local QBCore = exports['qb-core']:GetCoreObject()
local PlayerGang = QBCore.Functions.GetPlayerData().gang
local shownGangMenu = false
local DynamicMenuItems = {}
local gangmenu

Citizen.CreateThread(function()
     for gangmenu, v in pairs(Config.GangLocations) do
         exports['qb-core']:createPrompt(v.gangname, v.coords, QBCore.Shared.Keybinds['J'], 'Open ' .. v.name, {
             type = 'client',
             event = 'qb-gangmenu:client:OpenMenu',
             args = { },
         })
         if v.showblip == true then
             local GangBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
             SetBlipSprite(GangBlip, GetHashKey("blip_honor_bad"), true)
             SetBlipScale(GangBlip, 0.2)
			 Citizen.InvokeNative(0x9CB1A1623062F402, GangBlip, v.name)
         end
     end
end)

-- UTIL
local function CloseMenuFullGang()
    exports['qb-menu']:closeMenu()
    exports['qb-core']:HideText()
    shownGangMenu = false
end

local function comma_valueGang(amount)
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

--//Events
AddEventHandler('onResourceStart', function(resource)--if you restart the resource
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerGang = QBCore.Functions.GetPlayerData().gang
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerGang = QBCore.Functions.GetPlayerData().gang
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(InfoGang)
    PlayerGang = InfoGang
end)

RegisterNetEvent('qb-gangmenu:client:Stash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerGang.name, {
        maxweight = 4000000,
        slots = 100,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:client:Warbobe', function()
    TriggerEvent('qb-clothes:OpenOutfits')
end)

local function AddGangMenuItem(data, id)
    local menuID = id or (#DynamicMenuItems + 1)
    DynamicMenuItems[menuID] = deepcopy(data)
    return menuID
end

exports("AddGangMenuItem", AddGangMenuItem)

local function RemoveGangMenuItem(id)
    DynamicMenuItems[id] = nil
end

exports("RemoveGangMenuItem", RemoveGangMenuItem)

RegisterNetEvent('qb-gangmenu:client:OpenMenu', function()
    shownGangMenu = true
    local gangMenu = {
        {
            header = "帮派管理  - " .. string.upper(PlayerGang.label),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
        {
            header = "管理帮派成员",
            icon = "fa-solid fa-list",
            txt = "招募或解雇帮派成员",
            params = {
                event = "qb-gangmenu:client:ManageGang",
            }
        },
        {
            header = "招募帮派成员",
            icon = "fa-solid fa-hand-holding",
            txt = "雇用帮派成员",
            params = {
                event = "qb-gangmenu:client:HireMembers",
            }
        },
        {
            header = "存储访问",
            icon = "fa-solid fa-box-open",
            txt = "打开帮派藏匿处",
            params = {
                event = "qb-gangmenu:client:Stash",
            }
        },
        {
            header = "服装",
            txt = "换衣服",
            icon = "fa-solid fa-shirt",
            params = {
                event = "qb-gangmenu:client:Warbobe",
            }
        },
        {
            header = "金钱管理",
            icon = "fa-solid fa-sack-dollar",
            txt = "检查你的帮派 公款",
            params = {
                event = "qb-gangmenu:client:SocietyMenu",
            }
        },
    }

    for _, v in pairs(DynamicMenuItems) do
        gangMenu[#gangMenu + 1] = v
    end

    gangMenu[#gangMenu + 1] = {
        header = "Exit",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "qb-menu:closeMenu",
        }
    }

    exports['qb-menu']:openMenu(gangMenu)
end)

RegisterNetEvent('qb-gangmenu:client:ManageGang', function()
    local GangMembersMenu = {
        {
            header = "Manage Gang Members - " .. string.upper(PlayerGang.label),
            icon = "fa-solid fa-circle-info",
            isMenuHeader = true,
        },
    }
    QBCore.Functions.TriggerCallback('qb-gangmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            GangMembersMenu[#GangMembersMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                icon = "fa-solid fa-circle-user",
                params = {
                    event = "qb-gangmenu:lient:ManageMember",
                    args = {
                        player = v,
                        work = PlayerGang
                    }
                }
            }
        end
        GangMembersMenu[#GangMembersMenu + 1] = {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "qb-gangmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(GangMembersMenu)
    end, PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:lient:ManageMember', function(data)
    local MemberMenu = {
        {
            header = "Manage " .. data.player.name .. " - " .. string.upper(PlayerGang.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    for k, v in pairs(QBCore.Shared.Gangs[data.work.name].grades) do
        MemberMenu[#MemberMenu + 1] = {
            header = v.name,
            txt = "Grade: " .. k,
            params = {
                isServer = true,
                event = "qb-gangmenu:server:GradeUpdate",
                icon = "fa-solid fa-file-pen",
                args = {
                    cid = data.player.empSource,
                    grade = tonumber(k),
                    gradename = v.name
                }
            }
        }
    end
    MemberMenu[#MemberMenu + 1] = {
        header = "Fire",
        icon = "fa-solid fa-user-large-slash",
        params = {
            isServer = true,
            event = "qb-gangmenu:server:FireMember",
            args = data.player.empSource
        }
    }
    MemberMenu[#MemberMenu + 1] = {
        header = "Return",
        icon = "fa-solid fa-angle-left",
        params = {
            event = "qb-gangmenu:client:ManageGang",
        }
    }
    exports['qb-menu']:openMenu(MemberMenu)
end)

RegisterNetEvent('qb-gangmenu:client:HireMembers', function()
    local HireMembersMenu = {
        {
            header = "Hire Gang Members - " .. string.upper(PlayerGang.label),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    QBCore.Functions.TriggerCallback('qb-gangmenu:getplayers', function(players)
        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                HireMembersMenu[#HireMembersMenu + 1] = {
                    header = v.name,
                    txt = "Citizen ID: " .. v.citizenid .. " - ID: " .. v.sourceplayer,
                    icon = "fa-solid fa-user-check",
                    params = {
                        isServer = true,
                        event = "qb-gangmenu:server:HireMember",
                        args = v.sourceplayer
                    }
                }
            end
        end
        HireMembersMenu[#HireMembersMenu + 1] = {
            header = "Return",
            icon = "fa-solid fa-angle-left",
            params = {
                event = "qb-gangmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(HireMembersMenu)
    end)
end)

RegisterNetEvent('qb-gangmenu:client:SocietyMenu', function()
    QBCore.Functions.TriggerCallback('qb-gangmenu:server:GetAccount', function(cb)
        local SocietyMenu = {
            {
                header = "Balance: $" .. comma_valueGang(cb) .. " - " .. string.upper(PlayerGang.label),
                isMenuHeader = true,
                icon = "fa-solid fa-circle-info",
            },
            {
                header = "Deposit",
                icon = "fa-solid fa-money-bill-transfer",
                txt = "Deposit Money",
                params = {
                    event = "qb-gangmenu:client:SocietyDeposit",
                    args = comma_valueGang(cb)
                }
            },
            {
                header = "Withdraw",
                icon = "fa-solid fa-money-bill-transfer",
                txt = "Withdraw Money",
                params = {
                    event = "qb-gangmenu:client:SocietyWithdraw",
                    args = comma_valueGang(cb)
                }
            },
            {
                header = "Return",
                icon = "fa-solid fa-angle-left",
                params = {
                    event = "qb-gangmenu:client:OpenMenu",
                }
            },
        }
        exports['qb-menu']:openMenu(SocietyMenu)
    end, PlayerGang.name)
end)

RegisterNetEvent('qb-gangmenu:client:SocietyDeposit', function(saldoattuale)
    local deposit = exports['qb-input']:ShowInput({
        header = "Deposit Money <br> Available Balance: $" .. saldoattuale,
        submitText = "Confirm",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Amount'
            }
        }
    })
    if deposit then
        if not deposit.amount then return end
        TriggerServerEvent("qb-gangmenu:server:depositMoney", tonumber(deposit.amount))
    end
end)

RegisterNetEvent('qb-gangmenu:client:SocietyWithdraw', function(saldoattuale)
    local withdraw = exports['qb-input']:ShowInput({
        header = "Withdraw Money <br> Available Balance: $" .. saldoattuale,
        submitText = "Confirm",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = '$'
            }
        }
    })
    if withdraw then
        if not withdraw.amount then return end
        TriggerServerEvent("qb-gangmenu:server:withdrawMoney", tonumber(withdraw.amount))
    end
end)
