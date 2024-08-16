local QBCore = exports['qb-core']:GetCoreObject()

local wagonid = nil
local spawnedWagon = nil
local isSpawned = false
local wagonBlip = nil
local ownedCID = nil
local spawnedHorseID = 0
local wagonStorage = 0
local wagonWeight = 0

exports('CheckActiveWagon', function()
    return spawnedWagon
end)

RegisterNetEvent('gs-wagons:client:updatewagonid', function(wagonid, cid)
    ownedCID = cid
    print('Owned CID: ' .. ownedCID)
end)

Citizen.CreateThread(function()
    while true do
        Wait(100)
        if spawnedWagon ~= nil then
            RemoveBlip(wagonBlip)
            local wagonPos = GetEntityCoords(spawnedWagon)
            wagonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, wagonPos)
            SetBlipSprite(wagonBlip, 874255393)
            SetBlipScale(wagonBlip, 0.2)
            Citizen.InvokeNative(0x9CB1A1623062F402, wagonBlip, '拥有的马车')
        end
    end
end)

Citizen.CreateThread(function()
    local model = 'U_M_M_BwmStablehand_01'

    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end
    local coords = CONFIG.DealerPos
    local dealer = CreatePed(model, coords.x, coords.y, coords.z - 1.0, coords.w, false, false, 0, 0)
    Citizen.InvokeNative(0x283978A15512B2FE, dealer, true)
    SetEntityCanBeDamaged(dealer, false)
    SetEntityInvincible(dealer, true)
    FreezeEntityPosition(dealer, true)
    SetBlockingOfNonTemporaryEvents(dealer, true)
    Wait(1)
    
    exports['qb-target']:AddTargetEntity(dealer, {
        options = {
            {
                icon = '',
                label = '购买马车',
                targeticon = 'fas fa-eye',
                action = function()
                    WagonMenu()
                end
            },
            {
                icon = '',
                label = '查看马车',
                targeticon = 'fas fa-eye',
                action = function()
                    TriggerServerEvent('gs-wagons:server:ownedwagons')
                end
            },
            {
                icon = '',
                label = '存入马车',
                targeticon = 'fas fa-eye',
                action = function()
                    local wagonPos = GetEntityCoords(spawnedWagon)
                    local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, wagonPos.x, wagonPos.y, wagonPos.z, true)

                    if spawnedWagon ~= nil then
                        if distance <= 10 then
                            DeleteVehicle(spawnedWagon)
                            spawnedWagon = nil
                            QBCore.Functions.Notify('你存放了你的马车!', 'success', 3000)
                            RemoveBlip(wagonBlip)
                        else
                            QBCore.Functions.Notify('你的车太远了!', 'error', 3000)
                        end
                    else
                        QBCore.Functions.Notify('你没有任何马车出去!', 'error', 3000)
                    end
                end
            },
            {
                icon = '',
                label = '贸易马车',
                targeticon = 'fas fa-eye',
                action = function()
                    local info = exports['qb-input']:ShowInput({
                        header = '将你的马车交易给其他玩家',
                        inputs = {
                            {
                                text = '输入 ID#',
                                name = 'id',
                                type='text',
                                isRequired = true
                            }
                        }
                    })
                    print(QBCore.Debug(info))
                    TriggerServerEvent('gs-wagons:server:tradewagon', info.id, spawnedWagon)
                    DeleteVehicle(spawnedWagon)
                    spawnedWagon = nil
                end
            },
           -- {
           --     icon = '',
           --     label = '卖马车',
           --     targeticon = 'fas fa-eye',
           --     action = function()
            --        local wagonPos = GetEntityCoords(spawnedWagon)
           --         local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, wagonPos.x, wagonPos.y, wagonPos.z, true)

           --         if spawnedWagon ~= nil then
           --             if distance <= 10 then
           --                 TriggerServerEvent('gs-wagon:server:sellwagon', spawnedWagon)
           --                 DeleteVehicle(spawnedWagon)
            --                spawnedWagon = nil
            --            else
           --                 QBCore.Functions.Notify('你的车太远了!', 'error', 3000)
           --             end
           --         else
                        --QBCore.Functions.Notify('你没有任何马车出去!', 'error', 3000)
           --         end
           --     end
          --  }
        }
    })

    local dealerBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords.x, coords.y, coords.z)
    SetBlipSprite(dealerBlip, -1236452613)
    SetBlipScale(dealerBlip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, dealerBlip, '货运马车商人')
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, QBCore.Shared.Keybinds['L']) then
            local playerCoords = GetEntityCoords(PlayerPedId())
            local wagonPos = GetEntityCoords(spawnedWagon)
            local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, wagonPos.x, wagonPos.y, wagonPos.z, true)
            
            if not isSpawned or (isSpawned and distance > 50) then
                TriggerServerEvent('gs-wagons:server:spawnwagon')
            end

            if isSpawned and distance <= 50 then
                TaskGoToEntity(spawnedWagon, PlayerPedId(), 30000, 5)
            end
        end

        if IsControlJustPressed(0, QBCore.Shared.Keybinds['I']) then
            local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if currentVehicle == spawnedWagon then
                HorseInventory()
            end
        end
    end
end)

RegisterNetEvent('gs-wagons:client:spawnwagon', function(model, ownedCid, spawnedwagonid, storage, weight)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local citizenid = PlayerData.citizenid
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local offset = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 10.0, 0.0)
    RemoveBlip(wagonBlip)
    
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(1)
    end

    if spawnedWagon ~= nil then
        DeleteVehicle(spawnedWagon)
        spawnedWagon = nil
    end
    
    spawnedWagon = CreateVehicle(model, offset.x, offset.y, offset.z, playerCoords.z, true, false, false)
    isSpawned = true
    local wagonPos = GetEntityCoords(spawnedWagon)

    if citizenid == ownedCid then
        wagonBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, wagonPos)
        SetBlipSprite(wagonBlip, 874255393)
        SetBlipScale(wagonBlip, 0.2)
        Citizen.InvokeNative(0x9CB1A1623062F402, wagonBlip, '自有马车')
    end

    wagonStorage = storage
    wagonWeight = weight
    wagonid = spawnedwagonid
    spawnedHorseID = spawnedWagon

    TriggerServerEvent('gs-wagons:server:updatetempwagon', spawnedWagon)
end)

function WagonMenu()
    menuData = {}

    table.insert(menuData, {
        header = '马车商人',
        isMenuHeader = true
    })

    for _, wagons in ipairs(CONFIG.wagonid) do
        table.insert(menuData, {
            header = wagons.name,
            txt = '价格: $' .. wagons.price .. ' 存储空间: ' .. wagons.storage,
            params = {
                event = 'gs-wagons:client:wagoninfo',
                isServer = false,
                args = {
                    price = wagons.price,
                    model = wagons.model,
                    storage = wagons.storage,
                    weight = wagons.weight,
                    model = wagons.model
                }
            }
        })
    end

    table.insert(menuData, {
        header = '关闭菜单',
        txt = '',
        params = {
            event = 'qb-menu:closeMenu'
        }
    })

    exports['qb-menu']:openMenu(menuData)
end

RegisterNetEvent('gs-wagons:client:wagoninfo', function(data)
    local price = data.price
    local model = data.model
    local storage = data.storage
    local weight = data.weight

    local info = exports['qb-input']:ShowInput({
        header = '马车信息',
        inputs = {
            {
                text = '备注马车名字',
                name = 'name',
                type = 'text',
                isRequired = true
            }
        }
    })

    TriggerServerEvent('gs-wagons:server:buywagon', info.name, price, model, storage, weight)
end)

RegisterNetEvent('gs-wagons:client:ownedwagons', function(storeWagons)
    menuData = {}

    table.insert(menuData, {
        header = '自有马车',
        isMenuHeader = true
    })

    for i = 1, #storeWagons do
        local wagons = storeWagons[i]
        table.insert(menuData, {
            header = wagons.name,
            txt = '马车 ID: ' .. wagons.wagonid .. ' 存储空间: ' .. wagons.storage .. ' 状态: ' .. wagons.active,
            params = {
                event = 'gs-wagons:server:activatewagon',
                isServer = true,
                args = {
                    wagonid = wagons.wagonid
                }
            }
        })
    end

    table.insert(menuData, {
        header = '关闭菜单',
        txt = '',
        params = {
            event = 'qb-menu:closeMenu'
        }
    })

    exports['qb-menu']:openMenu(menuData)
end)

function HorseInventory()
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', '马车_' .. wagonid, {
        maxweight = wagonWeight,
        slots = wagonStorage,
    })
    TriggerEvent('inventory:client:SetCurrentStash', '马车_' .. wagonid)
end