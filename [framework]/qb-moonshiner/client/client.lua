local QBCore = exports['qb-core']:GetCoreObject()
local isBusy = false
local moonshinekit = 0
local fx_group = "scr_adv_sok"
local fx_name = "scr_adv_sok_torchsmoke"
local smoke

isLoggedIn = false
PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

function DrawText3Ds(x, y, z, text)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(15)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text)
    SetTextCentre(1)
    DisplayText(str,_x,_y)
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(15) 
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end

-- setup moonshine
RegisterNetEvent('qb-moonshiner:client:moonshinekit')
AddEventHandler('qb-moonshiner:client:moonshinekit', function(itemName) 
    if moonshinekit ~= 0 then
        SetEntityAsMissionEntity(moonshinekit)
        DeleteObject(moonshinekit)
        moonshinekit = 0
    else
        local playerPed = PlayerPedId()
        TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 10000, true, false, false, false)
        Wait(10000)
        ClearPedTasks(playerPed)
        SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
        local pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.75, -1.55)
        local modelHash = GetHashKey(Config.Prop)
        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Wait(1)
            end
        end
        local prop = CreateObject(modelHash, pos, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        TriggerServerEvent('qb-moonshiner:server:startsmoke', pos)
        PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
        moonshinekit = prop
    end
end, false)

RegisterNetEvent('qb-moonshiner:client:startsmoke')
AddEventHandler('qb-moonshiner:client:startsmoke', function(smokecoords)
    UseParticleFxAsset(fx_group)
    smoke = StartParticleFxLoopedAtCoord(fx_name, smokecoords, -2,0.0,0.0, 2.0, false, false, false, true)
    Citizen.InvokeNative(0x9DDC222D85D5AF2A, smoke, 10.0)
    SetParticleFxLoopedAlpha(smoke, 1.0)
    SetParticleFxLoopedColour(smoke, 1.0,1.0,1.0, false)
end)

-- create moonshine still / destroy (police only)
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local pos, awayFromObject = GetEntityCoords(PlayerPedId()), true
        local moonshineObject = GetClosestObjectOfType(pos, 5.0, GetHashKey(Config.Prop), false, false, false)
        if moonshineObject ~= 0 and PlayerJob.name ~= Config.LawJobName then
            local objectPos = GetEntityCoords(moonshineObject)
            if #(pos - objectPos) < 3.0 then
                awayFromObject = false
                DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, Lang:t('menu.brew'))
                if IsControlJustReleased(0, QBCore.Shared.Keybinds['J']) then
                    TriggerEvent('qb-moonshiner:client:craftmenu')
                end
            end
        else
            local objectPos = GetEntityCoords(moonshineObject)
            if #(pos - objectPos) < 3.0 then
                awayFromObject = false
                DrawText3Ds(objectPos.x, objectPos.y, objectPos.z + 1.0, Lang:t('menu.destroy'))
                if IsControlJustReleased(0, QBCore.Shared.Keybinds['J']) then
                    local player = PlayerPedId()
                    TaskStartScenarioInPlace(player, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 5000, true, false, false, false)
                    Wait(5000)
                    ClearPedTasks(player)
                    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
                    DeleteObject(moonshineObject)
                    Citizen.InvokeNative(0x22970F3A088B133B, smoke, true)
                    PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
                    QBCore.Functions.Notify(Lang:t('primary.moonshine_destroyed'), 'primary')
                end
            end
        end
        if awayFromObject then
            Wait(1000)
        end
    end
end)

-- moonshine menu
RegisterNetEvent('qb-moonshiner:client:craftmenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t('menu.moonshine'),
            isMenuHeader = true,
        },
        {
            header = Lang:t('menu.make_moonshine'),
            txt = Lang:t('text.xsugar_1xWater_and_1xcorn'),
            params = {
                event = 'qb-moonshiner:client:moonshine',
                isServer = false,
            }
        },
        {
            header = Lang:t('menu.close_menu'),
            txt = '',
            params = {
                event = 'qb-menu:closeMenu',
            }
        },
    })
end)

function HasRequirements(requirements)
    local found_requirements = {}
    local count = 0
    local missing = {}
    for i, require in ipairs(requirements) do
        if QBCore.Functions.HasItem(require) then
            found_requirements[#found_requirements + 1] = require
            count = count + 1
        else
            missing[#missing + 1] = require
        end
    end

    if count == #requirements then
        return true
    elseif count == 0 then
        QBCore.Functions.Notify("You are missing all of the requirements: " .. table.concat(missing, ", "), 'error')
        return false
    else
        QBCore.Functions.Notify("You are missing the following requirements: " .. table.concat(missing, ", "), 'error')
        return false
    end
end

-- make moonshine
RegisterNetEvent("qb-moonshiner:client:moonshine")
AddEventHandler("qb-moonshiner:client:moonshine", function()
    if isBusy then
        return
    else
        local hasItems = HasRequirements({'sugar','corn','water'})
        if hasItems then
            isBusy = not isBusy
            Citizen.InvokeNative(0x239879FC61C610CC, smoke, 0.0,0.0,0.0, false)
            local player = PlayerPedId()
            TaskStartScenarioInPlace(player, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), Config.BrewTime, true, false, false, false)
            Wait(Config.BrewTime)
            ClearPedTasks(player)
            SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
            TriggerServerEvent('qb-moonshiner:server:givemoonshine', 1)
            PlaySoundFrontend("SELECT", "RDRO_Character_Creator_Sounds", true, 0)
            Citizen.InvokeNative(0x239879FC61C610CC, smoke, 1.0,1.0,1.0, false)
            isBusy = not isBusy
        else
            QBCore.Functions.Notify(Lang:t('error.you_dont_have_the_ingredients_to_make_this'), 'error')
        end
    end
end)

-- sell moonshine vendor
Citizen.CreateThread(function()
    for k,v in pairs(Config.MoonshineVendor) do
        exports['qb-core']:createPrompt(v.uid, v.pos, QBCore.Shared.Keybinds['J'], v.header, {
            type = 'client',
            event = 'qb-moonshiner:client:sellmenu',
            args = {v.uid}
        })  
    end
end)

-- draw marker if set to true in config
CreateThread(function()
    while true do
        local sleep = 0
        for k,v in pairs(Config.MoonshineVendor) do
            if v.showmarker == true then
                Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('qb-moonshiner:client:sellmenu') 
AddEventHandler('qb-moonshiner:client:sellmenu', function(menuid)
    local shoptable = {
        {
            header = "| "..getMenuTitle(menuid).." |",
            isMenuHeader = true,
        },
    }
    local closemenu = {
        header = Lang:t('menu.close_menu'),
        txt = '', 
        params = {
            event = 'qbr-menu:closeMenu',
        }
    }
    for k,v in pairs(Config.MoonshineVendor) do
        if v.uid == menuid then
            for g,f in pairs(v.shopdata) do
                local lineintable = {
                    header = "<img src=nui://qb-inventory/html/images/"..f.image.." width=20px>"..f.title..Lang:t('menu.price')..f.price..')',
                    params = {
                        event = 'qb-moonshiner:client:sellcount',
                        args = {menuid, f}
                    }
                }
                table.insert(shoptable, lineintable)
            end 
        end
    end
    table.insert(shoptable,closemenu)
    exports['qb-menu']:openMenu(shoptable)
end)

RegisterNetEvent('qb-moonshiner:client:sellcount') 
AddEventHandler('qb-moonshiner:client:sellcount', function(arguments)
    local menuid = arguments[1]
    local data = arguments[2]
    local inputdata = exports['qb-input']:ShowInput({
        header = Lang:t('menu.enter_the_number_of_1pc',{price = data.price}),
        submitText = Lang:t('text.sell'),
        inputs = {
            {
                text = data.description,
                input = "amount",
                type = "number",
                isRequired = true
            },
        }
    })
    if inputdata ~= nil then
        for k,v in pairs(inputdata) do
            TriggerServerEvent('qb-moonshiner:server:sellitem', v,data)
        end
    end
end)

function getMenuTitle(menuid)
    for k,v in pairs(Config.MoonshineVendor)  do
        if menuid == v.uid then
            return v.header
        end
    end
end
