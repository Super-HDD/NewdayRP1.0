local QBCore = exports['qb-core']:GetCoreObject()

-----------------------------------------------------------------------------------

-- use cleankit
QBCore.Functions.CreateUseableItem("cleankit", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('qb-weaponsmiteh:client:serviceweapon', src, 'cleankit', 1)
end)

-----------------------------------------------------------------------------------

local checkItem=function(Player,required_item,amount)
    if Config.Debug then
        --print('required item:'..required_item..'x'..amount..'player has '..Player.Functions.GetItemByName(required_item))
    end
    if Player.Functions.GetItemByName(required_item) and Player.Functions.GetItemByName(required_item).amount >= amount then
        return true
    else
        return false
    end
end
-- check player has items
QBCore.Functions.CreateCallback('qb-weaponsmiteh:server:checkitems', function(source, cb, craftitems)
    local src = source
    local hasItems = false

    --icheck[i]=j用来记录配方中第i项需求中的第j项可选物品符合配方要求
    --例如套索的需要的第二种物品可以是一星狼皮，二星狼皮或者三星狼皮（加设数组中也按该顺序排列），而玩家背包中的三星狼皮是足够的，那么icheck[2]=3
    local icheck = {} 
    
    local Player = QBCore.Functions.GetPlayer(src)

    for i=1,#craftitems do
        local v=craftitems[i]
        print(type(v.item))
        if type(v.item) == 'table' then
            hasItems=false
            for j=1,#v.item do
                if checkItem(Player,v.item[j],v.amount[j])  then
                    hasItems=true
                    icheck[i]=j
                    break
                end
            end
            if hasItems ==false then
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.you_dont_have_the_required_items'), 'error')
                cb(false,nil)
                return
            end
        else
            if checkItem(Player,v.item,v.amount) ==false then
                TriggerClientEvent('QBCore:Notify', src, Lang:t('error.you_dont_have_the_required_items'), 'error')
                cb(false,nil)
                return
            end
        end
    end

    if Config.Debug then print('enough') end


    cb(true,icheck)

end)



-----------------------------------------------------------------------------------

-- finish crafting
RegisterServerEvent('qb-weaponsmiteh:server:finishcrafting')
AddEventHandler('qb-weaponsmiteh:server:finishcrafting', function(craftitems, receive,icheck,prob)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    -- remove craftitems
    for i=1,#craftitems do
        local v=craftitems[i]
        if Config.Debug == true then
            print(v.item)
            print(v.amount)
        end
        if type(v.item) =='table' then
            Player.Functions.RemoveItem(v.item[icheck[i]], v.amount[icheck[i]])
        else
            Player.Functions.RemoveItem(v.item, v.amount)
        end
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.item], "remove")
    end
    -- add items
    if prob then
        local rnd=math.random(0,100)
        if rnd<=prob then
            Player.Functions.AddItem(receive, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[receive], "add")
            TriggerClientEvent('QBCore:Notify', src, Lang:t('success.crafting_finished'), 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.crafting_failed_due_to_unlucky'), 'error')
        end
    end

end)

-----------------------------------------------------------------------------------




