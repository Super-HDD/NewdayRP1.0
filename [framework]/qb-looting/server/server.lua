local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-looting:server:lootreward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local chance = math.random(1,100)
    -- common reward (95% chance)
    if chance <= 95 then -- reward : 1 x common
        local item = Config.CommonItems[math.random(1, #Config.CommonItems)]
        -- add items
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        Player.Functions.AddMoney('cash', math.random(1,5))
        -- webhook
        TriggerEvent('qb-log:server:CreateLog', 'loot', 'looted 🌟', 'orange', firstname..' '..lastname..' found '..item..' standard loot!')
    -- rare reward (5% chance)
    elseif chance > 95 then -- reward : 1 x rare
        local item = Config.RareItems[math.random(1, #Config.RareItems)]
        -- add items
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
        Player.Functions.AddMoney('cash', math.random(5,10))
        -- webhook
        TriggerEvent('qb-log:server:CreateLog', 'loot', 'looted citizen 🌟', 'orange', firstname..' '..lastname..' found '..item..' rare loot!')
    else
        print("something went wrong check for exploit!")
    end
end)

-- Callbacks
QBCore.Functions.CreateCallback('qb-looting:server:isPlayerDead', function(_, cb, playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    cb(Player.PlayerData.metadata["isdead"])
end)
