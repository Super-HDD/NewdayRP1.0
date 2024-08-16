local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local currentjob

-----------------------------------------------------------------------------------

-- wholesale prompts and blips
Citizen.CreateThread(function()
    for wholesale, v in pairs(Config.WholesaleLocations) do
        exports['qb-core']:createPrompt(v.prompt, v.coords, QBCore.Shared.Keybinds['J'], '打开 ' .. v.name, {
            type = 'client',
            event = 'qb-wholesaletrader:client:openMenu',
            args = { v.job },
        })
        if v.showblip == true then
            local WholesaleTraderBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(WholesaleTraderBlip, GetHashKey(Config.WholesaleBlip.blipSprite), true)
            SetBlipScale(WholesaleTraderBlip, Config.WholesaleBlip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, WholesaleTraderBlip, Config.WholesaleBlip.blipName)
        end
    end
end)

-- draw marker if set to true in config
CreateThread(function()
    while true do
        local sleep = 1000

        for _, v in pairs(Config.WholesaleLocations) do
            if v.showmarker then
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local coord = v.coords
                local distance = #(coords - coord)

                if distance <= 10.0 then
                    sleep = 4

                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                end
            end
        end

        Wait(sleep)
    end
end)

-----------------------------------------------------------------------------------

-- wholesale trader menu
RegisterNetEvent('qb-wholesaletrader:client:openMenu', function(job)
    local playerjob = QBCore.Functions.GetPlayerData().job.name
    if playerjob == job then
        currentjob = job
        exports['qb-menu']:openMenu({
            {
                header = Lang:t('menu.wholesale_trader'),
                isMenuHeader = true,
            },
            {
                header = Lang:t('menu.wholesale_storage'),
                txt = "",
                icon = "fas fa-box",
                params = {
                    event = 'qb-wholesaletrader:client:storage',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = Lang:t('menu.wholesale_imports'),
                txt = "",
                icon = "fas fa-box",
                params = {
                    event = 'qb-wholesaletrader:client:openShop',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = Lang:t('menu.job_management'),
                txt = "",
                icon = "fas fa-user-circle",
                params = {
                    event = 'qb-bossmenu:client:OpenMenu',
                    isServer = false,
                    args = {},
                }
            },
            {
                header = Lang:t('menu.job_wagon'),
                txt = "",
                icon = "fas fa-horse",
                params = {
                    event = 'qb-jobwagon:client:openWagonMenu',
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
    else
        QBCore.Functions.Notify(Lang:t('error.not_authorised'), 'error')
    end
end)

-----------------------------------------------------------------------------------

-- wholesale shop
RegisterNetEvent('qb-wholesaletrader:client:openShop')
AddEventHandler('qb-wholesaletrader:client:openShop', function()
    local job = QBCore.Functions.GetPlayerData().job.name
    if job == currentjob then
        local ShopItems = {}
        ShopItems.label = "批发店"
        ShopItems.items = Config.WholesaleShop
        ShopItems.slots = #Config.WholesaleShop
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "批发店"..math.random(1, 99), ShopItems)
    else
        QBCore.Functions.Notify(Lang:t('error.not_authorised'), 'error')
    end
end)

-----------------------------------------------------------------------------------

-- wholesale trader general storage
RegisterNetEvent('qb-wholesaletrader:client:storage', function()
    local job = QBCore.Functions.GetPlayerData().job.name
    if job == currentjob then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", currentjob, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", currentjob)
    end
end)

-----------------------------------------------------------------------------------
