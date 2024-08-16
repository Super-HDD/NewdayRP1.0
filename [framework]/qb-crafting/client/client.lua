local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local bpos
local crafting

--------------------------------------------------------------------------

-- start invension shop
Citizen.CreateThread(function()
    for bpos, v in pairs(Config.InvensionShopLocations) do
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], Lang:t('menu.open') .. v.name, {
            type = 'client',
            event = 'qb-crafting:client:OpenInvensionShop',
        })
        if v.showblip == true then
            local StoreBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(StoreBlip, 1475879922, 1)
            SetBlipScale(StoreBlip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, StoreBlip, v.name)
        end
    end
end)

-- draw marker if set to true in config
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local sleep = 1000

        for _, v in pairs(Config.InvensionShopLocations) do
            if v.showmarker then
                local coord = v.coords
                local distance = #(coords - coord)

                if distance <= 10.0 then
                    sleep = 4

                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                end
            end
        end

        Wait(sleep)
    end
end)

RegisterNetEvent('qb-crafting:client:OpenInvensionShop')
AddEventHandler('qb-crafting:client:OpenInvensionShop', function()
    local ShopItems = {}
    ShopItems.label = "大发明家"
    ShopItems.items = Config.InvensionShop
    ShopItems.slots = #Config.InvensionShop
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "InvensionShop_"..math.random(1, 99), ShopItems)
end)
-- end invension shop

--------------------------------------------------------------------------

-- crafting locations
Citizen.CreateThread(function()
    for crafting, v in pairs(Config.CraftingLocations) do
        exports['qb-core']:createPrompt(v.location, v.coords, QBCore.Shared.Keybinds['J'], '访问 ' .. v.name, {
            type = 'client',
            event = 'qb-crafting:client:OpenMenu',
        })
        if v.showblip == true then
            local CraftingBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(CraftingBlip, 3535996525, 1)
            SetBlipScale(CraftingBlip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, CraftingBlip, v.name)
        end
    end
end)

-- draw marker if set to true in config
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local sleep = 1000

        for _, v in pairs(Config.CraftingLocations) do
            if v.showmarker then
                local coord = v.coords
                local distance = #(coords - coord)

                if distance <= 10.0 then
                    sleep = 4

                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                end
            end
        end

        Wait(sleep)
    end
end)

-- crafting menu
RegisterNetEvent('qb-crafting:client:OpenMenu', function()
    lib.showContext('some_menu')
    

    
      
end)
lib.registerContext({
    id = 'some_menu',
    title = Lang:t('menu.crafting_menu'),
    options = {
      
      {
        title = Lang:t('menu.craft_shovel'),
        description = Lang:t('text.xbpc_xsteel_xwood'),
        icon = 'fas fa-cog',
        event = 'qb-crafting:client:craftshovel',
        
      },
      {
        title = Lang:t('menu.craft_axe'),
        description = Lang:t('text.xbpc_xsteel_xwood'),
        icon = 'fas fa-cog',
        event = 'qb-crafting:client:craftaxe',
        
       
      },
      {
        title = Lang:t('menu.craft_pickAxe'),
        description = Lang:t('text.xbpc_xsteel_xwood'),
        event = 'qb-crafting:client:craftpickaxe',
        icon = 'fas fa-cog'
      },
      
    }
  })
--------------------------------------------------------------------------

-- make copy from blueprint original
RegisterNetEvent('qb-crafting:client:makecopy')
AddEventHandler('qb-crafting:client:makecopy', function(bpo, bpc, name)
    local hasItem = QBCore.Functions.HasItem(bpo, 1)
    if hasItem then
        QBCore.Functions.Progressbar(Lang:t('progressbar.copy')..name, Lang:t('progressbar.making_copy_of')..name..'..', Config.BPOCopyTime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:givecopy', bpc)
        end)
    else
        QBCore.Functions.Notify(Lang:t('error.you_dont_have_this_blueprint_original'), 'error')
    end
end)

--------------------------------------------------------------------------

-- shovel crafting
RegisterNetEvent('qb-crafting:client:craftshovel')
AddEventHandler('qb-crafting:client:craftshovel', function()
    local hasItem1 = QBCore.Functions.HasItem('bpcshovel', 1)
    local hasItem2 = QBCore.Functions.HasItem('steel', 3)
    local hasItem3 = QBCore.Functions.HasItem('wood', 1)
    if hasItem1 and hasItem2 and hasItem3 then
        QBCore.Functions.Progressbar("crafting-shovel", Lang:t('progressbar.crafting_shovel'), Config.ShovelCraftTime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:craftshovel')
        end)
    else
        QBCore.Functions.Notify(Lang:t('error.need_more_crafting_items'), 'error')
    end
end)

--------------------------------------------------------------------------

-- axe crafting
RegisterNetEvent('qb-crafting:client:craftaxe')
AddEventHandler('qb-crafting:client:craftaxe', function()
    local hasItem1 = QBCore.Functions.HasItem('bpcaxe', 1)
    local hasItem2 = QBCore.Functions.HasItem('steel', 3)
    local hasItem3 = QBCore.Functions.HasItem('wood', 1)
    if hasItem1 and hasItem2 and hasItem3 then
        QBCore.Functions.Progressbar("crafting-axe", Lang:t('progressbar.crafting_axe'), Config.AxeCraftTime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:craftaxe')
        end)
    else
        QBCore.Functions.Notify(Lang:t('error.need_more_crafting_items'), 'error')
    end
end)

--------------------------------------------------------------------------

-- pickaxe crafting
RegisterNetEvent('qb-crafting:client:craftpickaxe')
AddEventHandler('qb-crafting:client:craftpickaxe', function()
    local hasItem1 = QBCore.Functions.HasItem('bpcpickaxe', 1)
    local hasItem2 = QBCore.Functions.HasItem('steel', 3)
    local hasItem3 = QBCore.Functions.HasItem('wood', 1)
    if hasItem1 and hasItem2 and hasItem3 then
        QBCore.Functions.Progressbar("crafting-pickaxe", Lang:t('progressbar.crafting_pickAxe'), Config.PickAxeCraftTime, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerServerEvent('qb-crafting:server:craftpickaxe')
        end)
    else
        QBCore.Functions.Notify(Lang:t('error.need_more_crafting_items'), 'error')
    end
end)

--------------------------------------------------------------------------
