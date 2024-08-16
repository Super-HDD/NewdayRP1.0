local QBCore = exports['qb-core']:GetCoreObject()

local PlantsLoaded = false
local CollectedPoop = {}

-----------------------------------------------------------------------

-- cornseed
QBCore.Functions.CreateUseableItem("cornseed", function(source)
    local src = source

    TriggerClientEvent('qb-farmer:client:plantNewSeed', src, 'corn', 'CRP_CORNSTALKS_AB_SIM', 'cornseed')
end)

-- sugarseed
QBCore.Functions.CreateUseableItem("sugarseed", function(source)
    local src = source

    TriggerClientEvent('qb-farmer:client:plantNewSeed', src, 'sugar', 'CRP_SUGARCANE_AC_SIM', 'sugarseed')
end)

-- tobaccoseed
QBCore.Functions.CreateUseableItem("tobaccoseed", function(source)
    local src = source

    TriggerClientEvent('qb-farmer:client:plantNewSeed', src, 'tobacco', 'CRP_TOBACCOPLANT_AC_SIM', 'tobaccoseed')
end)

-- carrotseed
QBCore.Functions.CreateUseableItem("carrotseed", function(source)
    local src = source

    TriggerClientEvent('qb-farmer:client:plantNewSeed', src, 'carrot', 'CRP_CARROTS_AA_SIM', 'carrotseed')
end)

-- tomatoseed
QBCore.Functions.CreateUseableItem("tomatoseed", function(source)
    local src = source

    TriggerClientEvent('qb-farmer:client:plantNewSeed', src, 'tomato', 'CRP_TOMATOES_AA_SIM', 'tomatoseed')
end)

-- broccoliseed
QBCore.Functions.CreateUseableItem("broccoliseed", function(source)
    local src = source

    TriggerClientEvent('qb-farmer:client:plantNewSeed', src, 'broccoli', 'crp_broccoli_aa_sim', 'broccoliseed')
end)

-- potatoseed
QBCore.Functions.CreateUseableItem("potatoseed", function(source)
    local src = source

    TriggerClientEvent('qb-farmer:client:plantNewSeed', src, 'potato', 'crp_potato_aa_sim', 'potatoseed')
end)

-----------------------------------------------------------------------

-- remove seed item
RegisterServerEvent('qb-farmer:server:removeitem')
AddEventHandler('qb-farmer:server:removeitem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(item, amount)

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)

-----------------------------------------------------------------------

-- update plant data
CreateThread(function()
    while true do
        Wait(5000)

        if PlantsLoaded then
            TriggerClientEvent('qb-farmer:client:updatePlantData', -1, Config.FarmPlants)
        end
    end
end)

CreateThread(function()
    TriggerEvent('qb-farmer:server:getPlants')
    PlantsLoaded = true
end)

RegisterServerEvent('qb-farmer:server:savePlant')
AddEventHandler('qb-farmer:server:savePlant', function(data, plantId, citizenid)
    local datas = json.encode(data)

    MySQL.Async.execute('INSERT INTO player_plants (properties, plantid, citizenid) VALUES (@properties, @plantid, @citizenid)',
    {
        ['@properties'] = datas,
        ['@plantid'] = plantId,
        ['@citizenid'] = citizenid
    })
end)

-- plant seed
RegisterServerEvent('qb-farmer:server:plantNewSeed')
AddEventHandler('qb-farmer:server:plantNewSeed', function(planttype, location, hash)
    local src = source
    local plantId = math.random(111111, 999999)
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    local SeedData =
    {
        id = plantId,
        planttype = planttype,
        x = location.x,
        y = location.y,
        z = location.z,
        hunger = Config.StartingHunger,
        thirst = Config.StartingThirst,
        growth = 0.0,
        quality = 100.0,
        grace = true,
        hash = hash,
        beingHarvested = false,
        planter = Player.PlayerData.citizenid,
        planttime = os.time()
    }

    local PlantCount = 0

    for _, v in pairs(Config.FarmPlants) do
        if v.planter == Player.PlayerData.citizenid then
            PlantCount = PlantCount + 1
        end
    end

    if PlantCount >= Config.MaxPlantCount then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.you_already_have_plants_down',{MaxPlantCount = Config.MaxPlantCount}), 'error')
    else
        table.insert(Config.FarmPlants, SeedData)
        TriggerEvent('qb-farmer:server:savePlant', SeedData, plantId, citizenid)
        TriggerEvent('qb-farmer:server:updatePlants')
    end
end)

-- check plant
RegisterServerEvent('qb-farmer:server:plantHasBeenHarvested')
AddEventHandler('qb-farmer:server:plantHasBeenHarvested', function(plantId)
    for _, v in pairs(Config.FarmPlants) do
        if v.id == plantId then
            v.beingHarvested = true
        end
    end

    TriggerEvent('qb-farmer:server:updatePlants')
end)

-- distory plant (police)
RegisterServerEvent('qb-farmer:server:destroyPlant')
AddEventHandler('qb-farmer:server:destroyPlant', function(plantId)
    local src = source

    for k, v in pairs(Config.FarmPlants) do
        if v.id == plantId then
            table.remove(Config.FarmPlants, k)
        end
    end

    TriggerClientEvent('qb-farmer:client:removePlantObject', -1, plantId)
    TriggerEvent('qb-farmer:server:PlantRemoved', plantId)
    TriggerEvent('qb-farmer:server:updatePlants')
    TriggerClientEvent('QBCore:Notify', src, Lang:t('success.you_distroyed_the_plant'), 'success')
end)

-- harvest plant and give reward
RegisterServerEvent('qb-farmer:server:harvestPlant')
AddEventHandler('qb-farmer:server:harvestPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local poorAmount = 0
    local goodAmount = 0
    local exellentAmount = 0
    local poorQuality = false
    local goodQuality = false
    local exellentQuality = false
    local hasFound = false
    local label = nil
    local item = nil

    for k, v in pairs(Config.FarmPlants) do
        if v.id == plantId then
            for y = 1, #Config.FarmItems do
                if v.planttype == Config.FarmItems[y].planttype then
                    label = Config.FarmItems[y].label
                    item = Config.FarmItems[y].item
                    poorAmount = math.random(Config.FarmItems[y].poorRewardMin, Config.FarmItems[y].poorRewardMax)
                    goodAmount = math.random(Config.FarmItems[y].goodRewardMin, Config.FarmItems[y].goodRewardMax)
                    exellentAmount = math.random(Config.FarmItems[y].exellentRewardMin, Config.FarmItems[y].exellentRewardMax)
                    local quality = math.ceil(v.quality)
                    hasFound = true

                    table.remove(Config.FarmPlants, k)

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
    if not hasFound then return end

    if poorQuality then
        Player.Functions.AddItem(item, poorAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.you_harvest_label',{amount = poorAmount, label = label}), 'success')
    elseif goodQuality then
        Player.Functions.AddItem(item, goodAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.you_harvest_label',{amount = goodAmount, label = label}), 'success')
    elseif exellentQuality then
        Player.Functions.AddItem(item, exellentAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.you_harvest_label',{amount = exellentAmount, label = label}), 'success')
    else
        print("something went wrong!")
    end

    TriggerClientEvent('qb-farmer:client:removePlantObject', -1, plantId)
    TriggerEvent('qb-farmer:server:PlantRemoved', plantId)
    TriggerEvent('qb-farmer:server:updatePlants')
end)

RegisterServerEvent('qb-farmer:server:updatePlants')
AddEventHandler('qb-farmer:server:updatePlants', function()
    local src = source

    TriggerClientEvent('qb-farmer:client:updatePlantData', src, Config.FarmPlants)
end)

-- water plant
RegisterServerEvent('qb-farmer:server:waterPlant')
AddEventHandler('qb-farmer:server:waterPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.FarmPlants) do
        if v.id == plantId then
            Config.FarmPlants[k].thirst = Config.FarmPlants[k].thirst + Config.ThirstIncrease
            if Config.FarmPlants[k].thirst > 100.0 then
                Config.FarmPlants[k].thirst = 100.0
            end
        end
    end

    if not Player.Functions.RemoveItem('water', 1) then return end

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['water'], "remove")
    TriggerEvent('qb-farmer:server:updatePlants')
end)

-- feed plant
RegisterServerEvent('qb-farmer:server:feedPlant')
AddEventHandler('qb-farmer:server:feedPlant', function(plantId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.FarmPlants) do
        if v.id == plantId then
            Config.FarmPlants[k].hunger = Config.FarmPlants[k].hunger + Config.HungerIncrease

            if Config.FarmPlants[k].hunger > 100.0 then
                Config.FarmPlants[k].hunger = 100.0
            end
        end
    end

    if not Player.Functions.RemoveItem('fertilizer', 1) then return end

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fertilizer'], "remove")
    TriggerEvent('qb-farmer:server:updatePlants')
end)

-- update plant
RegisterServerEvent('qb-farmer:server:updateFarmPlants')
AddEventHandler('qb-farmer:server:updateFarmPlants', function(id, data)
    local result = MySQL.query.await('SELECT * FROM player_plants WHERE plantid = @plantid',
    {
        ['@plantid'] = id
    })

    if not result[1] then return end

    local newData = json.encode(data)

    MySQL.Async.execute('UPDATE player_plants SET properties = @properties WHERE plantid = @id',
    {
        ['@properties'] = newData,
        ['@id'] = id
    })
end)

-- remove plant
RegisterServerEvent('qb-farmer:server:PlantRemoved')
AddEventHandler('qb-farmer:server:PlantRemoved', function(plantId)
    local result = MySQL.query.await('SELECT * FROM player_plants')

    if not result then return end

    for i = 1, #result do
        local plantData = json.decode(result[i].properties)

        if plantData.id == plantId then
            MySQL.Async.execute('DELETE FROM player_plants WHERE id = @id',
            {
                ['@id'] = result[i].id
            })

            for k, v in pairs(Config.FarmPlants) do
                if v.id == plantId then
                    table.remove(Config.FarmPlants, k)
                end
            end
        end
    end
end)

-- get plant
RegisterServerEvent('qb-farmer:server:getPlants')
AddEventHandler('qb-farmer:server:getPlants', function()
    local result = MySQL.query.await('SELECT * FROM player_plants')

    if not result[1] then return end

    for i = 1, #result do
        local plantData = json.decode(result[i].properties)
        print('loading '..plantData.planttype..' plant with ID: '..plantData.id)
        table.insert(Config.FarmPlants, plantData)
    end
end)

-- plant timer
CreateThread(function()
    while true do
        Wait(Config.GrowthTimer)

        for i = 1, #Config.FarmPlants do
            if Config.FarmPlants[i].growth < 100 then
                if Config.FarmPlants[i].grace then
                    Config.FarmPlants[i].grace = false
                else
                    Config.FarmPlants[i].thirst = Config.FarmPlants[i].thirst - 1
                    Config.FarmPlants[i].hunger = Config.FarmPlants[i].hunger - 1
                    Config.FarmPlants[i].growth = Config.FarmPlants[i].growth + 1

                    if Config.FarmPlants[i].growth > 100 then
                        Config.FarmPlants[i].growth = 100
                    end

                    if Config.FarmPlants[i].hunger < 0 then
                        Config.FarmPlants[i].hunger = 0
                    end

                    if Config.FarmPlants[i].thirst < 0 then
                        Config.FarmPlants[i].thirst = 0
                    end

                    if Config.FarmPlants[i].quality < 25 then
                        Config.FarmPlants[i].quality = 25
                    end

                    if Config.FarmPlants[i].thirst < 75 or Config.FarmPlants[i].hunger < 75 then
                        Config.FarmPlants[i].quality = Config.FarmPlants[i].quality - 1
                    end
                end
            else
                local untildead = Config.FarmPlants[i].planttime + Config.DeadPlantTime
                local currenttime = os.time()

                if currenttime > untildead then
                    local deadid = Config.FarmPlants[i].id

                    print('Removing Dead Plant with ID '..deadid)

                    TriggerEvent('qb-farmer:server:PlantRemoved', deadid)
                end
            end

            TriggerEvent('qb-farmer:server:updateFarmPlants', Config.FarmPlants[i].id, Config.FarmPlants[i])
        end

        TriggerEvent('qb-farmer:server:updatePlants')
    end
end)

-- give farmer collected water
RegisterServerEvent('qb-farmer:server:giveitem')
AddEventHandler('qb-farmer:server:giveitem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem(item, amount)

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

-- Collected Poop
RegisterNetEvent('qb-farmer:server:CollectedPoop')
AddEventHandler('qb-farmer:server:CollectedPoop', function(coords)
    local exists = false

    for i = 1, #CollectedPoop do
        local poo = CollectedPoop[i]

        if poo == coords then
            exists = true

            break
        end
    end

    if not exists then
        CollectedPoop[#CollectedPoop + 1] = coords
    end
end)

local CollectedPoo = function()
    for i = 1, #CollectedPoop do
        local poo = CollectedPoop[i]

        if poo then
            print(poo)
        end
    end
end

QBCore.Commands.Add('checkpoo', 'Check Collected Poo', {}, false, function(source)
    CollectedPoo()
end)

QBCore.Functions.CreateCallback('qb-farmer:server:CheckCollectedPoop', function(source, cb, coords)
    local exists = false

    print('Client: '..coords)

    for i = 1, #CollectedPoop do
        local poo = CollectedPoop[i]

        if poo == coords then
            exists = true

            print('Server: '..poo)

            break
        end
    end

    print(exists)

    cb(exists)
end)