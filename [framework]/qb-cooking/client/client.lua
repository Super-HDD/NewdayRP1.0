-- Ensure the resource 'qb-core' is properly imported and accessible
local QBCore = exports['qb-core']:GetCoreObject()

-- Initialize campfire and other variables
local campfire = false
local fire
local options = {}

-- Add target models for interaction
exports['qb-target']:AddTargetModel(Config.CampfireProps, {
    options = {
        {
            type = "client",
            event = 'qb-cooking:client:cookmenu',
            icon = "far fa-eye",
            label = Lang:t('label.open_cooking_menu'),
            distance = 3.0
        },
        {
            event = "qb-campfire:getWarm",
            icon = "fas fa-fire",
            label = "取暖",
        },
        {
            icon = "fas fa-fire-extinguisher",
            label = "扑灭营火",
            action = function(entity)
                TriggerEvent('qb-campfire:removeCampfire', entity)
            end
        },
    }
})

-- Event to get warm
RegisterNetEvent('qb-campfire:getWarm', function()
    local ped = PlayerPedId(-1)

    
    QBCore.Functions.RequestAnimDict('script_common@shared_scenarios@kneel@mourn@female@a@base')
    TaskPlayAnim(ped, "script_common@shared_scenarios@kneel@mourn@female@a@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)

    -- Show progress circle while warming up
    if lib.progressCircle({
        duration = 27000, -- Adjust the duration as needed
        position = 'bottom',
        label = '感到暖和.... ',
        useWhileDead = false,
        canCancel = false, -- Change to true if you want to allow canceling
        anim = {
            dict = 'script_common@shared_scenarios@kneel@mourn@female@a@base',
            clip = 'empathise_headshake_f_001',
            flag = 15,  
        },
        disableControl = true, -- Disable player control during the animation
        text = '感到暖和...',
    }) then
        --- Clear the animation immediately
        ClearPedTasksImmediately(ped)

        -- Increase player's health
        local maxHealth = GetEntityMaxHealth(ped)
        local health = GetEntityHealth(ped)
        local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 60))
        SetEntityHealth(ped, newHealth)
    else
        -- Handle cancelation or failure
        QBCore.Functions.Notify("Warming up canceled or failed.", 'error')
    end
end)

--no props in towns
function CanPlacePropHere(pos)
    local canPlace = true

    local ZoneTypeId = 1  -- Replace with the correct ZoneTypeId you want to check
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local town = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, ZoneTypeId)

    if town ~= false then
        canPlace = false
    end

    return canPlace
end

-- setup campfire  
RegisterNetEvent('qb-cooking:client:setupcampfire')
AddEventHandler('qb-cooking:client:setupcampfire', function()
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55))
    local positionToCheck = { x = x, y = y + 1, z = z }

    if CanPlacePropHere(positionToCheck) then
        if existingCampfire then
            -- Display a message to the player
            QBCore.Functions.Notify(Lang:t("primary.campfire_existed"), 'inform', 5000) -- Change the duration as needed (in milliseconds)

            -- Remove the existing campfire if it exists
            DeleteObject(existingCampfire)
        end

        local ped = PlayerPedId()
        QBCore.Functions.RequestAnimDict('script_common@shared_scenarios@kneel@mourn@female@a@base')
        TaskPlayAnim(ped, "script_common@shared_scenarios@kneel@mourn@female@a@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
        
        -- Use the Oxlib progress circle
        if lib.progressCircle({
            duration = 20000, -- Adjust the duration as needed
            position = 'bottom',
            label = Lang:t('primary.settingup_campfire'),
            useWhileDead = false,
            canCancel = true,
            anim = {
                dict = 'script_common@shared_scenarios@kneel@mourn@female@a@base',
                clip = 'empathise_headshake_f_001',
                flag = 15,
            },
        }) then
            -- Place the campfire after the progress circle completes
            local prop = CreateObject(GetHashKey("p_campfire05x"), x, y + 1, z, true, false, true)
            SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
            PlaceObjectOnGroundProperly(prop)
            fire = prop
            QBCore.Functions.Notify(Lang:t("primary.campfire_deployed"), 'primary')
            TriggerServerEvent('qb-cooking:server:removeCampfire')
            campfire = true  -- Set the campfire variable to true
            existingCampfire = prop -- Update the existing campfire reference
        else
            -- Handle cancelation
            QBCore.Functions.Notify("停止生火", 'error')
        end
        
        -- Stop the animation task even if the progress circle is canceled
        StopAnimTask(ped, 'script_common@shared_scenarios@kneel@mourn@female@a@base', 'base', 1.0)
    else
        -- Handle blocked placement
        QBCore.Functions.Notify('该区域禁止生火', 'error')
    end
end, false)

-- Remove campfire
RegisterNetEvent('qb-campfire:removeCampfire', function(Campfire)
    local ped = PlayerPedId()
    campfire = false

    QBCore.Functions.RequestAnimDict('script_common@shared_scenarios@kneel@mourn@female@a@base')
    TaskPlayAnim(ped, "script_common@shared_scenarios@kneel@mourn@female@a@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
    
    -- Use the Oxlib progress circle
    if lib.progressCircle({
        duration = 3000, -- Adjust the duration as needed
        label = Lang:t('primary.removing_campfire'),
        position = 'bottom',
        useWhileDead = false,
        canCancel = false, -- Change to true if you want to allow canceling
        anim = {
            dict = 'script_common@shared_scenarios@kneel@mourn@female@a@base',
            clip = 'empathise_headshake_f_001',
            flag = 15,
        },
    }) then
        -- Stop the animation task
        StopAnimTask(ped, 'script_common@shared_scenarios@kneel@mourn@female@a@base', 'base', 1.0)

        -- Delete the campfire object
        DeleteObject(Campfire)

        -- Add coal to the player's inventory using QB Core's AddItem function
        TriggerServerEvent('qb-campfire:giveCoal')

        QBCore.Functions.Notify(Lang:t("primary.campfire_put_out"), 'primary')
    else
        -- Handle cancelation
        -- QBCore.Functions.Notify("Campfire removal canceled.", 'error')
    end
end)
------------------------------------------------------------------------------------------------------

-- create a table to store menu options by category
local categoryMenus = {}

-- iterate through recipes and organize them by category
for _, v in ipairs(Config.Recipes) do
    local ingredientsMetadata = {}

    for i, ingredient in ipairs(v.ingredients) do
        table.insert(ingredientsMetadata, { label = QBCore.Shared.Items[ingredient.item].label, value = ingredient.amount })
    end
    local option = {
        title = v.title,
        icon = 'fa-solid fa-kitchen-set',
        event = 'qb-cooking:client:checkingredients',
        metadata = ingredientsMetadata,
        args = {
            title = v.title,
            ingredients = v.ingredients,
            cooktime = v.cooktime,
            receive = v.receive,
            giveamount = v.giveamount
        }
    }

    -- check if a menu already exists for this category
    if not categoryMenus[v.category] then
        categoryMenus[v.category] = {
            id = 'cooking_menu_' .. v.category,
            title = '烹饪菜单',
            menu = 'cooking_main_menu',
            onBack = function() end,
            options = { option }
        }
    else
        table.insert(categoryMenus[v.category].options, option)
    end
end

-- log menu events by category
for category, menuData in pairs(categoryMenus) do
    RegisterNetEvent('qb-cooking:client:' .. category)
    AddEventHandler('qb-cooking:client:' .. category, function()
        lib.registerContext(menuData)
        lib.showContext(menuData.id)
    end)
end

-- main event to open main menu
RegisterNetEvent('qb-cooking:client:cookmenu')
AddEventHandler('qb-cooking:client:cookmenu', function()
    -- show main menu with categories
    local mainMenu = {
        id = 'cooking_main_menu',
        title = '烹饪菜单',
        options = {}
    }

    for category, menuData in pairs(categoryMenus) do
        table.insert(mainMenu.options, {
            title = category,
            description = '查看 ' .. category..'配方',
            icon = 'fa-solid fa-kitchen-set',
            event = 'qb-cooking:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(mainMenu)
    lib.showContext(mainMenu.id)
end)

------------------------------------------------------------------------------------------------------

-- check player has the ingredients to cook item
RegisterNetEvent('qb-cooking:client:checkingredients', function(data)
    local input = lib.inputDialog('Cooking Amount', {
        { 
            type = 'input',
            label = 'Amount',
            required = true,
            min = 1, max = 10 
        },
    })

    if not input then return end

    local cookamount = tonumber(input[1])
    if cookamount then
        QBCore.Functions.TriggerCallback('qb-cooking:server:checkingredients', function(hasRequired)
            if (hasRequired) then
                if Config.Debug == true then
                    print("passed")
                end
                TriggerEvent('qb-cooking:cookmeal', data.title, data.ingredients, tonumber(data.cooktime * cookamount), data.receive, data.giveamount,  cookamount)
            else
                if Config.Debug == true then
                    print("failed")
                end
                return
            end
        end, data.ingredients,  cookamount)
    end
end)

-- do cooking
RegisterNetEvent('qb-cooking:cookmeal', function(title, ingredients, cooktime, receive, giveamount, cookamount)
    local ped = PlayerPedId()
    local animDict = 'script_common@shared_scenarios@kneel@mourn@female@a@base'
    local animName = 'base'

    QBCore.Functions.RequestAnimDict(animDict)

    -- Check if the animation dictionary was successfully loaded
    if HasAnimDictLoaded(animDict) then
        -- Play the animation
        TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)

        -- Use the Oxlib progress circle with a message
        if lib.progressCircle({
            duration = cooktime, -- Adjust the duration as needed
            position = 'bottom',
            useWhileDead = false,
            canCancel = false, -- Change to true if you want to allow canceling
            anim = {
                dict = animDict,
                clip = 'empathise_headshake_f_001',
                flag = 15,
            },
            disableControl = true, -- Disable player control during the animation
            label = 'Cooking ' .. title, -- Your cooking message here
        }) then
            -- Cooking was successful
            TriggerServerEvent('qb-cooking:server:finishcooking', ingredients, receive, giveamount, cookamount)

            -- Stop the animation
            StopAnimTask(ped, animDict, animName, 1.0)
        else
            -- Handle cancelation or failure
            QBCore.Functions.Notify("Cooking canceled or failed.", 'error')

            -- Cancel the animation
            StopAnimTask(ped, animDict, animName, 1.0)
        end
    else
        -- Handle if the animation dictionary couldn't be loaded
        QBCore.Functions.Notify("Failed to load animation dictionary.", 'error')
    end
end)