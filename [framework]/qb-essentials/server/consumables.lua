local QBCore = exports['qb-core']:GetCoreObject()

-- Drink

QBCore.Functions.CreateUseableItem("water", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("coffee", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkCoffee", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("napolunganyi", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkWhiskey", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("jiekedanni", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkWhiskey", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("baiweipijiu", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkWhiskey", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("yishabeilaputaojiu", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkWhiskey", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("putaojiu", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:DrinkWhiskey", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("niunai", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

-- EAT

QBCore.Functions.CreateUseableItem("sandwich", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("bread", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("chocolate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("stew", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)






QBCore.Functions.CreateUseableItem("juwuba", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)


QBCore.Functions.CreateUseableItem("daxianaiyoumogutang", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)
--

QBCore.Functions.CreateUseableItem("niupa", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)


--

QBCore.Functions.CreateUseableItem("tudouniupa", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tudouni", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("hulobodunrou", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("yanmeizhou", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("niunaiyanmaizhou", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("luroudasan", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("shucaidun", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("moxigeroujuan", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("daluandun", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("tuerqikaorou", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("jiroukuai", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("huilingdun", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("huangyoujianlongxia", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("xiangkaoeyupai", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("lingmengmulicishi", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:EatStew", source, item.name)
    end
end)







QBCore.Functions.CreateUseableItem("kaoquanyang", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("kaozhuzhupai", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)
--

QBCore.Functions.CreateUseableItem("cooked_meat", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cooked_fish", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end
end)

-- OTHER

QBCore.Functions.CreateUseableItem("cigarette", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Smoke", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cigar", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Smoke", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("binoculars", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("binoculars:Toggle", source)
end)

QBCore.Functions.CreateUseableItem("dual", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb:Dual", source)
end)

-- player field bandage
QBCore.Functions.CreateUseableItem("fieldbandage", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('consumables:client:UseFieldBandage', source)
end)

-- remove item
RegisterNetEvent('consumables:server:removeitem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "remove")
end)




























QBCore.Functions.CreateUseableItem("yixiangbaiweipijiu", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('consumables:client:yixiangbaiweipijiu', source)
end)

QBCore.Functions.CreateUseableItem("yixiangyishabeilaputaojiu", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('consumables:client:yixiangyishabeilaputaojiu', source)
end)


QBCore.Functions.CreateUseableItem("yixiangjiekedanni", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('consumables:client:yixiangjiekedanni', source)
end)

QBCore.Functions.CreateUseableItem("yixiangnapolunganyi", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('consumables:client:yixiangnapolunganyi', source)
end)