local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("beer", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-drinker:client:DrinkBeer", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("whiskey", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-drinker:client:DrinkWhiskey", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("moonshine", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-drinker:client:DrinkMoonshine", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("coffee", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-drinker:client:DrinkCoffee", src, item.name)
    end
end)
