function Notify(event, data)
    if event == 'NotFound' then
        TriggerClientEvent('QBCore:Notify', data, Lang:t('notify.notfound'), 'error')
    elseif event == 'InvalidFormat' then
        TriggerClientEvent('QBCore:Notify', data, Lang:t('notify.InvalidFormat'), 'error')
    elseif event == 'WrongSecureWord' then
        TriggerClientEvent('QBCore:Notify', data, Lang:t('notify.WrongSecureWord'), 'error')
    elseif event == 'Deleted' then
        TriggerClientEvent('QBCore:Notify', data, Lang:t('notify.deleted'), 'success')
    end
end