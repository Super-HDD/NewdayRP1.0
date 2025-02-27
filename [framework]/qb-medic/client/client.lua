local QBCore = exports['qb-core']:GetCoreObject()

local createdEntries = {}
local isLoggedIn = false
local deathSecondsRemaining = 0
local deathTimerStarted = false
local deathactive = false
local mediclocation = nil
local medicsonduty = 0
local healthset = false
local closestRespawn = nil
local medicCalled = false
local Dead = false
local deadcam = nil
local angleY = 0.0
local angleZ = 0.0


------------------------------------------------------ FUNCTIONS -------------------------------------------------------


-- Death Timer
local deathTimer = function()
    deathSecondsRemaining = Config.DeathTimer

    CreateThread(function()
        while deathSecondsRemaining > 0 do
            Wait(1000)

            deathSecondsRemaining = deathSecondsRemaining - 1

            TriggerEvent("qb-medic:client:GetMedicsOnDuty")
        end
    end)
end

-- Drawtext for Countdown
local DrawTxt = function(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local string = CreateVarString(10, "LITERAL_STRING", str)

    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)

    if enableShadow then
        SetTextDropshadow(1, 0, 0, 0, 255)
    end

    DisplayText(string, x, y)
end

-- Start Death Cam
local StartDeathCam = function()
    ClearFocus()

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local fov = GetGameplayCamFov()

    deadcam = Citizen.InvokeNative(0x40C23491CE83708E, "DEFAULT_SCRIPTED_CAMERA", coords, 0, 0, 0, fov)

    SetCamActive(deadcam, true)
    RenderScriptCams(true, true, 1000, true, false)
end

-- End Death Cam
local EndDeathCam = function()
    ClearFocus()

    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(deadcam, false)
    DestroyAllCams(true)

    deadcam = nil
end

-- Update Death Cam Position
local ProcessNewPosition = function()
    local mouseX = 0.0
    local mouseY = 0.0
    local ped = PlayerPedId()

    if IsInputDisabled(0) then
        mouseX = GetDisabledControlNormal(1, 0x6BC904FC) * 8.0
        mouseY = GetDisabledControlNormal(1, 0x84574AE8) * 8.0
    else
        mouseX = GetDisabledControlNormal(1, 0x6BC904FC) * 0.5
        mouseY = GetDisabledControlNormal(1, 0x84574AE8) * 0.5
    end

    angleZ = angleZ - mouseX
    angleY = angleY + mouseY

    if angleY > 89.0 then
        angleY = 89.0
    elseif angleY < -89.0 then
        angleY = -89.0
    end

    local pCoords = GetEntityCoords(ped)

    local behindCam =
    {
        x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (0.5 + 0.5),
        y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (0.5 + 0.5),
        z = pCoords.z + ((Sin(angleY))) * (0.5 + 0.5)
    }

    local rayHandle = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z + 0.5, behindCam.x, behindCam.y, behindCam.z, -1, ped, 0)

    local _, hitBool, hitCoords, _, _ = GetShapeTestResult(rayHandle)

    local maxRadius = 3.5

    if (hitBool and Vdist(pCoords.x, pCoords.y, pCoords.z + 0.0, hitCoords) < 0.5 + 0.5) then
        maxRadius = Vdist(pCoords.x, pCoords.y, pCoords.z + 0.0, hitCoords)
    end

    local offset =
    {
        x = ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * maxRadius,
        y = ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * maxRadius,
        z = ((Sin(angleY))) * maxRadius
    }

    local pos =
    {
        x = pCoords.x + offset.x,
        y = pCoords.y + offset.y,
        z = pCoords.z + offset.z
    }

    return pos
end

-- Process Camera Controls
local ProcessCamControls = function()
    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)

    -- disable 1st person as the 1st person camera can cause some glitches
    Citizen.InvokeNative(0x05AB44D906738426)

    -- calculate new position
    local newPos = ProcessNewPosition()

    -- set coords of cam
    Citizen.InvokeNative(0xF9EE7D419EE49DE6, deadcam, newPos.x, newPos.y, newPos.z)

    -- set rotation
    Citizen.InvokeNative(0x948B39341C3A40C2, deadcam, playerCoords.x, playerCoords.y, playerCoords.z)
end

-- Medic Call Delay
local MedicCalled = function()
    local delay = Config.MedicCallDelay * 1000

    CreateThread(function()
        while true do
            Wait(delay)

            medicCalled = false

            return
        end
    end)
end

-- Set Closest Respawn
local function SetClosestRespawn()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil

    for k, _ in pairs(Config.RespawnLocations) do
        local dest = vector3(Config.RespawnLocations[k].coords.x, Config.RespawnLocations[k].coords.y, Config.RespawnLocations[k].coords.z)
        local dist2 = #(pos - dest)

        if current then
            if dist2 < dist then
                current = k
                dist = dist2
            end
        else
            dist = dist2
            current = k
        end
    end

    if current ~= closestRespawn then
        closestRespawn = current
    end
end


------------------------------------------------------- THREADS --------------------------------------------------------


-- Prompts and Blips
CreateThread(function()
    for i = 1, #Config.MedicJobLocations do
        local loc = Config.MedicJobLocations[i]

        exports['qb-core']:createPrompt(loc.prompt, loc.coords, QBCore.Shared.Keybinds['J'], '访问 '..loc.name,
        {
            type = 'client',
            event = 'qb-medic:client:mainmenu',
            args = {loc.prompt, loc.name}
        })

        createdEntries[#createdEntries + 1] = {type = "PROMPT", handle = loc.prompt}

       -- if loc.showblip then
       --     local MedicBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, loc.coords)

        --    SetBlipSprite(MedicBlip, GetHashKey(Config.Blip.blipSprite), true)
        --    SetBlipScale(MedicBlip, Config.Blip.blipScale)
        --    Citizen.InvokeNative(0x9CB1A1623062F402, MedicBlip, Config.Blip.blipName)

        --    createdEntries[#createdEntries + 1] = {type = "BLIP", handle = MedicBlip}
       -- end
    end
end)



-- Citizen.CreateThread(function()
--     for saloontender, v in pairs(Config.SaloonTenderLocations) do
--         exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], '访问 ' .. v.name, {
--             type = 'client',
--             event = 'qb-medic:client:mainmenu',
--             args = { v.location, v.coords },
--         })
--         if v.showblip == true then
--             local SaloonTenderBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
--             SetBlipSprite(SaloonTenderBlip, GetHashKey(Config.Blip.blipSprite), true)
--             SetBlipScale(SaloonTenderBlip, Config.Blip.blipScale)
--             Citizen.InvokeNative(0x9CB1A1623062F402, SaloonTenderBlip, Config.Blip.blipName)
--         end
--     end
-- end)

-- Register Death
CreateThread(function()
    while not isLoggedIn do
        isLoggedIn = LocalPlayer.state['isLoggedIn']

        Wait(5000)
    end

    while true do
        Wait(1000)

        local playerPed = PlayerPedId()
        local dead = IsEntityDead(playerPed)

        if dead and not deathactive then
            exports.spawnmanager:setAutoSpawn(false)

            deathTimerStarted = true

            deathTimer()

            deathactive = true

            TriggerServerEvent("QBCore:Server:SetMetaData", "isdead", true)
            TriggerEvent('qb-medic:client:DeathCam')
        end
    end
end)

-- Display Respawn Message and Countdown
CreateThread(function()
    while true do
        local t = 1000

        if deathactive then
            t = 4

            if deathTimerStarted and deathSecondsRemaining > 0 then
                DrawTxt('在'..deathSecondsRemaining..'秒内重生..', 0.50, 0.80, 0.5, 0.5, true, 104, 244, 120, 200, true)
            end

            if deathTimerStarted and deathSecondsRemaining == 0 and medicsonduty == 0 then
                DrawTxt('按 [E] 重生', 0.50, 0.85, 0.5, 0.5, true, 104, 244, 120, 200, true)
            end

            if deathTimerStarted and deathSecondsRemaining < Config.DeathTimer and medicsonduty > 0 and not medicCalled then
                if deathSecondsRemaining == 0 then
                    DrawTxt('按 [E] 重生 - 按 [J] 寻求帮助', 0.50, 0.85, 0.5, 0.5, true, 104, 244, 120, 200, true)
                else
                    DrawTxt('按 [J] 寻求帮助', 0.50, 0.85, 0.5, 0.5, true, 104, 244, 120, 200, true)
                end
            end

            if deathTimerStarted and deathSecondsRemaining == 0 and IsControlPressed(0, QBCore.Shared.Keybinds['E']) then
                deathTimerStarted = false

                TriggerEvent('qb-medic:client:revive')
                TriggerServerEvent('qb-medic:server:deathactions')
            end

            if deathactive and deathTimerStarted and deathSecondsRemaining < Config.DeathTimer and IsControlPressed(0, QBCore.Shared.Keybinds['J']) and not medicCalled then
                medicCalled = true

                if medicsonduty == 0 then
                    MedicCalled()

                    goto continue
                end

                local text = '一个人需要医疗帮助!'

                TriggerServerEvent('qb-medic:server:medicAlert', text)

                QBCore.Functions.Notify('医生已被召唤!', 'success', 5000)

                MedicCalled()

                ::continue::
            end
        end

        if Config.Debug then
            print('deathTimerStarted: '..tostring(deathTimerStarted))
            print('deathSecondsRemaining: '..tostring(deathSecondsRemaining))
            print('medicsonduty: '..tostring(medicsonduty))
        end

        Wait(t)
    end
end)

-- Health Update Loop
CreateThread(function()
    local lastHealth = 0

    while true do
        if healthset then
            local ped = PlayerPedId()
            local health = GetEntityHealth(ped)

            if lastHealth ~= health then
                TriggerServerEvent('qb-medic:server:SetHealth', health)
            end

            lastHealth = health

            Wait(1000)
        else
            Wait(5000)
        end
    end
end)


-------------------------------------------------------- EVENTS --------------------------------------------------------


-- Medic Menu
AddEventHandler('qb-medic:client:mainmenu', function(location, name)
    local job = QBCore.Functions.GetPlayerData().job.name

    if job ~= Config.JobRequired then
        QBCore.Functions.Notify('你不是医生!', 'error')

        return
    end

    mediclocation = location

    exports['qb-menu']:openMenu(
    {
        {
            header = name,
            icon = "fas fa-briefcase-medical",
            isMenuHeader = true
        },
        {
            header = "切换职责",
            txt = "",
            icon = "fas fa-user-circle",
            params =
            {
                event = 'qb-medic:client:ToggleDuty',
                isServer = false
            }
        },
        {
            header = "医疗用品",
            txt = "",
            icon = "fas fa-heartbeat",
            params =
            {
                event = 'qb-medic:client:OpenMedicSupplies',
                isServer = false
            }
        },
        {
            header = "医疗存储",
            txt = "",
            icon = "fas fa-box",
            params =
            {
                event = 'qb-medic:client:storage',
                isServer = false
            }
        },
        {
            header = "职位管理",
            txt = "",
            icon = "fas fa-building",
            params =
            {
                event = 'qb-bossmenu:client:OpenMenu',
                isServer = false
            }
        },
        {
            header = "关闭菜单",
            txt = '',
            icon = "fas fa-xmark",
            params =
            {
                event = 'qb-menu:closeMenu'
            }
        }
    })
end)

-- Death Cam
AddEventHandler('qb-medic:client:DeathCam', function()
    CreateThread(function()
        while true do
            Wait(1000)

            if not Dead and deathactive then
                Dead = true

                StartDeathCam()
            elseif Dead and not deathactive then
                Dead = false

                EndDeathCam()
            end

            if deathSecondsRemaining <= 0 and not deathactive then
                Dead = false

                EndDeathCam()

                return
            end
        end
    end)

    CreateThread(function()
        while true do
            Wait(4)

            if deadcam and Dead then
                ProcessCamControls()
            end

            if deathactive and not deadcam then
                StartDeathCam()
            end

            if deathSecondsRemaining <= 0 and not deathactive then return end
        end
    end)
end)

-- Get Medics On-Duty
AddEventHandler('qb-medic:client:GetMedicsOnDuty', function()
    QBCore.Functions.TriggerCallback('qb-medic:server:getmedics', function(mediccount)
        medicsonduty = mediccount
    end)
end)

-- Player Revive After Pressing [E]
AddEventHandler('qb-medic:client:revive', function()
    SetClosestRespawn()

    local player = PlayerPedId()

    if deathactive then
        DoScreenFadeOut(500)

        Wait(1000)

        local respawnPos = Config.RespawnLocations[closestRespawn].coords

        NetworkResurrectLocalPlayer(respawnPos, true, false)
        SetEntityInvincible(player, false)
        ClearPedBloodDamage(player)
        Citizen.InvokeNative(0xC6258F41D86676E0, player, 0, 100) -- SetAttributeCoreValue
        Citizen.InvokeNative(0xC6258F41D86676E0, player, 1, 100) -- SetAttributeCoreValue
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", 100)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", 100)
        SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(player, true, true)

        -- Reset Death Timer
        deathactive = false
        deathTimerStarted = false
        medicCalled = false
        deathSecondsRemaining = 0

        Wait(1500)

        DoScreenFadeIn(1800)

        TriggerServerEvent("QBCore:Server:SetMetaData", "isdead", false)
    end
end)

-- Admin Revive
RegisterNetEvent('qb-medic:client:adminRevive', function()
    local player = PlayerPedId()
    local pos = GetEntityCoords(player, true)

    DoScreenFadeOut(500)

    Wait(1000)

    NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(player), true, false)
    SetEntityInvincible(player, false)
    ClearPedBloodDamage(player)
    Citizen.InvokeNative(0xC6258F41D86676E0, player, 0, 100) -- SetAttributeCoreValue
    Citizen.InvokeNative(0xC6258F41D86676E0, player, 1, 100) -- SetAttributeCoreValue
    TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + 100)
    TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
    RemoveAllPedWeapons(player, true, true)

    -- Reset Death Timer
    deathactive = false
    deathTimerStarted = false
    medicCalled = false
    deathSecondsRemaining = 0

    Wait(1500)

    DoScreenFadeIn(1800)

    TriggerServerEvent("QBCore:Server:SetMetaData", "isdead", false)
end)

-- Player Revive
RegisterNetEvent('qb-medic:client:playerRevive', function()
    local player = PlayerPedId()
    local pos = GetEntityCoords(player, true)

    DoScreenFadeOut(500)

    Wait(1000)

    NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(player), true, false)
    SetEntityInvincible(player, false)
    ClearPedBloodDamage(player)
    Citizen.InvokeNative(0xC6258F41D86676E0, player, 0, 100) -- SetAttributeCoreValue
    Citizen.InvokeNative(0xC6258F41D86676E0, player, 1, 100) -- SetAttributeCoreValue
    TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + 100)
    TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 100)
    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)
    RemoveAllPedWeapons(player, true, true)

    -- Reset Death Timer
    deathactive = false
    deathTimerStarted = false
    medicCalled = false
    deathSecondsRemaining = 0

    Wait(1500)

    DoScreenFadeIn(1800)

    TriggerServerEvent("QBCore:Server:SetMetaData", "isdead", false)
end)

-- Setup Stored Health on Spawn
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    print('Player health adjusted!')

    local ped = PlayerPedId()
    local healthcore = Citizen.InvokeNative(0x36731AC041289BB1, ped, 0)
    local savedhealth = QBCore.Functions.GetPlayerData().metadata["health"]

    while not healthset do
        Wait(1000)

        ped = PlayerPedId()

        if healthcore < 100 then
            Citizen.InvokeNative(0xC6258F41D86676E0, ped, 0, 100) -- SetAttributeCoreValue
            SetEntityHealth(ped, savedhealth, 0)

            healthset = true
        else
            Wait(1000)

            healthset = true
        end
    end

    if Config.DisableRegeneration then
        Citizen.InvokeNative(0x8899C244EBCF70DE, PlayerId(), 0.0)
    end
end)

-- Medic Supplies
AddEventHandler('qb-medic:client:OpenMedicSupplies', function()
    local job = QBCore.Functions.GetPlayerData().job.name

    if job ~= Config.JobRequired then return end

    local ShopItems = {}
    ShopItems.label = "Medic Supplies"
    ShopItems.items = Config.MedicSupplies
    ShopItems.slots = #Config.MedicSupplies

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "医疗用品_"..math.random(1, 99), ShopItems)
end)

-- Medic Storage
AddEventHandler('qb-medic:client:storage', function()
    local job = QBCore.Functions.GetPlayerData().job.name
    local stashloc = mediclocation

    if job ~= Config.JobRequired then return end

    TriggerServerEvent("inventory:server:OpenInventory", "stash", stashloc,
    {
        maxweight = Config.StorageMaxWeight,
        slots = Config.StorageMaxSlots,
    })

    TriggerEvent("inventory:client:SetCurrentStash", stashloc)
end)

-- Kill Player
RegisterNetEvent('qb-medic:client:KillPlayer')
AddEventHandler('qb-medic:client:KillPlayer', function()
    local ped = PlayerPedId()

    SetEntityHealth(ped, 0)
end)

-- Cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    DestroyAllCams(true)

    for i = 1, #createdEntries do
        if createdEntries[i].type == "BLIP" then
            if createdEntries[i].handle then
                RemoveBlip(createdEntries[i].handle)
            end
        end

        if createdEntries[i].type == "PROMPT" then
            if createdEntries[i].handle then
                exports['qb-core']:deletePrompt(createdEntries[i].handle)
            end
        end
    end
end)