local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('KickForAFK', function()
    DropPlayer(source, '您因 AFK 而被踢')
end)

QBCore.Functions.CreateCallback('qb-afkkick:server:GetPermissions', function(source, cb)
    cb(QBCore.Functions.GetPermission(source))
end)
