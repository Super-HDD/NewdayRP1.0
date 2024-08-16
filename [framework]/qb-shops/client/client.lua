local QBCore = exports['qb-core']:GetCoreObject()
local store

Citizen.CreateThread(function()
    for store, v in pairs(Config.Locations) do
        exports['qb-core']:createPrompt(v.location, v.shopcoords, QBCore.Shared.Keybinds['J'],  '访问' .. v.name, {
            type = 'client',
            event = 'qb-shops:openshop',
            args = {v.products, v.name},
        })
        if v.showblip == true then
            local StoreBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.shopcoords)
            if v.products == "normal" then
                SetBlipSprite(StoreBlip, v.blipsprite, true)
                SetBlipScale(StoreBlip, v.blipscale)
            elseif v.products == "weapons" then
                SetBlipSprite(StoreBlip, v.blipsprite, true)
                SetBlipScale(StoreBlip, v.blipscale)
            elseif v.products == "saloon" then
                SetBlipSprite(StoreBlip, v.blipsprite, true)
                SetBlipScale(StoreBlip, v.blipscale)
            end
        end
    end
end)

RegisterNetEvent('qb-shops:openshop')
AddEventHandler('qb-shops:openshop', function(shopType, shopName)
    local type = shopType
    local shop = shopName
    local ShopItems = {}
    ShopItems.items = {}
    QBCore.Functions.TriggerCallback('qb-shops:server:getLicenseStatus', function(result)
        ShopItems.label = shop
        if type == "weapon" then
            if result then
                ShopItems.items =  Config.Products[type]
            else
                for i = 1, #Config.Products[type] do
                    if not Config.Products[type][i].requiresLicense then
                        table.insert(ShopItems.items, Config.Products[type][i])
                    end
                end
            end
        else
            ShopItems.items = Config.Products[type]
        end
        ShopItems.slots = 30
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "杂货店_"..type, ShopItems)
    end)
end)

RegisterNetEvent('qb-shops:client:UpdateShop')
AddEventHandler('qb-shops:client:UpdateShop', function(shopType, itemData, amount)
    TriggerServerEvent('qb-shops:server:UpdateShopItems', shopType, itemData, amount)
end)

RegisterNetEvent('qb-shops:client:SetShopItems')
AddEventHandler('qb-shops:client:SetShopItems', function(shopType, shopProducts)
    Config.Products[shopType] = shopProducts
end)

RegisterNetEvent('qb-shops:client:RestockShopItems')
AddEventHandler('qb-shops:client:RestockShopItems', function(shopType, amount)
    print('RESTOCK FUNCTION')
    print(shopType)
    print(amount)
    if Config.Products[shopType] ~= nil then
        for k, v in pairs(Config.Products[shopType]) do
            Config.Products[shopType][k].amount = Config.Products[shopType][k].amount + amount
        end
    end
end)
