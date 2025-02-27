local QBCore = exports['qb-core']:GetCoreObject()
local isBusy = false
local SpawnedPlants = {}
local HarvestedPlants = {}
local canHarvest = true
local isDoingAction = false
local Zones = {}
local zonename = nil
local inFarmZone = false
local farmZoneRequired = false
local seedBasedZones = false
local isLoggedIn = false
local PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

-- For Ensure Command
AddEventHandler('onResourceStart', function(JobInfo)
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

-- Create Farm Zones
CreateThread(function()
    if not Config.UseFarmingZones then return end

    for k=1, #Config.FarmZone do
        Zones[k] = PolyZone:Create(Config.FarmZone[k].zones, {
            name = Config.FarmZone[k].name,
            minZ = Config.FarmZone[k].minz,
            maxZ = Config.FarmZone[k].maxz,
            debugPoly = false,
        })

        Zones[k]:onPlayerInOut(function(isPointInside)
            if not isPointInside then
                inFarmZone = false
                return
            end

            inFarmZone = true
            zonename = Zones[k].name

            -- Seed Based Farm Zone
            if not Config.UseSeedBasedZones then
                QBCore.Functions.Notify(Lang:t('primary.you_have_entered_farm_zone'), 'primary', 3000)
                Wait(3000)

                return
            end

            local msg = Lang:t('primary.you_have_entered_farm_zone_zonename',{zonename = zonename})
            local msg1 = Lang:t('primary.you_may_only_plant_seeds_here',{zonename = zonename})

            QBCore.Functions.Notify(msg, 'primary', 3000)

            if Config.NotificationSound then
                NotificationSound(msg1)
            end

            Wait(3000)
        end)
    end
end)

-- Create Farm Zone Blips
Citizen.CreateThread(function()
    if not Config.UseFarmingZones then return end

    for farmzone, v in pairs(Config.FarmZone) do
        if v.showblip then
            local FarmZoneBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.blipcoords)
            local blipName = Lang:t('瓦伦丁公共农场')

            if Config.UseSeedBasedZones then
                blipName = v.blipname
            end

            SetBlipSprite(FarmZoneBlip, 669307703, true)
            SetBlipScale(FarmZoneBlip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, FarmZoneBlip, blipName)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(150)

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local InRange = false

        for i = 1, #Config.FarmPlants do
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.FarmPlants[i].x, Config.FarmPlants[i].y, Config.FarmPlants[i].z, true)

            if dist >= 50.0 then goto continue end

            local hasSpawned = false
            InRange = true

            for z = 1, #SpawnedPlants do
                local p = SpawnedPlants[z]

                if p.id == Config.FarmPlants[i].id then
                    hasSpawned = true
                end
            end

            if hasSpawned then goto continue end

            local planthash = Config.FarmPlants[i].hash
            local phash = GetHashKey(planthash)
            local data = {}

            while not HasModelLoaded(phash) do
                Wait(10)
                RequestModel(phash)
            end

            RequestModel(phash)
            data.id = Config.FarmPlants[i].id
            data.obj = CreateObject(phash, Config.FarmPlants[i].x, Config.FarmPlants[i].y, Config.FarmPlants[i].z -1.2, false, false, false)
            SetEntityAsMissionEntity(data.obj, true)
            FreezeEntityPosition(data.obj, true)
            SetModelAsNoLongerNeeded(data.obj)
            SpawnedPlants[#SpawnedPlants + 1] = data
            hasSpawned = false

            ::continue::
        end

        if not InRange then
            Wait(5000)
        end
    end
end)

-- destroy plant
function DestroyPlant()
    local plant = GetClosestPlant()
    local hasDone = false
    local ped = PlayerPedId()

    for k, v in pairs(HarvestedPlants) do
        if v == plant.id then
            hasDone = true
        end
    end

    if hasDone then
        QBCore.Functions.Notify(Lang:t('错误：发生了一些问题'), 'error')
        Wait(5000)

        return
    end

    FreezeEntityPosition(ped, true)

    if Config.ProgressBar then
        QBCore.Functions.Progressbar("destroying-plants", Lang:t('进度条：正在摧毁植物'), 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
        end)
    end

    isDoingAction = true
    table.insert(HarvestedPlants, plant.id)
    TriggerServerEvent('qb-farmer:server:plantHasBeenHarvested', plant.id)
    TaskStartScenarioInPlace(ped, `WORLD_HUMAN_CROUCH_INSPECT`, 0, true)
    Wait(5000)
    ClearPedTasks(ped)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    FreezeEntityPosition(ped, false)
    TriggerServerEvent('qb-farmer:server:destroyPlant', plant.id)
    isDoingAction = false
    canHarvest = true
end

-- havest plants
function HarvestPlant()
    local plant = GetClosestPlant()
    local hasDone = false
    local ped = PlayerPedId()

    for k, v in pairs(HarvestedPlants) do
        if v == plant.id then
            hasDone = true
        end
    end

    if hasDone then
        QBCore.Functions.Notify(Lang:t('错误：出现了问题'), 'error')
        Wait(5000)

        return
    end

    FreezeEntityPosition(ped, true)

    if Config.ProgressBar then
        QBCore.Functions.Progressbar("harvesting-plants", Lang:t('进度条：正在收获植物'), 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
        end)
    end

    isDoingAction = true
    table.insert(HarvestedPlants, plant.id)
    TriggerServerEvent('qb-farmer:server:plantHasBeenHarvested', plant.id)
    TaskStartScenarioInPlace(ped, `WORLD_HUMAN_CROUCH_INSPECT`, 0, true)
    Wait(10000)
    ClearPedTasks(ped)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    FreezeEntityPosition(ped, false)
    TriggerServerEvent('qb-farmer:server:harvestPlant', plant.id)
    isDoingAction = false
    canHarvest = true
end

--触发器操作
Citizen.CreateThread(function()
    while true do
        local t = 1000

        if inFarmZone then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            t = 4

            for k, v in pairs(Config.FarmPlants) do
                if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true) < 1.3 and not isDoingAction and not v.beingHarvested and not IsPedInAnyVehicle(PlayerPedId(), false) then
                    if PlayerJob.name == 'police' then
                        local plant = GetClosestPlant()
                        DrawText3D(v.x, v.y, v.z, Lang:t('text.thirst_hunger',{thirst = v.thirst,hunger = v.hunger}))
                        DrawText3D(v.x, v.y, v.z - 0.18, Lang:t('text.growth_quality',{growth = v.growth,quality = v.quality}))
                        DrawText3D(v.x, v.y, v.z - 0.36, Lang:t('text.destroy_plant'))
                        if IsControlJustPressed(0, QBCore.Shared.Keybinds['G']) then
                            if v.id == plant.id then
                                DestroyPlant()
                            end
                        end
                    else
                        if v.growth < 100 then
                            local plant = GetClosestPlant()
                            DrawText3D(v.x, v.y, v.z, Lang:t('text.thirst_hunger',{thirst = v.thirst,hunger = v.hunger}))
                            DrawText3D(v.x, v.y, v.z - 0.18, Lang:t('text.growth_quality',{growth = v.growth,quality = v.quality}))
                            DrawText3D(v.x, v.y, v.z - 0.36, Lang:t('text.water_feed'))
                            if IsControlJustPressed(0, QBCore.Shared.Keybinds['G']) then
                                if v.id == plant.id then
                                    TriggerEvent('qb-farmer:client:waterPlant')
                                end
                            elseif IsControlJustPressed(0, QBCore.Shared.Keybinds['J']) then
                                if v.id == plant.id then
                                    TriggerEvent('qb-farmer:client:feedPlant')
                                end
                            end
                        else
                            DrawText3D(v.x, v.y, v.z,  Lang:t('text.quality'))
                            DrawText3D(v.x, v.y, v.z - 0.18, Lang:t('text.harvest'))
                            if IsControlJustReleased(0, QBCore.Shared.Keybinds['E']) and canHarvest then
                                local plant = GetClosestPlant()
                                local callpolice = math.random(1,100)
                                if v.id == plant.id then
                                    HarvestPlant()
                                    if callpolice > 95 then
                                        local coords = GetEntityCoords(PlayerPedId())
                                        -- alert police action here
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        Wait(t)
    end
end)

function GetClosestPlant()
    local dist = 1000
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local plant = {}

    for i = 1, #Config.FarmPlants do
        local xd = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.FarmPlants[i].x, Config.FarmPlants[i].y, Config.FarmPlants[i].z, true)

        if xd < dist then
            dist = xd
            plant = Config.FarmPlants[i]
        end
    end

    return plant
end

-- remove plant object
RegisterNetEvent('qb-farmer:client:removePlantObject')
AddEventHandler('qb-farmer:client:removePlantObject', function(plant)
    for i = 1, #SpawnedPlants do
        local o = SpawnedPlants[i]

        if o.id == plant then
            SetEntityAsMissionEntity(o.obj, false)
            FreezeEntityPosition(o.obj, false)
            DeleteObject(o.obj)
        end
    end
end)

-- water plants
RegisterNetEvent('qb-farmer:client:waterPlant')
AddEventHandler('qb-farmer:client:waterPlant', function()
    local entity = nil
    local plant = GetClosestPlant()
    local ped = PlayerPedId()
    isDoingAction = true

    if plant == nil then return end

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then
            entity = v.obj
        end
    end

    local item1 = 'bucket'
    local item2 = 'water'
    local hasItem1 = QBCore.Functions.HasItem(item1, 1)
    local hasItem2 = QBCore.Functions.HasItem(item2, 1)

    if hasItem1 and hasItem2 then
        FreezeEntityPosition(ped, true)

        if Config.ProgressBar then
            QBCore.Functions.Progressbar("watering-plants", Lang:t('progressbar.watering_the_plants'), 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
            end)
        end

        Citizen.InvokeNative(0x5AD23D40115353AC, ped, entity, -1)
        TaskStartScenarioInPlace(ped, `WORLD_HUMAN_BUCKET_POUR_LOW`, 0, true)
        Wait(10000)
        ClearPedTasks(ped)
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        FreezeEntityPosition(ped, false)
        TriggerServerEvent('qb-farmer:server:waterPlant', plant.id)
        isDoingAction = false

        return
    end

    QBCore.Functions.Notify( Lang:t('error.you_need_item_to_do_that',{item1 = item1,item2 = item2}), 'error', 3000)
    Wait(5000)
    isDoingAction = false
end)

-- feed plants
RegisterNetEvent('qb-farmer:client:feedPlant')
AddEventHandler('qb-farmer:client:feedPlant', function()
    local entity = nil
    local plant = GetClosestPlant()
    local ped = PlayerPedId()
    isDoingAction = true

    if plant == nil then return end

    for k, v in pairs(SpawnedPlants) do
        if v.id == plant.id then
            entity = v.obj
        end
    end

    local item1 = 'bucket'
    local item2 = 'fertilizer'
    local hasItem1 = QBCore.Functions.HasItem(item1, 1)
    local hasItem2 = QBCore.Functions.HasItem(item2, 1)

    if hasItem1 and hasItem2 then
        FreezeEntityPosition(ped, true)

        if Config.ProgressBar then
            QBCore.Functions.Progressbar("fertilising-plants", Lang:t('progressbar.fertilising_the_plants'), 14000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
            end)
        end

        Citizen.InvokeNative(0x5AD23D40115353AC, ped, entity, -1)
        TaskStartScenarioInPlace(ped, `WORLD_HUMAN_FEED_PIGS`, 0, true)
        Wait(14000)
        ClearPedTasks(ped)
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        FreezeEntityPosition(ped, false)
        TriggerServerEvent('qb-farmer:server:feedPlant', plant.id)
        isDoingAction = false

        return
    end

    QBCore.Functions.Notify(Lang:t('error.you_need_item_to_do_that',{item1 = item1,item2 = item2}), 'error', 3000)
    Wait(5000)
    isDoingAction = false
end)

RegisterNetEvent('qb-farmer:client:updatePlantData')
AddEventHandler('qb-farmer:client:updatePlantData', function(data)
    Config.FarmPlants = data
end)

-- Plant Seeds
RegisterNetEvent('qb-farmer:client:plantNewSeed')
AddEventHandler('qb-farmer:client:plantNewSeed', function(planttype, pHash, seed)
    if not isLoggedIn then return end

    local pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
    local ped = PlayerPedId()

    -- Farming Zone
    if Config.UseFarmingZones then
        farmZoneRequired = true
    end

    -- Seed Based Farm Zone
    if Config.UseSeedBasedZones then
        seedBasedZones = true
    end

    -- Job required
    if Config.EnableJob and PlayerJob.name ~= Config.JobRequired then
        QBCore.Functions.Notify(Lang:t('出错啦，只有农夫可以种植'), 'error', 3000)

        Wait(3000)

        return
    end

    -- Not in Farming Zone
    if farmZoneRequired and not inFarmZone then
        QBCore.Functions.Notify(Lang:t('出错啦，您不在农场区域范围内'), 'error', 3000)

        Wait(3000)

        return
    end

    -- Wrong Plant Seed on Seed-based Farm Zone
    if farmZoneRequired and seedBasedZones and zonename ~= planttype then
        local msg = Lang:t('出错啦，您只能在农场区域种植',{zonename = zonename})

        QBCore.Functions.Notify(msg, 'error', 3000)

        if Config.NotificationSound then
            NotificationSound(msg)
        end

        Wait(3000)

        return
    end

    if CanPlantSeedHere(pos) and not IsPedInAnyVehicle(PlayerPedId(), false) and not isBusy then
        isBusy = true
        local anim1 = `WORLD_HUMAN_FARMER_RAKE`
        local anim2 = `WORLD_HUMAN_FARMER_WEEDING`

        FreezeEntityPosition(ped, true)

        if Config.ProgressBar then
            QBCore.Functions.Progressbar("planting-seeds", Lang:t('progressbar.planting_seeds',{planttype = planttype}), 30000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
            end)
        end

        if not IsPedMale(ped) then
            anim1 = `WORLD_HUMAN_CROUCH_INSPECT`
            anim2 = `WORLD_HUMAN_CROUCH_INSPECT`
        end

        TaskStartScenarioInPlace(ped, anim1, 0, true)
        Wait(10000)
        ClearPedTasks(ped)
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        TaskStartScenarioInPlace(ped, anim2, 0, true)
        Wait(20000)
        ClearPedTasks(ped)
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        FreezeEntityPosition(ped, false)
        TriggerServerEvent('qb-farmer:server:removeitem', seed, 1)
        TriggerServerEvent('qb-farmer:server:plantNewSeed', planttype, pos, pHash)
        isBusy = false
        farmZoneRequired = false

        return
    end

    QBCore.Functions.Notify(Lang:t('error.too_close_to_another_plant'), 'error', 3000)

    Wait(3000)
end)

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    SetTextScale(0.25, 0.25)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end

function CanPlantSeedHere(pos)
    local canPlant = true

    for i = 1, #Config.FarmPlants do
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.FarmPlants[i].x, Config.FarmPlants[i].y, Config.FarmPlants[i].z, true) < 1.3 then
            canPlant = false
        end
    end

    return canPlant
end

-- start farm shop
Citizen.CreateThread(function()
    for farmshop, v in pairs(Config.FarmShopLocations) do
        exports['qb-core']:createPrompt(v.name, v.coords, 0xF3830D8E, Lang:t('menu.open') .. v.name, {
            type = 'client',
            event = 'qb-farmer:client:OpenFarmShop',
        })

        if v.showblip then
            local FarmShopBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)

            SetBlipSprite(FarmShopBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(FarmShopBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, FarmShopBlip, Config.Blip.blipName)
        end

        if v.showmarker then
            while true do
                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local coord = v.coords
                local distance = #(coords - coord)
                local t = 1000

                if distance <= 10.0 then
                    t = 4

                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                end

                Wait(t)
            end
        end
    end
end)

RegisterNetEvent('qb-farmer:client:OpenFarmShop')
AddEventHandler('qb-farmer:client:OpenFarmShop', function()
    local ShopItems = {}

    ShopItems.label = "Farm Shop"
    ShopItems.items = Config.FarmShop
    ShopItems.slots = #Config.FarmShop
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "FarmShop_"..math.random(1, 99), ShopItems)
end)
-- end farm shop

function NotificationSound(msg)
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    for i = 1, #SpawnedPlants do
        local plants = SpawnedPlants[i].obj

        SetEntityAsMissionEntity(plants, false)
        FreezeEntityPosition(plants, false)
        DeleteObject(plants)
    end
end)