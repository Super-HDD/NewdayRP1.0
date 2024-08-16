local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = false
local PlayerData = {}
local carthash
local spawncoords
local cargohash
local lightupgardehash
local maxweight
local maxslots
local SpawnedWagon = nil
local wagonSpawned = false

-----------------------------------------------------------------------------------

AddEventHandler('QBCore:Client:OnPlayerLoaded', function() -- Don't use this with the native method
    isLoggedIn = true
    PlayerData = QBCore.Functions.GetPlayerData()
    TriggerEvent('qb-jobwagon:client:setupjobsystem')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function() -- Don't use this with the native method
    isLoggedIn = false
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    TriggerEvent('qb-jobwagon:client:setupjobsystem')
end)

-----------------------------------------------------------------------------------

-- setup job system
RegisterNetEvent('qb-jobwagon:client:setupjobsystem', function()
    local job = PlayerData.job.name
    for k, v in pairs(Config.JobsSettings) do
        if k == job then
            carthash = v.carthash
            spawncoords = v.spawncoords
            cargohash = v.cargohash
            lightupgardehash = v.lightupgardehash
            maxweight = v.maxweight
            maxslots = v.maxslots
        end
    end
end)

-----------------------------------------------------------------------------------

-- job wagon menu
RegisterNetEvent('qb-jobwagon:client:openWagonMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = Lang:t('menu.wagon_menu'),
            isMenuHeader = true,
        },
        {
            header = Lang:t('menu.wagon_setup'),
            txt = "",
            icon = "fas fa-box",
            params = {
                event = 'qb-jobwagon:server:SetupWagon',
                isServer = true,
                args = {},
            }
        },
        {
            header = Lang:t('menu.wagon_get'),
            txt = "",
            icon = "fas fa-box",
            params = {
                event = 'qb-jobwagon:client:SpawnWagon',
                isServer = false,
                args = {},
            }
        },
        {
            header = Lang:t('menu.wagon_store'),
            txt = "",
            icon = "fas fa-box",
            params = {
                event = 'qb-jobwagon:client:storewagon',
                isServer = false,
                args = {},
            }
        },
        {
            header = Lang:t('menu.close_menu'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu',
            }
        },
    })
end)

-- spawn company wagon
RegisterNetEvent('qb-jobwagon:client:SpawnWagon', function()
    QBCore.Functions.TriggerCallback('qb-jobwagon:server:GetActiveWagon', function(data)
        if data ~= nil then
            if wagonSpawned == false then
                local ped = PlayerPedId()
                local playerjob = QBCore.Functions.GetPlayerData().job.name
                local plate = data.plate
                RequestModel(carthash)
                while not HasModelLoaded(carthash) do
                    Citizen.Wait(0)
                end
                local wagon = CreateVehicle(carthash, spawncoords, true, false)
                SetVehicleOnGroundProperly(wagon)
                Wait(200)
                SetPedIntoVehicle(ped, wagon, -1)
                SetModelAsNoLongerNeeded(carthash)
                Citizen.InvokeNative(0xD80FAF919A2E56EA, wagon, cargohash)
                Citizen.InvokeNative(0xC0F0417A90402742, wagon, lightupgardehash) 
                SpawnedWagon = wagon
                wagonSpawned = true
                QBCore.Functions.Notify(Lang:t('primary.wagon_out'), 'primary')
            else
                QBCore.Functions.Notify(Lang:t('primary.wagon_already_out'), 'primary')
            end
        else
            QBCore.Functions.Notify(Lang:t('error.no_wagon_setup'), 'error')
        end
    end)
end)

-- open wagon menu
CreateThread(function()
    while true do
        Wait(1)
        if Citizen.InvokeNative(0x91AEF906BCA88877, 0, QBCore.Shared.Keybinds['B']) then -- IsDisabledControlJustPressed
            local playercoords = GetEntityCoords(PlayerPedId())
            local wagoncoords = GetEntityCoords(SpawnedWagon)
            if #(playercoords - wagoncoords) <= 2.0 then
                QBCore.Functions.TriggerCallback('qb-jobwagon:server:GetActiveWagon', function(data)
                    local wagonstash = data.plate
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", wagonstash, { maxweight = Config.MaxWeight, slots = Config.MaxSlots, })
                    TriggerEvent("inventory:client:SetCurrentStash", wagonstash)
                end)
            end
        end
    end
end)

-- store wagon
RegisterNetEvent('qb-jobwagon:client:storewagon', function()
    if wagonSpawned == true then
        DeleteVehicle(SpawnedWagon)
        SetEntityAsNoLongerNeeded(SpawnedWagon)
        QBCore.Functions.Notify(Lang:t('success.wagon_stored'), 'success')
        wagonSpawned = false
    end
end)
