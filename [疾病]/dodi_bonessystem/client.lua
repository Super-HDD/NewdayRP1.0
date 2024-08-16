local lastHealth = nil
local playerWasDead = false
local walkHealthDict = 'arthur_healthy'
local walkHealthAnim = 'default'

local TEXTS = Config.Texts
local TEXTURES = Config.Textures

local damageThreshold = 100  -- Valor de dano necessário para quebrar ossos
local is_badly_injured = false
local deathTimerStarted= false
-- local deathSecondsRemaining
local heal = false


local boneMapping = {
    -- [21030] = "HEAD",
    -- [53675] = "LARM",
    -- [34606] = "LHAND",
    -- [6884] = "RLEG",
    -- [55120] = "LLEG",
    -- [14284] = "NECK",
    -- [14413] = "SPINE",
    -- [30226] = "UPPER_BODY",
    -- [56200] = "LOWER_BODY",
    -- [22798] = "RHAND",
    -- [54187] = "RARM",
    -- [33646] = "RFOOT",
    -- [45454] = "LFOOT",
    [27981] = 'HEAD',
    [57278] = 'HEAD',
    [54890] = 'HEAD',
    [21030] = 'HEAD',
    -- NECK
    [24015] = 'NECK',
    [52596] = 'NECK',
    [32630] = 'NECK',
	[32631] = 'NECK',
	[32632] = 'NECK',
    [14283] = 'NECK',
	[14284] = 'NECK',
	[14285] = 'NECK',
    -- SPINE
    [14410] = 'SPINE',
    [14411] = 'SPINE',
	[14412] = 'SPINE',
	[14413] = 'SPINE',
	[14414] = 'SPINE',
    --UPPER_BODY
    [30226] = 'UPPER_BODY',
    -- LOWER_BODY
    [56200] = 'LOWER_BODY',
    -- LARM
    [43700] = 'Left Arm',  -- LARM
    [24238] = 'Left Arm',
    [55540] = 'Left Arm',
    [53562] = 'Left Arm',
    [53675] = 'Left Arm',
    -- LHAND
    [34606] = 'Left Hand',
    -- LFINGER
    [41403] = 'Left Finger',
    [41404] = 'Left Finger',
    [41405] = 'Left Finger',
    [41323] = 'Left Finger',
    [41324] = 'Left Finger',
    [41325] = 'Left Finger',
    [41326] = 'Left Finger',
    [41307] = 'Left Finger',
    [41308] = 'Left Finger',
    [41309] = 'Left Finger',
    [41310] = 'Left Finger',
    [41355] = 'Left Finger',
    [41356] = 'Left Finger',
    [41357] = 'Left Finger',
    [41358] = 'Left Finger',
    [41339] = 'Left Finger',
    [41340] = 'Left Finger',
    [41341] = 'Left Finger',
    [41342] = 'Left Finger',
    [35940] = 'Left Finger',
	[43154] = 'Left Finger',
	[60440] = 'Left Finger',
	[35924] = 'Left Finger',
	[35908] = 'Left Finger',
	[35892] = 'Left Finger',
	[35876] = 'Left Finger',
	[55214] = 'Left Finger',
	[55198] = 'Left Finger',
	[55246] = 'Left Finger',
	[55230] = 'Left Finger',
    -- LLEG
    [40091] = 'Left Leg',
    [52390] = 'Left Leg',
	[65480] = 'Left Leg',
	[21174] = 'Left Leg',
	[49844] = 'Left Leg',
	[38229] = 'Left Leg',
	[51618] = 'Left Leg',
	[17816] = 'Left Leg',
    [21124] = 'Left Leg',
	[12785] = 'Left Leg',
	[881] = 'Left Leg',
	[65034] = 'Left Leg',
	[62433] = 'Left Leg',
	[8936] = 'Left Leg',
	[2474] = 'Left Leg',
	[8980] = 'Left Leg',
    [55253] = 'Left Leg',
	[15681] = 'Left Leg',
    [12865] = 'Left Leg',
    [3003] = 'Left Leg',
    [65478] = 'Left Leg',
    [55120] = 'Left Leg',
    -- LFOOT
    [45454] = 'Left Foot',
    -- RARM
    [54187] = 'Right Arm',
    [46065] = 'Right Arm',
    [46260] = 'Right Arm',
    [65198] = 'Right Arm',
    [31186] = 'Right Arm',
    -- RHAND
    [22798] = 'Right Hand',
    -- RFINGER
    [16827] = 'Right Finger',
	[16828] = 'Right Finger',
	[16829] = 'Right Finger',
	[16747] = 'Right Finger',
	[16748] = 'Right Finger',
	[16749] = 'Right Finger',
	[16750] = 'Right Finger',
	[16731] = 'Right Finger',
	[16732] = 'Right Finger',
	[16733] = 'Right Finger',
	[16734] = 'Right Finger',
	[16779] = 'Right Finger',
	[16780] = 'Right Finger',
	[16781] = 'Right Finger',
	[16782] = 'Right Finger',
	[16763] = 'Right Finger',
	[16764] = 'Right Finger',
	[16765] = 'Right Finger',
	[16766] = 'Right Finger',
    [11364] = 'Right Finger',
	[41618] = 'Right Finger',
	[14992] = 'Right Finger',
	[11348] = 'Right Finger',
	[11332] = 'Right Finger',
	[11316] = 'Right Finger',
	[11300] = 'Right Finger',
	[61341] = 'Right Finger',
	[61325] = 'Right Finger',
	[61373] = 'Right Finger',
	[61357] = 'Right Finger',
	[36407] = 'Right Finger',
    -- RLEG
    [64298] = 'Right Leg',
	[27814] = 'Right Leg',
	[65384] = 'Right Leg',
	[19638] = 'Right Leg',
	[6170] = 'Right Leg',
	[17720] = 'Right Leg',
    [22660] = 'Right Leg',
	[10571] = 'Right Leg',
	[64874] = 'Right Leg',
	[30131] = 'Right Leg',
	[46712] = 'Right Leg',
	[53296] = 'Right Leg',
	[14866] = 'Right Leg',
    [31046] = 'Right Leg',
	[11991] = 'Right Leg',
    [10651] = 'Right Leg',
    [5217] = 'Right Leg',
    [6884] = 'Right Leg',
    -- RFOOT
    [33646] = 'Right Foot',
    -- Adicione mais mapeamentos conforme necessário
}

-- function useMedicalKit()   ------ limpar tabela de danos
--     local playerServerId = GetPlayerServerId(PlayerId())
--     TriggerServerEvent('useMedicalKit', playerServerId)
-- end

-- Drawtext for Countdown
local DrawTxt = function(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local string = CreateVarString(10, "LITERAL_STRING", str)

    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)

    if enableShadow then
        SetTextDropshadow(1, 0, 0, 0, 255)
    end

    DisplayText(string, x, y)
end

local deathTimer = function()
  
end

local function SetLightIntensityForObject(ob, b)
    Citizen.InvokeNative(0xF49574E2332A8F06, ob, b)
end

local function GetObjectLightIntensity(ob)
    return Citizen.InvokeNative(0x3397CD4E0353DFBA, ob)
end

local function SetLightsColorForEntity(ob, r, g, b)
    Citizen.InvokeNative(0x6EC2A67962296F49, ob, r, g, b)
end

local lightObject = nil
local shouldBlink = false

RegisterNetEvent("myScript:emitLight")
AddEventHandler("myScript:emitLight", function()
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local object = GetClosestObjectOfType(pos, 10.0, GetHashKey('xray_starter'), false, false, false)

    if object ~= 0 then
        print("Object found!")

        -- Obtenha a posição do objeto
        local objectPos = GetEntityCoords(object)

        -- Adicione um offset para mover a luz para a posição desejada
        local lightPos = vector3(objectPos.x - 0.8, objectPos.y - 0.2, objectPos.z)

        Citizen.CreateThread(function()
            while true do
                -- Desenhe a luz
                DrawLightWithRange(lightPos.x, lightPos.y, lightPos.z, 0, 255, 0, 10.0, 100.0)

                -- Pare de desenhar a luz após 10 segundos
                Citizen.Wait(10000)
                break
            end
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- controla a frequência das verificações
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        local object = GetClosestObjectOfType(pos, 5.0, GetHashKey('xray_starter'), false, false, false)
        if object ~= 0 then
            TriggerServerEvent('myScript:nearObject')
        end
    end
end)


    
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = PlayerPedId()
        local health = GetEntityHealth(playerPed)

        -- If the player has been revived
        if playerWasDead and health > 0 then
            TriggerServerEvent('playerRevived', GetPlayerServerId(PlayerId()))
            Citizen.InvokeNative(0x923583741DC87BCE, playerPed, walkHealthDict)
            Citizen.InvokeNative(0xAA74EC0CB0AAEA2C, playerPed, walkHealthAnim)
            Citizen.InvokeNative(0xB4FD7446BAB2F394,"MP_Downed")
            playerWasDead = false
        end

        if health == 0 then
            playerWasDead = true
        elseif health > 0 and lastHealth and health < lastHealth then
            local damage = lastHealth - health
            local boneHit, boneIndex = GetPedLastDamageBone(playerPed)
            if boneHit then
                print('hit')
                local bodyPart = GetBodyPartFromBone(boneIndex)
                -- DeathTimer()
                --sendToNui(bodyPart)
                TriggerServerEvent('logDamage', GetPlayerServerId(PlayerId()), damage, bodyPart)
                if boneHit and damage >= damageThreshold then  -- Verifica se o dano atingiu o limite
                    Citizen.InvokeNative(0xFFD54D9FE71B966A, playerPed, 2, boneIndex, 0.0, 0.1, 0.0, 20.0, 3.0, -1.0, 1.0)
                    
                    if bodyPart == "Right Leg" then
                        TriggerEvent("bone:Tip", "Boken leg..", 3000)
                        print("Injured RLEG Walkstyle")
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_right_leg')
                        PlayPain(playerPed, 12, 1, true, true)
                        Citizen.InvokeNative(0x4102732DF6B4005F,"MP_Downed",0, true) --play
                        Citizen.InvokeNative(0xa4d3a1c008f250df, 13)
                        Wait(4000)
                        Citizen.InvokeNative(0x66B1CB778D911F49, playerPed, 0.0)
                        Citizen.InvokeNative(0xB4FD7446BAB2F394,"MP_Downed")
                        Wait(25000)
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_general')
                    elseif bodyPart == "Left Leg" then
                        TriggerEvent("bone:Tip", "Boken leg..", 3000)
                        print("Injured LLEG Walkstyle")
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_left_leg')
                        PlayPain(playerPed, 12, 1, true, true)
                        Citizen.InvokeNative(0x4102732DF6B4005F,"MP_Downed",0, true) --play
                        Citizen.InvokeNative(0xa4d3a1c008f250df, 13)
                        Wait(4000)
                        Citizen.InvokeNative(0x66B1CB778D911F49, playerPed, 0.0)
                        Citizen.InvokeNative(0xB4FD7446BAB2F394,"MP_Downed")
                        Wait(25000)
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_general')
                    elseif bodyPart == "Right Arm" then
                        TriggerEvent("bone:Tip", "Boken arm..", 3000)
                        print("Injured RARM Walkstyle")
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_right_arm')
                        PlayPain(playerPed, 12, 1, true, true)
                        Citizen.InvokeNative(0x4102732DF6B4005F,"MP_Downed",0, true) --play
                        Citizen.InvokeNative(0xa4d3a1c008f250df, 13)
                        Wait(4000)
                        Citizen.InvokeNative(0x66B1CB778D911F49, playerPed, 0.0)
                        Citizen.InvokeNative(0xB4FD7446BAB2F394,"MP_Downed")
                        Wait(25000)
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_general')
                    elseif bodyPart == "Left Arm" then
                        print("Injured LARM Walkstyle")
                        TriggerEvent("bone:Tip", "Boken arm..", 3000)
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_left_arm')
                        PlayPain(playerPed, 12, 1, true, true)
                        Citizen.InvokeNative(0x4102732DF6B4005F,"MP_Downed",0, true) --play
                        Citizen.InvokeNative(0xa4d3a1c008f250df, 13)
                        Wait(4000)
                        Citizen.InvokeNative(0x66B1CB778D911F49, playerPed, 0.0)
                        Citizen.InvokeNative(0xB4FD7446BAB2F394,"MP_Downed")
                        Wait(25000)
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_general')
                    else
                        print("Injured Walkstyle")
                        TriggerEvent("bone:Tip", "Look for a doctor!", 3000)
                        if deathTimerStarted == false then TriggerEvent("bone:DeathTimer") end
                        Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'injured_general')
                        PlayPain(playerPed, 12, 1, true, true)
                        Citizen.InvokeNative(0x4102732DF6B4005F,"MP_Downed",0, true) --play
                        Citizen.InvokeNative(0xa4d3a1c008f250df, 13)
                        Wait(4000)
                        Citizen.InvokeNative(0x66B1CB778D911F49, playerPed, 0.0)
                        Citizen.InvokeNative(0xB4FD7446BAB2F394,"MP_Downed")
                        -- Wait(5000)
                        -- Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
                        -- Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'normal')
                    end
                end
            end
        end

        lastHealth = health
    end
end)

function GetBodyPartFromBone(bone)
    return boneMapping[bone] or "Unknown bodypart"
end

  
  local ledger, pen -- Variáveis globais para guardar as referências aos objetos

  function playAnim(animDictMale, animDictFemale, animName, duration, isUpperBody)
      local playerPed = PlayerPedId()
      local isMale = IsPedMale(playerPed)
      local animDict = isMale and animDictMale or animDictFemale
  
      if not HasAnimDictLoaded(animDict) then
          RequestAnimDict(animDict)
  
          while not HasAnimDictLoaded(animDict) do
              Citizen.Wait(0)
          end
      end
  
      local flag = isUpperBody and 49 or 0
  
      TaskPlayAnim(playerPed, animDict, animName, 8.0, -8, duration, flag, 0, false, false, false)
      AnimpostfxPlay("DEADEYE")
      Wait(5000)
      AnimpostfxStop("DEADEYE")
  
      Citizen.SetTimeout(duration, function()
          ClearPedTasks(playerPed)
          if DoesEntityExist(ledger) then -- Verifique se o objeto existe antes de tentar deletá-lo
              DeleteObject(ledger)
          end
          if DoesEntityExist(pen) then -- Verifique se o objeto existe antes de tentar deletá-lo
              DeleteObject(pen)
          end
      end)
  end
  
  RegisterNetEvent('playCheckBonesAnim')
  AddEventHandler('playCheckBonesAnim', function()
      local ped = PlayerPedId()
      local male = IsPedMale(ped)
      ledger = CreateObject(GetHashKey('P_AMB_CLIPBOARD_01'), x, y, z, true, true, true)
      pen = CreateObject(GetHashKey('P_PEN01X'), x, y, z, true, true, true)
      local lefthand = GetEntityBoneIndexByName(ped, "SKEL_L_Hand")
      local righthand = GetEntityBoneIndexByName(ped, "SKEL_R_Hand")
  
      if male then
          AttachEntityToEntity(pen, ped, righthand, 0.105, 0.055, -0.13, -5.0, 0.0, 0.0, true, true, false, true, 1, true)
          AttachEntityToEntity(ledger, ped, lefthand, 0.17, 0.07, 0.08, 80.0, 160.0, 180.0, true, true, false, true, 1, true)
      else
          AttachEntityToEntity(pen, ped, righthand, 0.095, 0.045, -0.095, -5.0, 0.0, 0.0, true, true, false, true, 1, true)
          AttachEntityToEntity(ledger, ped, lefthand, 0.17, 0.07, 0.08, 70.0, 155.0, 185.0, true, true, false, true, 1, true)
      end
  
      playAnim("amb_work@world_human_write_notebook@male_a@idle_c", "amb_work@world_human_write_notebook@female_a@idle_c", "idle_h", 10000, false)
  end)
  
  

----------------------------Basic Notification----------------------------

RegisterNetEvent('Notification:left_doctor')
AddEventHandler('Notification:left_doctor', function(t1, t2, dict, txtr, timer)
    if Config.framework == "redemrp" then
        local _dict = tostring(dict)
        if not HasStreamedTextureDictLoaded(_dict) then
            RequestStreamedTextureDict(_dict, true) 
            while not HasStreamedTextureDictLoaded(_dict) do
                Citizen.Wait(5)
            end
        end
        if txtr ~= nil then
            exports.dodi_bonessystem.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
        else
            local txtr = "tick"
            exports.dodi_bonessystem.LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
        end
        SetStreamedTextureDictAsNoLongerNeeded(_dict)
    elseif Config.framework == "vorp" then
        TriggerEvent("vorp:TipBottom", t1.."\n"..t2, timer) 
    elseif Config.framework == "qbr" then
        TriggerEvent('QBCore:Notify', 9, t1.."\n"..t2, timer, 0, dict, txtr, 'COLOR_WHITE')
    end
end)


RegisterNetEvent('bone:Tip')
AddEventHandler('bone:Tip', function(text, duration)
    exports.dodi_bonessystem.DisplayTip(0, tostring(text), tonumber(duration))
end)


-- Código do cliente para executar a animação
RegisterNetEvent('bandage:playAnim')
AddEventHandler('bandage:playAnim', function()
    local playerPed = PlayerPedId() -- Obtém o ID do ped/personagem do jogador
    -- local animDict = "mini_games@story@mob4@heal_jules@bandage@arthur" -- Dicionário de animação
    -- local animName = "bandage_start" -- Nome da animação
    heal=true

    Citizen.InvokeNative(0x923583741DC87BCE, playerPed, 'default')
    Citizen.InvokeNative(0x89F5E7ADECCCB49C, playerPed, 'normal')

    Citizen.Wait(500)

    -- Carregar a animação
    -- RequestAnimDict(animDict)
    -- while not HasAnimDictLoaded(animDict) do
    --     Citizen.Wait(10)
    -- end
    
    -- Faz o ped do jogador executar a animação
    -- TaskPlayAnim(playerPed, animDict, animName, 2.0, -2.0, -1, 67109393, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
    
    Citizen.Wait(7000)
    ClearPedTasks(playerPed)
end)

-- 定时死亡
RegisterNetEvent('bone:DeathTimer')
AddEventHandler('bone:DeathTimer', function()
    local deathSecondsRemaining = Config.DeathTimer 
    deathTimerStarted=true
    heal =false
    Citizen.CreateThread(function()
        while deathSecondsRemaining > 0 do
            Wait(1000)
            -- TriggerEvent("bone:Tip", '治疗状态'..heal, 1000)
            deathSecondsRemaining = deathSecondsRemaining - 1
            if heal then
                heal=false
                deathTimerStarted = false
                return
            end
            TriggerEvent("bone:Tip", '在'..deathSecondsRemaining..'秒后死亡..', 1000)
        end
        TriggerEvent('qb-medic:client:KillPlayer', source)
        deathTimerStarted = false
    end)
end)

RegisterNetEvent('bone:client:stop-death-timer')
AddEventHandler('bone:client:stop-death-timer',function()
    heal=true
end)

-- RegisterNetEvent('bone:Timesup')
-- AddEventHandler('bone:Timesup',function()
--     if is_badly_injured then  end
-- end)


-- Citizen.CreateThread(function()
--     local t=1000
--     while true do

--         if  deathTimerStarted then 
--             t=1000
--             if heal == false then
--                 if deathSecondsRemaining > 0 then 
--                     TriggerEvent("bone:Tip", '在'..deathSecondsRemaining..'秒后死亡..', 1000)
--                 elseif deathSecondsRemaining <= 0 then 
--                     TriggerEvent('qb-medic:client:KillPlayer', source)
--                 end
--             end
--         end
--         Wait(t)
--     end
-- end)
