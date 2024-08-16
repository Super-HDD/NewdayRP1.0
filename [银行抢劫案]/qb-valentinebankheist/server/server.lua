local QBCore = exports['qb-core']:GetCoreObject()

-- give reward
RegisterServerEvent('qb-valentinebankheist:server:reward')
AddEventHandler('qb-valentinebankheist:server:reward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1,100)
    if chance <= 50 then
        local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        -- add items
        Player.Functions.AddItem(item1, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item1], "add")
        Player.Functions.AddItem(item2, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item2], "add")
        Player.Functions.AddItem(item3, Config.SmallRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item3], "add")
        TriggerClientEvent('QBCore:Notify', src, '这次的小战利品奖励!', 'primary')
    elseif chance >= 50 and chance <= 80 then -- medium reward
        local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        -- add items
        Player.Functions.AddItem(item1, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item1], "add")
        Player.Functions.AddItem(item2, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item2], "add")
        Player.Functions.AddItem(item3, Config.MediumRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item3], "add")
        TriggerClientEvent('QBCore:Notify', src, '这次的战利品奖励中等!', 'primary')
    elseif chance > 80 then -- large reward
        local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
        -- add items
        Player.Functions.AddItem(item1, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item1], "add")
        Player.Functions.AddItem(item2, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item2], "add")
        Player.Functions.AddItem(item3, Config.LargeRewardAmount)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item3], "add")
        Player.Functions.AddMoney(Config.MoneyRewardType, Config.MoneyRewardAmount, "bank-heist")
        TriggerClientEvent('QBCore:Notify', src, '这次的战利品奖励丰厚!', 'primary')
        Wait(5000)
        TriggerClientEvent('QBCore:Notify', src, '额外的 '..Config.MoneyRewardAmount..' '..Config.MoneyRewardType..' 被掠夺!', 'primary')
    end
end)

-- remove item
RegisterNetEvent('qb-valentinebankheist:server:removeItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "remove")
end)
