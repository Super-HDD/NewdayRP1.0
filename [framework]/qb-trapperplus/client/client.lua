local QBCore = exports['qb-core']:GetCoreObject()

-----------------------------------------------------------------------------------

-- prompts
Citizen.CreateThread(function()
    for trapper, v in pairs(Config.TrapperLocations) do
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'],  Lang:t('menu.open') .. v.name, {
            type = 'client',
            event = 'qb-trapperplus:client:menu',
            args = {},
        })
        if v.showblip == true then
            local TrapperBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(TrapperBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(TrapperBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, TrapperBlip, Config.Blip.blipName)
        end
    end
end)

-----------------------------------------------------------------------------------

-- trapper menu
RegisterNetEvent('qb-trapperplus:client:menu', function()
    exports['qb-menu']:openMenu({
        {
            header =  Lang:t('menu.trapper_menu'),
            isMenuHeader = true,
        },
        {
            header = Lang:t('menu.sell_stored_pelts'),
            txt = Lang:t('text.sell_store_pelts'),
            icon = "fas fa-paw",
            params = {
                event = 'qb-trapperplus:client:sellpelts',
                isServer = false,
            }
        },
        {
            header = Lang:t('menu.open_trapper_shop'),
            txt = Lang:t('text.buy_items_from_the_trapper'),
            icon = "fas fa-shopping-basket",
            params = {
                event = 'qb-trapperplus:client:OpenTrapperShop',
                isServer = false,
                args = {}
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

-----------------------------------------------------------------------------------

-- process bar before sell pelts
RegisterNetEvent('qb-trapperplus:client:sellpelts', function()
    QBCore.Functions.Progressbar('make-product', Lang:t('progressbar.checking_pelts'), Config.SellTime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('qb-trapperplus:server:sellpelts')
    end)
end)

-----------------------------------------------------------------------------------

-- pickup pelt and store in inventory
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
        local pelthash = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
        if Config.Debug == true then
            print("holding: "..tostring(holding))
            print("pelthash: "..tostring(pelthash))
        end
        if holding ~= false then
            for i = 1, #Config.Pelts do
                if pelthash == Config.Pelts[i].pelthash then
                    local name = Config.Pelts[i].name
                    local rewarditem1 = Config.Pelts[i].rewarditem1
                    local rewarditem2 = Config.Pelts[i].rewarditem2
                    local deleted = DeleteThis(holding)
                    if deleted then
                        QBCore.Functions.Notify(name.. Lang:t('primary.stored'), 'primary')
                        TriggerServerEvent('qb-trapperplus:server:storepelt', rewarditem1, rewarditem2)
                    else
                        QBCore.Functions.Notify( Lang:t('error.something_went_wrong'), 'error')
                    end
                end
            end
        end
    end
end)

-----------------------------------------------------------------------------------

-- delete holding
function DeleteThis(holding)
    NetworkRequestControlOfEntity(holding)
    SetEntityAsMissionEntity(holding, true, true)
    Wait(100)
    DeleteEntity(holding)
    Wait(500)
    local entitycheck = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
    local holdingcheck = GetPedType(entitycheck)
    if holdingcheck == 0 then
        return true
    else
        return false
    end
end

-----------------------------------------------------------------------------------

-- trapper shop
RegisterNetEvent('qb-trapperplus:client:OpenTrapperShop')
AddEventHandler('qb-trapperplus:client:OpenTrapperShop', function()
    local ShopItems = {}
    ShopItems.label = Lang:t('text.trapper_shop')
    ShopItems.items = Config.TrapperShop
    ShopItems.slots = #Config.TrapperShop
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "TrapperShop_"..math.random(1, 99), ShopItems)
end)

-----------------------------------------------------------------------------------
