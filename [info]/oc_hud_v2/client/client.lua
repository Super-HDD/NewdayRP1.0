-- Optimizations
local showMap, showBars, showArmor, showOxygen, isOpen, cinematicHud, isPaused
local MapActive, changehudstyleActive, resethudstyleActive, healthActive, armorActive, hungerActive, thirstActive, staminaActive, oxygenActive, microphoneActive, timeActive, cinematicActive, idActive, jobActive, timedivActive, walletdivActive, bankdivActive, societydivActive, blackMoneydivActive, main2Active, mainActive, logoActive
local MapSwitch, changehudstyleSwitch, resehudstyleSwitch, healthSwitch, armorSwitch, hungerSwitch, thirstSwitch, staminaSwitch, oxygenSwitch, microphoneSwitch, timeSwitch, cinematicSwitch, idSwitch, jobSwitch, timedivSwitch, walletdivSwitch, bankdivSwitch, societydivSwitch, blackMoneydivSwitch, main2Switch, mainSwitch, logoSwitch



-- Main Thread -- Thread 1#
CreateThread(function()
while true do
local ped = PlayerPedId()
local player = PlayerId()
local stamina = Config.stamina - GetPlayerSprintStaminaRemaining(player)
local armor, id = GetPedArmour(ped), GetPlayerServerId(player)

SendNUIMessage({
stamina = stamina,
})

if Config.Microphone == false then 
SendNUIMessage({action = 'microphoneHide'})
end


-- Armor hide if not used and configured to true (config.lua)
if Config.hideArmor and not cinematicHud and not isPaused then
if (armor <= 0) then
if not armorSwitch then
SendNUIMessage({action = 'armorHide'})
armorActive = true
showArmor = true
else
SendNUIMessage({action = 'armorShow'})
armorActive = false
showArmor = false
end
elseif not armorSwitch then
SendNUIMessage({action = 'armorShow'})
armorActive = false
showArmor = false
end




end

-- Action when pause menu on
if IsPauseMenuActive() and not isPaused and not isOpen then
if not mainActive then
mainActive = true
SendNUIMessage({action = 'mainHide'})
end
isPaused = true
elseif not IsPauseMenuActive() and isPaused and not cinematicHud then
if mainActive then
mainActive = false
SendNUIMessage({action = 'mainShow'});
end
isPaused = false
end

Wait(Config.waitTime)
end
end)
-- Disable action control -- Thread 2#
CreateThread(function()
while isOpen do
Wait(500)
DisableControlAction(0, 322, true)
end
end)
--  Events
RegisterNUICallback('close', function(event)
SendNUIMessage({ action = 'hide' })
SetNuiFocus(false, false)
isOpen = false
end)

RegisterNUICallback('change', function(data)
TriggerEvent('oc_hud_v2_v2:change', data.action)
end)

-- Change Switch list
RegisterNetEvent('oc_hud_v2:change')
AddEventHandler('oc_hud_v2:change', function(action)

if action == "hunger" then
if not hungerActive then
hungerActive = true
hungerSwitch = true
SendNUIMessage({action = 'hungerHide'})
else
hungerActive = false
hungerSwitch = false
SendNUIMessage({action = 'hungerShow'})
end

elseif action == "thirst" then
if not thirstActive then
thirstActive = true
thirstSwitch = true
SendNUIMessage({action = 'thirstHide'})
else
thirstActive = false
thirstSwitch = false
SendNUIMessage({action = 'thirstShow'})
end

elseif action == "walletdiv" then
if not walletdivActive then
walletdivActive = true
walletdivSwitch = true
SendNUIMessage({action = 'walletdivHide'})
else
walletdivActive = false
walletdivSwitch = false
SendNUIMessage({action = 'walletdivShow'})
end

elseif action == "blackMoneydiv" then
if not blackMoneydivActive then
blackMoneydivActive = true
blackMoneydivSwitch = true
SendNUIMessage({action = 'blackMoneydivHide'})
else
blackMoneydivActive = false
blackMoneydivSwitch = false
SendNUIMessage({action = 'blackMoneydivShow'})
end

elseif action == "societydiv" then
if not societydivActive then
societydivActive = true
societydivSwitch = true
SendNUIMessage({action = 'societydivHide'})
else
societydivActive = false
societydivSwitch = false
SendNUIMessage({action = 'societydivShow'})
end

elseif action == "bankdiv" then
if not bankdivActive then
bankdivActive = true
bankdivSwitch = true
SendNUIMessage({action = 'bankdivHide'})
else
bankdivActive = false
bankdivSwitch = false
SendNUIMessage({action = 'bankdivShow'})
end

elseif action == "main" then

if not mainActive then
mainActive = true
mainSwitch = true
showMap = false
DisplayRadar(false)
SendNUIMessage({action = 'mainHide'})
else 
mainActive = false
mainSwitch = false
showMap = true
DisplayRadar(true)
SendNUIMessage({action = 'mainShow'})
end


elseif action == "main2" then
if not main2Active then
main2Active = true
main2Switch = true
SendNUIMessage({action = 'main2Hide'})
else
main2Active = false
main2Switch = false
SendNUIMessage({action = 'main2Show'})
end

elseif action == "job" then
if not jobActive then
jobActive = true
jobSwitch = true
SendNUIMessage({action = 'jobHide'})
else
jobActive = false
jobSwitch = false
SendNUIMessage({action = 'jobShow'})
end

elseif action == "time" then
if not timeActive then
timeActive = true
timeSwitch = true
SendNUIMessage({action = 'timeHide'})
else
timeActive = false
timeSwitch = false
SendNUIMessage({action = 'timeShow'})
end

elseif action == "logo" then
if not logoActive then
logoActive = true
logoSwitch = true
SendNUIMessage({action = 'logoHide'})
else
logoActive = false
logoSwitch = false
SendNUIMessage({action = 'logoShow'})
end



elseif action == "microphone" then
if not microphoneActive then
microphoneActive = true
microphoneSwitch = true
SendNUIMessage({action = 'microphoneHide'})
else
microphoneActive = false
microphoneSwitch = false
SendNUIMessage({action = 'microphoneShow'})
end

elseif action == "oxygen" then
if not oxygenActive then
oxygenActive = true
oxygenSwitch = true
SendNUIMessage({action = 'oxygenHide'})
else
oxygenActive = false
oxygenSwitch = false
SendNUIMessage({action = 'oxygenShow'})
end

elseif  action == "health" then
if not healthActive then
healthActive = true
healthSwitch = true
SendNUIMessage({action = 'healthHide'})
else
healthActive = false
healthSwitch = false
SendNUIMessage({action = 'healthShow'})
end

elseif action == "armor" then
if not armorActive then
armorActive = true
armorSwitch = true
SendNUIMessage({action = 'armorHide'})
else
armorActive = false
armorSwitch = false
SendNUIMessage({action = 'armorShow'})
end

elseif action == "stamina" then
if not staminaActive then
staminaActive = true
staminaSwitch = true
SendNUIMessage({action = 'staminaHide'})
else
staminaActive = false
staminaSwitch = false
SendNUIMessage({action = 'staminaShow'})
end

elseif action == "id" then
if not idActive then
idActive = true
idSwitch = true
SendNUIMessage({action = 'idHide'})
else
idActive = false
idSwitch = false
SendNUIMessage({action = 'idShow'})
end




end

end)


local pressed = false


RegisterNetEvent("oc_hud:hudopen") 
AddEventHandler("oc_hud:hudopen", function() 
hud() 
end)

-- command open menu
RegisterCommand('hud', function()
if not isOpen and not isPaused then
isOpen = true
SendNUIMessage({ action = 'show' })
SetNuiFocus(true, true)
end
end)

-- hud
 function hud()
if not isOpen and not isPaused then
isOpen = true
SendNUIMessage({ action = 'show' })
SetNuiFocus(true, true)
end
end


-- Handler
AddEventHandler('playerSpawned', function()
Wait(Config.waitSpawn)
SendNUIMessage({ action = 'setPosition' })
SendNUIMessage({ action = 'setColors' })
end)

AddEventHandler('onResourceStart', function(resourceName)
if (GetCurrentResourceName() == resourceName) then
Wait(Config.waitResource)
SendNUIMessage({ action = 'setPosition' })
SendNUIMessage({ action = 'setColors' })
end
end)






RegisterCommand('hudsetting', function()
	isOpen = true
	SendNUIMessage({ action = 'show' })
	SetNuiFocus(true, true)
end, false)
RegisterKeyMapping('hudsetting', 'HUD Setting', 'keyboard', Config.Settingkey)

RegisterCommand('hidehud', function()
	SendNUIMessage({ action = 'mainHide' })
	showMap = false
	DisplayRadar(false)
end, false)
RegisterKeyMapping('hidehud', 'Hide HUD', 'keyboard', Config.Hidehudkey)

RegisterCommand('showhud', function()
	SendNUIMessage({ action = 'mainShow' })
	showMap = true
	DisplayRadar(true)
end, false)
RegisterKeyMapping('showhud', 'Show HUD', 'keyboard', Config.Showhudkey)

RegisterCommand('showmap', function()
	SendNUIMessage({ action = 'streetinfoShow' })
	showMap = true
	DisplayRadar(true)
end, false)
RegisterKeyMapping('showmap', 'Show mini-map', 'keyboard', Config.Showmap)

RegisterCommand('hidemap', function()
	SendNUIMessage({ action = 'streetinfoHide' })
	showMap = false
	DisplayRadar(false)
end, false)
RegisterKeyMapping('hidemap', 'Hide mini-map', 'keyboard', Config.Hidemap)





--Changed by oliann97

