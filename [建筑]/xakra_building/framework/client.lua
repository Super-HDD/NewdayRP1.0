TriggerEvent("getCore", function(core)
    QBcore = core
end)

function NotifyLeft(title, subtitle, dict, icon , time, color)
    QBcore.NotifyLeft(title, subtitle, dict, icon , time, color)
end

function AddWebhook(title, webhook, description, color, name, logo, footerlogo, avatar)
    QBcore.AddWebhook(title, webhook, description, color, name, logo, footerlogo, avatar)
end

function openInventory(id, inv, capacity)
    TriggerEvent('qb_inventory:ReloadHideoutInventory', json.encode({itemList = inv, action = 'setSecondInventoryItems'}))
    TriggerEvent('qb_inventory:OpenHideoutInventory', _U('Chest').." "..id, id, capacity)
end