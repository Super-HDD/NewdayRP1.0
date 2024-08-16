function SA_Payment(data)
    local src = data.src
    local amount = data.amount
    local name = data.name
    
    if name == 'PaymentNotify' then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('notifications.paid') .. amount .. Lang:t('notifications.currency'), 'success')

    elseif name == 'NotEnoughMoney' then
        TriggerClientEvent('QBCore:Notify', source, Lang:t('notifications.enoughmoney'), 'error')

    elseif name == 'RecievedNotify' then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('notifications.recieved') .. amount .. Lang:t('notifications.currency'), 'success')

    elseif name == 'FullInventory' then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('notifications.FullInventory') .. amount .. Lang:t('notifications.currency'), 'success')

    end
end
