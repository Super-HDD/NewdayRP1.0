local QBCore = exports['qb-core']:GetCoreObject()
local xSound = exports.xsound
local isPlaying = false

QBCore.Functions.CreateUseableItem("barrier", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("QB_barrier:client:placeDJEquipment", source, item.name)
		TriggerEvent('qb-log:server:CreateLog', 'camp', 'BEDTIME 💤', 'yellow', firstname..' '..lastname..' 💤 IS SETTING UP A barrier 💤')
    end
end)


RegisterNetEvent('QB_barrier:server:pickedup', function(entity)
    local src = source
    xSound:Destroy(-1, tostring(entity))
end)


RegisterNetEvent('QB_barrier:Server:RemoveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
end)

RegisterServerEvent('QB_barrier:server:pickeupdecks')
AddEventHandler('QB_cookkit:server:pickeupdecks', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('barrier', 1)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['barrier'], "add")
end)