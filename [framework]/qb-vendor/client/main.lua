local QBCore = exports['qb-core']:GetCoreObject()
local currentvendor = nil

-------------------------------------------------------------------------------------------
-- Little Function
-------------------------------------------------------------------------------------------

local function ClearMenu()
	exports['qb-menu']:closeMenu()
end

local function closeMenuFull()
    currentvendor = nil
    ClearMenu()
end

RegisterNetEvent("qb-vendor:client:closemenu")
AddEventHandler("qb-vendor:client:closemenu", function()
    closeMenuFull()
end)

-------------------------------------------------------------------------------------------
-- Menu
-------------------------------------------------------------------------------------------

RegisterNetEvent("qb-vendor:client:vendorMenu", function()
    --print(currentvendor)
    QBCore.Functions.TriggerCallback('qb-vendor:server:vendorOwned', function(result)
        if result == nil then
            --print(currentvendor)
            local vendorMenuFirst = {
                {
                    header = Lang:t('menu.market'),
                    isMenuHeader = true
                },
            }
            vendorMenuFirst[#vendorMenuFirst+1] = {
                header = Lang:t('menu.buy'),
                icon = 'fa-solid fa-file-invoice-dollar',
                txt = Lang:t('menu.buy_sub').." : $" ..Config.Market[currentvendor].price,
                params = {
                    event = "qb-vendor:client:vendorAchat",
                    args = currentvendor
                }
            }
            vendorMenuFirst[#vendorMenuFirst+1] = {
                header = "⬅ "..Lang:t('menu.quit'),
                txt = "",
                params = {
                    event = "qb-vendor:client:closemenu",
                }
            }
            exports['qb-menu']:openMenu(vendorMenuFirst)
        else
            QBCore.Functions.TriggerCallback('qb-vendor:server:vendorOwner', function(result2)
                if result2 == nil then
                    local vendorMenuFirst = {
                        {
                            header = Lang:t('menu.market'),
                            isMenuHeader = true
                        },
                    }
                    vendorMenuFirst[#vendorMenuFirst+1] = {
                        header = Lang:t('menu.open_market'),
                        txt = Lang:t('menu.open_market_sub'),
                        icon = 'fa-solid fa-store',
                        params = {
                            isServer = true,
                            event = "qb-vendor:server:vendorGetShopItems",
                            args = currentvendor
                        }
                    }
                    vendorMenuFirst[#vendorMenuFirst+1] = {
                        header = Lang:t('menu.rob'),
                        txt = Lang:t('menu.rob_sub'),
                        icon = 'fa-solid fa-gun',
                        params = {
                            event = "qb-vendor:client:vendorRob",
                            args = currentvendor,
                        }
                    }
                    vendorMenuFirst[#vendorMenuFirst+1] = {
                        header = "⬅ "..Lang:t('menu.quit'),
                        txt = "",
                        params = {
                            event = "qb-vendor:client:closemenu",
                        }
                    }
                    exports['qb-menu']:openMenu(vendorMenuFirst)
                else
                    local vendorMenuFirst = {
                        {
                            header = Lang:t('menu.market'),
                            isMenuHeader = true
                        },
                    }
                    vendorMenuFirst[#vendorMenuFirst+1] = {
                        header = Lang:t('menu.open_market'),
                        txt = Lang:t('menu.open_market_sub'),
                        icon = 'fa-solid fa-store',
                        params = {
                            isServer = true,
                            event = "qb-vendor:server:vendorGetShopItems",
                            args = currentvendor
                        }
                    }
                    vendorMenuFirst[#vendorMenuFirst+1] = {
                        header = Lang:t('menu.refill'),
                        txt = Lang:t('menu.refill_sub'),
                        icon = 'fa-solid fa-boxes-packing',
                        params = {
                            event = "qb-vendor:client:vendorInvReFull",
                        }
                    }
                    vendorMenuFirst[#vendorMenuFirst+1] = {
                        header = Lang:t('menu.checkmoney'),
                        txt = Lang:t('menu.checkmoney_sub'),
                        icon = 'fa-solid fa-sack-dollar',
                        params = {
                            event = "qb-vendor:client:vendorCheckMoney",
                            args = data,
                        }
                    }
                    vendorMenuFirst[#vendorMenuFirst+1] = {
                        header = Lang:t('menu.manage'),
                        txt = Lang:t('menu.manage_sub'),
                        icon = 'fa-solid fa-sack-dollar',
                        params = {
                            event = "qb-vendor:client:vendorSettings",
                            args = v,
                        }
                    }
                    vendorMenuFirst[#vendorMenuFirst+1] = {
                        header = "⬅ "..Lang:t('menu.quit'),
                        txt = "",
                        params = {
                            event = "qb-vendor:client:closemenu",
                        }
                    }
                    exports['qb-menu']:openMenu(vendorMenuFirst)
                end
            end, currentvendor)
        end
    end, currentvendor)
end)

RegisterNetEvent("qb-vendor:client:vendorInv", function(store_inventory, data)
    QBCore.Functions.TriggerCallback('qb-vendor:server:vendorS', function(result)
        local vendorMenuItem = {
            {
                header = "| "..Lang:t('menu.market').." : "..result[1].displayname.." |",
                txt = Lang:t('menu.refill_in'),
                isMenuHeader = true
            },
        }
        for k, v in pairs(store_inventory) do
            if store_inventory[k].stock > 0 then
            vendorMenuItem[#vendorMenuItem+1] = {
                header = QBCore.Shared.Items[store_inventory[k].items].label,
                txt = Lang:t('menu.instock')..": "..store_inventory[k].stock.." | "..Lang:t('menu.price')..": $"..store_inventory[k].price,
                params = {
                    event = "qb-vendor:client:vendorInvInput",
                    args = store_inventory[k],
                }
            }
            end
        end

        vendorMenuItem[#vendorMenuItem+1] = {
            header = "⬅ "..Lang:t('menu.return_m'),
            txt = "",
            params = {
                event = "qb-vendor:client:vendorMenu",
            }
        }
        exports['qb-menu']:openMenu(vendorMenuItem)
    end, currentvendor)
end)

RegisterNetEvent("qb-vendor:client:vendorInvReFull", function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        QBCore.Functions.TriggerCallback('qb-vendor:server:vendorS', function(result)
            if PlayerData.items == nil then 
                local vendorMenuNoInvItem = {
                    {
                        header = "| "..Lang:t('menu.market').." : "..result[1].displayname.." |",
                        txt = Lang:t('menu.market_sub'),
                        isMenuHeader = true
                    },
                }
                vendorMenuNoInvItem[#vendorMenuNoInvItem+1] = {
                    header = Lang:t('menu.no_item'),
                    txt = Lang:t('menu.no_item_sub'),
                    isMenuHeader = true
                }
                vendorMenuNoInvItem[#vendorMenuNoInvItem+1] = {
                    header = "⬅ "..Lang:t('menu.return_m'),
                    txt = "",
                    params = {
                        event = "qb-vendor:client:vendorMenu",
                    }
                }
                exports['qb-menu']:openMenu(vendorMenuNoInvItem)
            else
                local vendorMenuInvItem = {
                    {
                        header = "| "..Lang:t('menu.market').." : "..result[1].displayname.." |",
                        txt = Lang:t('menu.market_sub'),
                        isMenuHeader = true
                    },
                }
                for k, v in pairs(PlayerData.items) do
					--print(PlayerData.items[k].name.." "..PlayerData.items[k].amount)
                    if PlayerData.items[k].amount > 0 and PlayerData.items[k].type == "item" then
                    vendorMenuInvItem[#vendorMenuInvItem+1] = {
                        header = PlayerData.items[k].label,
                        txt = Lang:t('menu.in_inv').." : "..PlayerData.items[k].amount,
                        params = {
                            event = "qb-vendor:client:vendorInvReFillInput",
                            args = PlayerData.items[k],
                        }
                    }
                    end
                end

                vendorMenuInvItem[#vendorMenuInvItem+1] = {
                    header = "⬅ "..Lang:t('menu.return_m'),
                    txt = "",
                    params = {
                        event = "qb-vendor:client:vendorMenu",
                    }
                }
                exports['qb-menu']:openMenu(vendorMenuInvItem)
            end
        end, currentvendor)
    end)
end)

RegisterNetEvent("qb-vendor:client:vendorCheckMoney", function()
    --print(1)
    QBCore.Functions.TriggerCallback('qb-vendor:server:vendorGetMoney', function(checkmoney)
        QBCore.Functions.TriggerCallback('qb-vendor:server:vendorS', function(result)
            --print(checkmoney)
            local vendorMenuMoney = {
                {
                    header = "| "..Lang:t('menu.market').." : "..result[1].displayname.." |",
                    txt = Lang:t('menu.checkmoney_in'),
                    isMenuHeader = true
                },
            }
            vendorMenuMoney[#vendorMenuMoney+1] = {
                header = Lang:t('menu.currentmoney').." : $" ..checkmoney.money,
                txt = "",
                isMenuHeader = true
            }
            vendorMenuMoney[#vendorMenuMoney+1] = {
                header = Lang:t('menu.withdraw'),
                txt = Lang:t('menu.withdraw_sub'),
                params = {
                    event = "qb-vendor:client:vendorWithdraw",
                    args =  checkmoney,
                }
            }
            vendorMenuMoney[#vendorMenuMoney+1] = {
                header = "⬅ "..Lang:t('menu.return_m'),
                txt = "",
                params = {
                    event = "qb-vendor:client:vendorMenu",
                }
            }
            exports['qb-menu']:openMenu(vendorMenuMoney)
        end, currentvendor)
    end, currentvendor)
end)

RegisterNetEvent("qb-vendor:client:vendorAchat", function(currentvendor)
    price = Config.Market[currentvendor].price
    QBCore.Functions.TriggerCallback('qb-vendor:server:vendorS', function(result)
        local vendorAchat = {
            {
                header = "| "..Lang:t('menu.market').." : " ..result[1].displayname.." |",
                txt = Lang:t('menu.buy_price').." : $" ..Config.Market[currentvendor].price,
                isMenuHeader = true
            },
        }
        vendorAchat[#vendorAchat+1] = {
            header = Lang:t('menu.confirm_buy'),
            txt = Lang:t('menu.confirm_buy_sub'),
            params = {
                event = "qb-vendor:client:vendorBuyEtal",
                args = currentvendor, price,
            }
        }
        vendorAchat[#vendorAchat+1] = {
            header = "⬅ "..Lang:t('menu.quit'),
            txt = "",
            params = {
                event = "qb-vendor:client:closemenu",
            }
        }
        exports['qb-menu']:openMenu(vendorAchat)
    end, currentvendor)
end)

RegisterNetEvent("qb-vendor:client:vendorSettings", function()
    QBCore.Functions.TriggerCallback('qb-vendor:server:vendorS', function(result)
        local vendorSettings = {
            {
                header = "| "..Lang:t('menu.market').." : " ..result[1].displayname.." |",
                txt = Lang:t('menu.manage_in'),
                isMenuHeader = true
            },
        }
        vendorSettings[#vendorSettings+1] = {
            header = Lang:t('menu.manage_in_name'),
            txt = Lang:t('menu.manage_in_name_sub'),
            params = {
                event = "qb-vendor:client:vendorName",
                args = "",
            }
        }
        vendorSettings[#vendorSettings+1] = {
            header = Lang:t('menu.manage_in_give_market'),
            txt = Lang:t('menu.manage_in_give_market_sub'),
            params = {
                event = "qb-vendor:client:vendorGiveBusiness",
                args = "",
            }
        }
        vendorSettings[#vendorSettings+1] = {
            header = "⬅ "..Lang:t('menu.return_m'),
            txt = "",
            params = {
                event = "qb-vendor:client:vendorMenu",
            }
        }
        exports['qb-menu']:openMenu(vendorSettings)
    end, currentvendor)
end)

-------------------------------------------------------------------------------------------
-- Input
-------------------------------------------------------------------------------------------

RegisterNetEvent("qb-vendor:client:vendorGiveBusiness", function()
    local dialoggive = exports['qb-input']:ShowInput({
        header = Lang:t('input.give_market'),
        submitText = Lang:t('input.validate'),
        inputs = {
            {text = Lang:t('input.give_market_champ'), name = "tocid", type = "text", isRequired = true, }
        },
    })

    if dialoggive ~= nil then
            TriggerServerEvent('qb-vendor:server:vendorGiveBusiness', currentvendor, dialoggive.tocid)
    end
end)

RegisterNetEvent("qb-vendor:client:vendorName", function()

    local ChangeName = exports['qb-input']:ShowInput({
        header = Lang:t('input.name'),
        submitText = Lang:t('input.validate'),
        inputs = {
            {text = Lang:t('input.name_champ'), name = "name", type = "text", isRequired = true, }
        },
    })

    if ChangeName ~= nil then 
        TriggerServerEvent('qb-vendor:server:vendorName', currentvendor, ChangeName.name)
    end
end)

RegisterNetEvent("qb-vendor:client:vendorWithdraw", function(checkmoney)
    local money = checkmoney.money

    local Withdraw = exports['qb-input']:ShowInput({
        header = Lang:t('input.withdraw').." : (Max : $"..money..")",
        submitText = Lang:t('input.validate'),
        inputs = {
            {text = Lang:t('input.withdraw_champ'), name = "qt", type = "number", isRequired = true, }
        },
    })

    if Withdraw ~= nil then 
        TriggerServerEvent('qb-vendor:server:vendorWithdraw', currentvendor, Withdraw.qt)
    end
end)

RegisterNetEvent("qb-vendor:client:vendorInvReFillInput", function(data)
    local name = data
    local label = data.label
    local amount = data.amount
    local Refill = exports['qb-input']:ShowInput({
        header = Lang:t('input.refill').." : "..label,
        submitText = Lang:t('input.validate'),
        inputs = {
            {text = Lang:t('input.qt'), name = "qt", type = "number", isRequired = true, },
            {text = Lang:t('input.refill_price'), name = "qtp", type = "number", isRequired = true, },
        },
    })

    QBCore.Functions.GetPlayerData(function(PlayerData)
        for k, v in pairs(PlayerData.items) do
            if amount >= tonumber(Refill.qt) then
                TriggerServerEvent('qb-vendor:server:vendorInvReFill', currentvendor, name, Refill.qt, Refill.qtp)
            else
                QBCore.Functions.Notify(("Invalid Amount"), 'error')
            end
            return
        end
    end)
end)

RegisterNetEvent("qb-vendor:client:vendorInvInput", function(data)
    local name = data.items
    local prix = data.price
    local stock = data.stock

    local howmany = exports['qb-input']:ShowInput({
        header = Lang:t('input.howmany_buy').." ("..QBCore.Shared.Items[name].label.." | $"..prix.." | Stock: "..stock..")",
        submitText = Lang:t('input.validate'),
        inputs = {
            {text = Lang:t('input.qt'), name = "qt", type = "number", isRequired = true, }
        },
    })
    if stock >= tonumber(howmany.qt) then
        TriggerServerEvent('qb-vendor:server:vendorPurchaseItem', currentvendor, name, howmany.qt)
    else
        QBCore.Functions.Notify(("Invalid Amount"), 'error')
    end
end)

-------------------------------------------------------------------------------------------
-- Event
-------------------------------------------------------------------------------------------

RegisterNetEvent("qb-vendor:client:vendorBuyEtal")
AddEventHandler("qb-vendor:client:vendorBuyEtal", function()
    --print(currentvendor)
    --print(price)
    TriggerServerEvent('qb-vendor:server:vendorBuyEtal', currentvendor, price)
end)

RegisterNetEvent("Stores:ReturnStoreItems")
AddEventHandler("Stores:ReturnStoreItems", function(data, data2)
    store_inventory = data
    Wait(100)
    TriggerEvent('qb-vendor:client:vendorInv', store_inventory, data2)
end)

-------------------------------------------------------------------------------------------
-- NPC
-------------------------------------------------------------------------------------------

function SET_PED_RELATIONSHIP_GROUP_HASH ( iVar0, iParam0 )
    return Citizen.InvokeNative( 0xC80A74AC829DDD92, iVar0, _GET_DEFAULT_RELATIONSHIP_GROUP_HASH( iParam0 ) )
end

function _GET_DEFAULT_RELATIONSHIP_GROUP_HASH ( iParam0 )
    return Citizen.InvokeNative( 0x3CC4A718C258BDD0 , iParam0 );
end

function modelrequest( model )
    Citizen.CreateThread(function()
        RequestModel( model )
    end)
end

function RandomPed ()
    return Config.Model[math.random(1, #Config.Model)]
end

local peds = {}
Citizen.CreateThread(function()
    for z, x in pairs(Config.Market) do
        peds[z] = _CreatePed(Config.Market[z].npc, Config.Market[z].heading)
        --print(peds)
    end
end)

function _CreatePed(coords, heading)
    local Ped = RandomPed()
    while not HasModelLoaded( GetHashKey(Ped) ) do
        Wait(500)
        modelrequest( GetHashKey(Ped) )
    end

    local npc = CreatePed(GetHashKey(Ped), coords, heading, false, false, 0, 0)
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    ClearPedTasks(npc)
    RemoveAllPedWeapons(npc)
    SET_PED_RELATIONSHIP_GROUP_HASH(npc, GetHashKey(Ped))
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(Ped))
    SetBlockingOfNonTemporaryEvents(npc,true)
    ClearPedTasksImmediately(npc)
    FreezeEntityPosition(npc, false)
    Wait(1000)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    return npc
end

-------------------------------------------------------------------------------------------
-- ROBBERY
-------------------------------------------------------------------------------------------

RegisterNetEvent("qb-vendor:client:vendorRob", function()
    local me = PlayerPedId()
    local isArmed = Citizen.InvokeNative(0xCB690F680A3EA971, me, 4)  --isPedArmed
    if isArmed then
        QBCore.Functions.TriggerCallback('qb-vendor:server:vendorS', function(result)
            if result[1].robbery == 0 then
                for i, x in pairs(peds) do
                    if HasEntityClearLosToEntityInFront(me, peds[i], 19) and not IsPedDeadOrDying(peds[i]) and GetDistanceBetweenCoords(GetEntityCoords(me), GetEntityCoords(peds[i]), true) <= 4.0 then
                        --print("Ok")
                        local pedcoord = GetEntityCoords(peds[i])
                        local pedheading = GetEntityHeading(peds[i])
                        local randomNumber = math.random(1,10)
                        --print(randomNumber)
                        Wait(100)
                        if randomNumber <= Config.ChanceFail then
                            GiveWeaponToPed_2(peds[i], 0x5B78B8DD, 90, true, true, GetWeapontypeGroup(0x5B78B8DD), true, 0.5, 1.0, 0, true, 0, 0)
                            SetCurrentPedWeapon(peds[i], 0x5B78B8DD, true)
                            Wait(100)
                            SetEntityInvincible(peds[i], false)
                            FreezeEntityPosition(peds[i], false)
                            SetEntityCanBeDamagedByRelationshipGroup(peds[i], true, `PLAYER`)
                            SetBlockingOfNonTemporaryEvents(peds[i],false)
                            TaskCombatPed(peds[i], PlayerPedId(), 0, 16)
                            Wait(100)
                            QBCore.Functions.Notify(Lang:t('rob.fail'), 'error')
                            Wait(20000)
                            DeletePed(peds[i])
                            Wait(10000)
                            newpeds = _CreatePed(pedcoord, pedheading)
                            table.insert(peds, newpeds)
                        else
                            RequestAnimDict("script_proc@robberies@homestead@lonnies_shack@deception")
                            while not HasAnimDictLoaded("script_proc@robberies@homestead@lonnies_shack@deception") do
                                Citizen.Wait(100)
                            end
                            TaskPlayAnim(peds[i], "script_proc@robberies@homestead@lonnies_shack@deception", "hands_up_loop", 2.0, -2.0, -1, 67109393, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)

                            QBCore.Functions.Progressbar("robbery", Lang:t('rob.good'), Config.RobTime, false, true, {
                                disableMovement = true,
                                disableCarMovement = false,
                                disableMouse = false,
                                disableCombat = true,
                                }, {}, {}, {}, function() -- Done
                            end)
                            Wait(Config.RobTime)
                            ClearPedTasks(peds[i])
                            TriggerServerEvent("qb-vendor:server:vendorRob", currentvendor)
                        end
                    end
                end
            else
                QBCore.Functions.Notify(Lang:t('rob.already'), 'error')
            end
        end, currentvendor)
    else
        QBCore.Functions.Notify(Lang:t('rob.need_gun'), 'error')
    end
end)

-------------------------------------------------------------------------------------------
-- Blips
-------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    for z, x in pairs(Config.Market) do
        local blip = N_0x554d9d53f696d002(1664425300, Config.Market[z].coords)
        SetBlipSprite(blip, Config.MarketShop, 1)
        SetBlipScale(blip, 0.025)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, Lang:t('other.blips'))
    end  
end)

-------------------------------------------------------------------------------------------
-- Prompt
-------------------------------------------------------------------------------------------

CreateThread(function()
    for k, v in pairs(Config.Market) do
        exports['qb-core']:createPrompt(Config.Market[k], Config.Market[k].coords, 0xF3830D8E, Lang:t('other.prompt'), {
            type = 'client',
            event = 'qb-vendor:client:vendorMenuPrompt'
        })
    end
end)

RegisterNetEvent('qb-vendor:client:vendorMenuPrompt', function()
    for k, v in pairs(Config.Market) do
        local PutOutDist = #(GetEntityCoords(PlayerPedId()) - Config.Market[k].coords)
        if PutOutDist <= 4 then
            if not IsPedInAnyVehicle(PlayerPedId()) then
                currentvendor = k
                TriggerEvent('qb-vendor:client:vendorMenu')
            end
        end
    end
end)

-------------------------------------------------------------------------------------------
-- Debug
-------------------------------------------------------------------------------------------
--[[
RegisterNetEvent("qb-vendor:server:vendorDbInv")
AddEventHandler("qb-vendor:server:vendorDbInv", function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        for k, v in pairs(PlayerData.items) do 
            if PlayerData.items[k] ~= nil and PlayerData.items[k].type == "item" then 
                print(PlayerData.items[k].name.." - "..PlayerData.items[k].amount)
            end
        end
    end)
end)

RegisterCommand('debug_inv', function()
    TriggerEvent("qb-vendor:server:vendorDbInv")
end)

RegisterCommand('debug_input', function()
    TriggerEvent("qb-vendor:client:vendorName")
end)
]]--
