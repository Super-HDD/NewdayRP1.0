-- [[ Exports ]] --
local function doemote(emote)
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, emote, 1, 1, 0, 0)
end exports('doemote', doemote)

local function dodictemote(dict, anim, duration)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
    Citizen.InvokeNative(0xEA47FE3719165B94, PlayerPedId(), dict, anim, 8.0, -8.0, duration, 1, 0, true, 0, false, 0, false)
end exports('dodictemote', dodictemote)

-- [[ Events ]] --
RegisterNetEvent("emotes:client:doemote")
AddEventHandler("emotes:client:doemote", function(data)
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, data, 1, 1, 0, 0)
end)

RegisterNetEvent("emotes:client:doemotemenu")
AddEventHandler("emotes:client:doemotemenu", function(data)
    Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 0, 0, data.emote, 1, 1, 0, 0)
end)

RegisterNetEvent("emotes:client:dodictemote")
AddEventHandler("emotes:client:dodictemote", function(data)
    local ped = PlayerPedId()
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(100)
    end
    Citizen.InvokeNative(0xEA47FE3719165B94, ped, data.dict, data.anim, 8.0, -8.0, data.duration, 1, 0, true, 0, false, 0, false)
end)

-- [[ Emote Menu ]] --

RegisterNetEvent('emotes:client:EmoteMenu', function()
    lib.registerContext({
        id = 'eemote_menu',
        title = Lang:t('emotes.title'),
        
        options = {
          
            {
                title = Lang:t('emotes.actions.mainMenu'),
               
                    event = 'emotes:client:actionemotes',
               
            }, {
                title = Lang:t('emotes.greeting.mainMenu'),
                
                    event = 'emotes:client:greetemotes'
                
            }, {
                title = Lang:t('emotes.reaction.mainMenu'),
               
                    event = 'emotes:client:reactionemotes'
               
            },{
                title = Lang:t('emotes.taunting.mainMenu'),
               
                    event = 'emotes:client:tauntemotes'
               
            }
    
          
    
          
          
          
        }
      })
      lib.showContext('eemote_menu')
end)

RegisterNetEvent('emotes:client:actionemotes', function()
    Citizen.Wait(500)
    local EmoteMenu = {}
    for k, v in pairs(Config.Emotes.Actions) do
        EmoteMenu[#EmoteMenu + 1] = {
            title = "/"..k,
            description = v.desc,
           
                event = 'emotes:client:doemotemenu',
                args = {
                    emote = v.anim,
               
            }
        }
    end
   
    lib.registerContext({
        id = 'Emotee_Menu',
        title = Lang:t('emotes.actions.secondMenu'),
        menu = 'eemote_menu',
        options = EmoteMenu
      })
      lib.showContext('Emotee_Menu')
end)

RegisterNetEvent('emotes:client:greetemotes', function()
    Citizen.Wait(500)
    local EmoteMenu = {}
    for k, v in pairs(Config.Emotes.Greeting) do
        EmoteMenu[#EmoteMenu + 1] = {
            title = "/"..k,
            description = v.desc,
            
                event = 'emotes:client:doemotemenu',
                args = {
                    emote = v.anim,
                }
           
        }
    end
    
    lib.registerContext({
        id = 'Emote_Menu',
        title = Lang:t('emotes.greeting.secondMenu'),
        menu = 'eemote_menu',
        options = EmoteMenu
      })
      lib.showContext('Emote_Menu')
end)

RegisterNetEvent('emotes:client:reactionemotes', function()
    Citizen.Wait(500)
    local EmoteMenu = {}
    for k, v in pairs(Config.Emotes.Reactions) do
        EmoteMenu[#EmoteMenu + 1] = {
            title = "/"..k,
            description = v.desc,
            
                event = 'emotes:client:doemotemenu',
                args = {
                    emote = v.anim,
                }
            
        }
    end
    
    lib.registerContext({
        id = 'second_Menu',
        title = Lang:t('emotes.reaction.secondMenu'),
        menu = 'eemote_menu',
        options = EmoteMenu
      })
      lib.showContext('second_Menu')
end)

RegisterNetEvent('emotes:client:tauntemotes', function()
    Citizen.Wait(500)
    local EmoteMenu = {}
    for k, v in pairs(Config.Emotes.Taunting) do
        EmoteMenu[#EmoteMenu + 1] = {
            title = "/"..k,
            description = v.desc,
           
                event = 'emotes:client:doemotemenu',
                args = {
                    emote = v.anim,
                }
            
        }
    end
    
    lib.registerContext({
        id = 'taunte_motes',
        title = Lang:t('emotes.taunting.secondMenu'),
        menu = 'eemote_menu',
        options = EmoteMenu
      })
      lib.showContext('taunte_motes')
end)

RegisterNetEvent('emotes:client:danceemotes', function()
    Citizen.Wait(500)
    local EmoteMenu = {}
    for k, v in pairs(Config.Emotes.Dancing) do
        EmoteMenu[#EmoteMenu + 1] = {
            title = "/"..k,
            description = v.desc,
           
                event = 'emotes:client:dodictemote',
                
                    dict = v.dict,
                    anim = v.anim,
                    duration = v.duration,
               
           
        }
    end
    
    lib.registerContext({
        id = 'dancing_motes',
        title = Lang:t('emotes.dancing.secondMenu'),
        menu = 'eemote_menu',
        options = EmoteMenu
      })
      lib.showContext('dancing_motes')
end)