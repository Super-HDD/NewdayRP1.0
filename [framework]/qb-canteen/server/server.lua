local QBCore = exports['qb-core']:GetCoreObject()

-- use canteen 100
QBCore.Functions.CreateUseableItem("canteen100", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-canteen:client:drink', src, Config.DrinkAmount)
    Player.Functions.RemoveItem('canteen100', 1)
    Player.Functions.AddItem('canteen75', 1)
end)

-- use canteen 75
QBCore.Functions.CreateUseableItem("canteen75", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-canteen:client:drink', src, Config.DrinkAmount)
    Player.Functions.RemoveItem('canteen75', 1)
    Player.Functions.AddItem('canteen50', 1)
end)

-- use canteen 50
QBCore.Functions.CreateUseableItem("canteen50", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-canteen:client:drink', src, Config.DrinkAmount)
    Player.Functions.RemoveItem('canteen50', 1)
    Player.Functions.AddItem('canteen25', 1)
end)

-- use canteen 25
QBCore.Functions.CreateUseableItem("canteen25", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-canteen:client:drink', src, Config.DrinkAmount)
    Player.Functions.RemoveItem('canteen25', 1)
    Player.Functions.AddItem('canteen0', 1)
end)

-- use canteen 0 - error or fillup
QBCore.Functions.CreateUseableItem("canteen0", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-canteen:client:fillupcanteen', src)
end)

-- remove empty give full canteen
RegisterServerEvent('qb-canteen:server:givefullcanteen')
AddEventHandler('qb-canteen:server:givefullcanteen', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('canteen0', 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['canteen0'], "remove")
    Player.Functions.AddItem('canteen100', 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['canteen100'], "add")
end)
