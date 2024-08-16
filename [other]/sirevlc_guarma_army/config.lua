Config = {}

--Turn your framework to true and all the others to false. This is to check jobs
Config.RoleRestriction   = false
Config.REDEMRP2          = false
Config.REDEMRP2023REBOOT = false
Config.VORP              = false
Config.RSG               = false
Config.QBR               = false


--List of roles enabled to open the menu if Config.RoleRestriction = true
Config.Roles = {
"trapper",
}
-------------------------------------------
               --MENU --
-------------------------------------------
Config.GeneralMenuIsUsed = false 
Config.MenuActive = true  
Config.OpenMenuKey = 0x4F49CC4C -- [3] by default 
Config.Debug = false
--If you want to trigger the menu via another method than "is key pressed" call the event like this :
--TriggerEvent("sirevlc_guarma_army_menu","mainmenu")
 
 
--GUARMA ARMY 
--TriggerEvent("sirevlc_army","MenOutfits62")
--TriggerEvent("sirevlc_army","MenOutfits63")
--TriggerEvent("sirevlc_army","MenOutfits64")
--TriggerEvent("sirevlc_army","MenOutfits65")
--TriggerEvent("sirevlc_army","MenOutfits66")
--TriggerEvent("sirevlc_army","MenOutfits67")
--TriggerEvent("sirevlc_army","MenOutfits68")
--TriggerEvent("sirevlc_army","MenOutfits69")
--TriggerEvent("sirevlc_army","MenOutfits70")
--TriggerEvent("sirevlc_army","MenOutfits71")
--TriggerEvent("sirevlc_army","MenOutfits72")
--TriggerEvent("sirevlc_army","MenOutfits73")
--TriggerEvent("sirevlc_army","MenOutfits74")
--TriggerEvent("sirevlc_army","MenOutfits75")
--TriggerEvent("sirevlc_army","MenOutfits76")
--TriggerEvent("sirevlc_army","MenOutfits77")
--TriggerEvent("sirevlc_army","MenOutfits78")
--TriggerEvent("sirevlc_army","MenOutfits79")
--TriggerEvent("sirevlc_army","MenOutfits80")
--TriggerEvent("sirevlc_army","MenOutfits81")
--TriggerEvent("sirevlc_army","MenOutfits82")
--TriggerEvent("sirevlc_army","MenOutfits83")
--TriggerEvent("sirevlc_army","MenOutfits84")
--TriggerEvent("sirevlc_army","MenOutfits85")
--TriggerEvent("sirevlc_army","MenOutfits86")
--TriggerEvent("sirevlc_army","MenOutfits87")
--TriggerEvent("sirevlc_army","MenOutfits88")
--TriggerEvent("sirevlc_army","MenOutfits89")
--TriggerEvent("sirevlc_army","MenOutfits90")
--TriggerEvent("sirevlc_army","MenOutfits91")
--TriggerEvent("sirevlc_army","MenOutfits92")
--TriggerEvent("sirevlc_army","MenOutfits93")
 
 

-------------------------------------------
           --TEXTS TRANSLATIONS--
-------------------------------------------
Config.TextMenuTitle   = "Army"    
Config.TextMenuLabel02 = 'Outfits'       
       
Config.TextMenuDescriptionLabel02 = 'Outfits'              

Config.TextMainMenu = "Outfits"
Config.MainMenu = {
        {label = "Guarma Army"        ,value = "action02",  desc =  "Guarma"             ,  image='items/guarma.png'},
}
 
--Here you can translate menu texts, enable or disable menu lines/options with adding -- in front of the line
 
Config.TextGuarmaArmyTitle   = "Guarma Army"
Config.GuarmaArmy = {
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