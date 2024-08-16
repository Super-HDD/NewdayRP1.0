local QBCore = exports['qb-core']:GetCoreObject()
local CURRENT_TRAIN = nil
local train = nil
local trainspawned = false
local trainrunning = false



RegisterNetEvent('qb-railroadjob:client:companyone', function(data)
    local railroadMenu = {{
        header = "| 铁路公司菜单 |",
        isMenuHeader = true
    }}
    for k, v in pairs(Config.CentralTrains) do
        railroadMenu[#railroadMenu + 1] = {
            header = "🚂 | 中央铁路列车运营路线 " .. k,
            txt = v.label,
            params = {
                event = 'qb-railroadjob:client:spawntrain',
                isServer = false,
                args = {
                    trainHash = v.hash
                }
            }
        }
    end
    railroadMenu[#railroadMenu + 1] = {
        header = "关闭菜单",
        txt = '',
        params = {
            event = 'qb-menu:closeMenu'
        }
    }
    exports['qb-menu']:openMenu(railroadMenu)
end)

RegisterNetEvent('qb-railroadjob:client:companytwo', function(data)
    local railroadMenu = {{
        header = "| 铁路公司菜单 |",
        isMenuHeader = true
    }}
    for k, v in pairs(Config.SouthernTrains) do
        railroadMenu[#railroadMenu + 1] = {
            header = "🚂 | 东南部铁路列车运营路线 " .. k,
            txt = v.label,
            params = {
                event = 'qb-railroadjob:client:spawntrain',
                isServer = false,
                args = {
                    trainHash = v.hash
                }
            }
        }
    end
    railroadMenu[#railroadMenu + 1] = {
        header = "关闭菜单",
        txt = '',
        params = {
            event = 'qb-menu:closeMenu'
        }
    }
    exports['qb-menu']:openMenu(railroadMenu)
end)

RegisterNetEvent('qb-railroadjob:client:companythree', function(data)
    local railroadMenu = {{
        header = "| 铁路公司菜单 |",
        isMenuHeader = true
    }}
    for k, v in pairs(Config.OtherTrains) do
        railroadMenu[#railroadMenu + 1] = {
            header = "🚂 | " .. v.label,
            txt = "",
            params = {
                event = 'qb-railroadjob:client:spawntrain',
                isServer = false,
                args = {
                    trainHash = v.hash
                }
            }
        }
    end
    railroadMenu[#railroadMenu + 1] = {
        header = "关闭菜单",
        txt = '',
        params = {
            event = 'qb-menu:closeMenu'
        }
    }
    exports['qb-menu']:openMenu(railroadMenu)
end)

RegisterNetEvent('qb-railroadjob:client:remove', function(data)
    DeleteEntity(CURRENT_TRAIN)
    trainspawned = false
    trainrunning = false
end)

-- 铁路公司菜单
RegisterNetEvent('qb-railroadjob:client:menu', function(data)
    if not trainspawned then
        exports['qb-menu']:openMenu({
            {
                header = "| 铁路公司菜单 |",
                txt = "选择铁路公司",
                isMenuHeader = true,
            }, {
                header = "🚂 | 中央联合铁路",
                txt = "",
                params = {
                    event = 'qb-railroadjob:client:companyone',
                    isServer = false,
                }
            }, {
                header = "🚂 | 南部和东部铁路",
                txt = "",
                params = {
                    event = 'qb-railroadjob:client:companytwo',
                    isServer = false,
                }
            }, {
                header = "🚂 | 其他铁路",
                txt = "",
                params = {
                    event = 'qb-railroadjob:client:companythree',
                    isServer = false,
                }
            }, {
                header = "关闭菜单",
                txt = '',
                params = {
                    event = 'qb-menu:closeMenu',
                }
            },
        })
    else
        exports['qb-menu']:openMenu({
            {
                header = "| 铁路公司菜单 |",
                txt = "选择铁路公司",
                isMenuHeader = true,
            }, {
                header = "移除火车",
                txt = "",
                params = {
                    event = 'qb-railroadjob:client:remove',
                    isServer = false,
                }
            }, {
                header = "关闭菜单",
                txt = '',
                params = {
                    event = 'qb-menu:closeMenu',
                }
            },
        })
    end
end)

RegisterNetEvent('qb-railroadjob:client:spawntrain')
AddEventHandler('qb-railroadjob:client:spawntrain', function(data)
    if QBCore.Functions.GetPlayerData().job.name == 'railroad' then
        if not trainspawned then
            SetRandomTrains(false)
            --requestmodel--
            local trainWagons = N_0x635423d55ca84fc8(data.trainHash)
            for wagonIndex = 0, trainWagons - 1 do
                local trainWagonModel = N_0x8df5f6a19f99f0d5(data.trainHash, wagonIndex)
                while not HasModelLoaded(trainWagonModel) do
                    Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
                    Citizen.Wait(100)
                end
            end
            --spawn train--
            --local train = N_0xc239dbd9a57d2a71(data.trainHash, GetEntityCoords(PlayerPedId()), 0, 1, 1, 1)
            local train = Citizen.InvokeNative(0xc239dbd9a57d2a71, data.trainHash, vector3(-185.09, 596.99, 113.51), 0, 1, 1, 1)
            SetTrainSpeed(train, 0.0)
            local coords = GetEntityCoords(train)
            local trainV = vector3(coords.x, coords.y, coords.z)
            SetModelAsNoLongerNeeded(train)
            --blip--
            local blipname = "Train"
            local bliphash = -399496385
            local blip = Citizen.InvokeNative(0x23f74c2fda6e7c61, bliphash, train) -- blip for train
            SetBlipScale(blip, 1.5)
            CURRENT_TRAIN = train
            trainspawned = true
            trainrunning = true
        else
            QBCore.Functions.Notify('列车已经在运行中!!', 5000) 
        end
    else
        QBCore.Functions.Notify('您不是铁路公司的职员!', 5000) 
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if trainrunning then
            for i = 1, #Config.stops do
                local coords = GetEntityCoords(CURRENT_TRAIN)
                local trainV = vector3(coords.x, coords.y, coords.z)
                local distance = #(Config.stops[i].coords - trainV)
                --speed setup with ai driver--
                local stopspeed = 0.0
                local cruisespeed = 5.0
                local fullspeed = 15.0
                if distance < Config.stops[i].dst then
                    SetTrainCruiseSpeed(CURRENT_TRAIN, cruisespeed)
                    Wait(200)
                    if distance < Config.stops[i].dst2 then
                        SetTrainCruiseSpeed(CURRENT_TRAIN, stopspeed)
                        Config.printdebug('Train Stopped At: '..Config.stops[i].name)
                        Wait(Config.stops[i].time)
                        Config.printdebug('Train Leaving From: '..Config.stops[i].name)
                        SetTrainCruiseSpeed(CURRENT_TRAIN, cruisespeed)
                        Wait(10000)
                    end
                elseif distance > Config.stops[i].dst then
                    SetTrainCruiseSpeed(CURRENT_TRAIN, fullspeed)
                    Wait(25)
                end
            end
        end
    end
end)

if Config.debug then
    -- delete train
    RegisterCommand('deletetrain', function()
        if QBCore.Functions.GetPlayerData().job.name == 'railroad' then
            DeleteEntity(CURRENT_TRAIN)
            trainspawned = false
            trainrunning = false
        else
            QBCore.Functions.Notify('您不是铁路公司的职员!', 5000) 
        end
    end)
end

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('valentine-station', vector3(-162.8994, 638.43988, 114.03205), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('rhodes-station',  vector3(1241.63, -1317.9, 76.9 ), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('denis-station',  vector3(2759.21, -1416.27, 46.22), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('Vanhorn-station',  vector3(2891.21, 619.44, 57.72), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('Annesberg-station',  vector3(2951.42, 1282.26, 44.63), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('Baccus-station',  vector3(589.15, 1679.48, 187.67), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('wallas-station',  vector3(-1312.28, 393.41, 95.38), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('riggs-station',  vector3(-1102.95, -574.11, 82.26), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)

Citizen.CreateThread(function()
    exports['qb-core']:createPrompt('Flatneck-station', vector3(-329.91, -348.86, 88.03), QBCore.Shared.Keybinds['J'], '铁路公司菜单', {
        type = 'client',
        event = 'qb-railroadjob:client:menu',
        args = {}
    })  
end)


--[1] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(-162.5611, 638.82128, 114.03203 -1), ["Heading"] = 148.31669 }, -- valentine station
--[2] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(1241.63, -1317.9, 76.9 -1), ["Heading"] = 125.34 }, -- rhode station
--[3] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(2759.21, -1416.27, 46.22 -1), ["Heading"] = 125.34 }, --denis station
--[4] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(2891.21, 619.44, 57.72 -1), ["Heading"] = 57.77 }, --vanhorn station
--[5] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(2951.42, 1282.26, 44.63 -1), ["Heading"] = 161.22 }, --annesberg station
--[6] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(589.15, 1679.48, 187.67 -1), ["Heading"] = 344.76 }, --annesberg station
--[7] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(-1312.28, 393.41, 95.38 -1), ["Heading"] = 323.69 }, --wallas station
--[8] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(-1102.95, -574.11, 82.26 -1), ["Heading"] = 129.27 }, --riggs station
--[9] = { ["Model"] = "U_M_M_RhdTrainStationWorker_01", ["Pos"] = vector3(-329.91, -348.86, 88.03 -1), ["Heading"] = 17.07 }, --flatneck station