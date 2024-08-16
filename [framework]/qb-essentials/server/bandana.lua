local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('bandana', 'Bandana on/off', {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-bandana:client:ToggleBandana', src)
end)
