function Dehydratation()
    if Config.Framework == "qbr" then
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] - Config.GlobalSettings.dehydratateValue)
    elseif Config.Framework == "vorp" then
        TriggerEvent("vorpmetabolism:changeValue", "Thirst", -Config.GlobalSettings.dehydratateValue)
    elseif Config.Framework == "rsg" then
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] - Config.GlobalSettings.dehydratateValue)
    end
end

function Drink(value)
    if Config.Framework == "qbr" then
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", exports['qbr-core']:GetPlayerData().metadata["thirst"] + Config.GlobalSettings.drinkValue)
    elseif Config.Framework == "vorp" then
        TriggerEvent("vorpmetabolism:changeValue", "Thirst", Config.GlobalSettings.drinkValue)
    elseif Config.Framework == "rsg" then
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + Config.GlobalSettings.drinkValue)
    end
end

function getIdentifier()
    if Config.Framework == "qbr" then
        return exports['qbr-core']:GetPlayerData().citizenid
    elseif Config.Framework == "vorp" then
        return 0
    elseif Config.Framework == "rsg" then
        return exports['qb-core']:GetCoreObject().Functions.GetPlayerData().citizenid
    end
end

function notify(text, lenght)
    TriggerEvent('QBCore:Notify', text, "error")
end

RegisterNetEvent("gp-illness:client:curePlayer", function()
    CurePlayer()
end)

RegisterNetEvent("gp-illness:client:curePlayerFromIllness", function(illness)
    CurePlayerFromIllness(illness)
end)