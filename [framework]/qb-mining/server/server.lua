local QBCore = exports['qb-core']:GetCoreObject()

-- give mining reward
RegisterServerEvent('qb-mining:server:giveMiningReward')
AddEventHandler('qb-mining:server:giveMiningReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1,100)
    if Player.PlayerData.job.name=='miner' then 
        chance=100
    end
    if chance <= 50 then
        local item1 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        local item2 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        local item3 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        -- add items
        Player.Functions.AddItem(item1, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item1], "add")
        Player.Functions.AddItem(item2, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item2], "add")
        Player.Functions.AddItem(item3, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item3], "add")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('primary.small_haul_time'), 'primary')
    elseif chance >= 50 and chance <= 80 then -- medium reward
        local item1 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        local item2 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        local item3 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        -- add items
        Player.Functions.AddItem(item1, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item1], "add")
        Player.Functions.AddItem(item2, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item2], "add")
        Player.Functions.AddItem(item3, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item3], "add")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('primary.medium_haul_this_time'), 'primary')
    elseif chance > 80 then -- large reward
        local item1 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        local item2 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        local item3 = Config.MiningRewards[math.random(1, #Config.MiningRewards)]
        -- add items
        Player.Functions.AddItem(item1, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item1], "add")
        Player.Functions.AddItem(item2, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item2], "add")
        Player.Functions.AddItem(item3, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item3], "add")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('primary.largq_haul_this_time'), 'primary')
    end
end)

-- remove pickaxe if broken
RegisterServerEvent('qb-mining:server:removeitem')
AddEventHandler('qb-mining:server:removeitem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if item == 'pickaxe' then
        Player.Functions.RemoveItem('pickaxe', 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['pickaxe'], "add")
        QBCore.Functions.Notify(src, Lang:t('success.your_pickaxe_broke'), 'success')
    else
        QBCore.Functions.Notify(src, Lang:t('error.something_went_wrong'), 'error')
        print('something went wrong with moonshine script could be exploint!')
    end
end)
