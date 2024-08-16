local QBCore = exports['qb-core']:GetCoreObject()

-- foxhound
QBCore.Functions.CreateUseableItem("foxhound", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callfoxhound", source, item.name)
end)

-- sheperd
QBCore.Functions.CreateUseableItem("sheperd", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callsheperd", source, item.name)
end)

-- coonhound
QBCore.Functions.CreateUseableItem("coonhound", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callcoonhound", source, item.name)
end)

-- catahoulacur
QBCore.Functions.CreateUseableItem("catahoulacur", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callcatahoulacur", source, item.name)
end)

-- bayretriever
QBCore.Functions.CreateUseableItem("bayretriever", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callbayretriever", source, item.name)
end)

-- collie
QBCore.Functions.CreateUseableItem("collie", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callcollie", source, item.name)
end)

-- hound
QBCore.Functions.CreateUseableItem("hound", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callhound", source, item.name)
end)

-- husky
QBCore.Functions.CreateUseableItem("husky", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callhusky", source, item.name)
end)

-- lab
QBCore.Functions.CreateUseableItem("lab", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:calllab", source, item.name)
end)

-- poodle
QBCore.Functions.CreateUseableItem("poodle", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callpoodle", source, item.name)
end)

-- street
QBCore.Functions.CreateUseableItem("street", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-pets:client:callstreet", source, item.name)
end)