local QBCore = exports['qb-core']:GetCoreObject()

-- use moonshine kit
QBCore.Functions.CreateUseableItem("moonshinekit", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('qb-moonshiner:client:moonshinekit', source, item.name)
    end
end)

-- brew moonshine
RegisterServerEvent('qb-moonshiner:server:givemoonshine')
AddEventHandler('qb-moonshiner:server:givemoonshine', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if amount == 1 then
        Player.Functions.RemoveItem('sugar', 1)
        Player.Functions.RemoveItem('corn', 1)
        Player.Functions.RemoveItem('water', 1)
        Player.Functions.AddItem('moonshine', 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['moonshine'], "add")
        QBCore.Functions.Notify(src, Lang:t('success.you_made_some_moonshine'), 'success')
    else
        QBCore.Functions.Notify(src, Lang:t('error.something_went_wrong'), 'error')
        print('something went wrong with moonshine script could be exploint!')
    end
end)

-- sell moonshine at vendor
RegisterServerEvent('qb-moonshiner:server:sellitem')
AddEventHandler('qb-moonshiner:server:sellitem', function(amount, data)
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
                TriggerClientEvent('QBCore:Notify', src, Lang:t('success.you_sold',{amount = amount,totalcash = totalcash}), 'success')
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.you_dont_have_that_much_on_you'), 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.you_dont_have_an_item_on_you'), 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.must_not_be_a_negative_value'), 'error')
    end
end)

RegisterServerEvent('qb-moonshiner:server:startsmoke')
AddEventHandler('qb-moonshiner:server:startsmoke', function(coords)
    local src = source
    TriggerClientEvent('qb-moonshiner:client:startsmoke', -1, coords)
end)
