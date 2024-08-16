-- Functions
local identifierUsed = GetConvar('es_identifierUsed', 'steam')
local foundResources = {}
-- Functions
local QBCore = exports['qb-core']:GetCoreObject()

local StarterItems = {
    ['bread'] = { amount = 5, item = 'bread' },
	['water'] = { amount = 5, item = 'water' },
    ['cash'] = { amount = 150, item = 'cash' }
}

local function GiveStarterItems(source)
    local Player = QBCore.Functions.GetPlayer(source)
    for k, v in pairs(StarterItems) do
        Player.Functions.AddItem(v.item, v.amount)
    end
end

local function loadHouseData()
    local HouseGarages = {}
    local Houses = {}
    local result = MySQL.Sync.fetchAll('SELECT * FROM houselocations')
    if result[1] ~= nil then
        for k, v in pairs(result) do
            local owned = false
            if tonumber(v.owned) == 1 then
                owned = true
            end
            local garage = v.garage ~= nil and json.decode(v.garage) or {}
            Houses[v.name] = {
                coords = json.decode(v.coords),
                owned = v.owned,
                price = v.price,
                locked = true,
                adress = v.label,
                tier = v.tier,
                garage = garage,
                decorations = {},
            }
            HouseGarages[v.name] = {
                label = v.label,
                takeVehicle = garage,
            }
        end
    end
    TriggerClientEvent("qb-garages:client:houseGarageConfig", -1, HouseGarages)
    TriggerClientEvent("qb-houses:client:setHouseConfig", -1, Houses)
end

RegisterNetEvent('qb-multicharacter:server:disconnect', function(source)
    DropPlayer(source, "You have disconnected from QBCore RedM")
end)

RegisterNetEvent('qb-multicharacter:server:loadUserData', function(cData)
    local src = source
    if QBCore.Player.Login(src, cData.citizenid) then
        print('^2[qb-core]^7 '..GetPlayerName(src)..' (Citizen ID: '..cData.citizenid..') has succesfully loaded!')
        QBCore.Commands.Refresh(src)
        TriggerClientEvent("qb-multicharacter:client:closeNUI", src)
        TriggerClientEvent('qb-spawn:client:setupSpawnUI', src, cData, false)
        TriggerEvent("qb-log:server:CreateLog", "joinleave", "Loaded", "green", "**".. GetPlayerName(src) .. "** ("..cData.citizenid.." | "..src..") loaded..")
	end
end)

RegisterNetEvent('qb-multicharacter:server:createCharacter', function(data, enabledhouses)
    local newData = {}
    local src = source
    newData.cid = data.cid
    newData.charinfo = data
    if QBCore.Player.Login(src, false, newData) then
        QBCore.ShowSuccess(GetCurrentResourceName(), GetPlayerName(src)..' has succesfully loaded!')
        QBCore.Commands.Refresh(src)
        --[[if enabledhouses then loadHouseData() end]] -- Enable once housing is ready
        TriggerClientEvent("qb-multicharacter:client:closeNUI", src)
        GiveStarterItems(src)
	end
end)

RegisterNetEvent('qb-multicharacter:server:deleteCharacter', function(citizenid)
    QBCore.Player.DeleteCharacter(source, citizenid)
end)

-- Callbacks

QBCore.Functions.CreateCallback("qb-multicharacter:server:setupCharacters", function(source, cb)
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    local plyChars = {}
    MySQL.Async.fetchAll('SELECT * FROM players WHERE license = @license', {['@license'] = license}, function(result)
        for i = 1, (#result), 1 do
            result[i].charinfo = json.decode(result[i].charinfo)
            result[i].money = json.decode(result[i].money)
            result[i].job = json.decode(result[i].job)
            plyChars[#plyChars+1] = result[i]
        end
        cb(plyChars)
    end)
end)

QBCore.Functions.CreateCallback("qb-multicharacter:server:GetNumberOfCharacters", function(source, cb)
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    print('get user license:'..license)
    local numOfChars = 0
    if next(Config.PlayersNumberOfCharacters) then
        for i, v in pairs(Config.PlayersNumberOfCharacters) do
            if v.license == license then
                numOfChars = v.numberOfChars
                break
            else
                numOfChars = Config.DefaultNumberOfCharacters
            end
        end
    else
        numOfChars = Config.DefaultNumberOfCharacters
    end
    cb(numOfChars)
end)

QBCore.Commands.Add("logout", "Logout of Character (Admin Only)", {}, false, function(source)
    QBCore.Player.Logout(source)
    TriggerClientEvent('qb-multicharacter:client:chooseChar', source)
end, 'admin')

QBCore.Commands.Add("closeNUI", "Close Multi NUI", {}, false, function(source)
    TriggerClientEvent('qb-multicharacter:client:closeNUI', source)
end, 'user')
