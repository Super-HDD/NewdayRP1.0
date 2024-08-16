local QBCore = exports['qb-core']:GetCoreObject()

	QBCore.Functions.CreateUseableItem('pomade', function(source, item)
		local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent('qb-pomade:usepomade', source, v)
		end
	end)

