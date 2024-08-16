qb-core/client/functions.lua

function QBCore.Functions.Notify(text, textype, length, system)
    local ttype = textype ~= nil and textype or "info"
    local length = length ~= nil and length or 7000
    local color = color ~= nil and color or "#ffffff"
    local system = system ~= nil and system or 'Notifications'
    if ttype == 'primary' then ttype = "info" end
    exports['Ultra-Notify']:Alert(ttype, text, length, ttype)
end

