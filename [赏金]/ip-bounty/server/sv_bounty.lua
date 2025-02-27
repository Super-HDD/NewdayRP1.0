local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('ip_bountyhunting:AddSomeMoney')
AddEventHandler('ip_bountyhunting:AddSomeMoney', function()
    local _source = source
    local price = Config.Price
    local Character = QBCore.Functions.GetPlayer(source)
    Character.Functions.AddMoney('cash', price, 'bounty-hunting')
    if Config.DefaultNotification then
        TriggerClientEvent('QBCore:Notify', _source, "You Got Paid ".."+$"..price, "inform", 5000)
    else
        TriggerClientEvent('ip-core:NotifyLeft', _source, "Bounty", "You Got Paid ".."+$"..price, "INVENTORY_ITEMS", "money_billstack", 5000)
    end
end)

RegisterNetEvent('ip-bounty:server:removeitem')
AddEventHandler('ip-bounty:server:removeitem', function(itemName, amount)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(itemName, amount)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], "remove", amount)
end)