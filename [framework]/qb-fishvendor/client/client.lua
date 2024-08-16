local QBCore = exports['qb-core']:GetCoreObject()
local fishvendor
local name = nil

-- prompts
Citizen.CreateThread(function()
    for fishvendor, v in pairs(Config.FishVendorLocations) do
        local name = v.name
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], Lang:t('menu.open_prompt') .. v.name, {
            type = 'client',
            event = 'qb-fishvendor:client:menu',
            args = { name },
        })
        if v.showblip == true then
            local FishVendorBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(FishVendorBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(FishVendorBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, FishVendorBlip, Config.Blip.blipName)
        end
    end
end)

-- fishvendor menu
RegisterNetEvent('qb-fishvendor:client:menu', function(vendorname)
    exports['qb-menu']:openMenu({
        {
            header = vendorname,
            isMenuHeader = true,
        },
        {
            header = Lang:t('menu.sell_small_fish'),
            txt = Lang:t('menu.we_currently_pay')..Config.SmallFishPrice..Lang:t('menu.per_small_fish'),
            icon = "fas fa-fish",
            params = {
                event = 'qb-fishvendor:server:sellsmallfish',
                isServer = true,
            }
        },
        {
            header = Lang:t('menu.sell_medium_fish'),
            txt = Lang:t('menu.we_currently_pay')..Config.MediumFishPrice..Lang:t('menu.per_medium_fish'),
            icon = "fas fa-fish",
            params = {
                event = 'qb-fishvendor:server:sellmediumfish',
                isServer = true,
            }
        },
        {
            header = Lang:t('menu.sell_large_fish'),
            txt = Lang:t('menu.we_currently_pay')..Config.LargeFishPrice..Lang:t('menu.per_large_fish'),
            icon = "fas fa-fish",
            params = {
                event = 'qb-fishvendor:server:selllargefish',
                isServer = true,
            }
        },
        {
            header = Lang:t('menu.open_shop'),
            txt = Lang:t('menu.buy_items_txt'),
            icon = "fas fa-shopping-basket",
            params = {
                event = 'qb-fishvendor:client:OpenFishVendorShop',
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

RegisterNetEvent('qb-fishvendor:client:OpenFishVendorShop')
AddEventHandler('qb-fishvendor:client:OpenFishVendorShop', function()
    local ShopItems = {}
    ShopItems.label = "鱼贩店"
    ShopItems.items = Config.FishVendorShop
    ShopItems.slots = #Config.FishVendorShop
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "FishVendor_"..math.random(1, 99), ShopItems)
end)
