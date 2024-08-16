local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-cityhall:server:ApplyJob', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local ped = GetPlayerPed(src)
    Player.Functions.SetJob(data.job, 0)
    TriggerClientEvent('QBCore:Notify', src, 'Your new job is '..data.lable)
end)
