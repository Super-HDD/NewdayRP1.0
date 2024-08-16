local QBCore = exports['qb-core']:GetCoreObject()

local jailtimeMinsRemaining = 0
local inJail = false
local inJailZone = false
local jailTime = 0
local Zones = {}

-----------------------------------------------------------------------------------

-- prompts
Citizen.CreateThread(function()
    for prison, v in pairs(Config.MenuLocations) do
        exports['qb-core']:createPrompt(v.prompt, v.coords, QBCore.Shared.Keybinds['J'], '访问 ' .. v.name, {
            type = 'client',
            event = 'qb-prison:client:menu',
            args = {},
        })
        if v.showblip == true then
            local PrisonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(PrisonBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(PrisonBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, PrisonBlip, Config.Blip.blipName)
        end
    end
end)

-- draw marker if set to true in config
CreateThread(function()
    while true do
        Wait(1)
        inRange = false
        local pos = GetEntityCoords(PlayerPedId())
        for prison, v in pairs(Config.MenuLocations) do
            if #(pos - v.coords) < Config.MarkerDistance then
                inRange = true
                if v.showmarker == true then
                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                end
            end
            if not inRange then
                Wait(2500)
            end
        end
    end
end)

-- Prison Zone
CreateThread(function()
    for k = 1, #Config.PrisonZone do
        Zones[k] = PolyZone:Create(Config.PrisonZone[k].zones,
        {
            name = Config.PrisonZone[k].name,
            minZ = Config.PrisonZone[k].minz,
            maxZ = Config.PrisonZone[k].maxz,
            debugPoly = false
        })

        Zones[k]:onPlayerInOut(function(isPointInside)
            if not isPointInside then
                inJailZone = false
                return
            end

            inJailZone = true
        end)
    end
end)

-- Prison Zone Loop
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local isJailed = 0
        local teleport = vector3(3368.31, -665.94, 46.29)

        if LocalPlayer.state['isLoggedIn'] then
            QBCore.Functions.GetPlayerData(function(PlayerData)
                isJailed = PlayerData.metadata["injail"]
            end)
        end

        if isJailed <= 0 then goto continue end
        if inJailZone then goto continue end

        QBCore.Functions.Notify('将你送回监狱区!', 'primary', 3000)

        Wait(3000)
        DoScreenFadeOut(1000)
        Wait(1000)
        SetEntityCoords(ped, teleport)
        Wait(1000)
        DoScreenFadeIn(1000)

        ::continue::

        Wait(10000)
    end
end)

-- prison menu
RegisterNetEvent('qb-prison:client:menu', function()
    exports['qb-menu']:openMenu({
        {
            header = "监狱菜单",
            isMenuHeader = true,
        },
        {
            header = "监狱商店",
            icon = "fas fa-shopping-basket",
            txt = "让自己活下去",
            params = { 
                event = 'qb-prison:client:shop',
                isServer = false,
                args = {}
            }
        },
        {
            header = "邮局",
            icon = "far fa-envelope-open",
            txt = "与亲人保持联系",
            params = { 
                event = 'qb-prison:client:telegrammenu',
                isServer = false,
                args = {}
            }
        },
        {
            header = "关闭菜单",
            txt = '',
            params = {
                event = 'qb-menu:closeMenu',
            }
        },
    })
end)

-- telegram menu
RegisterNetEvent('qb-prison:client:telegrammenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "| 电报菜单 |",
            isMenuHeader = true,
        },
        {
            header = "📥 | 阅读消息",
            txt = "阅读您的电报消息",
            params = {
                event = 'qb-telegram:client:readmessages',
                isServer = false,
                args = {}
            }
        },
        {
            header = "📤 | 发送电报",
            txt = "向另一位玩家发送电报",
            params = {
                event = 'qb-telegram:client:writemessage',
                isServer = false,
                args = {}
            }
        },
        {
            header = "<<< 后退",
            txt = '',
            params = {
                event = 'qb-prison:client:menu',
            }
        },
    })
end)

-----------------------------------------------------------------------------------

-- prison shop
RegisterNetEvent('qb-prison:client:shop')
AddEventHandler('qb-prison:client:shop', function()
    local ShopItems = {}
    ShopItems.label = "监狱商店"
    ShopItems.items = Config.PrisonShop
    ShopItems.slots = #Config.PrisonShop
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "监狱商店_"..math.random(1, 99), ShopItems)
end)

-----------------------------------------------------------------------------------

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["injail"] > 0 then
            TriggerEvent("qb-prison:client:Enter", PlayerData.metadata["injail"])
        end
    end)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    Wait(100)
    if LocalPlayer.state['isLoggedIn'] then
        QBCore.Functions.GetPlayerData(function(PlayerData)
            if PlayerData.metadata["injail"] > 0 then
                TriggerEvent("qb-prison:client:Enter", PlayerData.metadata["injail"])
            end
        end)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    inJail = false
end)

-----------------------------------------------------------------------------------

-- sent to jail
RegisterNetEvent('qb-prison:client:Enter', function(time)
    jailTime = time -- in mins
    local RandomStartPosition = Config.Locations.spawns[math.random(1, #Config.Locations.spawns)]
    SetEntityCoords(PlayerPedId(), RandomStartPosition.coords.x, RandomStartPosition.coords.y, RandomStartPosition.coords.z - 0.9, 0, 0, 0, false)
    SetEntityHeading(PlayerPedId(), RandomStartPosition.coords.w)
    Wait(500)
    TriggerServerEvent('qb-prison:server:SaveJailItems')
    QBCore.Functions.Notify('你的财产已被没收', 'primary')
    TriggerEvent('qb-prison:client:prisonclothes')
    TriggerServerEvent('qb-prison:server:RemovePlayerJob')
    inJail = true
    handleJailtime()
end)

-----------------------------------------------------------------------------------

RegisterNetEvent("qb-prison:client:prisonclothes") -- prison outfit event
AddEventHandler("qb-prison:client:prisonclothes", function()
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x9925C067, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x485EE834, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x18729F39, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3107499B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3C1A74CD, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3F1F01E5, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x3F7F3587, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x49C89D9B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x4A73515C, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x514ADCEA, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x5FC29285, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x79D7DF96, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x7A96FACA, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x877A2CF7, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x9B2C8B89, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xA6D134C6, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xE06D30CE, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x662AC34, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xAF14310B, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x72E6EF74, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xEABE0032, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0x2026C46D, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xB6B6122D, true, true, true)
    Citizen.InvokeNative(0xDF631E4BCE1B1FC4, ped, 0xB9E2FA01, true, true, true)

    if IsPedMale(ped) then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x5BA76CCF, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x216612F0, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x1CCEE58D, true, true, true)
    else
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x6AB27695, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x75BC0CF5, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x14683CDF, true, true, true)
    end
    RemoveAllPedWeapons(ped, true, true)
end)

-----------------------------------------------------------------------------------

-- jail timer
function handleJailtime()
    jailtimeMinsRemaining = jailTime
    Citizen.CreateThread(function()
        while jailtimeMinsRemaining > 0 do
            Wait(1000 * 60)
            jailtimeMinsRemaining = jailtimeMinsRemaining - 1
            if jailtimeMinsRemaining > 0 then
                if jailtimeMinsRemaining > 1 then
                    exports['qb-core']:DrawText('自由在 '..jailtimeMinsRemaining..' 分钟!', 'left')
                    TriggerServerEvent('qb-prison:server:updateSentance', jailtimeMinsRemaining)
                else
                    exports['qb-core']:DrawText('准备发布!', 'left')
                    TriggerServerEvent('qb-prison:server:updateSentance', jailtimeMinsRemaining)
                end
            else
                exports['qb-core']:HideText()
                TriggerEvent('qb-prison:client:freedom')
            end
        end
    end)
end

-----------------------------------------------------------------------------------

-- released from jail
RegisterNetEvent('qb-prison:client:freedom', function()
    TriggerServerEvent('qb-prison:server:FreePlayer')
    TriggerServerEvent('qb-prison:server:GiveJailItems')
    Wait(500)
    DoScreenFadeOut(1000)
    Wait(3000)
    SetEntityCoords(PlayerPedId(), Config.Locations["outside"].coords.x, Config.Locations["outside"].coords.y, Config.Locations["outside"].coords.z, 0, 0, 0, false)
    SetEntityHeading(PlayerPedId(), Config.Locations["outside"].coords.w)
    TriggerServerEvent("qb-appearance:LoadSkin")
    Wait(3000)
    DoScreenFadeIn(1000)
    QBCore.Functions.Notify('你已经出狱了，祝你好运', 'primary')
    Wait(5000)
    QBCore.Functions.Notify('您已收回财产', 'primary')
    inJail = false
end)

-----------------------------------------------------------------------------------
