local QBCore = exports['qb-core']:GetCoreObject()

-- give wood reward
RegisterServerEvent('qb-gatherer:server:giveWoodReward')
AddEventHandler('qb-gatherer:server:giveWoodReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local randomNumber = math.random(1,100)
    if randomNumber > 95 then
        Player.Functions.RemoveItem('axe', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["axe"], "remove")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.your_axe_is_broken'), 'error')
    else
        local givewood = math.random(1,3)
        Player.Functions.AddItem('wood', givewood)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['wood'], "add")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.you_chopped_wood',{givewood = givewood}), 'success')
    end
end)
