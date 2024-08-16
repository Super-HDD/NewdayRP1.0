local QBCore = exports['qb-core']:GetCoreObject()

local createdEntries = {}
local selling = false
local cooldown = false
local cooldowntimer = 0

-- Delete Entity
local DeleteThis = function(horse)
    NetworkRequestControlOfEntity(horse)
    SetEntityAsMissionEntity(riding, true, true)

    Wait(100)

    DeleteEntity(horse)

    Wait(500)

    local ped = PlayerPedId()
    local entitycheck = Citizen.InvokeNative(0xD806CD2A4F2C2996, ped)
    local ridingcheck = GetPedType(entitycheck)

    if ridingcheck == 0 then return true end

    return false
end

-- Prompts
CreateThread(function()
    for i = 1, #Config.SellWildHorseLocations do
        local loc = Config.SellWildHorseLocations[i]
        local name = loc.name
        local location = loc.location
        local coords = loc.coords
        local showblip = loc.showblip

        exports['qb-core']:createPrompt(location, coords, QBCore.Shared.Keybinds['J'], Lang:t('menu.open')..name,
        {
            type = 'client',
            event = 'qb-sellwildhorse:client:menu',
            args = {name}
        })

        createdEntries[#createdEntries + 1] = {type = 'PROMPT', handle = location}

        if showblip then
            local SellWildHorseBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords)

            SetBlipSprite(SellWildHorseBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(SellWildHorseBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, SellWildHorseBlip, Config.Blip.blipName)

            createdEntries[#createdEntries + 1] = {type = 'BLIP', handle = SellWildHorseBlip}
        end
    end
end)

-- Sell Wild Horse Menu
RegisterNetEvent('qb-sellwildhorse:client:menu', function(name)
    if selling then return end

    if Config.EnableCooldown and cooldowntimer > 0 then
        local time = 'seconds'
        local timer = cooldowntimer

        if cooldowntimer > 60 then
            timer = math.floor(cooldowntimer / 60)
            time = 'minutes'
        end

        QBCore.Functions.Notify('您需要等待'..timer..''..time..'才能出售另一匹野马！', 'error', 3000)

        return
    end

    lib.registerContext({
        id = 'wildhorse_menu',
        title = name,
        options = {

            {

                title = Lang:t('menu.sell_stored_horse'),
                description = Lang:t('text.sell_store_horse'),
                icon = "fas fa-paw",
                event = 'qb-sellwildhorse:client:sellhorse',
            }
        }
    })

    lib.showContext('wildhorse_menu')
end)

-- Sell Horse Event
AddEventHandler('qb-sellwildhorse:client:sellhorse', function()
    local ped = PlayerPedId()
    local horse = Citizen.InvokeNative(0xE7E11B8DCBED1058, ped)
    local myhorse = exports['qb-horses']:CheckActiveHorse()
    local model = GetEntityModel(horse)
    local owner = Citizen.InvokeNative(0xF103823FFE72BB49, horse)
    selling = true

    if Config.Debug then
        print("Rider    : "..tostring(ped))
        print("Horse    : "..tostring(horse))
        print("Model    : "..tostring(model))
        print("Owner    : "..tostring(owner))
    end

    if not horse or horse == 0 then
        QBCore.Functions.Notify(Lang:t('error.you_dont_have_any_horse_to_sell'), 'error', 3000)

        Wait(3000)

        selling = false

        return
    end

    if not owner or owner ~= ped then
        QBCore.Functions.Notify(Lang:t('error.not_tamed'), 'error', 3000)

        Wait(3000)

        selling = false

        return
    end

    if myhorse and myhorse ~= 0 then
        QBCore.Functions.Notify(Lang:t('error.owned_horse'), 'error', 3000)

        Wait(3000)

        selling = false

        return
    end

    for i = 1, #Config.Horse do
        local horses = Config.Horse[i]
        local models = horses.model

        if model == models then
            local name = horses.name
            local rewardmoney = horses.rewardmoney
            local rewarditem = horses.rewarditem

            if Config.Debug then
                print("Horse Model  : "..tostring(model))
                print("Reward Money : "..tostring(rewardmoney))
                print("Reward Item  : "..tostring(rewarditem))
            end

            QBCore.Functions.Progressbar('sell-horse', Lang:t('progressbar.checking_horse')..name, Config.SellTime, false, true,
            {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                local deleted = DeleteThis(horse)

                if deleted then
                    TriggerServerEvent('qb-sellwildhorse:server:reward', rewardmoney, rewarditem)

                    Wait(3000)

                    selling = false

                    if Config.EnableCooldown then
                        TriggerEvent('qb-sellwildhorse:client:Cooldown')
                    end

                    return
                end
            end)
        end
    end

    selling = false
end)

AddEventHandler('qb-sellwildhorse:client:Cooldown', function()
    if cooldown then return end

    CreateThread(function()
        cooldowntimer = Config.Cooldown
        cooldown = true

        while true do
            Wait(1000)

            cooldowntimer = cooldowntimer - 1

            if cooldowntimer <= 0 then
                cooldowntimer = 0
                cooldown = false

                return
            end
        end
    end)
end)

if Config.Debug then
    RegisterNetEvent('qb-sellwildhorse:client:SetHorseAsWild')
    AddEventHandler('qb-sellwildhorse:client:SetHorseAsWild', function()
        local ped = PlayerPedId()
        local mount = GetMount(ped)

        if mount then
            Citizen.InvokeNative(0xAEB97D84CDF3C00B, mount, true)
        end
    end)
end

-- Cleanup
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    FreezeEntityPosition(PlayerPedId(), false)

    for i = 1, #createdEntries do
        if createdEntries[i].type == 'PROMPT' then
            if createdEntries[i].handle then
                exports['qb-core']:deletePrompt(createdEntries[i].handle)
            end
        end

        if createdEntries[i].type == 'BLIP' then
            if createdEntries[i].handle then
                RemoveBlip(createdEntries[i].handle)
            end
        end
    end
end)