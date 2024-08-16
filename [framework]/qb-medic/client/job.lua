local QBCore = exports['qb-core']:GetCoreObject()

local blipEntries = {}

local transG = Config.DeathTimer


------------------------------------------------------ FUNCTIONS -------------------------------------------------------


-- Get Closest Player
local GetClosestPlayer = function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local closestDistance = -1
    local closestPlayer = -1
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()

    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local ped = GetPlayerPed(closestPlayers[i])
            local pos = GetEntityCoords(ped)
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end


-------------------------------------------------------- EVENTS --------------------------------------------------------


-- Toggle On-Duty
AddEventHandler('qb-medic:client:ToggleDuty', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        local PlayerJob = PlayerData.job

        if PlayerJob.name ~= Config.JobRequired then
            QBCore.Functions.Notify(Lang:t('error.not_medic'), 'error')

            return
        end

        TriggerServerEvent("QBCore:ToggleDuty")
    end)
end)

-- Medic Revive Player
AddEventHandler('qb-medic:client:RevivePlayer', function()
    local hasItem = QBCore.Functions.HasItem('firstaid', 1)

    if not hasItem then
        QBCore.Functions.Notify(Lang:t('error.no_firstaid'), 'error')

        return
    end

    local player, distance = GetClosestPlayer()

    if player == -1 or distance >= 5.0 then
        QBCore.Functions.Notify(Lang:t('error.no_player'), 'error')

        return
    end

    local ped = PlayerPedId()
    local playerId = GetPlayerServerId(player)
    local tped = GetPlayerPed(GetPlayerFromServerId(playerId))

    Citizen.InvokeNative(0x5AD23D40115353AC, ped, tped, -1)

    Wait(3000)

    FreezeEntityPosition(ped, true)
    TaskStartScenarioInPlace(ped, `WORLD_HUMAN_CROUCH_INSPECT`, -1, true, false, false, false)

    Wait(5000)

    ExecuteCommand('me Reviving')

    QBCore.Functions.Progressbar("reviving", "Reviving...", Config.MedicReviveTime, false, true,
    {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)

        TriggerServerEvent('qb-medic:server:RevivePlayer', playerId)

        transG = 0
    end)
end)

-- Medic Treat Wounds
AddEventHandler('qb-medic:client:TreatWounds', function()
    local hasItem = QBCore.Functions.HasItem('bandage', 1)
    if not hasItem then
        QBCore.Functions.Notify(Lang:t('error.no_bandage'), 'error')

        return
    end

    local player, distance = GetClosestPlayer()

    if player == -1 or distance >= 5.0 then
        QBCore.Functions.Notify(Lang:t('error.no_player'), 'error')

        return
    end

    local ped = PlayerPedId()
    local playerId = GetPlayerServerId(player)
    local tped = GetPlayerPed(GetPlayerFromServerId(playerId))

    Citizen.InvokeNative(0x5AD23D40115353AC, ped, tped, -1)

    Wait(3000)

    FreezeEntityPosition(ped, true)
    TaskStartScenarioInPlace(ped, `WORLD_HUMAN_CROUCH_INSPECT`, -1, true, false, false, false)

    Wait(5000)

    ExecuteCommand('me Treating Wounds')

    QBCore.Functions.Progressbar("treating", "Treating Wounds...", Config.MedicTreatTime, false, true,
    {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)

        TriggerServerEvent('qb-medic:server:TreatWounds', playerId)
        TriggerServerEvent('bone:server:useMedicalKit',playerId)
        transG = 0
    end)
end)

-- Medic Treat Wounds
RegisterNetEvent('qb-medic:client:HealInjuries', function()
    local player = PlayerPedId()

    Citizen.InvokeNative(0xC6258F41D86676E0, player, 0, 100) -- SetAttributeCoreValue
    Citizen.InvokeNative(0xC6258F41D86676E0, player, 1, 100) -- SetAttributeCoreValue
    TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + 100)
    TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
    ClearPedBloodDamage(player)
end)

-- Medic Alert
RegisterNetEvent('qb-medic:client:medicAlert', function(coords, text)
    QBCore.Functions.Notify(text, 'medic', 5000)

    local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords.x, coords.y, coords.z)
    local blip2 = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords.x, coords.y, coords.z)

    SetBlipSprite(blip, 1109348405)
    SetBlipSprite(blip2, -184692826)
    Citizen.InvokeNative(0x662D364ABF16DE2F, blip, GetHashKey('BLIP_MODIFIER_AREA_PULSE'))
    Citizen.InvokeNative(0x662D364ABF16DE2F, blip2, GetHashKey('BLIP_MODIFIER_AREA_PULSE'))
    SetBlipScale(blip, 0.8)
    SetBlipScale(blip2, 2.0)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, text)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip2, text)

    blipEntries[#blipEntries + 1] = {coords = coords, handle = blip}
    blipEntries[#blipEntries + 1] = {coords = coords, handle = blip2}

    -- Add GPS Route

    if Config.AddGPSRoute then
        StartGpsMultiRoute(`COLOR_GREEN`, true, true)
        AddPointToGpsMultiRoute(coords)
        SetGpsMultiRouteRender(true)
    end

    CreateThread(function ()
        while transG ~= 0 do
            Wait(180 * 4)

            local ped = PlayerPedId()
            local pcoord = GetEntityCoords(ped)
            local distance = #(coords - pcoord)
            transG = transG - 1

            if Config.Debug then
                print('Distance to Player Blip: '..tostring(distance)..' metres')
            end

            if transG <= 0 or distance < 5.0 then
                for i = 1, #blipEntries do
                    local blips = blipEntries[i]
                    local bcoords = blips.coords

                    if coords == bcoords then
                        if Config.Debug then
                            print('')
                            print('Blip Coords: '..tostring(bcoords))
                            print('Blip Removed: '..tostring(blipEntries[i].handle))
                            print('')
                        end

                        RemoveBlip(blipEntries[i].handle)
                    end
                end

                transG = Config.DeathTimer

                if Config.AddGPSRoute then
                    ClearGpsMultiRoute(coords)
                end

                return
            end
        end
    end)
end)

-- Cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    ClearGpsMultiRoute(coords)

    for i = 1, #blipEntries do
        if blipEntries[i].handle then
            RemoveBlip(blipEntries[i].handle)
        end
    end
end)


-- Functions

function MenuGarage()
    local vehicleMenu = {
        {
            header = Lang:t('menu.garage_title'),
            isMenuHeader = true
        }
    }

    local authorizedVehicles = Config.AuthorizedVehicles[QBCore.Functions.GetPlayerData().job.grade.level]
    for veh, label in pairs(authorizedVehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = label,
            txt = "",
            params = {
                event = "medic:client:TakeOutVehicle",
                args = {
                    vehicle = veh
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = Lang:t('menu.close'),
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }
    exports['qb-menu']:openMenu(vehicleMenu)
end