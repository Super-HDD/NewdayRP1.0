local QBCore = exports['qb-core']:GetCoreObject()

-- use canoe
QBCore.Functions.CreateUseableItem("canoe", function(source, item)
    local src = source
    TriggerClientEvent('qb-canoe:client:lauchcanoe', src, item.name)
end)
