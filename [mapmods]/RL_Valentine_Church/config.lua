Config = {}

--- TELEPORTER ---
Config.Teleport 			= true

	Config.Prompt			= true										-- true = Prompt / false = DrawText
	Config.Key 				= 0xD9D0E1C0 								-- Key to use teleporter (Prompt & DrawText)

	Config.TextEnter		= '进去 '
	Config.TextExit			= '离开 '
	Config.TextRoom			= '瓦伦丁德林格纹福音教堂大厅 '
	Config.TextLibrary		= '圣凯文图书馆 '
	Config.TextCave			= '僧侣的地下小屋 '
	Config.ChurchName		= '~COLOR_BRONZE~ 瓦伦丁德林格纹福音大教堂'

	Config.AddText 			= '[空格]'								-- DrawText Additionnal
	Config.TextColor1		= {r =  80, g =  45, b =  26, a = 255}  	-- DrawText Color	
	Config.TextColor2		= {r = 200, g = 200, b = 200, a = 200}		-- DrawText Color (Additionnal Text)

	Config.Sound    		= true										-- Play sound door when you use teleporter
	Config.SyncSound 		= false										-- Sync sound door with other player					(Not Recommanded)

	Config.BoostLight   	= true										-- Better light effect									(Optionnal)

--- YMAP ---
Config.YmapManager			= true										-- Enable and Disable ymap when player use teleporter 	(Recommanded)

-- ROOM :
Config.room1 = {
	'val_church_room_interior',
	'val_church_room_base',
	'val_church_room_bench',
	'val_church_room_ground',
	'val_church_room_ground_candle',
	'val_church_room_light',
	'val_church_room_plant',
}

Config.room2 = {
	'val_church_library',
	'val_church_library_light',
}

Config.room3 = {
	'val_church_cave',
	'val_church_cave_light',
}


