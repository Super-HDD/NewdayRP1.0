function Notification(options)
    options.animation = options.animation or {}
    options.docTitle = options.docTitle or {}

    local options = {
        type = options.type or "success",
        title = options.title or "",
        text = options.text or "Empty text",
        timeout = options.timeout or 5000,
        style = "default",
    }

    SendNUIMessage({options = options})
end

RegisterNetEvent("pn:Notification")
AddEventHandler("pn:Notification", function(options)
    Notification(options)
end)


function CustomNotification(options)
    options.animation = options.animation or {}
    options.docTitle = options.docTitle or {}

    local options = {
        type = options.type or "success",
        title = options.title or "",
        text = options.text or "Empty text",
        timeout = options.timeout or 5000,
        style="custom",
        class = options.class or "success",
        showicon = options.sicon or true,
        styletype = options.stype or 3,
    }

    SendNUIMessage({options = options})
end

RegisterNetEvent("pn:CustomNotification")
AddEventHandler("pn:CustomNotification", function(options)
    CustomNotification(options)
end)


RegisterCommand("notifytest", function(source, args, rawCommand)
    Notification({
        type="success",
        title="Notification test",
        text="Notification description",
        timeout=5000,
    })

    Notification({
        type="error",
        title="Notification test",
        text="Notification description",
        timeout=5000,
    })

    Notification({
        type="info",
        title="Notification test",
        text="Notification description",
        timeout=5000,
    })

    Notification({
        type="warning",
        title="Notification test",
        text="Notification description",
        timeout=5000,
    })

    CustomNotification({
        type = "success",
        title="Notification test",
        text="Notification description",
        timeout=5000,
        class = "pink1",
        showicon = true,
        stype = 3,
    })

    CustomNotification({
        type = "success",
        title="Notification test",
        text="Notification description",
        timeout=5000,
        class = "cordovan",
        showicon = true,
        stype = 2,
    })

    CustomNotification({
        type = "success",
        title="Notification test", 
        text="Notification description",
        timeout=5000,
        class = "earleblack",
        showicon = true,
        stype = 3, 
    })
 
    CustomNotification({
        type = "success",
        title="Notification test", 
        text="Notification description",
        timeout=5000,
        class = "champane",
        showicon = true,
        stype = 3,
    })


end, false)




