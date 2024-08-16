local QBCore = exports['qb-core']:GetCoreObject()

local jailtimeMinsRemaining = 0
local inJail = false
local inJailZone = false
local jailTime = 0
local Zones = {}

-----------------------------------------------------------------------------------

-- prompts





Citizen.CreateThread(function()
   
        exports['qb-core']:createPrompt(vector3(2645.6772, -1159.4980, 30.9509), QBCore.Shared.Keybinds['J'], '访问 圣丹尼斯艾丁格酒厂办事处老板菜单', {
            type = 'client',
            event = 'rsg-bossmenu:client:OpenMenu',
            
        })
    
end)