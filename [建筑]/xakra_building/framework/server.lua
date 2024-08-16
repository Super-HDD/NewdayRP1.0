TriggerEvent("getCore", function(core)
    QBcore = core
end)

local qbInv = exports.qb_inventory:qb_inventoryApi()

function NotifyLeft(source, title, subtitle, dict, icon , time, color)
    QBcore.NotifyLeft(source, title, subtitle, dict, icon , time, color)
end

function GetCharacter(source)
    -- .job
    -- .identifier
    -- .charIdentifier
    return QBcore.getUser(source).getUsedCharacter
end

function RegisterUsableItem(item, cb)
    qbInv.RegisterUsableItem(item, function(data)
        return cb(data)
    end)
end

function getItemCount(source, item, metadata)
    return qbInv.getItemCount(source, item, metadata)
end

function canCarryItems(source, amount)
    return exports.qb_inventory:canCarryItems(source, amount)
end

function canCarryItem(source, item, amount, callback)
    return exports.qb_inventory:canCarryItem(source, item, amount, callback)
end

function subItem(source, item, amount)
    return qbInv.subItem(source, item, amount)
end

function addItem(source, item, amount, metadata)
    return qbInv.addItem(source, item, amount, metadata)
end

function openInventory(source, id, inv, capacity)
    TriggerClientEvent('qb_inventory:ReloadHideoutInventory', source, json.encode({itemList = inv, action = 'setSecondInventoryItems'}))
    TriggerClientEvent('qb_inventory:OpenHideoutInventory', source, _U('Chest').." "..id, id, capacity)
end

function CloseInv(source, invId)
    exports.qb_inventory:closeInventory(source, invId)
end

function AddWebhook(title, webhook, description, color, name, logo, footerlogo, avatar)
    QBcore.AddWebhook(title, webhook, description, color, name, logo, footerlogo, avatar)
end