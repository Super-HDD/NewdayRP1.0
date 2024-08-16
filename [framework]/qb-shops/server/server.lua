local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-shops:server:UpdateShopItems')
AddEventHandler('qb-shops:server:UpdateShopItems', function(shopType, itemData, amount)
    Config.Products[shopType][itemData.slot].amount =  Config.Products[shopType][itemData.slot].amount - amount
    if Config.Products[shopType][itemData.slot].amount <= 0 then
        Config.Products[shopType][itemData.slot].amount = 0
    end
    TriggerClientEvent('qb-shops:client:SetShopItems', -1, shopType, Config.Products[shopType])
end)

RegisterServerEvent('qb-shops:server:RestockShopItems')
AddEventHandler('qb-shops:server:RestockShopItems', function(shopType)
    if Config.Products[shopType] ~= nil then
        local randAmount = math.random(10, 50)
        for k, v in pairs(Config.Products[shopType]) do
            Config.Products[shopType][k].amount = Config.Products[shopType][k].amount + randAmount
        end
        TriggerClientEvent('qb-shops:client:RestockShopItems', -1, shopType, randAmount)
    end
end)

QBCore.Functions.CreateCallback('qb-shops:server:getLicenseStatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata["licences"]

    if licenseTable.weapon then
        cb(true)
    else
        cb(false)
    end
end)
