local QBCore = exports['qb-core']:GetCoreObject()


for _, v in pairs(Config.PocketWatches) do
	QBCore.Functions.CreateUseableItem(v.item, function(source, item)
		local Player = QBCore.Functions.GetPlayer(source)
		TriggerClientEvent('qb-pocketwatch:usewatch', source, v)
	end)
end

