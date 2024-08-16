local QBCore = exports['qb-core']:GetCoreObject()


for _, zone in ipairs(Config.HuntingZones) do
    QBCore.Functions.CreateUseableItem(zone.bait, function(source)
        local src = source
        TriggerClientEvent('qb-hunting:server:useHuntingBait', src, zone.bait)
    end)
end


-- ... (Other CreateUseableItem calls and event handlers) ...

RegisterServerEvent('qb-hunting::server:updateCooldown')
AddEventHandler('qb-hunting::server:updateCooldown', function(zoneName, cooldown)
    local playerId = QBCore.Functions.GetPlayer(source).PlayerData.citizenid

    if not huntedPlayers[playerId] then
        huntedPlayers[playerId] = {}
    end

    huntedPlayers[playerId][zoneName] = cooldown
end)

-- ... (Other server-side code) ...

-- ... (Other event handlers) ...

RegisterServerEvent('qb-hunting::server:removeItem')
AddEventHandler("qb-hunting::server:removeItem", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src) 
    Player.Functions.RemoveItem(item, 1) 
end)