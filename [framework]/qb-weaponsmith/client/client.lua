local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = false
local PlayerData = {}
local currentjob
local jobaccess

-----------------------------------------------------------------------------------

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = QBCore.Functions.GetPlayerData()
    currentjob = PlayerData.job.name
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
    PlayerData = {}
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
    currentjob = PlayerData.job.name
end)

-----------------------------------------------------------------------------------

-- prompts and blips
CreateThread(function()
    for loc, v in pairs(Config.WeaponCraftingPoint) do

        if v.AvilableAmmo=='all' then
            Config.WeaponCraftingPoint[loc].AvilableAmmo=Config.AmmoCrafting
        end

        if v.AvilableTools=='all' then
            Config.WeaponCraftingPoint[loc].AvilableTools=Config.ToolsCrafting
        end

        if v.AvilableParts=='all' then
            Config.WeaponCraftingPoint[loc].AvilableParts=Config.WeaponPartsCrafting
        end

        if v.AvilableRevlover=='all' then
            Config.WeaponCraftingPoint[loc].AvilableRevlover=Config.RevloverCrafting
        end

        if v.AvilablePistol=='all' then
            Config.WeaponCraftingPoint[loc].AvilablePistol=Config.PistolCrafting
        end

        if v.AvilableRepeater=='all' then
            Config.WeaponCraftingPoint[loc].AvilableRepeater=Config.RepeaterCrafting
        end

        if v.AvilableShotgun=='all' then
            Config.WeaponCraftingPoint[loc].AvilableShotgun=Config.ShotgunCrafting
        end

        if v.AvilableRifle=='all' then
            Config.WeaponCraftingPoint[loc].AvilableRifle=Config.RifleCrafting
        end

        exports['qb-core']:createPrompt(v.prompt, v.coords, QBCore.Shared.Keybinds['J'], Lang:t('menu.open') .. v.name, {
            type = 'client',
            event = 'qb-weaponsmiteh:client:mainmenu',
            args = { loc,v.job },
        })   
    end
end)

-----------------------------------------------------------------------------------

-- weaponsmith menu
RegisterNetEvent('qb-weaponsmiteh:client:mainmenu', function(Location,jobaccess)
    print(Location)
    --不限定职业或者当前职业符合要求
    if jobaccess==nil or currentjob == jobaccess then
        --根据Config配置主菜单
        local Configurations=Config.WeaponCraftingPoint[Location]
        local MainMenu ={ {
                header =  Lang:t('menu.workshop'),
                isMenuHeader = true,
            },
        }

        if Configurations.AvilablePistol or Configurations.AvilableRepeater or Configurations.AvilableRevlover or Configurations.AvilableRifle or Configurations.AvilableShotgun then
            table.insert(MainMenu, {
                header = Lang:t('menu.weapon_crafting'),
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'qb-weaponsmiteh:client:weaponmenu',
                    isServer = false,
                    args={Location}
                }
            })
        end

        if Configurations.AvilableParts then
            print('yes')
            table.insert(MainMenu, {
                header = Lang:t('menu.weapon_parts_crafting'),
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'qb-weaponsmiteh:client:weapon-category-menu',
                    isServer = false,
                    args={
                        AvilableWeapons=Configurations.AvilableParts,
                        Category='weapon_parts_crafting'
                    }
                }
            })
        end

        if Configurations.AvilableTools then
            table.insert(MainMenu,{
                header = Lang:t('menu.tools_crafting'),
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'qb-weaponsmiteh:client:weapon-category-menu',
                    isServer = false,
                    args={
                        AvilableWeapons=Configurations.AvilableTools,
                        Category='tools_crafting'
                    }
                }
            })
        end

        if Configurations.AvilableAmmo then
            table.insert(MainMenu,{
                header = Lang:t('menu.ammo_crafting'),
                txt = "",
                icon = "fas fa-tools",
                params = {
                    event = 'qb-weaponsmiteh:client:weapon-category-menu',
                    isServer = false,
                    args={
                        AvilableWeapons=Configurations.AvilableAmmo,
                        Category='ammo_crafting'
                    }
                }
            })
        end

        if jobaccess then
            table.insert(MainMenu,{
                header = Lang:t('menu.weaponsmith_storage'),
                txt = "",
                icon = "fas fa-box",
                params = {
                    event = 'qb-weaponsmiteh:client:storage',
                    isServer = false,
                    args = {},
                }
            })
            table.insert(MainMenu,{
                header = Lang:t('menu.job_management'),
                txt = "",
                icon = "fas fa-user-circle",
                params = {
                    event = 'qb-bossmenu:client:OpenMenu',
                    isServer = false,
                    args = {},
                }
            })
        end
        exports['qb-menu']:openMenu(MainMenu)
    else
        QBCore.Functions.Notify(Lang:t('您未经授权'), 'error')
    end
end)

-- weaponsmith weapon menu
RegisterNetEvent('qb-weaponsmiteh:client:weaponmenu', function(args)
    local Location=args[1]
    print(Location)
    local Configurations=Config.WeaponCraftingPoint[Location]
    local WeaponCraftingMenu={ {
            header = Lang:t('menu.weapon_crafting'),
            isMenuHeader = true,
        }
    }
    if Configurations.AvilableRevlover then
        table.insert(WeaponCraftingMenu, {
            header = Lang:t('menu.revolver_crafting'),
            txt = "",
            icon = "fas fa-tools",
            params = {
                event = 'qb-weaponsmiteh:client:weapon-category-menu',
                isServer = false,
                args={
                    AvilableWeapons=Configurations.AvilableRevlover,
                    Category='revolver_crafting'
                }
            }
        })
    end

    if Configurations.AvilablePistol then
        table.insert(WeaponCraftingMenu,{
            header = Lang:t('menu.pistol_crafting'),
            txt = "",
            icon = "fas fa-tools",
            params = {
                event = 'qb-weaponsmiteh:client:weapon-category-menu',
                isServer = false,
                args={
                    AvilableWeapons=Configurations.AvilablePistol,
                    Category='pistol_crafting'
                }
            }
        })
    end

    if Configurations.AvilableRepeater then
        table.insert(WeaponCraftingMenu, {
            header = Lang:t('menu.repeater_crafting'),
            txt = "",
            icon = "fas fa-tools",
            params = {
                event = 'qb-weaponsmiteh:client:weapon-category-menu',
                isServer = false,
                args={
                    AvilableWeapons=Configurations.AvilableRepeater,
                    Category='repeater_crafting'
                }
            }
        })
    end

    if Configurations.AvilableRifle then
        table.insert(WeaponCraftingMenu, {
            header = Lang:t('menu.rifle_crafting'),
            txt = "",
            icon = "fas fa-tools",
            params = {
                event = 'qb-weaponsmiteh:client:weapon-category-menu',
                isServer = false,
                args={
                    AvilableWeapons=Configurations.AvilableRifle,
                    Category='rifle_crafting'
                }
            }
        })
    end

    if Configurations.AvilableShotgun then
        table.insert(WeaponCraftingMenu, {
            header = Lang:t('menu.shotgun_crafting'),
            txt = "",
            icon = "fas fa-tools",
            params = {
                event = 'qb-weaponsmiteh:client:weapon-category-menu',
                isServer = false,
                args={
                    AvilableWeapons=Configurations.AvilableShotgun,
                    Category='shotgun_crafting'
                }
            }
        })
    end
    exports['qb-menu']:openMenu(WeaponCraftingMenu)

end)

--各个种类武器菜单
RegisterNetEvent('qb-weaponsmiteh:client:weapon-category-menu', function(WeaponSubMenuArgs)
    local AvilableWeapons=WeaponSubMenuArgs.AvilableWeapons
    local Category=WeaponSubMenuArgs.Category
    if Config.Debug then 
        print('AvilableRevlover')
        print(QBCore.Debug(AvilableWeapons))
    end
    local CraftMenu = {
        {
            header = Lang:t('menu.'..Category),
            isMenuHeader = true,
        },
    }

    for i=1,#AvilableWeapons do
        local v=Config.CraftingRecipes[AvilableWeapons[i]]
        CraftMenu[#CraftMenu + 1] = {
            header = v.label,
            txt = v.txt,
            icon = 'fas fa-cog',
            params = {
                event = 'qb-weaponsmiteh:client:check-items',
                args = {                
                    name = v.name,
                    label = v.label,
                    item = v.name,
                    crafttime = v.crafttime,
                    receive = v.receive
                }
            }
        }
    end
    exports['qb-menu']:openMenu(CraftMenu)
end)

-- 检查是否满足材料需求
RegisterNetEvent('qb-weaponsmiteh:client:check-items', function(data)
    QBCore.Functions.TriggerCallback('qb-weaponsmiteh:server:checkitems', function(hasRequired,icheck)
    if (hasRequired) then
        if Config.Debug == true then
            print("passed")
        end
        TriggerEvent('qb-weaponsmiteh:client:start-crafting', data.name, data.label, tonumber(data.crafttime), data.receive,icheck)
    else
        if Config.Debug == true then
            print("failed")
        end
        return
    end
    end, Config.CraftingRecipes[data.name].craftitems)
end)

-- 开始制作
RegisterNetEvent('qb-weaponsmiteh:client:start-crafting', function(name, label, crafttime, receive,icheck)
    local craftitems = Config.CraftingRecipes[name].craftitems
    local prob=Config.CraftingRecipes[name].prob
    QBCore.Functions.Progressbar('craft-parts', Lang:t('progressbar.crafting_a')..label, crafttime, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('qb-weaponsmiteh:server:finishcrafting', craftitems, receive,icheck,prob)
    end)
end)

-----------存储界面
RegisterNetEvent('qb-weaponsmiteh:client:storage', function()
    local playerjob = PlayerData.job.name
    if playerjob == currentjob then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", currentjob, {
            maxweight = Config.StorageMaxWeight,
            slots = Config.StorageMaxSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", currentjob)
    end
end)

-----------------------------------------------------------------------------------

-- clean/inspect weapon
RegisterNetEvent('qb-weaponsmiteh:client:serviceweapon', function(item, amount)
    local playerjob = PlayerData.job.name
    if playerjob == currentjob then
        local ped = PlayerPedId()
        local cloth = CreateObject(`s_balledragcloth01x`, GetEntityCoords(PlayerPedId()), false, true, false, false, true)
        local PropId = `CLOTH`
        local actshort = `SHORTARM_CLEAN_ENTER`
        local actlong = `LONGARM_CLEAN_ENTER`
        local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), false, weaponHash, false)
        local model = GetWeapontypeGroup(weaponHash)
        local object = GetObjectIndexFromEntityIndex(GetCurrentPedWeaponEntityIndex(PlayerPedId(), 0))
        if Config.Debug == true then
            print("Weapon Group --> "..model)
            print("Weapon Hash --> "..weaponHash)        
        end
        if weaponHash ~= `WEAPON_UNARMED` then
            if model == 416676503 or model == -1101297303 then
                Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), "", cloth, PropId, actshort, 1, 0, -1.0) -- TaskItemInteraction_2
                Wait(15000)
                Citizen.InvokeNative(0xA7A57E89E965D839, object, 0.0, false) -- SetWeaponDegradation
                Citizen.InvokeNative(0xE22060121602493B, object, 0.0, false) -- SetWeaponDamage
                Citizen.InvokeNative(0x812CE61DEBCAB948, object, 0.0, false) -- SetWeaponDirt
                Citizen.InvokeNative(0xA9EF4AD10BDDDB57, object, 0.0, false) -- SetWeaponSoot
                QBCore.Functions.Notify( Lang:t('枪械清理成功'), 'success')
            else
                Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), "", cloth, PropId, actlong, 1, 0, -1.0) -- TaskItemInteraction_2 
                Wait(15000)
                Citizen.InvokeNative(0xA7A57E89E965D839, object, 0.0, false) -- SetWeaponDegradation
                Citizen.InvokeNative(0xE22060121602493B, object, 0.0, false) -- SetWeaponDamage
                Citizen.InvokeNative(0x812CE61DEBCAB948, object, 0.0, false) -- SetWeaponDirt
                Citizen.InvokeNative(0xA9EF4AD10BDDDB57, object, 0.0, false) -- SetWeaponSoot
                QBCore.Functions.Notify(Lang:t('枪械清理成功'), 'success')
            end
        else
            QBCore.Functions.Notify(Lang:t('您必须握住武器'), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t('您未经授权'), 'error')
    end
end)

-----------------------------------------------------------------------------------
