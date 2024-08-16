local QBCore = exports['qb-core']:GetCoreObject()
local pianoPlayed = false

RegisterNetEvent('qb-piano:PianoPlay', function(position, heading, animation)
    local pos = position
    local head = heading
    local anim = nil 
    if IsPedMale(PlayerPedId()) then 
        anim =  animation.Man
    else anim = animation.Woman end

    if not pianoPlayed then 
        pianoPlayed = true
        TaskStartScenarioAtPosition(PlayerPedId(), GetHashKey(anim), pos.x - 0.08, pos.y, pos.z + 0.03, head, 0, true, true, 0, true) 
    end      
end)

CreateThread(function()
    for k, v in pairs(Config.PianoLocation) do
        exports['qb-core']:createPrompt("qb-piano:Piano"..k, v.SitPosition, QBCore.Shared.Keybinds['J'], '弹钢琴', {
            type = 'client',
            event = 'qb-piano:PianoPlay',
            args = {v.SitPosition,v.SitHeading,v.Animation}
        })
        exports['qb-core']:createPrompt("qb-piano:PianoRemove"..k, v.SitPosition, QBCore.Shared.Keybinds['ENTER'], '起身', {
            type = 'client',
            event = 'qb-piano:PianoPause',
        })
    end
end)

RegisterNetEvent('qb-piano:PianoPause', function()
    pianoPlayed = false
    ClearPedTasks(PlayerPedId())
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        for k,v in pairs(Config.PianoLocation) do 
            exports['qb-core']:deletePrompt('qb-piano:Piano'..k)
            exports['qb-core']:deletePrompt('qb-piano:PianoRemove'..k)
        end
    end
end)
