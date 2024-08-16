local QBCore = exports['qb-core']:GetCoreObject()

local isBusy = false
local testAnimDict = 'amb_rest_drunk@world_human_coffee_drink@male_a@react_look@enter@high'
local testAnim = 'react_look_front_enter'

function loadAnimDict(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

function loadModel(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

function doAnim (Amodel, bone, pX, pY, pZ, rX, rY, rZ, anim, Adict, duration)
    local model = loadModel(GetHashKey(Amodel))
    object = CreateObject(model, GetEntityCoords(PlayerPedId()), true, false, false)
    AttachEntityToEntity(object, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), bone), pX, pY, pZ, rX, rY, rZ, false, true, true, true, 0, true)
    local dict = loadAnimDict(Adict)
    TaskPlayAnim(PlayerPedId(), dict, anim, 5.0, 5.0, duration, 1, false, false, false)
end

function AnimDetatch (sleep)
    Citizen.Wait(sleep)
    if object ~= nil then
        DetachEntity(object, true, true)
        DeleteObject(object)
    end
end

AddEventHandler('qb-essentials:client:DrinkingAnimation', function()
    local ped = PlayerPedId()

    loadAnimDict(testAnimDict)

    Wait(100)

    TaskPlayAnim(ped, testAnimDict, testAnim, 3.0, 3.0, -1, 1, 0, false, false, false)
end)

RegisterNetEvent("consumables:client:Drink", function(itemName)
    if isBusy then return end

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger01")
    local prop = CreateObject(GetHashKey("p_teacup01x"), coords, true, true, true)
    isBusy = not isBusy

    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    FreezeEntityPosition(ped, true)
    ClearPedTasksImmediately(ped)

    TriggerEvent('qb-essentials:client:DrinkingAnimation')

    Wait(2700) -- Timing is very important here :D

    AttachEntityToEntity(prop, ped, boneIndex, 0.05, -0.14, -0.02, -75.0, 4.0, -12.0, true, true, true, false, 0, true)

    QBCore.Functions.Progressbar("drinking-water", "你正在从水壶里面喝水", 4500, false, true,
    {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)

        isBusy = not isBusy

        SetEntityAsNoLongerNeeded(prop)
        DeleteEntity(prop)
        DeleteObject(prop)

        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])

        QBCore.Functions.Notify("你从你的水壶里喝了水!", 'success', 3000)
    end)
end)

RegisterNetEvent("consumables:client:Smoke", function(itemName)
    if isBusy then
        return
    else
        isBusy = not isBusy
        local sleep = 10000
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        Citizen.Wait(100)
        local cigar = nil
        if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) then
            local item_model = nil
            local pX, pY, pZ, rX, rY, rZ = nil, nil, nil, nil, nil, nil
            if itemName == "cigar" then
                sleep = 20000
                item_model = "p_cigar01x"
                pX, pY, pZ, rX, rY, rZ = 0.0, 0.03, 0.0, 0.0, 00.0, 0.0
            else
                item_model = "p_cigarette_cs01x"
                pX, pY, pZ, rX, rY, rZ = 0.0, 0.03, 0.01, 0.0, 180.0, 90.0
            end
            doAnim(item_model, "SKEL_R_FINGER12", pX, pY, pZ, rX, rY, rZ, 'base', 'amb_wander@code_human_smoking_wander@cigar@male_a@base', sleep)
        end
        Wait(sleep)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent('hud:server:RelieveStress', math.random(20, 40))
        ClearPedTasks(PlayerPedId())
        AnimDetatch (sleep)
        isBusy = not isBusy
    end
end)

RegisterNetEvent("consumables:client:Eat", function(itemName)
    if isBusy then
        return
    else
        isBusy = not isBusy
        sleep = 5000
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        Citizen.Wait(100)
        if not IsPedOnMount(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId()) then
            local dict = loadAnimDict('mech_inventory@eating@multi_bite@wedge_a4-2_b0-75_w8_h9-4_eat_cheese')
            TaskPlayAnim(PlayerPedId(), dict, 'quick_right_hand', 5.0, 5.0, -1, 1, false, false, false)
        end
        Wait(sleep)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        ClearPedTasks(PlayerPedId())
        isBusy = not isBusy
    end
end)

RegisterNetEvent("consumables:client:EatStew", function(itemName)
    if isBusy then
        return
    else
        isBusy = not isBusy
        sleep = 5000
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
        local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        local spoon = CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
        TaskItemInteraction_2(PlayerPedId(), 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 1, 0, -1.0)
        TaskItemInteraction_2(PlayerPedId(), 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 1, 0, -1.0)
        Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
        isBusy = not isBusy
    end
end)

-- player use bandage
RegisterNetEvent('consumables:client:UseFieldBandage', function()
    local ped = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem('fieldbandage', 1)
    if hasItem then
        QBCore.Functions.Progressbar("use_fieldbandage", "使用药品中..", 4000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
            anim = "bandage_fast",
            flags = 1,
        }, {}, {}, function() -- Done
            StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
            TriggerServerEvent('consumables:server:removeitem', 'fieldbandage', 1)
            SetEntityHealth(ped, GetEntityHealth(ped) + 10)
        end, function() -- Cancel
            StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
            QBCore.Functions.Notify(Lang:t('error.canceled'), "error")
        end)
    else
        QBCore.Functions.Notify('你没有任何药品!', 'error')
    end
end)























RegisterNetEvent('consumables:client:yixiangbaiweipijiu', function()
    local hasItem = QBCore.Functions.HasItem('yixiangbaiweipijiu', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-baiwepijiu", '正在拆开 一箱百威啤酒  ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:baiwepijiu')
        end)
    
    end
end)


RegisterNetEvent('consumables:client:yixiangyishabeilaputaojiu', function()
    local hasItem = QBCore.Functions.HasItem('yixiangyishabeilaputaojiu', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-putaojiu", '正在拆开 一箱伊莎贝拉葡萄酒 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:putaojiu')
        end)
    end
end)


RegisterNetEvent('consumables:client:yixiangjiekedanni', function()
    local hasItem = QBCore.Functions.HasItem('yixiangjiekedanni', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-jiekedanni", '正在拆开 一箱杰克丹尼 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:jiekedanni')
        end)
     end
end)


RegisterNetEvent('consumables:client:yixiangnapolunganyi', function()
    local hasItem = QBCore.Functions.HasItem('yixiangnapolunganyi', 1)
    
    
    
    
    
    if hasItem then
        QBCore.Functions.Progressbar("crafting-napolunganyi", '正在拆开 一箱杰克丹尼 ', 30000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:napolunganyi')
        end)
    end
end)