local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = QBCore.Functions.GetPlayerData().job
local shownBossMenu = false
local DynamicMenuItems = {}
local bossmenu

Citizen.CreateThread(function()
     for bossmenu, v in pairs(Config.BossLocations) do
         exports['qb-core']:createPrompt(v.bossname, v.coords, QBCore.Shared.Keybinds['J'], '访问 ' .. v.name, {
             type = 'client',
             event = 'qb-bossmenu:client:OpenMenu',
             args = { },
         })
         if v.showblip == true then
             local BossBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
			 SetBlipSprite(BossBlip, GetHashKey("blip_honor_good"), true)
             SetBlipScale(BossBlip, 0.2)
			 Citizen.InvokeNative(0x9CB1A1623062F402, BossBlip, v.name)
         end
     end
end)

-- UTIL
local function CloseMenuFull()
    exports['qb-menu']:closeMenu()
    exports['qb-core']:HideText()
    shownBossMenu = false
end

local function comma_value(amount)
    local formatted = amount
    while true do
        local k
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

local function AddBossMenuItem(data, id)
    local menuID = id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

exports("AddBossMenuItem", AddBossMenuItem)

local function RemoveBossMenuItem(id)
    DynamicMenuItems[id] = nil
end

exports("RemoveBossMenuItem", RemoveBossMenuItem)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('qb-bossmenu:client:OpenMenu', function()
    if not PlayerJob.name or not PlayerJob.isboss then return end

    local bossMenu = {
        
        {
            title = "管理员工",
            description = "检查您的员工名单",
            icon = "fa-solid fa-list",
           
                event = "qb-bossmenu:client:employeelist",
          
        },
        {
            title = "雇用员工",
            description = "雇用附近的平民",
            icon = "fa-solid fa-hand-holding",
            
                event = "qb-bossmenu:client:HireMenu",
           
        },
        {
            title = "存储访问",
            description = "开放存储",
            icon = "fa-solid fa-box-open",
           
                event = "qb-bossmenu:client:Stash",
           
        },
        {
            title = "服装",
            description = "查看已保存的服装",
            icon = "fa-solid fa-shirt",
           
                event = "qb-bossmenu:client:Wardrobe",
           
        },
        {
            title = "金钱管理",
            description = "检查您的公司余额",
            icon = "fa-solid fa-sack-dollar",
           
                event = "qb-bossmenu:client:SocietyMenu",
          
        },
    }

    for _, v in pairs(DynamicMenuItems) do
        bossMenu[#bossMenu + 1] = v
    end

    

   
    lib.registerContext({
        id = 'boss_menu',
        title = "老板菜单 - " .. string.upper(PlayerJob.label),
        options = bossMenu
    })
    lib.showContext('boss_menu')
end)

RegisterNetEvent('qb-bossmenu:client:employeelist', function()
    local EmployeesMenu = {
        {
            header = "管理员工 - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            EmployeesMenu[#EmployeesMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                icon = "fa-solid fa-circle-user",
                params = {
                    event = "qb-bossmenu:client:ManageEmployee",
                    args = {
                        player = v,
                        work = PlayerJob
                    }
                }
            }
        end
        EmployeesMenu[#EmployeesMenu + 1] = {
            header = "返回",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "qb-bossmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(EmployeesMenu)
    end, PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:ManageEmployee', function(data)
    local EmployeeMenu = {
        {
            header = "管理 " .. data.player.name .. " - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info"
        },
    }
    for k, v in pairs(QBCore.Shared.Jobs[data.work.name].grades) do
        EmployeeMenu[#EmployeeMenu + 1] = {
            header = v.name,
            txt = "职位: " .. k,
            params = {
                isServer = true,
                event = "qb-bossmenu:server:GradeUpdate",
                icon = "fa-solid fa-file-pen",
                args = {
                    cid = data.player.empSource,
                    grade = tonumber(k),
                    gradename = v.name
                }
            }
        }
    end
    EmployeeMenu[#EmployeeMenu + 1] = {
        header = "开除",
        icon = "fa-solid fa-user-large-slash",
        params = {
            isServer = true,
            event = "qb-bossmenu:server:FireEmployee",
            args = data.player.empSource
        }
    }
    EmployeeMenu[#EmployeeMenu + 1] = {
        header = "返回",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "qb-bossmenu:client:OpenMenu",
        }
    }
    exports['qb-menu']:openMenu(EmployeeMenu)
end)

RegisterNetEvent('qb-bossmenu:client:Stash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerJob.name, {
        maxweight = 4000000,
        slots = 25,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:Wardrobe', function()
    TriggerEvent('qb-clothes:OpenOutfits')
end)

RegisterNetEvent('qb-bossmenu:client:HireMenu', function()
    RegisterNetEvent('qb-bossmenu:client:HireMenu', function()
        local HireMenu = {
            {
                header = "雇用员工 - " .. string.upper(PlayerJob.label),
                isMenuHeader = true,
                icon = "fa-solid fa-circle-info",
            },
        }
        QBCore.Functions.TriggerCallback('qb-bossmenu:getplayers', function(players)
            for _, v in pairs(players) do
                if v and v ~= PlayerId() then
                    HireMenu[#HireMenu + 1] = {
                        header = v.name,
                        txt = "公民ID: " .. v.citizenid .. " - ID: " .. v.sourceplayer,
                        icon = "fa-solid fa-user-check",
                        params = {
                            isServer = true,
                            event = "qb-bossmenu:server:HireEmployee",
                            args = v.sourceplayer
                        }
                    }
                end
            end
            HireMenu[#HireMenu + 1] = {
                header = "返回",
                icon = "fa-solid fa-angle-left",
                params = {
                    event = "qb-bossmenu:client:OpenMenu",
                }
            }
            exports['qb-menu']:openMenu(HireMenu)
        end)
    end)
end)

RegisterNetEvent('qb-bossmenu:client:SocietyMenu', function()
    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetAccount', function(cb)
        local SocietyMenu = {
            
            {
                title = "存入资金",
                icon = "fa-solid fa-money-bill-transfer",
                description = "将钱存入账户",
               
                    event = "qb-bossmenu:client:SocetyDeposit",
                    args = comma_value(cb)
              
            },
            {
                title = "取出资金",
                icon = "fa-solid fa-money-bill-transfer",
                description = "从账户取出资金",
                
                    event = "qb-bossmenu:client:SocetyWithDraw",
                    args = comma_value(cb)
               
            },
            
        }
        
        lib.registerContext({
            id = 'Society_Menu',
            title = "公款: $" .. comma_value(cb) .. " - " .. string.upper(PlayerJob.label),
            menu = 'boss_menu',
            options = SocietyMenu
        })
        lib.showContext('Society_Menu')
    end, PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:SocetyDeposit', function(money)
    local input = lib.inputDialog("存款 <> 可用余额: $" .. money, {'金额'})
    
    if input then
        
        TriggerServerEvent("qb-bossmenu:server:depositMoney", tonumber(input[1]))
    end
end)

RegisterNetEvent('qb-bossmenu:client:SocetyWithDraw', function(money)
    local input = lib.inputDialog("取款 <> 可用余额: $" .. money, {'金额'})
    
    if input then
        
        TriggerServerEvent("qb-bossmenu:server:withdrawMoney", tonumber(input[1]))
    end
end)