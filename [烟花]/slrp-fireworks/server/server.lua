local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("slrp-fireworks:players")
AddEventHandler("slrp-fireworks:players", function(coords, firework)
	if firework == "big_fireworks" then
		TriggerClientEvent("slrp-fireworks:big_fireworks_players", -1, coords)

	elseif firework == "small_fireworks" then
		TriggerClientEvent("slrp-fireworks:small_fireworks_players", -1, coords)

	elseif firework == "big_firecracker" then
		TriggerClientEvent("slrp-fireworks:big_firecracker_players", -1, coords)

	elseif firework == "small_firecracker" then
		TriggerClientEvent("slrp-fireworks:small_firecracker_players", -1, coords)

	elseif firework == "smoke_campfire" then
		TriggerClientEvent("slrp-fireworks:smoke_campfire_players", -1, coords)
	end
end)

QBCore.Functions.CreateUseableItem("big_fireworks", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('slrp-fireworks:big_fireworks', src)
    Wait(1000)
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("small_fireworks", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('slrp-fireworks:small_fireworks', src)
    Wait(1000)
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("big_firecracker", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('slrp-fireworks:big_firecracker', src)
    Wait(1000)
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("small_firecracker", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('slrp-fireworks:small_firecracker', src)
    Wait(1000)
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

QBCore.Functions.CreateUseableItem("smoke_campfire", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('slrp-fireworks:smoke_campfire', src)
    Wait(1000)
    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)
