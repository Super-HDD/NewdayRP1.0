local QBCore = exports['qb-core']:GetCoreObject()
local foundResources = {}
local neededResources = {"qb-menubase"}
local detectNeededResources = function()

for k, v in ipairs(neededResources) do
        if GetResourceState(v) == "started" then
            foundResources[v] = true
        else
        end
    end
end

detectNeededResources()
RegisterServerEvent('qb-clothes:Save')
AddEventHandler('qb-clothes:Save', function(Clothes, Name, price)
    local src = source
    local _Name = Name
    local encode = json.encode(Clothes)
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local license = QBCore.Functions.GetIdentifier(src, 'license')
    local currentMoney = Player.Functions.GetMoney('cash')
    if currentMoney >= price then
        Player.Functions.RemoveMoney("cash", price)
        TriggerEvent("qb-clothes:retrieveClothes", citizenid, license, function(call)
            if call then
                MySQL.Async.execute("UPDATE playerclothe SET `clothes` = ? WHERE `citizenid`= ? AND `license`= ?", {encode, citizenid, license})
            else
                MySQL.Async.insert('INSERT INTO playerclothe (citizenid, license, clothes) VALUES (?, ?, ?);', {citizenid, license, encode})
            end
        end)
        if _Name then
            TriggerEvent("qb-clothes:retrieveOutfits", citizenid, license, _Name, function(call)
                if call then
                    MySQL.Async.execute("UPDATE playeroutfit SET `clothes` = ? WHERE `citizenid`= ? AND `license`= ? AND name = ?", {encode, citizenid, license, _Name})

                else
                    MySQL.Async.insert('INSERT INTO playeroutfit (citizenid, license, clothes, name) VALUES (?, ?, ?, ?);', {citizenid, license, encode, _Name})
                end
            end)
        end
    else
        TriggerClientEvent("qb-appearance:LoadSkinClient", src)
    end
    SetPlayerRoutingBucket(src, 0)
end)

RegisterServerEvent('qb-clothes:LoadClothes')
AddEventHandler('qb-clothes:LoadClothes', function(value)
    local _value = value
    local src = source
    local _clothes = nil
    local User = QBCore.Functions.GetPlayer(source)
    local citizenid = User.PlayerData.citizenid
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    local _clothes =  MySQL.Sync.fetchAll('SELECT * FROM playerclothe WHERE citizenid = ? AND license = ?', {citizenid, license})
    if _clothes[1] then   
        _clothes = json.decode(_clothes[1].clothes)
    else
        _clothes = {}
    end
    if _clothes ~= nil then
        if _value == 1 then
            TriggerClientEvent("qb-clothes:ApplyClothes", src, _clothes)
        elseif _value == 2 then
            local BucketID = (QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomInt(2))
            SetPlayerRoutingBucket(src, BucketID)
            SetRoutingBucketPopulationEnabled(BucketID, false)
            TriggerClientEvent("qb-clothes:OpenClothingMenu", src, _clothes)
        end
    end
end)

RegisterServerEvent('qb-clothes:SetOutfits')
AddEventHandler('qb-clothes:SetOutfits', function(name)
    local src = source
    local _name = name
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local license = QBCore.Functions.GetIdentifier(src, 'license')
    TriggerEvent('qb-clothes:retrieveOutfits', citizenid, license, _name, function(call)
        if call then
            MySQL.Async.execute("UPDATE playerclothe SET `clothes` = ? WHERE `citizenid`= ? AND `license`= ? ", {call, citizenid, license})
            TriggerClientEvent("qb-appearance:LoadSkinClient", src)
        end
    end)
end)

RegisterServerEvent('qb-clothes:DeleteOutfit')
AddEventHandler('qb-clothes:DeleteOutfit', function(name)
    local src = source
    local _name = name
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local license = QBCore.Functions.GetIdentifier(src, 'license')
    MySQL.Async.fetchAll('DELETE FROM playeroutfit WHERE citizenid = ? AND license = ? AND name =  ?', {citizenid, license, _name})
end)

RegisterServerEvent('qb-clothes:getOutfits')
AddEventHandler('qb-clothes:getOutfits', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local license = QBCore.Functions.GetIdentifier(src, 'license')
    local outfits = MySQL.Sync.fetchAll('SELECT * FROM playeroutfit WHERE citizenid = ? AND license = ?', {citizenid, license})
    if outfits[1] then
        TriggerClientEvent('qb-clothes:putInTable', src, outfits)
    end
end)

AddEventHandler('qb-clothes:retrieveClothes', function(citizenid, license, callback)
    local Callback = callback
    local clothes = MySQL.Sync.fetchAll('SELECT * FROM playerclothe WHERE citizenid = ? AND license = ?', {citizenid, license})
    if clothes[1] then
        Callback(clothes[1])
    else
        Callback(false)
    end
end)

AddEventHandler('qb-clothes:retrieveOutfits', function(citizenid, license, name, callback)
    local Callback = callback
    local clothes = MySQL.Sync.fetchAll('SELECT * FROM playeroutfit WHERE citizenid = ? AND license = ? AND name = ?', {citizenid, license, name})
    if clothes[1] then
        Callback(clothes[1]["clothes"])
    else
        Callback(false)
    end
end)

RegisterServerEvent("qb-clothes:deleteClothes")
AddEventHandler("qb-clothes:deleteClothes", function(license, Callback)
    local src = source
    local id
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            id = v
            break
        end
    end
    local Callback = callback
    MySQL.Async.fetchAll('DELETE FROM playerclothe WHERE `citizenid`= ? AND`license`= ?;', {id, license})
    MySQL.Async.fetchAll('DELETE FROM playeroutfit WHERE `citizenid`= ? AND`license`= ?;', {id, license})
end)
