local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('jiekedanni', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('ndrp-drinker:client:jiekedanni',src)
    end
end)