-- Variables
local currentGarage = 1
local inFingerprint = false
local FingerPrintSessionId = nil
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}
local onDuty = false

-- Functions

local function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)

    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["vehicle"][currentGarage]
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetEntityHeading(veh, coords.w)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        Citizen.InvokeNative(0x400F9556,veh, Lang:t('info.police_plate')..tostring(math.random(1000, 9999)))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

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
                event = "police:client:TakeOutVehicle",
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

function CreatePrompts()
    -- for k,v in pairs(Config.Locations['duty']) do
    --     exports['qb-core']:createPrompt('duty_prompt_' .. k, v, QBCore.Shared.Keybinds['J'], '切换执勤状态', {
    --         type = 'client',
    --         event = 'qb-policejob:ToggleDuty',
    --         args = {},
    --     })
    -- end
    
    -- for k, v in pairs(Config.Locations["vehicle"]) do
    --     exports['qb-core']:createPrompt("police:vehicle_"..k, vector3(v.x, v.y, v.z), QBCore.Shared.Keybinds['R'], '工作车库', {
    --         type = 'client',
    --         event = 'police:client:promptVehicle',
    --         args = {k},
    --     })
    -- end   

    for k,v in pairs(Config.Locations['evidence']) do
        exports['qb-core']:createPrompt('evidence_prompt_' .. k, v, QBCore.Shared.Keybinds['J'], '公开证据藏匿处', {
            type = 'client',
            event = 'police:client:EvidenceStashDrawer',
            args = { k },
        })
    end

    for k,v in pairs(Config.Locations['stash']) do
        exports['qb-core']:createPrompt('stash_prompt_' .. k, v, QBCore.Shared.Keybinds['J'], '打开个人储藏室', {
            type = 'client',
            event = 'police:client:OpenPersonalStash',
            args = {},
        })
    end

    -- for k,v in pairs(Config.Locations['armory']) do
    --     exports['qb-core']:createPrompt('armory_prompt_' .. k, v, QBCore.Shared.Keybinds['J'], '打开武器库', {
    --         type = 'client',
    --         event = 'police:client:OpenArmory',
    --         args = {},
    --     })
    -- end
end

local function loadAnimDict(dict) -- interactions, job,
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

local function GetClosestPlayer() -- interactions, job, tracker
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

local function SetWeaponSeries()
    for k, v in pairs(Config.Items.items) do
        if k < 6 then
            Config.Items.items[k].info.serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
        end
    end
end

RegisterNetEvent('police:client:promptVehicle', function(k)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        onDuty = PlayerData.job.onduty
        local ped = PlayerPedId()

        if PlayerJob.name == "police"  then
            if IsPedInAnyVehicle(ped, false) then
                QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(ped))
            else
                MenuGarage()
                currentGarage = k
            end
        else
            QBCore.Functions.Notify(Lang:t('error.on_duty_police_only'), 'error')
        end
    end)
end)

RegisterNetEvent('police:client:ImpoundVehicle', function(fullImpound, price)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if vehicle ~= 0 and vehicle then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehpos = GetEntityCoords(vehicle)
        if #(pos - vehpos) < 5.0 and not IsPedInAnyVehicle(ped) then
            local plate = QBCore.Functions.GetPlate(vehicle)
            TriggerServerEvent("police:server:Impound", plate, fullImpound, price)
            QBCore.Functions.DeleteVehicle(vehicle)
        end
    end
end)

RegisterNetEvent('police:client:CheckStatus', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "police" then
            local player, distance = GetClosestPlayer()
            if player ~= -1 and distance < 5.0 then
                local playerId = GetPlayerServerId(player)
                QBCore.Functions.TriggerCallback('police:GetPlayerStatus', function(result)
                    if result then
                        for k, v in pairs(result) do
                            QBCore.Functions.Notify(''..v..'')
                        end
                    end
                end, playerId)
            else
                QBCore.Functions.Notify(Lang:t("error.none_nearby"), 'error')
            end
        end
    end)
end)

RegisterNetEvent('police:client:EvidenceStashDrawer', function(k)
    local currentEvidence = k
    local pos = GetEntityCoords(PlayerPedId())
    local takeLoc = Config.Locations["evidence"][currentEvidence]

    if not takeLoc then return end

    if #(pos - takeLoc) <= 1.0 then
        local drawer = LocalInput(Lang:t('info.slot'), 11)
        if tonumber(drawer) then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", Lang:t('info.current_evidence', {value = currentEvidence, value2 = drawer}), {
                maxweight = 4000000,
                slots = 500,
            })
            TriggerEvent("inventory:client:SetCurrentStash", Lang:t('info.current_evidence', {value = currentEvidence, value2 = drawer}))
        end
    end
end)

-- Toggle Duty in an event.
RegisterNetEvent('qb-policejob:ToggleDuty', function()
    onDuty = not onDuty
    TriggerServerEvent("police:server:UpdateCurrentCops")
    TriggerServerEvent("police:server:UpdateBlips")
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent('police:client:TakeOutVehicle', function(data)
    local vehicle = data.vehicle
    TakeOutVehicle(vehicle)
end)

RegisterNetEvent('police:client:OpenPersonalStash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "policestash_"..QBCore.Functions.GetPlayerData().citizenid)
    TriggerEvent("inventory:client:SetCurrentStash", "policestash_"..QBCore.Functions.GetPlayerData().citizenid)
end)

RegisterNetEvent('police:client:OpenPersonalTrash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "policetrash", {
        maxweight = 4000000,
        slots = 300,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "policetrash")
end)

RegisterNetEvent('police:client:OpenArmory', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.name == "police" then
            local authorizedItems = {
                label = Lang:t('menu.pol_armory'),
                slots = 30,
                items = {}
            }
            local index = 1
            for _, armoryItem in pairs(Config.Items.items) do
                for i=1, #armoryItem.authorizedJobGrades do
                    if armoryItem.authorizedJobGrades[i] == PlayerData.job.grade.level then
                        authorizedItems.items[index] = armoryItem
                        authorizedItems.items[index].slot = index
                        index = index + 1
                    end
                end
            end
            SetWeaponSeries()
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "police", authorizedItems)
        else
            QBCore.Functions.Notify('仅执法部门', 'error')
        end
    end)
end)

-- Threads

-- Toggle Duty
CreateThread(function()
    if LocalPlayer.state.isLoggedIn and PlayerJob.name == 'police' then
        CreatePrompts()
    end

    for k, v in pairs(Config.Locations["stations"]) do
        --print(v.coords, v.label)
        local StationBlip = N_0x554d9d53f696d002(1664425300, v.coords)
        SetBlipSprite(StationBlip, -693644997, 52)
        SetBlipScale(StationBlip, 0.7)
        Citizen.InvokeNative(0x9CB1A1623062F402, StationBlip, v.label)
        -- Citizen.ReturnResultAnyway()
    end
    for k,v in pairs(QBCore.Shared.Weapons) do
        local weaponName = v.name
        local weaponLabel = v.label
        local weaponHash = GetHashKey(v.name)
        local weaponAmmo, weaponAmmoLabel = nil, 'unknown'
        if v.ammotype then
            weaponAmmo = v.ammotype:lower()
            weaponAmmoLabel = QBCore.Shared.Items[weaponAmmo].label
        end

        --print(weaponHash, weaponName, weaponLabel, weaponAmmo, weaponAmmoLabel)

        Config.WeaponHashes[weaponHash] = {
            weaponName = weaponName,
            weaponLabel = weaponLabel,
            weaponAmmo = weaponAmmo,
            weaponAmmoLabel = weaponAmmoLabel
        }
    end
end)
