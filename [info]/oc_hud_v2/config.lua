Config              = {}

-- Variables (HUD)
Config.hideArmor    = true -- 隐藏盔甲
Config.hideOxygen    = true -- 隐藏氧气
Config.ShowSpeedometer = false -- 车速表开\关（编辑html以及删除\更改开关和文本）
Config.Showstreetinfo = true  -- 街道信息 on\off（编辑 html 以及删除\更改开关和文本）
Config.Hidemaponfoot = false -- 步行隐藏小地图和街道信息（重新启动游戏以应用修改）
Config.Microphone = false -- on\off microphone system

Config.UnitOfSpeed = "kmh"  -- "kmh" or "mph" (edit html as well)

-- Local values
Config.oxygenMax    = 10 -- Max oxygen
Config.stamina = 100 -- Max stamina

-- General waiting times
Config.WaitValue = 5000 -- Time in milliseconds to load and show hud values, Lower ms could cause issue.
Config.WaitTalk = 300 -- Time delay in milliseconds to enlight microphone when a player is talking 
Config.waitTime     = 400  -- Set to 100 so the hud is more fluid. However, performance will be affected.

-- Saved elements
Config.waitSpawn    = 4000 -- Time to set hud elements back to saved on spawn
Config.waitResource = 100 -- Time to set hud elements back to saved after resource start


-- Hud keys customizable on Fivem keybinding settings
Config.Settingkey = "" -- Key to open hud setting menu
Config.Hidehudkey = "PAGEDOWN" --  Default Key to hide all hud components
Config.Showhudkey = "PAGEUP" -- Default Key to hide all hud components
Config.Showmap = "" -- Default Key to show mini-map 
Config.Hidemap = "" -- Default Key to hide mini-map 



-- Extra dev
Config.statustrigger = 'esx_status:getStatus'
Config.statustriggerhunger = 'hunger'
Config.statustriggerthirst = 'thirst'
Config.jobtrigger = 'esx:setJob'

























--Changed by oliann97