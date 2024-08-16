local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("vin", 'vorpinput', {{}}, false, function(source, args)
    local src = source
    local target = tonumber(args[1])

    TriggerClientEvent('vk-test:client:display-onscreen-keyboard',src)

end)
