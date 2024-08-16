local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('vk-test:client:display-onscreen-keyboard',function(source)
    TriggerEvent("vorpinputs:getInputs","buttonName","placeHolderName",function(data)
        print(QBCore.Debug(data))
    end)
end)
