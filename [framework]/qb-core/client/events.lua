-- Player load and unload handling
-- New method for checking if logged in across all scripts (optional)
-- if LocalPlayer.state['isLoggedIn'] then
local RDisplaying = 0
local time = 7000 -- Duration of the display of the text : 1000ms = 1sec

-- Place Ped on ground properly
local function PlacePedOnGroundProperly(ped, coord)
    local x, y, z = table.unpack(coord)
    local found, groundz, normal = GetGroundZAndNormalFor_3dCoord(x, y, z)

    if found then
        SetEntityCoordsNoOffset(ped, x, y, groundz + normal.z, true)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    ShutdownLoadingScreenNui()
    LocalPlayer.state:set('isLoggedIn', true, false)
    if QBConfig.EnablePVP then
        Citizen.InvokeNative(0xF808475FA571D823, true)
        SetRelationshipBetweenGroups(5, `PLAYER`, `PLAYER`)
    end
    if QBConfig.Player.RevealMap then
        SetMinimapHideFow(true)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    LocalPlayer.state:set('isLoggedIn', false, false)
end)

-- Teleport Commands

RegisterNetEvent('QBCore:Command:TeleportToPlayer', function(coords) -- #MoneSuer | Fixed Teleport Command
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z) 
end)

RegisterNetEvent('QBCore:Command:TeleportToCoords', function(x, y, z, h) -- #MoneSuer | Fixed Teleport Command
    local ped = PlayerPedId()
    SetEntityCoords(ped, x, y, z) 
end)

RegisterNetEvent('QBCore:Command:GoToMarker', function()
    local ped = PlayerPedId()
    local coords = GetWaypointCoords()
    local groundZ = GetHeightmapBottomZForPosition(coords.x, coords.y)
    local vehicle = GetVehiclePedIsIn(ped, false)
    local mount = GetMount(ped)

    if not IsWaypointActive() then
        QBCore.Functions.Notify(Lang:t("error.no_waypoint"), "error", 3000)
        return
    end

    SetEntityCoords(ped, coords.x, coords.y, groundZ + 3.0)
    PlacePedOnGroundProperly(ped, coords)

    if mount then
        SetEntityCoords(mount, coords.x, coords.y, groundZ + 3.0)
        PlacePedOnGroundProperly(mount, coords)
        Citizen.InvokeNative(0x028F76B6E78246EB, ped, mount, -1)
    end

    if vehicle then
        SetEntityCoords(vehicle, coords.x, coords.y, groundZ + 3.0)
        PlacePedOnGroundProperly(vehicle, coords)
        Citizen.InvokeNative(0x028F76B6E78246EB, ped, vehicle, -1)
    end

    QBCore.Functions.Notify(Lang:t("success.teleported_waypoint"), "success", 3000)
end)


-- HORSE / WAGON

RegisterNetEvent('QBCore:Command:SpawnVehicle', function(WagonName)
    local ped = PlayerPedId()
    local hash = GetHashKey(WagonName)
    if not IsModelInCdimage(hash) then return end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end

    local vehicle = CreateVehicle(hash, GetEntityCoords(ped), GetEntityHeading(ped), true, false)
    TaskWarpPedIntoVehicle(ped, vehicle, -1) -- Spawn the player onto "drivers" seat
    Citizen.InvokeNative(0x283978A15512B2FE, vehicle, true) -- Set random outfit variation / skin
    NetworkSetEntityInvisibleToNetwork(vehicle, true)
end)

RegisterNetEvent('QBCore:Command:SpawnHorse', function(HorseName)
    local ped = PlayerPedId()
    local hash = GetHashKey(HorseName)
    if not IsModelInCdimage(hash) then return end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(0)
    end

    local vehicle = CreatePed(hash, GetEntityCoords(ped), GetEntityHeading(ped), true, false)
    TaskWarpPedIntoVehicle(ped, vehicle, -1) -- Spawn the player onto "drivers" seat
    Citizen.InvokeNative(0x283978A15512B2FE, vehicle, true) -- Set random outfit variation / skin
    NetworkSetEntityInvisibleToNetwork(vehicle, true)
end)

RegisterNetEvent('QBCore:Command:DeleteVehicle', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local mount = GetMount(ped)

    if veh and veh ~= 0 then
        NetworkRequestControlOfEntity(veh)
        SetEntityAsMissionEntity(veh, true, true)
        DeleteVehicle(veh)
        SetEntityAsNoLongerNeeded(veh)
    else
        local pcoords = GetEntityCoords(ped)
        local vehicles = GetGamePool('CVehicle')

        for _, v in pairs(vehicles) do
            if #(pcoords - GetEntityCoords(v)) <= 5.0 then
                NetworkRequestControlOfEntity(v)
                SetEntityAsMissionEntity(v, true, true)
                DeleteVehicle(v)
                SetEntityAsNoLongerNeeded(v)
            end
        end
    end

    if mount and mount ~= 0 then
        NetworkRequestControlOfEntity(mount)
        SetEntityAsMissionEntity(mount, true, true)
        DeleteEntity(mount)
        SetEntityAsNoLongerNeeded(mount)
    end
end)

-- Other stuff

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    QBCore.PlayerData = val
end)

RegisterNetEvent('QBCore:Player:UpdatePlayerData', function()
    TriggerServerEvent('QBCore:UpdatePlayer')
end)

RegisterNetEvent('QBCore:Notify', function(text, type, length)
    QBCore.Functions.Notify(text, type, length)
end)

-- This event is exploitable and should not be used. It has been deprecated, and will be removed soon.
RegisterNetEvent('QBCore:Client:UseItem', function(item)
    QBCore.Debug(string.format("%s triggered QBCore:Client:UseItem by ID %s with the following data. This event is deprecated due to exploitation, and will be removed soon. Check qb-inventory for the right use on this event.", GetInvokingResource(), GetPlayerServerId(PlayerId())))
    QBCore.Debug(item)
end)

-- Callback Events --

-- Client Callback
RegisterNetEvent('QBCore:Client:TriggerClientCallback', function(name, ...)
    QBCore.Functions.TriggerClientCallback(name, function(...)
        TriggerServerEvent('QBCore:Server:TriggerClientCallback', name, ...)
    end, ...)
end)

-- Server Callback
RegisterNetEvent('QBCore:Client:TriggerCallback', function(name, ...)
    if QBCore.ServerCallbacks[name] then
        QBCore.ServerCallbacks[name](...)
        QBCore.ServerCallbacks[name] = nil
    end
end)

-- Me command
local RDisplaying = 1

RegisterNetEvent('QBCore:triggerDisplay')
AddEventHandler('QBCore:triggerDisplay', function(text, source, type, custom)
    local offset = 0.4 + (RDisplaying * 0.14)
    local target = GetPlayerFromServerId(source)
    if target == -1 then
        return
    end
    Display(GetPlayerFromServerId(source), text, offset, type, custom)
end)

function Display(mePlayer, text, offset, type, custom)
    local displaying = true
    local _type = type

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)
    Citizen.CreateThread(function()
        RDisplaying = RDisplaying + 1
        while displaying do
            Wait(1)
            local coordsMe = GetPedBoneCoords(GetPlayerPed(mePlayer), 53684, 0.0, 0.0, 0.0)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = #(coordsMe - coords)
            if dist < 15.0 then
                DrawText3D(coordsMe['x'], coordsMe['y'], coordsMe['z'] + offset, text, _type , custom)
            else
                if dist > 25 then
                    Wait(500)
                end
            end
        end
        RDisplaying = RDisplaying - 1
    end)
end

function DrawTexture(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11)
    if not HasStreamedTextureDictLoaded(textureStreamed) then
        RequestStreamedTextureDict(textureStreamed, false);
    else
        DrawSprite(textureStreamed, textureName, x, y, width, height, rotation, r, g, b, a, p11);
    end
end

function DrawText3D(x, y, z, text, _type, custom)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    local _me = _type
    if onScreen and ((_x > 0 and _x < 1) or (_y > 0 and _y < 1)) then
        SetTextScale(0.30, 0.30)
        SetTextFontForCurrentCommand(7)
        Citizen.InvokeNative(1758329440 & 0xFFFFFFFF, true)
        SetTextDropshadow(3, 0, 0, 0, 255)
        if _me == "me" then
            SetTextColor(255, 255, 255, 165)
        elseif _me == "do" then
            SetTextColor(145, 209, 144, 165)
        elseif _me == "try" then
            SetTextColor(32, 151, 247, 165)
        end
        SetTextCentre(1)
        onScreen, _x, _y = GetHudScreenPositionFromWorldPosition(x, y, z)
        DisplayText(str, _x, _y)
        if not custom then
            local factor = (string.len(text)) / 170
            local texture
            if string.len(text) < 20 then
                texture = "score_timer_bg_small"
            elseif string.len(text) < 40 then
                texture = "score_timer_large_black_bg"
            else
                texture = "score_timer_extralong"
            end
            DrawTexture("scoretimer_ink_backgrounds", texture, _x, _y + 0.0120, 0.015 + factor, 0.051, 0.0, 0, 0, 0, 180, false);
        end
    end
end

-- Listen to Shared being updated
RegisterNetEvent('QBCore:Client:OnSharedUpdate', function(tableName, key, value)
    QBCore.Shared[tableName][key] = value
    TriggerEvent('QBCore:Client:UpdateObject')
end)

RegisterNetEvent('QBCore:Client:OnSharedUpdateMultiple', function(tableName, values)
    for key, value in pairs(values) do
        QBCore.Shared[tableName][key] = value
    end
    TriggerEvent('QBCore:Client:UpdateObject')
end)
