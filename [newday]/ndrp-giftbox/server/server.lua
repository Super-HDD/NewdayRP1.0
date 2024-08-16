local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('giftbox', function(source, item)
	local player = QBCore.Functions.GetPlayer(source)
	if not player.Functions.GetItemByName(item.name) then return end
    
    local rnd = math.random(0,100)
    local current_prob=0;
    print(rnd)
    for i=1,#Config.giftbox do
        current_prob=current_prob+Config.giftbox[i].prob
        if rnd <= current_prob then
            for item_name,item_amount in pairs(Config.giftbox[i].gift) do
                print(item_name)
                player.Functions.AddItem(item_name,item_amount,_,_)
                TriggerClientEvent('inventory:client:ItemBox',source,QBCore.Shared.Items[item_name], "add")
            end
            break
        end
    end
    player.Functions.RemoveItem('giftbox',1,item.slot)
    TriggerClientEvent('inventory:client:ItemBox',source,QBCore.Shared.Items['giftbox'], "remove")
end)

QBCore.Functions.CreateUseableItem("wuren_mooncake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("egg_mooncake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("whiskey_mooncake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-drink:client:set-alcohol-count",source,320)
        TriggerClientEvent("consumables:client:Eat", source, item.name)      
    end
end)

QBCore.Command.Add()

