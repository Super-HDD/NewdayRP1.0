local QBCore = exports['qb-core']:GetCoreObject()
local PlantsLoaded = false

-- use seed
QBCore.Functions.CreateUseableItem("indtobaccoseed", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-indiantobacco:client:plantNewSeed', src, 'indtobacco')
    Player.Functions.RemoveItem('indtobaccoseed', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobaccoseed'], "remove")
end)

-- use indian cigar
QBCore.Functions.CreateUseableItem("indiancigar", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-indiantobacco:client:SmokeIndian', src)
end)

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        if PlantsLoaded then
            TriggerClientEvent('qb-indiantobacco:client:updatePlantData', -1, Config.Plants)
        end
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('qb-indiantobacco:server:getPlants')
    PlantsLoaded = true
end)

RegisterServerEvent('qb-indiantobacco:server:savePlant')
AddEventHandler('qb-indiantobacco:server:savePlant', function(data, plantId)
    local data = json.encode(data)
    MySQL.Async.execute('INSERT INTO indian_plants (properties, plantid) VALUES (@properties, @plantid)', {
        ['@properties'] = data,
        ['@plantid'] = plantId
    })
end)

-- give seed
RegisterServerEvent('qb-indiantobacco:server:giveSeed')
AddEventHandler('qb-indiantobacco:server:giveSeed', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('indtobaccoseed', math.random(1, 2))
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobaccoseed'], "add")
end)

-- plant seed
RegisterServerEvent('qb-indiantobacco:server:plantNewSeed')
AddEventHandler('qb-indiantobacco:server:plantNewSeed', function(type, location)
    local src = source
    local plantId = math.random(111111, 999999)
    local Player = QBCore.Functions.GetPlayer(src)
    local SeedData = {
        id = plantId, 
        type = type, 
        x = location.x, 
        y = location.y, 
        z = location.z, 
        hunger = Config.StartingHunger, 
        thirst = Config.StartingThirst, 
        growth = 0.0, 
        quality = 100.0, 
        grace = true, 
        beingHarvested = false, 
        planter = Player.PlayerData.citizenid,
        planttime = os.time(),
    }

    local PlantCount = 0

    for k, v in pairs(Config.Plants) do
        if v.planter == Player.PlayerData.citizenid then
            PlantCount = PlantCount + 1
        end
    end

    if PlantCount >= Config.MaxPlantCount then
        TriggerClientEvent('QBCore:Notify', src, '你已经拥有了 ' .. Config.MaxPlantCount .. ' 植物', 'error')
    else
        table.insert(Config.Plants, SeedData)
        TriggerEvent('qb-indiantobacco:server:savePlant', SeedData, plantId)
        TriggerEvent('qb-indiantobacco:server:updatePlants')
    end
end)

-- check plant
RegisterServerEvent('qb-indiantobacco:server:plantHasBeenHarvested')
AddEventHandler('qb-indiantobacco:server:plantHasBeenHarvested', function(plantId)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            v.beingHarvested = true
        end
    end
    TriggerEvent('qb-indiantobacco:server:updatePlants')
end)

-- distory plant (police)
RegisterServerEvent('qb-indiantobacco:server:destroyPlant')
AddEventHandler('qb-indiantobacco:server:destroyPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            table.remove(Config.Plants, k)
        end
    end
    TriggerClientEvent('qb-indiantobacco:client:removePlantObject', src, plantId)
    TriggerEvent('qb-indiantobacco:server:PlantRemoved', plantId)
    TriggerEvent('qb-indiantobacco:server:updatePlants')
    TriggerClientEvent('QBCore:Notify', src, 'you distroyed the plant', 'success')
end)

-- harvest plant
RegisterServerEvent('qb-indiantobacco:server:harvestPlant')
AddEventHandler('qb-indiantobacco:server:harvestPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount
    local label
    local item
    local poorQuality = false
    local goodQuality = false
    local exellentQuality = false
    local hasFound = false

    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            for y = 1, #Config.YieldRewards do
                if v.type == Config.YieldRewards[y].type then
                    label = Config.YieldRewards[y].label
                    item = Config.YieldRewards[y].item
                    amount = math.random(Config.YieldRewards[y].rewardMin, Config.YieldRewards[y].rewardMax)
                    local quality = math.ceil(v.quality)
                    hasFound = true
                    table.remove(Config.Plants, k)
                    if quality > 0 and quality <= 25 then -- poor
                        poorQuality = true
                    elseif quality >= 25 and quality <= 75 then -- good
                        goodQuality = true
                    elseif quality >= 75 then -- excellent
                        exellentQuality = true
                    end
                end
            end
        end
    end
    -- give rewards
    if hasFound then        
        if poorQuality then
            local pooramount = math.random(1,3)
            Player.Functions.AddItem('indtobacco', pooramount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobacco'], "add")
            TriggerClientEvent('QBCore:Notify', src, '您收获了'..pooramount ..'印度烟草', 'success')
            Player.Functions.SetMetaData("dealerrep", Player.PlayerData.metadata["dealerrep"] + pooramount)
            Wait(5000)
            TriggerEvent('qb-indiantobacco:server:dealerrep', src)
        elseif goodQuality then
            local goodamount = math.random(3,6)
            Player.Functions.AddItem('indtobacco', goodamount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobacco'], "add")
            TriggerClientEvent('QBCore:Notify', src, '您收获了'..goodamount..'印度烟草', 'success')
            Player.Functions.SetMetaData("dealerrep", Player.PlayerData.metadata["dealerrep"] + goodamount)
            Wait(5000)
            TriggerEvent('qb-indiantobacco:server:dealerrep', src)
        elseif exellentQuality then
            local exellentamount = math.random(6,12)
            Player.Functions.AddItem('indtobacco', exellentamount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobacco'], "add")
            Player.Functions.AddItem('indtobaccoseed', 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobaccoseed'], "add")
            TriggerClientEvent('QBCore:Notify', src, '您收获了'..exellentamount ..'印度烟草', 'success')
            Player.Functions.SetMetaData("dealerrep", Player.PlayerData.metadata["dealerrep"] + exellentamount)
            Wait(5000)
            TriggerEvent('qb-indiantobacco:server:dealerrep', src)
        else
            print("something went wrong!")
        end
        TriggerClientEvent('qb-indiantobacco:client:removePlantObject', src, plantId)
        TriggerEvent('qb-indiantobacco:server:PlantRemoved', plantId)
        TriggerEvent('qb-indiantobacco:server:updatePlants')
    end
end)

RegisterServerEvent('qb-indiantobacco:server:updatePlants')
AddEventHandler('qb-indiantobacco:server:updatePlants', function()
    local src = source
    TriggerClientEvent('qb-indiantobacco:client:updatePlantData', src, Config.Plants)
end)

-- water plant
RegisterServerEvent('qb-indiantobacco:server:waterPlant')
AddEventHandler('qb-indiantobacco:server:waterPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].thirst = Config.Plants[k].thirst + Config.ThirstIncrease
            if Config.Plants[k].thirst > 100.0 then
                Config.Plants[k].thirst = 100.0
            end
        end
    end
    Player.Functions.RemoveItem('water', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['water'], "remove")
    TriggerEvent('qb-indiantobacco:server:updatePlants')
end)

-- feed plant
RegisterServerEvent('qb-indiantobacco:server:feedPlant')
AddEventHandler('qb-indiantobacco:server:feedPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(Config.Plants) do
        if v.id == plantId then
            Config.Plants[k].hunger = Config.Plants[k].hunger + Config.HungerIncrease
            if Config.Plants[k].hunger > 100.0 then
                Config.Plants[k].hunger = 100.0
            end
        end
    end
    Player.Functions.RemoveItem('fertilizer', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fertilizer'], "remove")
    TriggerEvent('qb-indiantobacco:server:updatePlants')
end)

-- update plant
RegisterServerEvent('qb-indiantobacco:server:updateIndianPlants')
AddEventHandler('qb-indiantobacco:server:updateIndianPlants', function(id, data)
    local result = MySQL.query.await('SELECT * FROM indian_plants WHERE plantid = @plantid', {
        ['@plantid'] = id
    })
    if result[1] then
        local newData = json.encode(data)
        MySQL.Async.execute('UPDATE indian_plants SET properties = @properties WHERE plantid = @id', {
            ['@properties'] = newData,
            ['@id'] = id
        })
    end
end)

-- remove plant
RegisterServerEvent('qb-indiantobacco:server:PlantRemoved')
AddEventHandler('qb-indiantobacco:server:PlantRemoved', function(plantId)
    local result = MySQL.query.await('SELECT * FROM indian_plants')
    if result then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            if plantData.id == plantId then
                MySQL.Async.execute('DELETE FROM indian_plants WHERE id = @id', {
                    ['@id'] = result[i].id
                })
                for k, v in pairs(Config.Plants) do
                    if v.id == plantId then
                        table.remove(Config.Plants, k)
                    end
                end
            end
        end
    end
end)

-- get plant
RegisterServerEvent('qb-indiantobacco:server:getPlants')
AddEventHandler('qb-indiantobacco:server:getPlants', function()
    local data = {}
    local result = MySQL.query.await('SELECT * FROM indian_plants')
    if result[1] then
        for i = 1, #result do
            local plantData = json.decode(result[i].properties)
            print('loading indian plant with ID: '..plantData.id)
            table.insert(Config.Plants, plantData)
        end
    end
end)

-- plant timer
Citizen.CreateThread(function()
    while true do
        Wait(Config.GrowthTimer)
        for i = 1, #Config.Plants do
            if Config.Plants[i].growth < 100 then
                if Config.Plants[i].grace then
                    Config.Plants[i].grace = false
                else
                    Config.Plants[i].thirst = Config.Plants[i].thirst - 1
                    Config.Plants[i].hunger = Config.Plants[i].hunger - 1
                    Config.Plants[i].growth = Config.Plants[i].growth + 1

                    if Config.Plants[i].growth > 100 then
                        Config.Plants[i].growth = 100
                    end

                    if Config.Plants[i].hunger < 0 then
                        Config.Plants[i].hunger = 0
                    end

                    if Config.Plants[i].thirst < 0 then
                        Config.Plants[i].thirst = 0
                    end

                    if Config.Plants[i].quality < 25 then
                        Config.Plants[i].quality = 25
                    end

                    if Config.Plants[i].thirst < 75 or Config.Plants[i].hunger < 75 then
                        Config.Plants[i].quality = Config.Plants[i].quality - 1
                    end
                end
            else
                local untildead = Config.Plants[i].planttime + Config.DeadPlantTime
                local currenttime = os.time()
                if currenttime > untildead then
                    deadid = Config.Plants[i].id
                    print('Removing Dead Plant with ID '..deadid)
                    TriggerEvent('qb-indiantobacco:server:PlantRemoved', deadid)
                end
            end
            TriggerEvent('qb-indiantobacco:server:updateIndianPlants', Config.Plants[i].id, Config.Plants[i])
        end
        TriggerEvent('qb-indiantobacco:server:updatePlants')
    end
end)

-- check your dealer reputation
QBCore.Commands.Add("dealerrep", "check your dealer reputation ", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local curRep = Player.PlayerData.metadata["dealerrep"]
    TriggerClientEvent('QBCore:Notify', src, '您的经销商声誉是 '.. curRep, 'primary')
end)

-- used by harvest to show new dealer reputation
RegisterServerEvent('qb-indiantobacco:server:dealerrep')
AddEventHandler('qb-indiantobacco:server:dealerrep', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local curRep = Player.PlayerData.metadata["dealerrep"]
    TriggerClientEvent('QBCore:Notify', src, '您的经销商声誉提高至 '.. curRep, 'primary')
end)

-- trade tobacco
RegisterServerEvent('qb-indiantrader:server:tradetobacco')
AddEventHandler('qb-indiantrader:server:tradetobacco', function(data) -- 1 / 5 / 10
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local checktobacco = Player.Functions.GetItemByName("indtobacco")
    local trade = data.trade
    if checktobacco ~= nil then
        local playerindiantobacco = Player.Functions.GetItemByName('indtobacco').amount
        --print(trade)
        if trade == 1 then
            if playerindiantobacco >= 10 then
                Player.Functions.RemoveItem('indtobacco', 10)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobacco'], "remove")
                Player.Functions.AddItem('indiancigar', 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indiancigar'], "remove")
            else
                TriggerClientEvent('QBCore:Notify', src, '你没有足够的印度烟草来做到这一点!', 'error')
            end
        elseif trade == 5 then
            if playerindiantobacco >= 50 then
                Player.Functions.RemoveItem('indtobacco', 50)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobacco'], "remove")
                Player.Functions.AddItem('indiancigar', 5)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indiancigar'], "remove")
            else
                TriggerClientEvent('QBCore:Notify', src, '你没有足够的印度烟草来做到这一点!', 'error')
            end
        elseif trade == 10 then
            if playerindiantobacco >= 100 then
                Player.Functions.RemoveItem('indtobacco', 100)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indtobacco'], "remove")
                Player.Functions.AddItem('indiancigar', 10)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['indiancigar'], "remove")
            else
                TriggerClientEvent('QBCore:Notify', src, '你没有足够的印度烟草来做到这一点!', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, '不足以完成交易!', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, '你没有任何印度烟草!', 'error')
    end
end)

-- remove item
RegisterServerEvent('qb-indiantobacco:server:removeitem')
AddEventHandler('qb-indiantobacco:server:removeitem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)
