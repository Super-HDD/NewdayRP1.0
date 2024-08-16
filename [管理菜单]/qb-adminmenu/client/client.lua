local QBCore = exports['qb-core']:GetCoreObject()
local banlength = nil
local developermode = false
local showCoords = false
local vehicleDevMode = false
local banreason = 'Unknown'
local kickreason = 'Unknown'
local deletereason = 'Unknown'
local menuLocation = 'topright' -- e.g. topright (default), topleft, bottomright, bottomleft

-- Main Menus
local menu1 = MenuV:CreateMenu(false, Lang:t("menu.admin_menu"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test1')
local menu2 = MenuV:CreateMenu(false, Lang:t("menu.admin_options"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test2')
local menu3 = MenuV:CreateMenu(false, Lang:t("menu.manage_server"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test3')
local menu4 = MenuV:CreateMenu(false, Lang:t("menu.online_players"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test4')
local menu7 = MenuV:CreateMenu(false, Lang:t("menu.developer_options"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test7')

--Sub Menus
local menu8 = MenuV:CreateMenu(false, Lang:t("menu.weather_conditions"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test8')
local menu9 = MenuV:CreateMenu(false, Lang:t("menu.ban"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test9')
local menu10 = MenuV:CreateMenu(false, Lang:t("menu.kick"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test10')
local menu11 = MenuV:CreateMenu(false, Lang:t("menu.permissions"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test11')
local menu12 = MenuV:CreateMenu(false, Lang:t("menu.deletecharacter"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test12')
local menu15 = MenuV:CreateMenu(false, Lang:t("menu.spawn_weapons"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test15')

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

RegisterNUICallback("DeleteCharacter", function(citizenId)
    if citizenId ~= nil then
        TriggerServerEvent("admin:server:DeleteCharacter", citizenId)
    end
end)

RegisterNetEvent('admin:client:openMenu', function()
    MenuV:OpenMenu(menu1)
end)

--[[
    Main menu buttons
--]]
-- Admin options
menu1:AddButton({
    icon = '😃',
    label = Lang:t("menu.admin_options"),
    value = menu2,
    description = Lang:t("desc.admin_options_desc")
})

--player management
local player_management = menu1:AddButton({
    icon = '🙍‍♂️',
    label = Lang:t("menu.player_management"),
    value = menu4,
    description = Lang:t("desc.player_management_desc")
})

--server management
menu1:AddButton({
    icon = '🎮',
    label = Lang:t("menu.server_management"),
    value = menu3,
    description = Lang:t("desc.server_management_desc")
})

--developer options
menu1:AddButton({
    icon = '🔧',
    label = Lang:t("menu.developer_options"),
    value = menu7,
    description = Lang:t("desc.developer_desc")
})

--[[
    Sub Menus for the above main menu's
--]]

-- Admin Options Menu Buttons
local menu2_admin_noclip = menu2:AddCheckbox({
    icon = '🎥',
    label = Lang:t("menu.noclip"),
    value = nil,
    description = Lang:t("desc.noclip_desc")
})

local menu2_admin_revive = menu2:AddButton({
    icon = '🏥',
    label = Lang:t("menu.revive"),
    value = 'revive',
    description = Lang:t("desc.revive_desc")
})

local menu2_admin_invisible = menu2:AddCheckbox({
    icon = '👻',
    label = Lang:t("menu.invisible"),
    value = nil,
    description = Lang:t("desc.invisible_desc")
})

local menu2_admin_god_mode = menu2:AddCheckbox({
    icon = '⚡',
    label = Lang:t("menu.god"),
    value = nil,
    description = Lang:t("desc.god_desc")
})

local menu2_admin_display_names = menu2:AddCheckbox({
    icon = '📋',
    label = Lang:t("menu.names"),
    value = nil,
    description = Lang:t("desc.names_desc")
})

--give weapons
menu2:AddButton({
    icon = '🎁',
    label = Lang:t("menu.spawn_weapons"),
    value = menu15,
    description = Lang:t("desc.spawn_weapons_desc")
})

-- Server Options Menu Buttons
local menu3_server_weather = menu3:AddButton({
    icon = '🌡️',
    label = Lang:t("menu.weather_options"),
    value = menu8,
    description = Lang:t("desc.weather_desc")
})

local menu3_server_time = menu3:AddSlider({
    icon = '⏲️',
    label = Lang:t("menu.server_time"),
    value = GetClockHours(),
    values = {{
        label = '00',
        value = '00',
        description = Lang:t("menu.time")
    }, {
        label = '01',
        value = '01',
        description = Lang:t("menu.time")
    }, {
        label = '02',
        value = '02',
        description = Lang:t("menu.time")
    }, {
        label = '03',
        value = '03',
        description = Lang:t("menu.time")
    }, {
        label = '04',
        value = '04',
        description = Lang:t("menu.time")
    }, {
        label = '05',
        value = '05',
        description = Lang:t("menu.time")
    }, {
        label = '06',
        value = '06',
        description = Lang:t("menu.time")
    }, {
        label = '07',
        value = '07',
        description = Lang:t("menu.time")
    }, {
        label = '08',
        value = '08',
        description = Lang:t("menu.time")
    }, {
        label = '09',
        value = '09',
        description = Lang:t("menu.time")
    }, {
        label = '10',
        value = '10',
        description = Lang:t("menu.time")
    }, {
        label = '11',
        value = '11',
        description = Lang:t("menu.time")
    }, {
        label = '12',
        value = '12',
        description = Lang:t("menu.time")
    }, {
        label = '13',
        value = '13',
        description = Lang:t("menu.time")
    }, {
        label = '14',
        value = '14',
        description = Lang:t("menu.time")
    }, {
        label = '15',
        value = '15',
        description = Lang:t("menu.time")
    }, {
        label = '16',
        value = '16',
        description = Lang:t("menu.time")
    }, {
        label = '17',
        value = '17',
        description = Lang:t("menu.time")
    }, {
        label = '18',
        value = '18',
        description = Lang:t("menu.time")
    }, {
        label = '19',
        value = '19',
        description = Lang:t("menu.time")
    }, {
        label = '20',
        value = '20',
        description = Lang:t("menu.time")
    }, {
        label = '21',
        value = '21',
        description = Lang:t("menu.time")
    }, {
        label = '22',
        value = '22',
        description = Lang:t("menu.time")
    }, {
        label = '23',
        value = '23',
        description = Lang:t("menu.time")
    }}
})

-- Developer Options Menu Buttons
local menu7_dev_copy_vec3 = menu7:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_vector3"),
    value = 'coords',
    description = Lang:t("desc.vector3_desc")
})

local menu7_dev_copy_vec4 = menu7:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_vector4"),
    value = 'coords',
    description = Lang:t("desc.vector4_desc")
})

local menu7_dev_copy_heading = menu7:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_heading"),
    value = 'heading',
    description = Lang:t("desc.copy_heading_desc")
})

local menu7_dev_noclip = menu7:AddCheckbox({
    icon = '🎥',
    label = Lang:t("menu.noclip"),
    value = nil,
    description = Lang:t("desc.noclip_desc")
})

--[[
    QB Core Admin Menu button functions below.
--]]

--[[
    General Functions
--]]
local function LocalInput(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
    while (UpdateOnscreenKeyboard() == 0) do
    DisableAllControlActions(0)
    Wait(0)
    end

    if (GetOnscreenKeyboardResult()) then
    local result = GetOnscreenKeyboardResult()
        return result
    end
end

local function LocalInputInt(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        local result = GetOnscreenKeyboardResult()
        return tonumber(result)
    end
end

--[[
    Admin Options functions
--]]
-- Toggle player name display
menu2_admin_display_names:On('change', function()
    TriggerEvent('admin:client:toggleNames')
end)

-- Toggle NoClip
menu2_admin_noclip:On('change', function(_, _, _)
    ToggleNoClipMode()
end)

-- Revive Self
menu2_admin_revive:On('select', function(_)
    TriggerEvent('qb-medic:clent:adminRevive')
    TriggerServerEvent('qb-logs:server:CreateLog', 'admin', 'Admin Options', 'red', GetPlayerName() .. ' > REVIVED SELF <')
    RevivePlayer()
end)

-- Invisible
local invisible = false
menu2_admin_invisible:On('change', function(_, _, _)
    if not invisible then
        invisible = true
        SetEntityVisible(PlayerPedId(), false, 0)
    else
        invisible = false
        SetEntityVisible(PlayerPedId(), true, 0)
    end
end)

-- Godmode
local godmode = false
menu2_admin_god_mode:On('change', function(_, _, _)
    godmode = not godmode

    if godmode then
        while godmode do
            Wait(0)
            SetPlayerInvincible(PlayerId(), true)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end)

-- Weapons list
for _,v in pairs(QBCore.Shared.Weapons) do
    menu15:AddButton({icon = '🎁',
        label = v.label ,
        value = v.value ,
        description = Lang:t("desc.spawn_weapons_desc"),
        select = function(_)
            TriggerServerEvent('admin:giveWeapon', v.name)
            QBCore.Functions.Notify(Lang:t("success.spawn_weapon"))
        end
    })
end


--[[
    Player Management Options functions
--]]
-- Player List
local function OpenPermsMenu(permsply)
    QBCore.Functions.TriggerCallback('admin:server:getrank', function(rank)
        if rank then
            local selectedgroup = 'Unknown'
            MenuV:OpenMenu(menu11)
            menu11:ClearItems()
            menu11:AddSlider({
                icon = '',
                label = 'Group',
                value = 'user',
                values = {{
                    label = 'User',
                    value = 'user',
                    description = 'Group'
                }, {
                    label = 'Admin',
                    value = 'admin',
                    description = 'Group'
                }, {
                    label = 'God',
                    value = 'god',
                    description = 'Group'
                }},
                change = function(_, newValue, _)
                    local vcal = newValue
                    if vcal == 1 then
                        selectedgroup = {}
                        selectedgroup[#selectedgroup+1] = {rank = "user", label = "User"}
                    elseif vcal == 2 then
                        selectedgroup = {}
                        selectedgroup[#selectedgroup+1] = {rank = "admin", label = "Admin"}
                    elseif vcal == 3 then
                        selectedgroup = {}
                        selectedgroup[#selectedgroup+1] = {rank = "god", label = "God"}
                    end
                end
            })

            menu11:AddButton({
                icon = '',
                label = Lang:t("info.confirm"),
                value = "giveperms",
                description = 'Give the permission group',
                select = function(_)
                    if selectedgroup ~= 'Unknown' then
                        TriggerServerEvent('admin:server:setPermissions', permsply.id, selectedgroup)
                        QBCore.Functions.Notify(Lang:t("success.changed_perm"), 'success')
                        selectedgroup = 'Unknown'
                    else
                        QBCore.Functions.Notify(Lang:t("error.changed_perm_failed"), 'error')
                    end
                end
            })
        else
            MenuV:CloseMenu(menu1)
        end
    end)
end

local function OpenKickMenu(kickplayer)
    MenuV:OpenMenu(menu10)
    menu10:ClearItems()
    menu10:AddButton({
        icon = '',
        label = Lang:t("info.reason"),
        value = "reason",
        description = Lang:t("desc.kick_reason"),
        select = function(_)
            kickreason = LocalInput(Lang:t("desc.kick_reason"), 255)
        end
    })

    menu10:AddButton({
        icon = '',
        label = Lang:t("info.confirm"),
        value = "kick",
        description = Lang:t("desc.confirm_kick"),
        select = function(_)
            if kickreason ~= 'Unknown' then
                TriggerServerEvent('admin:server:kick', kickplayer, kickreason)
                kickreason = 'Unknown'
            else
                QBCore.Functions.Notify(Lang:t("error.missing_reason"), 'error')
            end
        end
    })
end

local function OpenDeleteMenu(deleteplayer)
    MenuV:OpenMenu(menu12)
    menu12:ClearItems()
    menu12:AddButton({
        icon = '',
        label = Lang:t("info.reason"),
        value = "reason",
        description = Lang:t("desc.delete_reason"),
        select = function(_)
            deletereason = LocalInput(Lang:t("desc.delete_reason"), 255)
        end
    })

    menu12:AddButton({
        icon = '',
        label = Lang:t("info.confirm"),
        value = "deletecharacter",
        description = Lang:t("desc.confirm_delete"),
        select = function(_)
            if deletereason ~= 'Unknown' then
                TriggerServerEvent('admin:server:DeleteCharacter', deleteplayer.id, deletereason)
                deletereason = 'Unknown'
            else
                QBCore.Functions.Notify(Lang:t("error.missing_reason"), 'error')
            end
        end
    })
end

local function OpenBanMenu(banplayer)
    MenuV:OpenMenu(menu9)
    menu9:ClearItems()
    menu9:AddButton({
        icon = '',
        label = Lang:t("info.reason"),
        value = "reason",
        description = Lang:t("desc.ban_reason"),
        select = function(_)
            banreason = LocalInput(Lang:t("desc.ban_reason"), 255)
        end
    })

    menu9:AddSlider({
        icon = '⏲️',
        label = Lang:t("info.length"),
        value = '3600',
        values = {{
            label = Lang:t("time.1hour"),
            value = '3600',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.6hour"),
            value ='21600',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.12hour"),
            value = '43200',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.1day"),
            value = '86400',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.3day"),
            value = '259200',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.1week"),
            value = '604800',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.1month"),
            value = '2678400',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.3month"),
            value = '8035200',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.6month"),
            value = '16070400',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.1year"),
            value = '32140800',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.permenent"),
            value = '99999999999',
            description = Lang:t("time.ban_length")
        }, {
            label = Lang:t("time.self"),
            value = "self",
            description = Lang:t("time.ban_length")
        }},
        select = function(_, newValue, _)
            if newValue == "self" then
                banlength = LocalInputInt('Ban Length', 11)
            else
                banlength = newValue
            end
        end
    })

    menu9:AddButton({
        icon = '',
        label = Lang:t("info.confirm"),
        value = "ban",
        description = Lang:t("desc.confirm_ban"),
        select = function(_)
            if banreason ~= 'Unknown' and banlength ~= nil then
                TriggerServerEvent('admin:server:ban', banplayer, banlength, banreason)
                banreason = 'Unknown'
                banlength = nil
            else
                QBCore.Functions.Notify(Lang:t("error.invalid_reason_length_ban"), 'error')
            end
        end
    })
end

local function OpenPlayerMenus(player)
    local Players = MenuV:CreateMenu(false, player.cid .. Lang:t("info.options"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv') -- Players Sub Menu
    Players:ClearItems()
    MenuV:OpenMenu(Players)
    local elements = {
        [1] = {
            icon = '💀',
            label = Lang:t("menu.kill"),
            value = "kill",
            description = Lang:t("menu.kill").. " " .. player.cid
        },
        [2] = {
            icon = '🏥',
            label = Lang:t("menu.revive"),
            value = "revive",
            description = Lang:t("menu.revive") .. " " .. player.cid
        },
        [3] = {
            icon = '👀',
            label = Lang:t("menu.spectate"),
            value = "spectate",
            description = Lang:t("menu.spectate") .. " " .. player.cid
        },
        [4] = {
            icon = '➡️',
            label = Lang:t("info.goto"),
            value = "goto",
            description = Lang:t("info.goto") .. " " .. player.cid .. Lang:t("info.position")
        },
        [5] = {
            icon = '⬅️',
            label = Lang:t("menu.bring"),
            value = "bring",
            description = Lang:t("menu.bring") .. " " .. player.cid .. " " .. Lang:t("info.your_position")
        },
        [6] = {
            icon = '🎒',
            label = Lang:t("menu.open_inv"),
            value = "inventory",
            description = Lang:t("info.open") .. " " .. player.cid .. Lang:t("info.inventories")
        },
        [7] = {
            icon = '👕',
            label = Lang:t("menu.give_clothing_menu"),
            value = "cloth",
            description = Lang:t("desc.clothing_menu_desc") .. " " .. player.cid
        },
        [8] = {
            icon = '🥾',
            label = Lang:t("menu.kick"),
            value = "kick",
            description = Lang:t("menu.kick") .. " " .. player.cid .. " " .. Lang:t("info.reason")
        },
        [9] = {
            icon = '🚫',
            label = Lang:t("menu.ban"),
            value = "ban",
            description = Lang:t("menu.ban") .. " " .. player.cid .. " " .. Lang:t("info.reason")
        },
        [10] = {
            icon = '🎟️',
            label = Lang:t("menu.permissions"),
            value = "perms",
            description = Lang:t("info.give") .. " " .. player.cid .. " " .. Lang:t("menu.permissions")
        },
        [11] = {
            icon = '🎟️',
            label = Lang:t("menu.deletecharacter"),
            value = "deletecharacter",
            description = Lang:t("info.deletecharacter") .. " " .. player.cid
        }
    }
    for _, v in ipairs(elements) do
        Players:AddButton({
            icon = v.icon,
            label = ' ' .. v.label,
            value = v.value,
            description = v.description,
            select = function(btn)
                local values = btn.Value
                if values ~= "ban" and values ~= "kick" and values ~= "perms" and values ~= "deletecharacter" then
                    TriggerServerEvent('admin:server:'..values, player)
                elseif values == "ban" then
                    OpenBanMenu(player)
                elseif values == "kick" then
                    OpenKickMenu(player)
                elseif values == "perms" then
                    OpenPermsMenu(player)
                elseif values == "deletecharacter" then
                    OpenDeleteMenu(player)
                end
            end
        })
    end
end

player_management:On('select', function(_)
    menu4:ClearItems()
    QBCore.Functions.TriggerCallback('test:getplayers', function(players)
        for _, v in pairs(players) do
            menu4:AddButton({
                label = Lang:t("info.id") .. v["id"] .. ' | ' .. v["name"],
                value = v,
                description = Lang:t("info.player_name"),
                select = function(btn)
                    local select = btn.Value -- get all the values from v!
                    OpenPlayerMenus(select) -- only pass what i select nothing else
                end
            }) -- WORKS
        end
    end)
end)


--[[
    Server Options functions
--]]

-- Adjust weather on change
menu3_server_weather:On("select",function()
    menu8:ClearItems()
    local elements = {
        [1] = {
            icon = '🌨️',
            label = Lang:t("weather.blizzard"),
            value = "BLIZZARD",
            description = Lang:t("weather.blizzed_desc")
        },
        [2] = {
            icon = '☁',
            label = Lang:t('weather.clouds'),
            value = 'CLOUDS',
            description = Lang:t('weather.clouds_desc')
        },
        [3] = {
            icon = '☀',
            label = Lang:t('weather.drizzle'),
            value = 'DRIZZLE',
            description = Lang:t('weather.drizzle_desc')
        },
        [4] = {
            icon = '☀',
            label = Lang:t('weather.fog'),
            value = 'FOG',
            description = Lang:t('weather.fog_desc')
        },
        [5] = {
            icon = '☀',
            label = Lang:t('weather.ground_blizzard'),
            value = 'GROUNDBLIZZARD',
            description = Lang:t('weather.ground_blizzard_desc')
        },
        [6] = {
            icon = '🌁',
            label = Lang:t('weather.hail'),
            value = 'HAIL',
            description = Lang:t('weather.hail_desc')
        },
        [7] = {
            icon = '🌁',
            label = Lang:t('weather.high_pressure'),
            value = 'HIGHPRESSURE',
            description = Lang:t('weather.high_pressure_desc')
        },
        [8] = {
            icon = '🌁',
            label = Lang:t('weather.hurricane'),
            value = 'HURRICANE',
            description = Lang:t('weather.hurricane_desc')
        },
        [9] = {
            icon = '⛅',
            label = Lang:t('weather.overcast'),
            value = 'OVERCAST',
            description = Lang:t('weather.overcast_desc')
        },

        [10] = {
            icon = '⛅',
            label = Lang:t('weather.overcast_dark'),
            value = 'OVERCASTDARK',
            description = Lang:t('weather.overcast_dark_desc')
        },
        [11] = {
            icon = '☂️',
            label = Lang:t("weather.rain"),
            value = "RAIN",
            description = Lang:t("weather.rain_desc")
        },
        [12] = {
            icon = '☂️',
            label = Lang:t("weather.sandstorm"),
            value = "SANDSTORM",
            description = Lang:t("weather.sandstorm_desc")
        },
        [13] = {
            icon = '☂️',
            label = Lang:t("weather.shower"),
            value = "SHOWER",
            description = Lang:t("weather.shower_desc")
        },
        [14] = {
            icon = '☂️',
            label = Lang:t("weather.sleet"),
            value = "SLEET",
            description = Lang:t("weather.sleet_desc")
        },
        [15] = {
            icon = '❄️',
            label = Lang:t("weather.snow"),
            value = "SNOW",
            description = Lang:t("weather.snow_desc")
        },
        [16] = {
            icon = '❄️',
            label = Lang:t("weather.light_snow"),
            value = "SNOWLIGHT",
            description = Lang:t("weather.light_snow_desc")
        },
        [17] = {
            icon = '🌤',
            label = Lang:t('weather.sunny'),
            value = 'SUNNY',
            description = Lang:t('weather.sunny_desc')
        },
        [18] = {
            icon = '⛈️',
            label = Lang:t("weather.thunder"),
            value = "THUNDER",
            description = Lang:t("weather.thunder_desc")
        },
        [19] = {
            icon = '⛈️',
            label = Lang:t("weather.thunder_storm"),
            value = "THUNDERSTORM",
            description = Lang:t("weather.thunder_storm_desc")
        },
        [20] = {
            icon = '❄️',
            label = Lang:t("weather.whiteout"),
            value = "WHITEOUT",
            description = Lang:t("weather.whiteout_desc")
        }
    }
    for _, v in ipairs(elements) do
        menu8:AddButton({icon = v.icon,label = v.label,value = v,description = v.description,select = function(btn)
            local selection = btn.Value
            TriggerServerEvent("admin:server:SetWeather", selection.value)
            QBCore.Functions.Notify(Lang:t("weather.weather_changed", {value = selection.label}))
        end})
    end
end)

-- Adjust time on change
menu3_server_time:On("select", function(_, value)
    TriggerServerEvent("admin:server:SetTime", value, value)
    QBCore.Functions.Notify(Lang:t("time.changed", {time = value}))
end)


local function CopyToClipboard(dataType)
    local ped = PlayerPedId()
    if dataType == 'coords2' then
        local coords = GetEntityCoords(ped)
        local x = QBCore.Shared.Round(coords.x, 2)
        local y = QBCore.Shared.Round(coords.y, 2)
        SendNUIMessage({
            string = string.format('vector2(%s, %s)', x, y)
        })
        QBCore.Functions.Notify(Lang:t("success.coords_copied"), "success")
    elseif dataType == 'coords3' then
        local coords = GetEntityCoords(ped)
        local x = QBCore.Shared.Round(coords.x, 2)
        local y = QBCore.Shared.Round(coords.y, 2)
        local z = QBCore.Shared.Round(coords.z, 2)
        SendNUIMessage({
            string = string.format('vector3(%s, %s, %s)', x, y, z)
        })
        QBCore.Functions.Notify(Lang:t("success.coords_copied"), "success")
    elseif dataType == 'coords4' then
        local coords = GetEntityCoords(ped)
        local x = QBCore.Shared.Round(coords.x, 2)
        local y = QBCore.Shared.Round(coords.y, 2)
        local z = QBCore.Shared.Round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = QBCore.Shared.Round(heading, 2)
        SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s)', x, y, z, h)
        })
        QBCore.Functions.Notify(Lang:t("success.coords_copied"), "success")
    elseif dataType == 'heading' then
        local heading = GetEntityHeading(ped)
        local h = QBCore.Shared.Round(heading, 2)
        SendNUIMessage({
            string = h
        })
        QBCore.Functions.Notify(Lang:t("success.heading_copied"), "success")
    elseif dataType == 'freeaimEntity' then
        local entity = GetFreeAimEntity()

        if entity then
            local entityHash = GetEntityModel(entity)
            local entityName = Entities[entityHash] or "Unknown"
            local entityCoords = GetEntityCoords(entity)
            local entityHeading = GetEntityHeading(entity)
            local entityRotation = GetEntityRotation(entity)
            local x = QBCore.Shared.Round(entityCoords.x, 2)
            local y = QBCore.Shared.Round(entityCoords.y, 2)
            local z = QBCore.Shared.Round(entityCoords.z, 2)
            local rotX = QBCore.Shared.Round(entityRotation.x, 2)
            local rotY = QBCore.Shared.Round(entityRotation.y, 2)
            local rotZ = QBCore.Shared.Round(entityRotation.z, 2)
            local h = QBCore.Shared.Round(entityHeading, 2)
            SendNUIMessage({
                string = string.format('Model Name:\t%s\nModel Hash:\t%s\n\nHeading:\t%s\nCoords:\t\tvector3(%s, %s, %s)\nRotation:\tvector3(%s, %s, %s)', entityName, entityHash, h, x, y, z, rotX, rotY, rotZ)
            })
            QBCore.Functions.Notify(Lang:t("success.entity_copy"), "success")
        else
            QBCore.Functions.Notify(Lang:t("error.failed_entity_copy"), "error")
        end
    end
end

RegisterNetEvent('admin:client:OpenClothingMenu')
AddEventHandler('admin:client:OpenClothingMenu', function(pid)
    TriggerServerEvent("qb-clothes:LoadClothes", 2)
end)

RegisterNUICallback("OpenClothingMenu" , function(data, cb)
    TriggerEvent("admin:client:OpenClothingMenu")
end)

RevivePlayer = function()
  local ped = PlayerPedId()
  local pos = GetEntityCoords(ped)
  NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(ped), true, false)
  SetEntityInvincible(ped, false)
  SetEntityMaxHealth(ped, 600)
  SetEntityHealth(ped, 600)
  ClearPedBloodDamage(ped)
  TriggerServerEvent('hud:server:RelieveStress', 100)
  TriggerEvent('qb-medic:clent:adminRevive')
  --QBCore.Functions.Notify(Lang:t('info.health'), 'primary')
end

HealPlayer = function()
  local ped = PlayerPedId()
  SetEntityInvincible(ped, false)
  SetEntityMaxHealth(ped, 600)
  SetEntityHealth(ped, 600)
  ClearPedBloodDamage(ped)
  TriggerServerEvent('hud:server:RelieveStress', 100)
end

RegisterNetEvent('admin:client:revivePlayer', function()
  RevivePlayer()
end)

RegisterNetEvent('admin:client:healPlayer', function()
  HealPlayer()
end)

RegisterNetEvent('admin:client:copyToClipboard', function(dataType)
    CopyToClipboard(dataType)
end)

local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

local function ToggleShowCoordinates()
    local x = 0.4
    local y = 0.025
    showCoords = not showCoords
    CreateThread(function()
        while showCoords do
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            local c = {}
            c.x = QBCore.Shared.Round(coords.x, 2)
            c.y = QBCore.Shared.Round(coords.y, 2)
            c.z = QBCore.Shared.Round(coords.z, 2)
            heading = QBCore.Shared.Round(heading, 2)
            Wait(0)
            Draw2DText(string.format('~w~'..Lang:t("info.ped_coords") .. '~b~ vector4(~w~%s~b~, ~w~%s~b~, ~w~%s~b~, ~w~%s~b~)', c.x, c.y, c.z, heading), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
        end
    end)
end

local function ToggleVehicleDeveloperMode()
    local x = 0.4
    local y = 0.888
    vehicleDevMode = not vehicleDevMode
    CreateThread(function()
        while vehicleDevMode do
            local ped = PlayerPedId()
            Wait(0)
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local netID = VehToNet(vehicle)
                local hash = GetEntityModel(vehicle)
                local modelName = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                local eHealth = GetVehicleEngineHealth(vehicle)
                local bHealth = GetVehicleBodyHealth(vehicle)
                Draw2DText(Lang:t("info.vehicle_dev_data"), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
                Draw2DText(string.format(Lang:t("info.ent_id") .. '~b~%s~s~ | ' .. Lang:t("info.net_id") .. '~b~%s~s~', vehicle, netID), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.025)
                Draw2DText(string.format(Lang:t("info.model") .. '~b~%s~s~ | ' .. Lang:t("info.hash") .. '~b~%s~s~', modelName, hash), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.050)
                Draw2DText(string.format(Lang:t("info.eng_health") .. '~b~%s~s~ | ' .. Lang:t("info.body_health") .. '~b~%s~s~', QBCore.Shared.Round(eHealth, 2), QBCore.Shared.Round(bHealth, 2)), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.075)
            end
        end
    end)
end

RegisterNetEvent('admin:client:ToggleCoords', function()
    ToggleShowCoordinates()
end)

menu7_dev_copy_vec3:On("select", function()
    CopyToClipboard('coords3')
end)

menu7_dev_copy_vec4:On("select", function()
    CopyToClipboard('coords4')
end)

menu7_dev_copy_heading:On("select", function()
    CopyToClipboard('heading')
end)

menu7_dev_noclip:On('change', function(_, _, _)
    ToggleNoClipMode()
end)
