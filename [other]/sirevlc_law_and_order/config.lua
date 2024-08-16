Config = {}

--Turn your framework to true and all the others to false. This is to check jobs
Config.RoleRestriction   = true
Config.REDEMRP2          = true
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
--Config.OpenMenuKey = 0x1CE6D9EB -- [2] by default 
Config.ShowBadge = true  -- show badges on female characters  
 
--If you want to trigger the menu via another method than "is key pressed" call the event like this :
--TriggerEvent("sirevlc_law_and_order_menu")
 
--Other options available : 
--TriggerEvent("sirevlc_law_and_order","WomenOutfits01")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits02")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits03")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits04")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits05")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits06")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits07")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits08")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits09")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits10")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits11")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits12")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits13")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits14")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits15")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits16")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits17")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits18")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits19")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits20")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits21")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits22")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits23")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits24")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits25")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits26")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits27")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits28")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits29")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits30")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits31")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits32")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits33")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits34")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits35")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits36")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits37")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits38")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits39")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits40")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits41")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits42")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits43")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits44")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits45")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits46")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits47")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits48")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits49")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits50")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits51")
--TriggerEvent("sirevlc_law_and_order","WomenOutfits52")
 



--TriggerEvent("sirevlc_law_and_order","MenOutfits01")
--TriggerEvent("sirevlc_law_and_order","MenOutfits02")
--TriggerEvent("sirevlc_law_and_order","MenOutfits03")
--TriggerEvent("sirevlc_law_and_order","MenOutfits04")
--TriggerEvent("sirevlc_law_and_order","MenOutfits05")
--TriggerEvent("sirevlc_law_and_order","MenOutfits06")
--TriggerEvent("sirevlc_law_and_order","MenOutfits07")
--TriggerEvent("sirevlc_law_and_order","MenOutfits08")
--TriggerEvent("sirevlc_law_and_order","MenOutfits09")
--TriggerEvent("sirevlc_law_and_order","MenOutfits10")
--TriggerEvent("sirevlc_law_and_order","MenOutfits11")
--TriggerEvent("sirevlc_law_and_order","MenOutfits12")
--TriggerEvent("sirevlc_law_and_order","MenOutfits13")
--TriggerEvent("sirevlc_law_and_order","MenOutfits14")
--TriggerEvent("sirevlc_law_and_order","MenOutfits15")
--TriggerEvent("sirevlc_law_and_order","MenOutfits16")
--TriggerEvent("sirevlc_law_and_order","MenOutfits17")
--TriggerEvent("sirevlc_law_and_order","MenOutfits18")
--TriggerEvent("sirevlc_law_and_order","MenOutfits19")
--TriggerEvent("sirevlc_law_and_order","MenOutfits20")
--TriggerEvent("sirevlc_law_and_order","MenOutfits21")
--TriggerEvent("sirevlc_law_and_order","MenOutfits22")
--TriggerEvent("sirevlc_law_and_order","MenOutfits23")
--TriggerEvent("sirevlc_law_and_order","MenOutfits24")
--TriggerEvent("sirevlc_law_and_order","MenOutfits25")
--TriggerEvent("sirevlc_law_and_order","MenOutfits26")
--TriggerEvent("sirevlc_law_and_order","MenOutfits27")
--TriggerEvent("sirevlc_law_and_order","MenOutfits28")
--TriggerEvent("sirevlc_law_and_order","MenOutfits29")
--TriggerEvent("sirevlc_law_and_order","MenOutfits30")
--TriggerEvent("sirevlc_law_and_order","MenOutfits31")
--TriggerEvent("sirevlc_law_and_order","MenOutfits32")
--TriggerEvent("sirevlc_law_and_order","MenOutfits33")
--TriggerEvent("sirevlc_law_and_order","MenOutfits34")
--TriggerEvent("sirevlc_law_and_order","MenOutfits35")
--TriggerEvent("sirevlc_law_and_order","MenOutfits36")
--TriggerEvent("sirevlc_law_and_order","MenOutfits37")
--TriggerEvent("sirevlc_law_and_order","MenOutfits38")
--TriggerEvent("sirevlc_law_and_order","MenOutfits39")
--TriggerEvent("sirevlc_law_and_order","MenOutfits40")
 
 

 

-------------------------------------------
           --TEXTS TRANSLATIONS--
-------------------------------------------
Config.TextMenuTitle   = "Law And Order"
Config.TextMenuLabel01 = 'Women Outfits'      
Config.TextMenuLabel02 = 'Men Outfits'       
 
 
Config.TextMenuDescriptionLabel01 = 'Women Outfits'         
Config.TextMenuDescriptionLabel02 = 'Men Outfits'          
Config.TextMenuDescriptionLabel03 = 'Remove Clothes'      




Config.TextMenuWomenTitle   = "Law And Order" 
Config.MenuWomen = {
		{label = "Trooper Blue#01"               , value = "action01",  desc = "Trooper Blue#01"                  ,image='items/clothing_hat_000_police.png'},
		{label = "Trooper Blue Rain#01"          , value = "action02",  desc = "Trooper Blue Rain#01"             ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Blue#02"               , value = "action03",  desc = "Trooper Blue#02"                  ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Blue Rain#02"          , value = "action04",  desc = "Trooper Blue Rain#02"             ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Black#01"              , value = "action05",  desc = "Trooper Black#01"                 ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Black Rain#01"         , value = "action06",  desc = "Trooper Black Rain#01"            ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Black#02"              , value = "action07",  desc = "Trooper Black#02"                 ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Black Rain#02"         , value = "action08",  desc = "Trooper Black Rain#02"            ,image='items/clothing_hat_000_police.png'},
        {label = "Officer Blue#01"               , value = "action09",  desc = "Officer Blue#01"                  ,image='items/officer_police.png'},
        {label = "Officer Blue Rain#01"          , value = "action10",  desc = "Officer Blue Rain#01"             ,image='items/officer_police.png'},
        {label = "Officer Blue#02"               , value = "action11",  desc = "Officer Blue#02"                  ,image='items/officer_police.png'},
        {label = "Officer Blue Rain#02"          , value = "action12",  desc = "Officer Blue Rain#02"             ,image='items/officer_police.png'},
        {label = "Officer Black#01"              , value = "action13",  desc = "Officer Black#01"                 ,image='items/officer_police.png'},
        {label = "Officer Black Rain#01"         , value = "action14",  desc = "Officer Black Rain#01"            ,image='items/officer_police.png'},
        {label = "Officer Black#02"              , value = "action15",  desc = "Officer Black#02"                 ,image='items/officer_police.png'},
        {label = "Officer Black Rain#02"         , value = "action16",  desc = "Officer Black Rain#02"            ,image='items/officer_police.png'},
        {label = "Officer Coat black#01"         , value = "action17",  desc = "Officer Coat black#01"            ,image='items/officer_police.png'},
        {label = "Officer Coat blue#01"          , value = "action18",  desc = "Officer Coat blue#01"             ,image='items/officer_police.png'},
        {label = "Officer Coat black#02"         , value = "action19",  desc = "Officer Coat black#02"            ,image='items/officer_police.png'},
        {label = "Officer Coat blue#02"          , value = "action20",  desc = "Officer Coat blue#02"             ,image='items/officer_police.png'},
        {label = "Southern Black #01"            , value = "action21",  desc = "Southern Black #01"               ,image='items/clothing_hat_000_police.png'},
        {label = "Southern Black Rain#01"        , value = "action22",  desc = "Southern Black Rain#01"           ,image='items/clothing_hat_000_police.png'},
        {label = "Southern Black #02"            , value = "action23",  desc = "Southern Black #02"               ,image='items/clothing_hat_000_police.png'},
        {label = "Southern Black Rain#02"        , value = "action24",  desc = "Southern Black Rain#02"           ,image='items/clothing_hat_000_police.png'},
        {label = "Southern Beige #01"            , value = "action25",  desc = "Southern Beige #01"               ,image='items/clothing_hat_000_police.png'},
        {label = "Southern Beige Rain#01"        , value = "action26",  desc = "Southern Beige Rain#01"           ,image='items/clothing_hat_000_police.png'},
        {label = "Southern Beige #02"            , value = "action27",  desc = "Southern Beige #02"               ,image='items/clothing_hat_000_police.png'},
        {label = "Southern Beige Rain#02"        , value = "action28",  desc = "Southern Beige Rain#02"           ,image='items/clothing_hat_000_police.png'},
        {label = "Southern Officer Black #01"    , value = "action29",  desc = "Southern Officer Black #01"       ,image='items/officer_police.png'},
        {label = "Southern Officer Black Rain#01", value = "action30",  desc = "Southern Officer Black Rain#01"   ,image='items/officer_police.png'},
        {label = "Southern Officer Black #02"    , value = "action31",  desc = "Southern Officer Black #02"       ,image='items/officer_police.png'},
        {label = "Southern Officer Black Rain#02", value = "action32",  desc = "Southern Officer Black Rain#02"   ,image='items/officer_police.png'},
        {label = "Southern Officer Beige #01"    , value = "action33",  desc = "Southern Officer Beige #01"       ,image='items/officer_police.png'},
        {label = "Southern Officer Beige Rain#01", value = "action34",  desc = "Southern Officer Beige Rain#01"   ,image='items/officer_police.png'},
        {label = "Southern Officer Beige #02"    , value = "action35",  desc = "Southern Officer Beige #02"       ,image='items/officer_police.png'},
        {label = "Southern Officer Beige Rain#02", value = "action36",  desc = "Southern Officer Beige Rain#02"   ,image='items/officer_police.png'},
        {label = "The Bureau Black #01"          , value = "action37",  desc = "The Bureau Black #01"             ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Black Rain#01"      , value = "action38",  desc = "The Bureau Black Rain#01"         ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Black #02"          , value = "action39",  desc = "The Bureau Black #02"             ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Black Rain#02"      , value = "action40",  desc = "The Bureau Black Rain#02"         ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Southern #01"       , value = "action41",  desc = "The Bureau Southern #01"          ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Southern Rain#01"   , value = "action42",  desc = "The Bureau Southern Rain#01"      ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Southern #02"       , value = "action43",  desc = "The Bureau Southern #02"          ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Southern Rain#02"   , value = "action44",  desc = "The Bureau Southern Rain#02"      ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Blue #01"           , value = "action45",  desc = "The Bureau Blue #01"              ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Blue Rain#01"       , value = "action46",  desc = "The Bureau Blue Rain#"            ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Blue #02"           , value = "action47",  desc = "The Bureau Blue #02"              ,image='items/clothing_hat_000_police.png'},
        {label = "The Bureau Blue Rain#02"       , value = "action48",  desc = "The Bureau Blue Rain#"            ,image='items/clothing_hat_000_police.png'},
 	
} 

 

--Here you can translate menu texts, enable or disable menu lines with adding -- in front of the line like this :
-- {label = "Officer Black#01",value = "action01",  desc = Config.TextMenuDescriptionMenLabel01, image='items/officer_police.png'},
Config.TextMenuMenTitle   = "Law And Order"
Config.MenuMen = {
		{label = "Officer Black#01"                ,value = "action01",  desc =  "Officer Black#01"               ,image='items/officer_police.png'},
		{label = "Officer Black Rain#01"           ,value = "action02",  desc =  "Officer Black Rain#01"          ,image='items/officer_police.png'},
        {label = "Officer Black#02"                ,value = "action03",  desc =  "Officer Black#02"               ,image='items/officer_police.png'},
        {label = "Officer Black Rain#02"           ,value = "action04",  desc =  "Officer Black Rain#02"          ,image='items/officer_police.png'},
        {label = "Officer Blue#01"                 ,value = "action05",  desc =  "Officer Blue#01"                ,image='items/officer_police.png'},
        {label = "Officer Blue Rain#01"            ,value = "action06",  desc =  "Officer Blue Rain#01"           ,image='items/officer_police.png'},
        {label = "Officer Blue#02"                 ,value = "action07",  desc =  "Officer Blue#02"                ,image='items/officer_police.png'},
        {label = "Officer Blue Rain#02"            ,value = "action08",  desc =  "Officer Blue Rain#02"           ,image='items/officer_police.png'},
        {label = "Trooper Black #01"               ,value = "action09",  desc =  "Trooper Black #01"              ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Black Rain #01"		   ,value = "action10",  desc =  "Trooper Black Rain #01"		  ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Black #02"               ,value = "action11",  desc =  "Trooper Black #02"              ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Black Rain #02"          ,value = "action12",  desc =  "Trooper Black Rain #02"         ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper SP Black #01"            ,value = "action13",  desc =  "Trooper SP Black #01"           ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper SP Black Rain #01"       ,value = "action14",  desc =  "Trooper SP Black Rain #01"      ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper SP Black #02"            ,value = "action15",  desc =  "Trooper SP Black #02"           ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper SP Black Rain #02"       ,value = "action16",  desc =  "Trooper SP Black Rain #02"      ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Blue #01"                ,value = "action17",  desc =  "Trooper Blue #01"               ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Blue Rain #01"	       ,value = "action18",  desc =  "Trooper Blue Rain #01"	      ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Blue #02"                ,value = "action19",  desc =  "Trooper Blue #02"               ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Blue Rain #02"           ,value = "action20",  desc =  "Trooper Blue Rain #02"          ,image='items/clothing_hat_000_police.png'},
        {label = "Harbor Guard #01"                ,value = "action21",  desc =  "Harbor Guard #01"               ,image='items/clothing_hat_000_police.png'},
        {label = "Harbor Guard Rain#01"            ,value = "action22",  desc =  "Harbor Guard Rain#01"           ,image='items/clothing_hat_000_police.png'},
        {label = "Harbor Guard #02"                ,value = "action23",  desc =  "Harbor Guard #02"               ,image='items/clothing_hat_000_police.png'},
        {label = "Harbor Guard Rain#02"            ,value = "action24",  desc =  "Harbor Guard Rain#02"           ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Southern Black #01"      ,value = "action25",  desc =  "Trooper Southern Black #01"     ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Southern Black Rain #01" ,value = "action26",  desc =  "Trooper Southern Black Rain #01",image='items/clothing_hat_000_police.png'},
        {label = "Trooper Southern Black #02"      ,value = "action27",  desc =  "Trooper Southern Black #02"     ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Southern Black Rain #02" ,value = "action28",  desc =  "Trooper Southern Black Rain #02",image='items/clothing_hat_000_police.png'},
        {label = "Trooper Southern Blue #01"       ,value = "action29",  desc =  "Trooper Southern Blue #01"      ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Southern Blue Rain #01"  ,value = "action30",  desc =  "Trooper Southern Blue Rain #01" ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Southern Blue #02"       ,value = "action31",  desc =  "Trooper Southern Blue #02"      ,image='items/clothing_hat_000_police.png'},
        {label = "Trooper Southern Blue Rain #02"  ,value = "action32",  desc =  "Trooper Southern Blue Rain #02" ,image='items/clothing_hat_000_police.png'},
        {label = "Sergeant #01"                    ,value = "action33",  desc =  "Sergeant #01"                   ,image='items/officer_police.png'},
        {label = "Sergeant Rain #01"               ,value = "action34",  desc =  "Sergeant Rain #01"              ,image='items/officer_police.png'},
        {label = "Sergeant #02"                    ,value = "action35",  desc =  "Sergeant #02"                   ,image='items/officer_police.png'},
        {label = "Sergeant Rain #02"               ,value = "action36",  desc =  "Sergeant Rain #02"              ,image='items/officer_police.png'},	
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