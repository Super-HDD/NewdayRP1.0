local camZPlus1 = 1500
local camZPlus2 = 50
local pointCamCoords = 75
local pointCamCoords2 = 0
local cam1Time = 500
local cam2Time = 1000
local choosingSpawn = false
local newPlayer = false
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-spawn:client:openUI', function(value)
    SetEntityVisible(PlayerPedId(), false)
    DoScreenFadeOut(250)
    Wait(1000)
    DoScreenFadeIn(250)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + camZPlus1, -85.00, 0.00, 0.00, 100.00, false, 0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
    end)
    Wait(500)
    SetDisplay(value)
    
end)

RegisterNUICallback("exit", function(data)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "ui",
        status = false
    })
    choosingSpawn = false
end)

local cam = nil
local cam2 = nil

RegisterNUICallback('setCam', function(data)
    local location = tostring(data.posname)
    local type = tostring(data.type)

    DoScreenFadeOut(200)
    Wait(500)
    DoScreenFadeIn(200)

    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end

    if DoesCamExist(cam2) then
        DestroyCam(cam2, true)
    end

    if type == "current" then
        QBCore.Functions.GetPlayerData(function(PlayerData)
            cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
            PointCamAtCoord(cam2, PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + pointCamCoords)
            SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
            if DoesCamExist(cam) then
                DestroyCam(cam, true)
            end
            Wait(cam1Time)

            cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
            PointCamAtCoord(cam, PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + pointCamCoords2)
            SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
            SetEntityCoords(PlayerPedId(), PlayerData.position.x, PlayerData.position.y, PlayerData.position.z)
            TriggerServerEvent("qb-appearance:LoadSkin")
        end)
    elseif type == "house" then
        local campos = Config.Houses[location].coords.enter

        cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
        SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
        if DoesCamExist(cam) then
            DestroyCam(cam, true)
        end
        Wait(cam1Time)

        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
        SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
        SetEntityCoords(PlayerPedId(), campos.x, campos.y, campos.z)
        TriggerServerEvent("qb-appearance:LoadSkin")
    elseif type == "normal" then
        local campos = QB.Spawns[location].coords

        cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
        SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
        if DoesCamExist(cam) then
            DestroyCam(cam, true)
        end
        Wait(cam1Time)

        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
        SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
        SetEntityCoords(PlayerPedId(), campos.x, campos.y, campos.z)
        TriggerServerEvent("qb-appearance:LoadSkin")
    elseif type == "appartment" then
        local campos = Apartments.Locations[location].coords.enter

        cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
        SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
        if DoesCamExist(cam) then
            DestroyCam(cam, true)
        end
        Wait(cam1Time)

        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
        PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
        SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
        SetEntityCoords(PlayerPedId(), campos.x, campos.y, campos.z)
        TriggerServerEvent("qb-appearance:LoadSkin")
    end
end)

RegisterNUICallback('chooseAppa', function(data)
    local appaYeet = data.appType
    SetDisplay(false)
    DoScreenFadeOut(500)
    Wait(5000)
    TriggerServerEvent("apartments:server:CreateApartment", appaYeet, Apartments.Locations[appaYeet].label)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    FreezeEntityPosition(ped, false)
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    SetEntityVisible(PlayerPedId(), true)
    TriggerServerEvent("qb-appearance:LoadSkin")
end)

RegisterNUICallback('spawnplayer', function(data)
    local location = tostring(data.spawnloc)
    local type = tostring(data.typeLoc)
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local insideMeta = PlayerData.metadata['inside']
    local isJailed = PlayerData.metadata["injail"]
    if type == "current" then
        SetDisplay(false)
        DoScreenFadeOut(500)
        Wait(2000)
        SetEntityCoords(PlayerPedId(), PlayerData.position.x, PlayerData.position.y, PlayerData.position.z)
        SetEntityHeading(PlayerPedId(), PlayerData.position.w)
        FreezeEntityPosition(PlayerPedId(), false)
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        FreezeEntityPosition(ped, false)
        RenderScriptCams(false, true, 500, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        SetCamActive(cam2, false)
        DestroyCam(cam2, true)
        SetEntityVisible(PlayerPedId(), true)
        Wait(500)
        DoScreenFadeIn(250)
        TriggerServerEvent("qb-appearance:LoadSkin")
    elseif type == "house" then
        SetDisplay(false)
        DoScreenFadeOut(500)
        Wait(2000)
        TriggerEvent('qb-houses:client:enterOwnedHouse', location)
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        FreezeEntityPosition(ped, false)
        FreezeEntityPosition(PlayerPedId(), false)
        RenderScriptCams(false, true, 500, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        SetCamActive(cam2, false)
        DestroyCam(cam2, true)
        SetEntityVisible(PlayerPedId(), true)
        Wait(500)
        DoScreenFadeIn(250)
        TriggerServerEvent("qb-appearance:LoadSkin")
    elseif type == "normal" then
        local pos = QB.Spawns[location].coords
        SetDisplay(false)
        DoScreenFadeOut(500)
        Wait(2000)
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        Wait(500)
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        SetEntityHeading(ped, pos.h)
        FreezeEntityPosition(ped, false)
        FreezeEntityPosition(PlayerPedId(), false)
        RenderScriptCams(false, true, 500, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        SetCamActive(cam2, false)
        DestroyCam(cam2, true)
        SetEntityVisible(PlayerPedId(), true)
        Wait(500)
        DoScreenFadeIn(250)
        TriggerServerEvent("qb-appearance:LoadSkin")
    end

    if newPlayer then
        TriggerServerEvent("qb-clothes:LoadClothes", 2)
        newPlayer = false
    end
    
    if isJailed > 0 then
        Wait(2000)
        TriggerEvent('qb-prison:client:prisonclothes')
    end

    TriggerEvent('qb-houses:client:BlipsOnSpawn')

    if QB.AutoDualWield then
        Wait(2000)

        TriggerEvent('qb-weapons:client:AutoDualWield')
    end
end)

function SetDisplay(bool)
    choosingSpawn = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end

CreateThread(function()
    while true do
        if choosingSpawn then
            DisableAllControlActions(0)
        else
            Wait(1000)
        end
        Wait(0)
    end
end)

RegisterNetEvent('qb-spawn:client:SpawnOnLastLocationOnly', function()
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local isJailed = PlayerData.metadata["injail"]

    SetDisplay(false)
    DoScreenFadeOut(500)
    Wait(2000)
    SetEntityCoords(PlayerPedId(), PlayerData.position.x, PlayerData.position.y, PlayerData.position.z)
    SetEntityHeading(PlayerPedId(), PlayerData.position.w)
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    FreezeEntityPosition(ped, false)
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
    DoScreenFadeIn(250)
    TriggerServerEvent("qb-appearance:LoadSkin")

    if isJailed > 0 then
        Wait(2000)
        TriggerEvent('qb-prison:client:prisonclothes')
    end

    TriggerEvent('qb-houses:client:BlipsOnSpawn')

    if QB.AutoDualWield then
        Wait(2000)

        TriggerEvent('qb-weapons:client:AutoDualWield')
    end
end)

RegisterNetEvent('qb-houses:client:setHouseConfig', function(houseConfig)
    Config.Houses = houseConfig
end)

RegisterNetEvent('qb-spawn:client:setupSpawnUI', function(cData, new)
    if not new and QB.SpawnOnLastLocationOnly then
        TriggerEvent('qb-spawn:client:SpawnOnLastLocationOnly')
        return
    end

    if not QB.EnableApartments then
        TriggerEvent('qb-spawn:client:setupSpawns', cData, new, nil)
        TriggerEvent('qb-spawn:client:openUI', true)
        return
    end

    QBCore.Functions.TriggerCallback('apartments:GetOwnedApartment', function(result)
        if result == nil then
            TriggerEvent('qb-spawn:client:setupSpawns', cData, true, Apartments.Locations)
            TriggerEvent('qb-spawn:client:openUI', true)
            return
        end

        TriggerEvent('qb-spawn:client:setupSpawns', cData, false, nil)
        TriggerEvent('qb-spawn:client:openUI', true)
        TriggerEvent("apartments:client:SetHomeBlip", result.type)
    end, cData.citizenid)
end)

RegisterNetEvent('qb-spawn:client:setupSpawns', function(cData, new, apps)
    newPlayer = new
    if not new then
        if QB.EnableHouses then
            QBCore.Functions.TriggerCallback('qb-spawn:server:getOwnedHouses', function(houses)
                local myHouses = {}
                if houses ~= nil then
                    for i = 1, (#houses), 1 do
                        table.insert(myHouses, {
                            house = houses[i].house,
                            label = Config.Houses[houses[i].house].adress,
                        })
                    end
                end

                Wait(500)
                SendNUIMessage({
                    action = "setupLocations",
                    locations = QB.Spawns,
                    houses = myHouses,
                })
            end, cData.citizenid)
        else
            SendNUIMessage({
                action = "setupLocations",
                locations = QB.Spawns,
                houses = {},
            })
        end
    elseif new and QB.EnableApartments then
        SendNUIMessage({
            action = "setupAppartements",
            locations = apps,
        })
    else
        SendNUIMessage({
            action = "setupnewplayerLocations",
            locations = QB.Spawns,
            houses = {},
        })
    end
end)
