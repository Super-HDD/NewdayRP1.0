local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('citizen_idcard', function(source, item)
	local player = QBCore.Functions.GetPlayer(source)
	if not player.Functions.GetItemByName(item.name) then return end

	TriggerClientEvent('ndrp-license:server:display-signed-idcard',source,item.info,item.slot)
end)

RegisterServerEvent('ndrp-license:server:create-signed-idcard',function (idcard_info,blankSlot)
    local src=source
    local player=QBCore.Functions.GetPlayer(src)
    print(QBCore.Debug(idcard_info))
    player.Functions.AddItem('citizen_idcard',_,_,idcard_info);
    TriggerClientEvent('inventory:client:ItemBox',src,QBCore.Shared.Items['citizen_idcard'], "add")
    player.Functions.RemoveItem('citizen_idcard',1,blankSlot)
    TriggerClientEvent('inventory:client:ItemBox',source,QBCore.Shared.Items['citizen_idcard'], "remove")
end)