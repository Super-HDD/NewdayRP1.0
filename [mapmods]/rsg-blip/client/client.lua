local QBCore = exports['qb-core']:GetCoreObject()

local jailtimeMinsRemaining = 0
local inJail = false
local inJailZone = false
local jailTime = 0
local Zones = {}

-----------------------------------------------------------------------------------

-- prompts
Citizen.CreateThread(function()
    for prison, v in pairs(Config.MenuLocations) do
        
        if v.showblip == true then
            local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(PrisonBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(PrisonBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, Config.Blip.blipName)
        end
    end
end)


RegisterNetEvent('rsg-blip:client:stash', function()
    local job = QBCore.Functions.GetPlayerData().job.name
    local stashloc = currentname
    if job == 'baoquan' then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", 'baoquan', {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", 'baoquan')
    end
end)

Citizen.CreateThread(function()
    for saloontender, v in pairs(Config.SaloonTenderLocations) do
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], '访问 ' .. v.name, {
            type = 'client',
            event = 'rsg-blip:client:stash',
            args = { v.location, v.coords },
        })
        if v.showblip == true then
            local SaloonTenderBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(SaloonTenderBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(SaloonTenderBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SaloonTenderBlip, Config.Blip.blipName)
        end
    end
end)




