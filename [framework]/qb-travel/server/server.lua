local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-travel:server:buyticket')
AddEventHandler('qb-travel:server:buyticket', function(price)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local cashBalance = Player.PlayerData.money["cash"]
	if cashBalance >= price then
		Player.Functions.RemoveMoney("cash", price, "purchase-ticket")
		Player.Functions.AddItem('boatticket', 1)
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['boatticket'], "add")
		QBCore.Functions.Notify(src, '买的船票是 $'..price, 'success')
	else 
		QBCore.Functions.Notify(src, '你没有足够的现金来做这件事!', 'error')
	end
end)

-- remove ticket
RegisterNetEvent('qb-travel:server:removeItem', function(item, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
	TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "remove")
end)