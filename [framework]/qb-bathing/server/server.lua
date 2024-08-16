local QBCore = exports['qb-core']:GetCoreObject()

BathingSessions = {}

RegisterServerEvent("qb-bathing:server:canEnterBath")
AddEventHandler("qb-bathing:server:canEnterBath", function(town)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local currentMoney = Player.PlayerData.money["cash"]

    if not BathingSessions[town] then
        if currentMoney >= Config.NormalBathPrice then
            Player.Functions.RemoveMoney("cash", Config.NormalBathPrice)
            BathingSessions[town] = src
            TriggerClientEvent("qb-bathing:client:StartBath", src, town)
        else
            print("NOTIFICATION HERE")
        end
    else
        print("NOTIFICATION HERE")
    end
end)


RegisterServerEvent("qb-bathing:server:canEnterDeluxeBath")
AddEventHandler("qb-bathing:server:canEnterDeluxeBath", function(p1 , p2 , p3)
    local src = source
    if BathingSessions[p2] == src then

        local Player = QBCore.Functions.GetPlayer(src)
        local currentMoney = Player.PlayerData.money["cash"]
            
        if currentMoney >= Config.DeluxeBathPrice then
            Player.Functions.RemoveMoney("cash", Config.DeluxeBathPrice)
            TriggerClientEvent("qb-bathing:client:StartDeluxeBath", src , p1 , p2 , p3)
        else
            print("NOTIFICATION HERE")
            TriggerClientEvent("qb-bathing:client:HideDeluxePrompt", src)
        end
    end
end)

RegisterServerEvent("qb-bathing:server:setBathAsFree")
AddEventHandler("qb-bathing:server:setBathAsFree", function(town)
    if BathingSessions[town] == source then
        BathingSessions[town] = nil
    end
end)

AddEventHandler('playerDropped', function()
    for town,player in pairs(BathingSessions) do
        if player == source then
            BathingSessions[town] = nil
        end
    end
end)
