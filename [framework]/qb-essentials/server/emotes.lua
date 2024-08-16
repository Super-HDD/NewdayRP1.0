local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('emotemenu', Lang:t('commands.emoteMenu'), {}, false, function(source)
    local src = source
    TriggerClientEvent('emotes:client:EmoteMenu', src)
end)

QBCore.Commands.Add('em', Lang:t('commands.emoteMenu'), {}, false, function(source)
    local src = source
    TriggerClientEvent('emotes:client:EmoteMenu', src)
end)

CreateThread(function()
    for k, v in pairs(Config.Emotes.Actions) do
        QBCore.Commands.Add(k, v.desc, {}, false, function(source)
            local src = source
            TriggerClientEvent('emotes:client:doemote', src, v.anim)
        end)        
    end
    for k, v in pairs(Config.Emotes.Greeting) do
        QBCore.Commands.Add(k, v.desc, {}, false, function(source)
            local src = source
            TriggerClientEvent('emotes:client:doemote', src, v.anim)
        end)        
    end
    for k, v in pairs(Config.Emotes.Reactions) do
        QBCore.Commands.Add(k, v.desc, {}, false, function(source)
            local src = source
            TriggerClientEvent('emotes:client:doemote', src, v.anim)
        end)        
    end
    for k, v in pairs(Config.Emotes.Taunting) do
        QBCore.Commands.Add(k, v.desc, {}, false, function(source)
            local src = source
            TriggerClientEvent('emotes:client:doemote', src, v.anim)
        end)        
    end
    for k, v in pairs(Config.Emotes.Dancing) do
        QBCore.Commands.Add(k, v.desc, {}, false, function(source)
            local src = source
            TriggerClientEvent('emotes:client:dodictemote', src, v.dict, v.anim, v.duration)
        end)        
    end
end)