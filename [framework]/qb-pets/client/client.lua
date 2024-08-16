local QBCore = exports['qb-core']:GetCoreObject()
local petout = false
local pets

Citizen.CreateThread(function()
    for pets, v in pairs(Config.PetShopLocations) do
        exports['qb-core']:createPrompt(v.shopname, v.coords, QBCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
            type = 'client',
            event = 'qb-pets:client:OpenPetShop',
        })
        if v.showblip == true then
            local StoreBlip = N_0x554d9d53f696d002(1664425300, v.coords)
            SetBlipSprite(StoreBlip, Config.Blip.blipSprite, 1)
            SetBlipScale(StoreBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, StoreBlip, Config.Blip.blipName)
        end
    end
end)

RegisterNetEvent('qb-pets:client:OpenPetShop')
AddEventHandler('qb-pets:client:OpenPetShop', function()
    local ShopItems = {}
    ShopItems.label = "宠物商店"
    ShopItems.items = Config.PetShop
    ShopItems.slots = #Config.PetShop
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "PetShop_"..math.random(1, 99), ShopItems)
end)

-- call foxhound
RegisterNetEvent("qb-pets:client:callfoxhound")
AddEventHandler("qb-pets:client:callfoxhound", function()
    local hasItem = QBCore.Functions.HasItem('foxhound', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogAmericanFoxhound_01"
            local name = "foxhound"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call sheperd
RegisterNetEvent("qb-pets:client:callsheperd")
AddEventHandler("qb-pets:client:callsheperd", function()
    local hasItem = QBCore.Functions.HasItem('sheperd', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogAustralianSheperd_01"
            local name = "sheperd"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call coonhound
RegisterNetEvent("qb-pets:client:callcoonhound")
AddEventHandler("qb-pets:client:callcoonhound", function()
    local hasItem = QBCore.Functions.HasItem('coonhound', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogBluetickCoonhound_01"
            local name = "coonhound"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call catahoulacur
RegisterNetEvent("qb-pets:client:callcatahoulacur")
AddEventHandler("qb-pets:client:callcatahoulacur", function()
    local hasItem = QBCore.Functions.HasItem('catahoulacur', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogCatahoulaCur_01"
            local name = "catahoulacur"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call bayretriever
RegisterNetEvent("qb-pets:client:callbayretriever")
AddEventHandler("qb-pets:client:callbayretriever", function()
    local hasItem = QBCore.Functions.HasItem('bayretriever', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogChesBayRetriever_01"
            local name = "bayretriever"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call collie
RegisterNetEvent("qb-pets:client:callcollie")
AddEventHandler("qb-pets:client:callcollie", function()
    local hasItem = QBCore.Functions.HasItem('collie', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogCollie_01"
            local name = "collie"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call hound
RegisterNetEvent("qb-pets:client:callhound")
AddEventHandler("qb-pets:client:callhound", function()
    local hasItem = QBCore.Functions.HasItem('hound', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogHound_01"
            local name = "hound"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call husky
RegisterNetEvent("qb-pets:client:callhusky")
AddEventHandler("qb-pets:client:callhusky", function()
    local hasItem = QBCore.Functions.HasItem('husky', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogHusky_01"
            local name = "husky"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call lab
RegisterNetEvent("qb-pets:client:calllab")
AddEventHandler("qb-pets:client:calllab", function()
    local hasItem = QBCore.Functions.HasItem('lab', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogLab_01"
            local name = "lab"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call poodle
RegisterNetEvent("qb-pets:client:callpoodle")
AddEventHandler("qb-pets:client:callpoodle", function()
    local hasItem = QBCore.Functions.HasItem('poodle', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogPoodle_01"
            local name = "poodle"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)

-- call street
RegisterNetEvent("qb-pets:client:callstreet")
AddEventHandler("qb-pets:client:callstreet", function()
    local hasItem = QBCore.Functions.HasItem('street', 1)
    if hasItem then
        if petout == false then
            local model = "A_C_DogStreet_01"
            local name = "street"
            doggo = newDoggo(model, name)
            petout = true
            doggo.whistle()
            Wait(Config.whistle_wait)
        else
            doggo.delete()
            petout = false
            QBCore.Functions.Notify('把你的狗送到狗舍', 'success')
        end
    else
        QBCore.Functions.Notify('你没有这只宠物!', 'error')
    end
end)