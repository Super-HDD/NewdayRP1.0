local QBCore = exports['qb-core']:GetCoreObject()
local TEXTS = Config.Texts
local TEXTURES = Config.Textures
local maxDistance = 10  -- Distância máxima permitida entre o médico e o jogador alvo

local playerDamages = {}
local playersNearObject = {}

RegisterServerEvent('playerRevived')
AddEventHandler('playerRevived', function(targetId)
    playerDamages[targetId] = nil
end)

RegisterServerEvent('logDamage')
AddEventHandler('logDamage', function(targetId, damage, bodyPart)
    local message = "ID player: " .. targetId .. ", damage: " .. damage .. ", bodypart: " .. bodyPart
    if not playerDamages[targetId] then
        playerDamages[targetId] = {}
    end
    table.insert(playerDamages[targetId], message)
end)

RegisterServerEvent('myScript:nearObject')
AddEventHandler('myScript:nearObject', function()
    local source = source
    playersNearObject[source] = true
end)

RegisterCommand('checkbones', function(source, args)
    local targetId = tonumber(args[1])
    if playersNearObject[source] and targetId then
        TriggerEvent('checkBones', source, targetId)
        playersNearObject[source] = nil
    else
        TriggerClientEvent("Notification:left_doctor", source, TEXTS.Warning, "您需要提供玩家ID并靠近X光机器才能完成.", TEXTURES.doc[1], TEXTURES.doc[2], 5000)
        
    end
end)



RegisterServerEvent('checkBones')
AddEventHandler('checkBones', function(source, targetId)
    local player = QBCore.Functions.GetPlayer(source)
    local is_medic=false;
    for i,v in pairs(player.PlayerData.job) do
        print(v)
        if v=='medic' then
            is_medic=true
            break
        end
    end
    if is_medic then
        local sourcePed = GetPlayerPed(source)
        local targetPed = GetPlayerPed(targetId)
        local sourceCoords = GetEntityCoords(sourcePed)
        local targetCoords = GetEntityCoords(targetPed)
        local distance = #(sourceCoords - targetCoords)
        if distance <= maxDistance then
            if playerDamages[targetId] then
                local message = ""
                for i, damage in ipairs(playerDamages[targetId]) do
                    local damageValue = tonumber(string.match(damage, "damage: (%d+)"))
                    if damageValue and damageValue > 50 then
                        message = message .. damage .. "\n"
                    end
                end
                print(message)
                if message ~= "" then
                    --TriggerClientEvent("bone:Tip", source, message, 5000)
                    TriggerClientEvent("Notification:left_doctor", source, TEXTS.Warning, message, TEXTURES.doc[1], TEXTURES.doc[2], 5000)
                else
                    TriggerClientEvent("Notification:left_doctor", source, TEXTS.Warning, "找不到超过100的骨骼伤害.", TEXTURES.doc[1], TEXTURES.doc[2], 5000)
                end
                TriggerClientEvent('playCheckBonesAnim', source)
                TriggerClientEvent("myScript:emitLight", -1, source)
                Wait(2200)
                TriggerClientEvent("myScript:emitLight", -1, source)
                Wait(2200)
                TriggerClientEvent("myScript:emitLight", -1, source)
                Wait(2200)
                TriggerClientEvent("myScript:emitLight", -1, source)
                Wait(2200)
                TriggerClientEvent("myScript:emitLight", -1, source)
            else
                print('here')
                TriggerClientEvent("Notification:left_doctor", source, TEXTS.Warning, TEXTS.Warning2, TEXTURES.doc[1], TEXTURES.doc[2], 5000)
                TriggerClientEvent('playCheckBonesAnim', source)
            end
        else
            TriggerClientEvent("Notification:left_doctor", source, TEXTS.Warning, "您离玩家太远了.", TEXTURES.doc[1], TEXTURES.doc[2], 5000)
        end
    else
        TriggerClientEvent("Notification:left_doctor", source, TEXTS.Warning, TEXTS.Warning3, TEXTURES.doc[1], TEXTURES.doc[2], 5000)
    end
end)

-- -- Registro do item usável 'bandagem'
-- RegisterServerEvent("RegisterUsableItem:bone_bandage")
-- TriggerEvent("redemrp:registerUsableItem", "bone_bandage", function(source)
--     local _source = source
--     TriggerEvent("redemrp:getPlayerFromId", source, function(player)
--         if player.getInventoryItem("bone_bandage").count >= 1 then
--             player.removeInventoryItem("bone_bandage", 1)
--             TriggerClientEvent('bandage:playAnim', _source) -- Trigger o evento de animação
--             TriggerEvent('useMedicalKit', _source) -- Trigger o evento 'useMedicalKit'
--         else
--             TriggerClientEvent("redemrp_notification:start", _source, ' Estão faltando itens', 2)
--             TriggerClientEvent("redemrp_notification:start", _source, ' Precisa: 1 Bandagem', 5)
--         end    
--     end)
-- end)

RegisterServerEvent('RegisterUsableItem:bandage')
AddEventHandler('RegisterUsableItem:bandage',function (source)
    QBCore.Functions.CreateUseableItem('bone_bandage', function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.GetItemByName(item.name) then return end
        -- Trigger code here for what item should do
        local player=QBCore.Functions.GetPlayer(source);
        if player.getInventoryItem("bandage").count >= 1 then
            player.removeInventoryItem("bandage", 1)
            TriggerClientEvent('bandage:playAnim', source) -- Trigger o evento de animação
            TriggerEvent('useMedicalKit', source) -- Trigger o evento 'useMedicalKit'
        else
            TriggerClientEvent("redemrp_notification:start", source, ' Estão faltando itens', 2)
            TriggerClientEvent("redemrp_notification:start", source, ' Precisa: 1 Bandagem', 5)
        end 
    end)
end)


RegisterServerEvent('bone:server:useMedicalKit')  -------- limpar tabela quando usar
AddEventHandler('bone:server:useMedicalKit', function(playerId)
    local patient=QBCore.Functions.GetPlayer(playerId)
    TriggerClientEvent('bandage:playAnim', patient.PlayerData.source) 
    playerDamages[playerId] = nil
    print('使用治疗包 ' .. playerId)
end)

