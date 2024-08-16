local charPed = nil
local choosingCharacter = false
local currentSkin = nil
local currentClothes = nil
local selectingChar = true
local PlayerSkins = {}
local PlayerClothes = {}
local characters = {}
local QBCore = exports['qb-core']:GetCoreObject()

local cams = {
    {
        type = "customization",
        x = -561.8157,
        y = -3780.966,
        z = 239.0805,
        rx = -4.2146,
        ry = -0.0007,
        rz = -87.8802,
        fov = 30.0
    },
    {
        type = "selection",
        x = -562.8157,
        y = -3776.266,
        z = 239.0805,
        rx = -4.2146,
        ry = -0.0007,
        rz = -87.8802,
        fov = 30.0
    }
}

-- Handlers

AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentResourceName() == resource) then
        DeleteEntity(charPed)
        SetModelAsNoLongerNeeded(charPed)
    end
end)

local function openCharMenu(bool)
    QBCore.Functions.TriggerCallback("qb-multicharacter:server:GetNumberOfCharacters", function(result)
        SetNuiFocus(bool, bool)
        SendNUIMessage({
            action = "ui",
            toggle = bool,
            nChar = result,
        })
        choosingCharacter = bool
    end)
end


RegisterNetEvent('qb-multicharacter:client:closeNUI', function()
    DeleteEntity(charPed)
    SetNuiFocus(false, false)
end)

RegisterNetEvent('qb-multicharacter:client:chooseChar', function()
    SetEntityVisible(PlayerPedId(), false, false)
    SetNuiFocus(false, false)
    DoScreenFadeOut(10)
    Wait(1000)
    GetInteriorAtCoords(-558.9098, -3775.616, 238.59, 137.98)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoords(PlayerPedId(), -562.91,-3776.25,237.63)
    Wait(1500)
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    Wait(10)
    openCharMenu(true)
    while selectingChar do
        Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
    end
end)

-- NUI

RegisterNUICallback('closeUI', function()
    openCharMenu(false)
end)

RegisterNUICallback('disconnectButton', function()
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    TriggerServerEvent('qb-multicharacter:server:disconnect')
end)

RegisterNUICallback('selectCharacter', function(data) -- When a char is selected and confirmed to use
    CreateThread(function()
        selectingChar = false
        local cData = data.cData
        DoScreenFadeOut(10)
        TriggerServerEvent('qb-multicharacter:server:loadUserData', cData)
        openCharMenu(false)
        local model = IsPedMale(charPed) and 'mp_male' or 'mp_female'
        SetEntityAsMissionEntity(charPed, true, true)
        DeleteEntity(charPed)
        Wait(5000)
        TriggerServerEvent("qb-appearance:loadSkin")
        Wait(500)
        TriggerServerEvent("qb-clothes:LoadClothes", 1)
        SetModelAsNoLongerNeeded(model)
    end)
end)

RegisterNUICallback('setupCharacters', function() -- Present char info
    QBCore.Functions.TriggerCallback("qb-multicharacter:server:setupCharacters", function(result)
        SendNUIMessage({
            action = "setupCharacters",
            characters = result
        })
    end)
end)

RegisterNUICallback('removeBlur', function()
    SetTimecycleModifier('default')
end)

RegisterNUICallback('createNewCharacter', function(data) -- Creating a char
    DoScreenFadeOut(150)
    Wait(200)
    DestroyAllCams(true)
    DeleteEntity(charPed)
    TriggerEvent("qb-appearance:OpenCreator")
    SetModelAsNoLongerNeeded(charPed)
    TriggerServerEvent('qb-multicharacter:server:createCharacter', data)
    Wait(1000)
    DoScreenFadeIn(1000)
end)

RegisterNUICallback('removeCharacter', function(data) -- Removing a char
    TriggerServerEvent('qb-multicharacter:server:deleteCharacter', data.citizenid)
    TriggerEvent('qb-multicharacter:client:chooseChar')
end)

-- Threads

CreateThread(function()
    RequestImap(-1699673416)
    RequestImap(1679934574)
    RequestImap(183712523)
    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            TriggerEvent('qb-multicharacter:client:chooseChar')
            return
        end
    end
end)