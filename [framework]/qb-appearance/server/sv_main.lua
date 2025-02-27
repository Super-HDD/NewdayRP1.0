local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-appearance:SaveSkin')
AddEventHandler('qb-appearance:SaveSkin', function(skin)
    local _skin = skin
    local _source = source
    local encode = json.encode(_skin)
    local Player = QBCore.Functions.GetPlayer(source)
    local citizenid = Player.PlayerData.citizenid
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    TriggerEvent("qb-appearance:retrieveSkin", citizenid, license, function(call)
        if call then
            MySQL.Async.execute("UPDATE playerskins SET `skin` = ? WHERE `citizenid`= ? AND `license`= ?", {encode, citizenid, license})
        else
            MySQL.Async.insert('INSERT INTO playerskins (citizenid, license, skin) VALUES (?, ?, ?);', {citizenid, license, encode})
        end
    end)
    TriggerClientEvent('qb-spawn:client:setupSpawnUI', source, encode, true)
end)

RegisterServerEvent('qb-appearance:SetPlayerBucket')
AddEventHandler('qb-appearance:SetPlayerBucket', function(b)
   SetPlayerRoutingBucket(source, b)
end)

RegisterServerEvent('qb-appearance:LoadSkin')
AddEventHandler('qb-appearance:LoadSkin', function()
    local _source = source
    local User = QBCore.Functions.GetPlayer(source)
    local citizenid = User.PlayerData.citizenid
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    local skins = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND license = ?', {citizenid, license})
    if skins[1] then
        local skin = skins[1].skin
        local decoded = json.decode(skin)
        TriggerClientEvent("qb-appearance:ApplySkin", _source, decoded)
    else
        TriggerClientEvent("qb-appearance:OpenCreator", _source)
    end
end)

AddEventHandler('qb-appearance:retrieveSkin', function(citizenid, license, callback)
    local Callback = callback
    local skins = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ? AND license = ?', {citizenid, license})
    if skins[1] then
        Callback(skins[1])
    else
        Callback(false)
    end
end)

RegisterServerEvent("qb-appearance:deleteSkin")
AddEventHandler("qb-appearance:deleteSkin", function(license, Callback)
    local _source = source
    local id
    for k, v in ipairs(GetPlayerIdentifiers(_source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            id = v
            break
        end
    end
    local Callback = callback
    MySQL.Async.fetchAll('DELETE FROM playerskins WHERE `citizenid`= ? AND`license`= ?;', {id, license})
end)

