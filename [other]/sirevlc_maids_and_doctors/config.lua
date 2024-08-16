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
--Config.OpenMenuKey       = 0xB03A913B -- [7] by default 
Config.Debug             = false

 
-------------------------------------------
           --TEXTS TRANSLATIONS--
-------------------------------------------
--Menus
Config.TextMenuTitle   = "Nurses and Doctors"
Config.TextMenuLabel01 = 'Women Outfits'      
Config.TextMenuLabel02 = 'Men Outfits' 
 
Config.TextMenuDescriptionLabel01 = 'Women Outfits'         
Config.TextMenuDescriptionLabel02 = 'Men Outfits'          
 
 
--Menus Outfits
Config.TextMenuWomenTitle   = "Nurses and Maids"       
Config.TextMenuWomenLabel001 = "Outfit#001"
Config.TextMenuWomenLabel002 = "Outfit#002"
Config.TextMenuWomenLabel003 = "Outfit#003"
Config.TextMenuWomenLabel004 = "Outfit#004"
Config.TextMenuWomenLabel005 = "Outfit#005"
Config.TextMenuWomenLabel006 = "Outfit#006"
Config.TextMenuWomenLabel007 = "Outfit#007"
Config.TextMenuWomenLabel008 = "Outfit#008"
Config.TextMenuWomenLabel009 = "Outfit#009"
Config.TextMenuWomenLabel010 = "Outfit#010"
  
Config.TextMenuWomenDescriptionLabel001 = "Outfit#001"
Config.TextMenuWomenDescriptionLabel002 = "Outfit#002"
Config.TextMenuWomenDescriptionLabel003 = "Outfit#003"
Config.TextMenuWomenDescriptionLabel004 = "Outfit#004"
Config.TextMenuWomenDescriptionLabel005 = "Outfit#005"
Config.TextMenuWomenDescriptionLabel006 = "Outfit#006"
Config.TextMenuWomenDescriptionLabel007 = "Outfit#007"
Config.TextMenuWomenDescriptionLabel008 = "Outfit#008"
Config.TextMenuWomenDescriptionLabel009 = "Outfit#009"
Config.TextMenuWomenDescriptionLabel010 = "Outfit#010"
 
 
Config.TextMenuMenTitle   = "Doctor"
Config.TextMenuMenLabel001 = "Outfit#001"
Config.TextMenuMenLabel002 = "Outfit#002"
Config.TextMenuMenLabel003 = "Outfit#003"
Config.TextMenuMenLabel004 = "Outfit#004"
Config.TextMenuMenLabel005 = "Outfit#005"
Config.TextMenuMenLabel006 = "Outfit#006"
Config.TextMenuMenLabel007 = "Outfit#007"
Config.TextMenuMenLabel008 = "Outfit#008"
Config.TextMenuMenLabel009 = "Outfit#009"
Config.TextMenuMenLabel010 = "Outfit#010"			 
 
 
Config.TextMenuMenDescriptionLabel001 = "Outfit#001"
Config.TextMenuMenDescriptionLabel002 = "Outfit#002"
Config.TextMenuMenDescriptionLabel003 = "Outfit#003"
Config.TextMenuMenDescriptionLabel004 = "Outfit#004"
Config.TextMenuMenDescriptionLabel005 = "Outfit#005"
Config.TextMenuMenDescriptionLabel006 = "Outfit#006"
Config.TextMenuMenDescriptionLabel007 = "Outfit#007"
Config.TextMenuMenDescriptionLabel008 = "Outfit#008"
Config.TextMenuMenDescriptionLabel009 = "Outfit#009"
Config.TextMenuMenDescriptionLabel010 = "Outfit#010"
 
 
 
-------------------------------------------
               --EVENTS LINES --
-------------------------------------------
--TriggerEvent("sirevlc_maids_and_doctors", "mainmenu") -- Open Main Menu
--TriggerEvent("sirevlc_maids_and_doctors", "RemoveUpperBody") -- Just remove upper body
--TriggerEvent("sirevlc_maids_and_doctors", "RemoveLowerBody") -- Just remove lower body 
 
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit001")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit002")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit003")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit004")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit005")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit006")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit007")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit008")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit009")
--TriggerEvent("sirevlc_maids_and_doctors","WomenOutfit010")
 
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit001")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit002")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit003")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit004")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit005")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit006")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit007")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit008")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit009")
--TriggerEvent("sirevlc_maids_and_doctors","MenOutfit010")
 
 
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