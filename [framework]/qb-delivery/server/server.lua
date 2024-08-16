local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-delivery:server:givereward', function(cashreward)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash',cashreward)
end)