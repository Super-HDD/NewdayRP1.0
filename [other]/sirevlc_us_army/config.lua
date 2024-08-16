Config = {}
--Turn your framework to true and all the others to false. This is to check jobs
Config.RoleRestriction   = false
Config.REDEMRP2          = false
Config.REDEMRP2023REBOOT = false
Config.VORP              = false
Config.RSG               = true
Config.QBR               = false
 
--List of roles enabled to open the menu if Config.RoleRestriction = true
Config.Roles = {
"trapper",
}
-------------------------------------------
               --MENU --
-------------------------------------------
Config.GeneralMenuIsUsed = false 
Config.MenuActive        = true  
Config.OpenMenuKey       = 0x1CE6D9EB -- [2] by default 
Config.Debug = false
--If you want to trigger the menu via another method than "is key pressed" call the event like this :
--TriggerEvent("sirevlc_us_army","mainmenu")

 
--US ARMY  
--TriggerEvent("sirevlc_army","MenOutfits01")
--TriggerEvent("sirevlc_army","MenOutfits02")
--TriggerEvent("sirevlc_army","MenOutfits03")
--TriggerEvent("sirevlc_army","MenOutfits04")
--TriggerEvent("sirevlc_army","MenOutfits05")
--TriggerEvent("sirevlc_army","MenOutfits06")
--TriggerEvent("sirevlc_army","MenOutfits07")
--TriggerEvent("sirevlc_army","MenOutfits08")
--TriggerEvent("sirevlc_army","MenOutfits09")
--TriggerEvent("sirevlc_army","MenOutfits10")
--TriggerEvent("sirevlc_army","MenOutfits11")
--TriggerEvent("sirevlc_army","MenOutfits12")
--TriggerEvent("sirevlc_army","MenOutfits13")
--TriggerEvent("sirevlc_army","MenOutfits14")
--TriggerEvent("sirevlc_army","MenOutfits15")
--TriggerEvent("sirevlc_army","MenOutfits16")
--TriggerEvent("sirevlc_army","MenOutfits17")
--TriggerEvent("sirevlc_army","MenOutfits18")
--TriggerEvent("sirevlc_army","MenOutfits19")
--TriggerEvent("sirevlc_army","MenOutfits20")
--TriggerEvent("sirevlc_army","MenOutfits21")
--TriggerEvent("sirevlc_army","MenOutfits22")
--TriggerEvent("sirevlc_army","MenOutfits23")
--TriggerEvent("sirevlc_army","MenOutfits24")
--TriggerEvent("sirevlc_army","MenOutfits25")
--TriggerEvent("sirevlc_army","MenOutfits26")
--TriggerEvent("sirevlc_army","MenOutfits27")
--TriggerEvent("sirevlc_army","MenOutfits28")
--TriggerEvent("sirevlc_army","MenOutfits29")
--TriggerEvent("sirevlc_army","MenOutfits30")
--TriggerEvent("sirevlc_army","MenOutfits31")
--TriggerEvent("sirevlc_army","MenOutfits32")
--TriggerEvent("sirevlc_army","MenOutfits33")
--TriggerEvent("sirevlc_army","MenOutfits34")
--TriggerEvent("sirevlc_army","MenOutfits35")
--TriggerEvent("sirevlc_army","MenOutfits36")
--TriggerEvent("sirevlc_army","MenOutfits37")
--TriggerEvent("sirevlc_army","MenOutfits38")
--TriggerEvent("sirevlc_army","MenOutfits39")
--TriggerEvent("sirevlc_army","MenOutfits40")
--TriggerEvent("sirevlc_army","MenOutfits41")
--TriggerEvent("sirevlc_army","MenOutfits42")
--TriggerEvent("sirevlc_army","MenOutfits43")
--TriggerEvent("sirevlc_army","MenOutfits44")
--TriggerEvent("sirevlc_army","MenOutfits45")
--TriggerEvent("sirevlc_army","MenOutfits46")
--TriggerEvent("sirevlc_army","MenOutfits47")
--TriggerEvent("sirevlc_army","MenOutfits48")
--TriggerEvent("sirevlc_army","MenOutfits49")
--TriggerEvent("sirevlc_army","MenOutfits50")
--TriggerEvent("sirevlc_army","MenOutfits51")
--TriggerEvent("sirevlc_army","MenOutfits52")
--TriggerEvent("sirevlc_army","MenOutfits53")
--TriggerEvent("sirevlc_army","MenOutfits54")
--TriggerEvent("sirevlc_army","MenOutfits55")
--TriggerEvent("sirevlc_army","MenOutfits56")
--TriggerEvent("sirevlc_army","MenOutfits57")
--TriggerEvent("sirevlc_army","MenOutfits58")
--TriggerEvent("sirevlc_army","MenOutfits59")
--TriggerEvent("sirevlc_army","MenOutfits60")
--TriggerEvent("sirevlc_army","MenOutfits61")
 
 
 
 

-------------------------------------------
           --TEXTS TRANSLATIONS--
-------------------------------------------
Config.TextMenuTitle   = "Army"    
Config.TextMenuLabel02 = 'Outfits'       
       
Config.TextMenuDescriptionLabel02 = 'Outfits'              

Config.TextMainMenu = "Outfits"
Config.MainMenu = {
		{label = "US Army"            ,value = "action01",  desc =  "US Army"            ,  image='items/us_flag.png'},
}
 
--Here you can translate menu texts, enable or disable menu lines/options with adding -- in front of the line
Config.TextPart1Title   = "US Army"
Config.Part1 = {
	 {label = "Outfit#01" ,value = "action01",  desc =  "Outfit#01"},
	 {label = "Outfit#02" ,value = "action02",  desc =  "Outfit#02"},
     {label = "Outfit#03" ,value = "action03",  desc =  "Outfit#03"},
     {label = "Outfit#04" ,value = "action04",  desc =  "Outfit#04"},
     {label = "Outfit#05" ,value = "action05",  desc =  "Outfit#05"},
     {label = "Outfit#06" ,value = "action06",  desc =  "Outfit#06"},
     {label = "Outfit#07" ,value = "action07",  desc =  "Outfit#07"},
     {label = "Outfit#08" ,value = "action08",  desc =  "Outfit#08"},
     {label = "Outfit#09" ,value = "action09",  desc =  "Outfit#09"},
     {label = "Outfit#10" ,value = "action10",  desc =  "Outfit#10"},
     {label = "Outfit#11" ,value = "action11",  desc =  "Outfit#11"},
     {label = "Outfit#12" ,value = "action12",  desc =  "Outfit#12"},
     {label = "Outfit#13" ,value = "action13",  desc =  "Outfit#13"},
     {label = "Outfit#14" ,value = "action14",  desc =  "Outfit#14"},
     {label = "Outfit#15" ,value = "action15",  desc =  "Outfit#15"},
     {label = "Outfit#16" ,value = "action16",  desc =  "Outfit#16"},
     {label = "Outfit#17" ,value = "action17",  desc =  "Outfit#17"},
     {label = "Outfit#18" ,value = "action18",  desc =  "Outfit#18"},
     {label = "Outfit#19" ,value = "action19",  desc =  "Outfit#19"},
     {label = "Outfit#20" ,value = "action20",  desc =  "Outfit#20"},
     {label = "Outfit#21" ,value = "action21",  desc =  "Outfit#21"},
     {label = "Outfit#22" ,value = "action22",  desc =  "Outfit#22"},
     {label = "Outfit#23" ,value = "action23",  desc =  "Outfit#23"},
     {label = "Outfit#24" ,value = "action24",  desc =  "Outfit#24"},
     {label = "Outfit#25" ,value = "action25",  desc =  "Outfit#25"},
     {label = "Outfit#26" ,value = "action26",  desc =  "Outfit#26"},
     {label = "Outfit#27" ,value = "action27",  desc =  "Outfit#27"},
     {label = "Outfit#28" ,value = "action28",  desc =  "Outfit#28"},
     {label = "Outfit#29" ,value = "action29",  desc =  "Outfit#29"},
     {label = "Outfit#30" ,value = "action30",  desc =  "Outfit#30"},
     {label = "Outfit#31" ,value = "action31",  desc =  "Outfit#31"},
     {label = "Outfit#32" ,value = "action32",  desc =  "Outfit#32"},
     {label = "Outfit#33" ,value = "action33",  desc =  "Outfit#33"},
     {label = "Outfit#34" ,value = "action34",  desc =  "Outfit#34"},
     {label = "Outfit#35" ,value = "action35",  desc =  "Outfit#35"},
     {label = "Outfit#36" ,value = "action36",  desc =  "Outfit#36"},	
     {label = "Outfit#37" ,value = "action37",  desc =  "Outfit#37"},	
     {label = "Outfit#38" ,value = "action38",  desc =  "Outfit#38"},	
     {label = "Outfit#39" ,value = "action39",  desc =  "Outfit#39"},	
     {label = "Outfit#40" ,value = "action40",  desc =  "Outfit#40"},	
     {label = "Outfit#41" ,value = "action41",  desc =  "Outfit#41"},	
     {label = "Outfit#42" ,value = "action42",  desc =  "Outfit#42"},	
     {label = "Outfit#43" ,value = "action43",  desc =  "Outfit#43"},	
     {label = "Outfit#44" ,value = "action44",  desc =  "Outfit#44"},	
     {label = "Outfit#45" ,value = "action45",  desc =  "Outfit#45"},	
     {label = "Outfit#46" ,value = "action46",  desc =  "Outfit#46"},	
     {label = "Outfit#47" ,value = "action47",  desc =  "Outfit#47"},	
     {label = "Outfit#48" ,value = "action48",  desc =  "Outfit#48"},	
     {label = "Outfit#49" ,value = "action49",  desc =  "Outfit#49"},	
     {label = "Outfit#50" ,value = "action50",  desc =  "Outfit#50"},	
     {label = "Outfit#51" ,value = "action51",  desc =  "Outfit#51"},	
     {label = "Outfit#52" ,value = "action52",  desc =  "Outfit#52"},	
     {label = "Outfit#53" ,value = "action53",  desc =  "Outfit#53"},	
     {label = "Outfit#54" ,value = "action54",  desc =  "Outfit#54"},	
     {label = "Outfit#55" ,value = "action55",  desc =  "Outfit#55"},	
     {label = "Outfit#56" ,value = "action56",  desc =  "Outfit#56"},	
     {label = "Outfit#57" ,value = "action57",  desc =  "Outfit#57"},	
     {label = "Outfit#58" ,value = "action58",  desc =  "Outfit#58"},	
     {label = "Outfit#59" ,value = "action59",  desc =  "Outfit#59"},	
	 {label = "Outfit#60" ,value = "action60",  desc =  "Outfit#60"},	
	 {label = "Outfit#61" ,value = "action61",  desc =  "Outfit#61"},	
}
 
 
-----------------------------------------------------------------------------------------------
									--KEYBINDS LIST--
-----------------------------------------------------------------------------------------------

--   -- Letters
--   ["A"] = 0x7065027D,
--   ["B"] = 0x4CC0E2FE,
--   ["C"] = 0x9959A6F0,
--   ["D"] = 0xB4E465B4,
--   ["E"] = 0xCEFD9220,
--   ["F"] = 0xB2F377E8,
--   ["G"] = 0x760A9C6F,
--   ["H"] = 0x24978A28,
--   ["I"] = 0xC1989F95,
--   ["J"] = 0xF3830D8E,
--   -- Missing K
--   ["L"] = 0x80F28E95,
--   ["M"] = 0xE31C6A41,
--   ["N"] = 0x4BC9DABB,
--   ["O"] = 0xF1301666,
--   ["P"] = 0xD82E0BD2,
--   ["Q"] = 0xDE794E3E,
--   ["R"] = 0xE30CD707,
--   ["S"] = 0xD27782E3,
--   -- Missing T
--   ["U"] = 0xD8F73058,
--   ["V"] = 0x7F8D09B8,
--   ["W"] = 0x8FD015D8,
--   ["X"] = 0x8CC9CD42,
--   -- Missing Y
--   ["Z"] = 0x26E9DC00,
--   -- Symbol Keys
--   ["RIGHTBRACKET"] = 0xA5BDCD3C,
--   ["LEFTBRACKET"] = 0x430593AA,
--   -- Mouse buttons
--   ["MOUSE1"] = 0x07CE1E61,
--   ["MOUSE2"] = 0xF84FA74F,
--   ["MOUSE3"] = 0xCEE12B50,
--   ["MWUP"] = 0x3076E97C,
--   -- Modifier Keys
--   ["CTRL"] = 0xDB096B85,
--   ["TAB"] = 0xB238FE0B,
--   ["SHIFT"] = 0x8FFC75D6,
--   ["SPACEBAR"] = 0xD9D0E1C0,
--   ["ENTER"] = 0xC7B5340A,
--   ["BACKSPACE"] = 0x156F7119,
--   ["LALT"] = 0x8AAA0AD4,
--   ["DEL"] = 0x4AF4D473,
--   ["PGUP"] = 0x446258B6,
--   ["PGDN"] = 0x3C3DD371,
--   -- Function Keys
--   ["F1"] = 0xA8E3F467,
--   ["F4"] = 0x1F6D95E5,
--   ["F6"] = 0x3C0A40F2,
--   -- Number Keys
--   ["1"] = 0xE6F612E4,
--   ["2"] = 0x1CE6D9EB,
--   ["3"] = 0x4F49CC4C,
--   ["4"] = 0x8F9F9E58,
--   ["5"] = 0xAB62E997,
--   ["6"] = 0xA1FDE2A6,
--   ["7"] = 0xB03A913B,
--   ["8"] = 0x42385422,
--   -- Arrow Keys
--   ["DOWN"] = 0x05CA7C52,
--   ["UP"] = 0x6319DB71,
--   ["LEFT"] = 0xA65EBAB4,
--   ["RIGHT"] = 0xDEB34313