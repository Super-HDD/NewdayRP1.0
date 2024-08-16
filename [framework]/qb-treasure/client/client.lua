local QBCore = exports['qb-core']:GetCoreObject()

local initialCooldownSeconds = 3600 -- cooldown time in seconds between treasure
local cooldownSecondsRemaining = 0 -- done to zero cooldown on restart
local started = false
local chestObject = nil

-----------------------------------------------------------------------------------

-- treasure location set GPS
RegisterNetEvent('qb-treasure:client:gototreasure')
AddEventHandler('qb-treasure:client:gototreasure', function(treasureCoords, item)
    StartGpsMultiRoute(`COLOR_RED`, true, true)
    AddPointToGpsMultiRoute(treasureCoords.x, treasureCoords.y, treasureCoords.z)
    SetGpsMultiRouteRender(true)

    TriggerServerEvent('qb-treasure:server:removeitem', item, 1)

    QBCore.Functions.Notify('Treasure location set!', 'primary')

    started = true

    TriggerEvent('qb-treasure:client:MetalDetector')
    TriggerEvent('qb-treasure:client:MetalDetectorBeep')
end)

-----------------------------------------------------------------------------------

-- text to screen
local DrawText3Ds = function(x, y, z, text)
    local _, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())

    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    SetTextCentre(true)
    DisplayText(str, _x, _y)
end

-- dig up chest animation
local StartAnimation = function(animDict, flags, playbackListName, groundZ, time)
    CreateThread(function()
        local player = PlayerPedId()
        local aCoord = GetEntityCoords(player)
        local pCoord = GetOffsetFromEntityInWorldCoords(player, -10.0, 0.0, 0.0)
        local pRot = GetEntityRotation(player)

        if groundZ then
            local _, ground = GetGroundZAndNormalFor_3dCoord(aCoord.x, aCoord.y, aCoord.z + 10)
            aCoord = {x = aCoord.x, y = aCoord.y, z = ground}
        end

        local animScene = Citizen.InvokeNative(0x1FCA98E33C1437B3, animDict, flags, playbackListName, 0, 1)

        Citizen.InvokeNative(0x020894BF17A02EF2, animScene, aCoord.x, aCoord.y, aCoord.z, pRot.x, pRot.y, pRot.z, 2)
        Citizen.InvokeNative(0x8B720AD451CA2AB3, animScene, "player", player, 0)

        local modelhash = `p_strongbox_muddy_01x`

        RequestModel(modelhash)

        while not HasModelLoaded(modelhash) do
            Wait(10)
        end

        chestObject = CreateObjectNoOffset(modelhash, pCoord.x, pCoord.y, pCoord.z, true, true, true)

        Citizen.InvokeNative(0x8B720AD451CA2AB3, animScene, "CHEST", chestObject, 0)
        Citizen.InvokeNative(0xAF068580194D9DC7, animScene)

        Wait(1000)

        Citizen.InvokeNative(0xF4D94AF761768700, animScene)

        if time then
            Wait(time)
        else
            Wait(10000)
        end

        Citizen.InvokeNative(0x84EEDB2C6E650000, animScene)

        DeleteObject(chestObject)
        SetObjectAsNoLongerNeeded(chestObject)
    end)
end

-- cooldown
local handleCooldown = function()
    cooldownSecondsRemaining = initialCooldownSeconds

    CreateThread(function()
        while cooldownSecondsRemaining > 0 do
            Wait(1000)

            cooldownSecondsRemaining = cooldownSecondsRemaining - 1
        end
    end)
end

-- detector part
AddEventHandler('qb-treasure:client:MetalDetector', function()
    CreateThread(function()
        while started do
            Wait(4)

            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local isonmount = IsPedOnMount(ped)
            local weaponhash = Citizen.InvokeNative(0x8425C5F057012DAB, ped)

            for _, v in pairs(Config.Locations) do
                if weaponhash == -862059856 and cooldownSecondsRemaining == 0 and not isonmount then
                    local dist = #(pos - v.coords)

                    if dist < 1 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 1.0, -1)

                        DrawText3Ds(v.coords.x, v.coords.y, v.coords.z + 1.0, "~g~E~w~ - Dig Treasure")

                        if IsControlJustReleased(0, 0xCEFD9220) then -- [E]
                            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                            Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.0, -1)

                            TriggerEvent('qb-treasure:clent:digging', v.name)

                            handleCooldown()
                        end
                    elseif dist < 2 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.9, -1)
                    elseif dist < 3 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.8, -1)
                    elseif dist < 4 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.7, -1)
                    elseif dist < 5 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.6, -1)
                    elseif dist < 6 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.5, -1)
                    elseif dist < 7 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.4, -1)
                    elseif dist < 8 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.3, -1)
                    elseif dist < 9 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.2, -1)
                    elseif dist < 10 then
                        Citizen.InvokeNative(0x437C08DB4FEBE2BD, ped, "MetalDetectorDetectionValue", 0.1, -1)
                    end
                end
            end
        end
    end)
end)

-- bleep the metal detector when near treasure
AddEventHandler('qb-treasure:client:MetalDetectorBeep', function()
    CreateThread(function()
        while started do
            Wait(4)

            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local isonmount = IsPedOnMount(ped)
            local weaponhash = Citizen.InvokeNative(0x8425C5F057012DAB, ped)

            for _, v in pairs(Config.Locations) do
                if weaponhash == -862059856 and cooldownSecondsRemaining == 0 and not isonmount then
                    local dist = #(pos - v.coords)

                    if dist < 1 then
                        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, 'metaldetector', 0.5)

                        Wait(500)
                    elseif dist < 5 then
                        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, 'metaldetector', 0.3)

                        Wait(1000)
                    elseif dist < 10 then
                        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, 'metaldetector', 0.1)

                        Wait(2000)
                    end
                end
            end
        end
    end)
end)

-- dig for treasure
RegisterNetEvent("qb-treasure:clent:digging")
AddEventHandler("qb-treasure:clent:digging", function(chest)
    local hasItem = QBCore.Functions.HasItem('shovel', 1)

    if hasItem then
        local randomNumber = math.random(1, 100)

        if randomNumber > 90 then
            TriggerServerEvent('qb-treasure:server:removeitem', 'shovel', 1)
            TriggerEvent('inventory:client:ItemBox', sharedItems['shovel'], 'remove')

            QBCore.Functions.Notify('你的铲子坏了', 'error')

            started = false
        else
            StartAnimation('script@mech@treasure_hunting@chest', 0, 'PBL_CHEST_01', true, 10000)

            Wait(10000)

            TriggerServerEvent('qb-treasure:server:givereward', chest)

            started = false
        end
    else
        QBCore.Functions.Notify('你没有铲子!', 'error')

        started = false
    end
end)