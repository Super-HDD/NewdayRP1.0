local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("lawbadge", '佩戴/摘下徽章', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == Config.LawJob and Player.PlayerData.job.onduty then
        TriggerClientEvent("qb-lawbadge:client:lawbadge", src)
    else
        TriggerClientEvent('QBCore:Notify', src, '您必须在值班时佩戴徽章', 'error')
    end
end)
