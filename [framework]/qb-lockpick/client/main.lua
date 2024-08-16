

RegisterNUICallback('callback', function(data, cb)
    openLockpick(false)
	lockpickCallback(data.success)
    cb('ok')
end)

RegisterNUICallback('exit', function()
    openLockpick(false)
end)

local openLockpick = function(shouldshow)
    SetNuiFocus(shouldshow, shouldshow)
    SendNUIMessage({
        action = "ui",
        toggle = shouldshow,
    })
    SetCursorLocation(0.5, 0.2)
    lockpicking = shouldshow
end

AddEventHandler('qb-lockpick:client:openLockpick', function(callback)
    local lockpickCallback = callback
    openLockpick(true)
end)