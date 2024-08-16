local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-wardrobe:server:getPlayerSkin', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid
    local skins = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ?', {cid})
    cb(skins[1])
end)

QBCore.Commands.Add("undress", "removes all clothing", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local jailed = Player.PlayerData.metadata['injail']

    if jailed > 0 then return end

    TriggerClientEvent('qb-wardrobe:client:removeAllClothing', src)
end)

QBCore.Commands.Add("hat", "hat on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "hat")
end)

QBCore.Commands.Add("shirt", "shirt on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "shirt")
end)

QBCore.Commands.Add("pants", "pants on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "pants")
end)

QBCore.Commands.Add("boots", "boots on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "boots")
end)

QBCore.Commands.Add("coat", "coat on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "coats")
end)

QBCore.Commands.Add("closedcoat", "closed coat on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "closedcoats")
end)

QBCore.Commands.Add("gloves", "gloves on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "glove")
end)

QBCore.Commands.Add("poncho", "ponchos on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "ponchos")
end)

QBCore.Commands.Add("vest", "vest on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "vest")
end)

QBCore.Commands.Add("sleeve", "sleeve shirt on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "sleeve")
end)

QBCore.Commands.Add("eyewear", "eyewear on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "eyewear")
end)

QBCore.Commands.Add("belt", "belts on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "belts")
end)

QBCore.Commands.Add("cloak", "cloaks on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "cloaks")
end)

QBCore.Commands.Add("chaps", "chaps on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "chaps")
end)

QBCore.Commands.Add("mask", "masks on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "masks")
end)

QBCore.Commands.Add("neckwear", "neckwear on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "neckwear")
end)

QBCore.Commands.Add("accessories", "accessories on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "accessories")
end)

QBCore.Commands.Add("gauntlets", "gauntlets on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "gauntlets")
end)

QBCore.Commands.Add("neckties", "neckties on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "neckties")
end)

QBCore.Commands.Add("loadouts", "loadouts on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "loadouts")
end)

QBCore.Commands.Add("suspenders", "suspenders on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "suspenders")
end)

QBCore.Commands.Add("satchels", "satchels on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "satchels")
end)

QBCore.Commands.Add("gunbelt", "gunbelt on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "gunbelts")
end)

QBCore.Commands.Add("buckle", "buckles on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "buckles")
end)

QBCore.Commands.Add("skirt", "skirts on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "skirts")
end)

QBCore.Commands.Add("armor", "armor on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "armor")
end)

QBCore.Commands.Add("hairaccessories", "hair accessories on/off", {}, false, function(source)
    local src = source
    TriggerClientEvent('qb-wardrobe:client:OnOffClothing', src, "hair_accessories")
end)

QBCore.Commands.Add("dress", "Wear all clothing", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local jailed = Player.PlayerData.metadata['injail']

    if jailed > 0 then return end

    local citizenid = Player.PlayerData.citizenid
    local license = QBCore.Functions.GetIdentifier(source, 'license')
    local _clothes =  MySQL.Sync.fetchAll('SELECT * FROM playerclothe WHERE citizenid = ? AND license = ?', {citizenid, license})

    if _clothes[1] then
        _clothes = json.decode(_clothes[1].clothes)
    else
        _clothes = {}
    end

    if _clothes then
        TriggerClientEvent("qb-clothes:ApplyClothes", src, _clothes)
    end
end)