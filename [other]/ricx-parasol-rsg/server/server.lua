local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("parasol", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('ricx_parasol:start', source, item.name)
    --TriggerClientEvent("ricx_parasol:start", src, item.name)
end)