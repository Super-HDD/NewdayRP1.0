local QBCore = exports['qb-core']:GetCoreObject()

-- 注册可使用物品
QBCore.Functions.CreateUseableItem("shovel", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    -- 触发客户端事件启动挖掘
    TriggerClientEvent("kerry-shovel:client:start", source)
end)

-- 注册服务器事件来给予奖励
RegisterServerEvent('kerry-shovel:server:givereward')
AddEventHandler('kerry-shovel:server:givereward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    local rewardMoneys = math.random(1, 2) 
    local baitworm = "p_baitworm01x"
    local item1 = Config.CommonItems[math.random(1, #Config.CommonItems)]
	
    if chance <= 60 then 
        -- 给予饵虫
        Player.Functions.AddItem(baitworm, 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[baitworm], "add")
        TriggerClientEvent('QBCore:Notify', src, '你找到了一些东西！', 'success')
		
    elseif chance > 60 and chance <= 85 then
        -- 给予随机物品
        Player.Functions.AddItem(item1, 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item1], "add")
        TriggerClientEvent('QBCore:Notify', src, '你找到了一些东西！', 'success')
		
    elseif chance > 85 then 
        -- 给予金钱奖励
        local moneyReward = rewardMoneys / 1 
        Player.Functions.AddMoney('cash', moneyReward)
        TriggerClientEvent('QBCore:Notify', src, '你找到了一枚硬币！', 'success')
    end 
end)
