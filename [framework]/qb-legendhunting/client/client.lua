local QBCore = exports['qb-core']:GetCoreObject()
local Zones = {}
local zonename = nil
local inHuntingZone = false
local baitLocation = nil
local spawnLocation = nil
local animal = {}

-- Initialize lastHuntTimes table here
local remainingCooldowns = {}

RegisterNetEvent('qb-hunting:client:cooldownMessage')
AddEventHandler('qb-hunting:client:cooldownMessage', function(remainingCooldown, totalCooldown)
    print("Received cooldownMessage event from server. Remaining Cooldown:", remainingCooldown, "Total Cooldown:", totalCooldown)
    local remainingMinutes = math.floor(remainingCooldown / 60)
    local remainingSeconds = remainingCooldown % 60
    local totalMinutes = math.floor(totalCooldown / 60)
    local totalSeconds = totalCooldown % 60
    QBCore.Functions.Notify('您需要等待' .. remainingMinutes .. '分钟和' .. remainingSeconds .. '秒，然后才能再次在此区域中狩猎。（总冷却时间：' .. totalMinutes .. '分钟和' .. totalSeconds .. ' 秒)', 'error')
end)
--------------------------------------------------------------------------------------------------

CreateThread(function()
    for k=1, #Config.HuntingZones do
        Zones[k] = CircleZone:Create(Config.HuntingZones[k].coords, Config.HuntingZones[k].radius, {
            name = Config.HuntingZones[k].name,
            debugPoly=false,
        })
        Zones[k]:onPlayerInOut(function(isPointInside)
            if isPointInside then
                inHuntingZone = true
                zonename = Zones[k].name
                local animal = Config.HuntingZones[k].animalname
                local bait = Config.HuntingZones[k].baitname
                if Config.HuntingZones[k].enterzone then
                    QBCore.Functions.Notify('您已进入狩猎区！动物：' .. animal .. ' 诱饵: ' .. bait, 'primary')
                end
            else
                inHuntingZone = false
                zonename = nil
                local animalName = Config.HuntingZones[k].animalname
                local baitName = Config.HuntingZones[k].baitname
                if Config.HuntingZones[k].enterzone then
                    QBCore.Functions.Notify('您已离开狩猎区！动物：' .. animalName .. ' 诱饵: ' .. baitName, 'primary')
                end
            end
        end)
        if Config.HuntingZones[k].showblip == true then
            local HuntingBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, Config.HuntingZones[k].coords)
            local blipSprite = Config.HuntingZones[k].blipSprite
            SetBlipSprite(HuntingBlip, Config.HuntingZones[k].blipSprite, true)
            SetBlipScale(HuntingBlip, Config.HuntingZones[k].blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, HuntingBlip, Config.HuntingZones[k].blipName)
        end
    end
end)

-- spawn location
local function getSpawnLoc()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local spawnCoords = nil
    while spawnCoords == nil do
        local spawnX = math.random(-Config.SpawnDistanceRadius, Config.SpawnDistanceRadius)
        local spawnY = math.random(-Config.SpawnDistanceRadius, Config.SpawnDistanceRadius)
        local spawnZ = baitLocation.z
        local vec = vector3(baitLocation.x + spawnX, baitLocation.y + spawnY, spawnZ)
        if #(playerCoords - vec) > Config.SpawnDistanceRadius then
            spawnCoords = vec
        end
    end
    local worked, groundZ, normal = GetGroundZAndNormalFor_3dCoord(spawnCoords.x, spawnCoords.y, 1023.9)
    spawnCoords = vector3(spawnCoords.x, spawnCoords.y, groundZ)
    return spawnCoords
end

RegisterNetEvent('qb-hunting:server:useHuntingBait')
AddEventHandler('qb-hunting:server:useHuntingBait', function(item)
    local playerServerId = GetPlayerServerId(PlayerId()) -- Get the player's server ID

    if inHuntingZone == true then
        local currentZone = nil
        for _, zone in pairs(Config.HuntingZones) do
            if zone.name == zonename then
                currentZone = zone
                break
            end
        end

        if currentZone then
            local requiredBait = currentZone.bait
            if item == requiredBait then -- Check if the used bait matches the required bait for the current zone
                local ped = PlayerPedId()
                local playerId = PlayerId()

                local zoneCooldown = remainingCooldowns[currentZone.name] or 0
                local currentTime = GetGameTimer() / 1000
                local elapsedTime = currentTime - (zoneCooldown - currentZone.timer * 60) -- Calculate elapsed time since last use

                -- Check zoneCooldown before using the bait
                if elapsedTime < currentZone.timer * 60 then
                    local remainingCooldown = currentZone.timer * 60 - elapsedTime
                    local remainingMinutes = math.floor(remainingCooldown / 60)
                    local remainingSeconds = math.floor(remainingCooldown % 60)
                    QBCore.Functions.Notify('你需要等待' .. remainingMinutes .. '分钟和' .. remainingSeconds .. '秒才能再次使用诱饵。', 'error')
                    return
                end

                baitLocation = GetEntityCoords(PlayerPedId())
                spawnLocation = getSpawnLoc()
                TaskStartScenarioInPlace(ped, `WORLD_HUMAN_CROUCH_INSPECT`, 0, true)
                Wait(10000)
                ClearPedTasks(ped)
                TriggerServerEvent('qb-hunting::server:removeItem', requiredBait)

                -- Set the zoneCooldown for the current zone
                remainingCooldowns[currentZone.name] = currentTime + currentZone.timer * 60
                TriggerServerEvent('qb-hunting::server:updateCooldown', currentZone.name, remainingCooldowns[currentZone.name])

                QBCore.Functions.Notify('已设置诱饵，躲起来！', 'primary')
                Wait(Config.HideTime)
                local spawnanimal = currentZone.animal
                local model = spawnanimal
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(10)
                end
                animal = CreatePed(model, spawnLocation.x, spawnLocation.y, spawnLocation.z, true, true, true)
                Citizen.InvokeNative(0x283978A15512B2FE, animal, true)
                Citizen.InvokeNative(0xDC19C288082E586E, animal, true, false)
                TaskGoStraightToCoord(animal, baitLocation.x, baitLocation.y, baitLocation.z, 1.0, -1, 0.0, 0.0)
                SetEntityMaxHealth(animal, currentZone.health)
                SetEntityHealth(animal, currentZone.health)
                SetModelAsNoLongerNeeded(spawnanimal)

                CreateThread(function()
                    local finished = false
                    while not IsPedDeadOrDying(animal) and not finished do
                        local spawnedAnimalCoords = GetEntityCoords(animal)
                        local distance = #(baitLocation - spawnedAnimalCoords)
                        if distance < 1.0 then
                            Wait(Config.AnimalWait)
                            Citizen.InvokeNative(0xBB9CE077274F6A1B, animal, 10.0, 10)
                            finished = true
                        end
                        Wait(1000)
                    end
                end)
            else
                QBCore.Functions.Notify('你不能在这个狩猎区使用这个诱饵！', 'error')
            end
        else
            QBCore.Functions.Notify('无法找到当前狩猎区。', 'error')
        end
    else
        QBCore.Functions.Notify('你不能在狩猎区域外使用该物品！', 'error')
    end
end)