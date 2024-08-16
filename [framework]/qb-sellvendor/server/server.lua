local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-sellvendor:server:sellitem')
AddEventHandler('qb-sellvendor:server:sellitem', function(amount, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = tonumber(amount)
    local checkitem = Player.Functions.GetItemByName(data.item)
    if amount >= 0 then
        if checkitem ~= nil then
            local amountitem = Player.Functions.GetItemByName(data.item).amount
            if amountitem >= amount then
                totalcash = (amount * data.price) 
                Player.Functions.RemoveItem(data.item, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.item], "remove")
                Player.Functions.AddMoney('cash', totalcash)
                TriggerClientEvent('QBCore:Notify', src, 'You sold ' ..amount.. ' for  $'..totalcash, 'success')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You don\'t have that much on you.', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have an item on you', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'must not be a negative value.', 'error')
    end
end)
