Config = {}

Config.defaultlang = 'en'   -- Language

Config.Webhook = ''

-- Keys: https://github.com/femga/rdr3_discoveries/tree/master/Controls
-- Keys of the propmts to build
Config.KeyRight = 0x65F9EC5B    -- RIGHT ARROW
Config.KeyLeft = 0xAD7FCC5B -- LEFT ARROW
Config.KeyAhead = 0x911CB09E    -- UP ARROW
Config.KeyAback = 0x4403F97F    -- DOWN ARROW
Config.KeyUp = 0x1ECA87D4   -- Q
Config.KeyDown = 0x018C47CF -- E
Config.KeySpeed = 0x8AAA0AD4    -- LEFT ALT
Config.KeyMode = 0xA1ABB953 -- G
Config.KeyCancel = 0x156F7119   -- BACKSPACE
Config.KeyBuild = 0x43DBF61F    -- ENTER

-- Key for remove builds
Config.KeyDelBuild = 0x018C47CF -- E

-- Key for move builds
Config.KeyMoveBuild = 0x018C47CF -- E

Config.MoveBuildingCommand = 'movebuild'    -- 移动建筑命令
Config.DelBuildingCommand = 'delbuild'  -- 进入删除模式的命令
Config.ShareBuildingCommand = 'sharebuild'  -- 共享建筑命令
Config.DelShareBuildingCommand = 'delsharebuild'    -- 删除玩家共享建筑的命令

Config.TextColor = { r = 18, g = 133, b = 14 } -- Color of the text of the commands to move and delete, min = 0, max = 255

Config.Speeds = {   -- Building movement speeds
    0.5,
    1,
    2.5,
    4,
}

-- List of zones that cannot be built
Config.ZonesNotBuilding = {
    { coords = vector3(2941.61, 1346.21, 44.1), radius = 400.0 }, -- ANNESBURG
    { coords = vector3(1347.07, -1251.19, 79.17), radius = 400.0 }, -- RHODES
    { coords = vector3(3049.33, 508.34, 44.42), radius = 400.0 },   -- VAN HORN
    { coords = vector3(2615.95, -1222.37, 53.34), radius = 700.0 }, -- SAINT DENIS
    { coords = vector3(-282.13, 717.68, 114.32), radius = 400.0 }, -- VALENTINE
    { coords = vector3(-1809.37, -390.41, 161.61), radius = 300.0 }, -- STRAWBERRY
    { coords = vector3(-801.42, -1304.05, 43.48), radius = 300.0 }, -- BLACKWATER
    { coords = vector3(-3669.82, -2596.38, -14.32), radius = 400.0 },   -- ARMADILLO
    { coords = vector3(-5526.51, -2971.92, -1.4), radius = 400.0 },   -- TUMBLEWEED
}

-- Smoke color when building, removing and destroying
Config.SmokeEnable = true
Config.SmokeColor = { r = 79, g = 124, b = 0 }  -- RGB Color (min = 0, max = 255)

Config.Veg = {
    enable = true, -- 启用/禁用清除植被的功能
    radius = 5, -- 清除建筑物周围植被的半径
}

-- Key for open door
Config.OpenDoor = 0x760A9C6F -- G

-- List of objects that work as doors
Config.ObjectDoors = {
    -- { object = 'Name object model', lock = 'enable or disable that can be opened with a lockpick' },
	{ object = 'val_p_door_lckd_1' },
    { object = 's_clothingcasedoor01x' },
    { object = 's_door_val_bankvault' },
    { object = 'p_doornbd39x_destruct', lock = true },
}

-- Key for open chest
Config.OpenChest = 0x760A9C6F -- G

Config.Inventory = {
	Blacklist = {
		'opium',
		'WEAPON_SNIPERRIFLE_CARCANO',
	},
	MaxItems = {
		iron = 100,
		wood = 150,
	},
	DisableWeapons = false,
}

Config.LockpickItem = 'lockpick'    -- 获取物品时所需的物品名称和消耗的物品名称

Config.LockpickChest = true  -- enable/disable steal chests whit lockpick
Config.LockpickChestCommand = 'testigo Se ha visto a una persona ganzuar un cofre'  -- 'witness command' or false
Config.LockpickDoor = true  -- enable/disable open doors whit lockpick
Config.LockpickDoorCommand = 'testigo Se ha visto a una persona ganzuar una puerta'  -- 'witness command' or false

Config.LockpickJobsRequired = {
    enable = true,  -- enable/disable check jobs when using lock pick
    amount = 2, -- number of players with one of the required jobs from the list
    jobs = {    -- List of jobs required to use the lock pick
        'sheriff',
        'police',
    },
}

-- List of objects that work as chests
Config.ObjectChests = {
    -- { object = 'OBJECT MODEL NAME', capacity = 'CHEST CAPACITY', lock = 'enable or disable that can be opened with a lockpick' },
	{ object = 's_re_rcboatbox01x', capacity = 50 },
    { object = 'p_chest01x', capacity = 200 },
    { object = 's_lootablebedchest', capacity = 500, lock = true },
}

Config.BuildingsHealth = true   -- true/false Enable or disable the item health system
Config.RadioSeeHealth = 7   -- number (Radius to show the health of the objects) or false (Disable seeing health on objects)
Config.HealthColor = {  -- Health bar colors
    BackgroundBar = { r = 25, g = 25, b = 25 }, -- min = 0, max = 255
    Bar = { r = 0, g = 128, b = 0 },    -- min = 0, max = 255
}

Config.ZonesNotBuildingsHealth = {  -- Zones that players cannot destroy buildings
    { coords = vector3(1421.14, 322.07, 88.4), radius = 100.0 }, -- EMERALD RANCH
    { coords = vector3(-2376.92, -2391.35, 61.37), radius = 100.0 }, -- MACFARLANE'S RANCH
    { coords = vector3(456.11, 2230.73, 247.35), radius = 100.0 }, -- WAPITI INDIAN RESERVATION
    { coords = vector3(-1094.7, 722.21, 104.91), radius = 100.0 }, -- CATTAIL POND
}

Config.FreezeObjects = true -- true/false 启用或禁用某些物体的移动

Config.SpawnDistance = 180 -- 数值（物体创建和删除的距离）

-- 物品列表 [item = '物品名称', object = '物体模型名称', health = 物体健康值（true默认 1000 / false禁用生命系统 / 数值选择健康值数量）]

Config.ItemsBuilding = {
-- ===================== CHESTS ====================  
    { item = 'boatbox01', object = 's_re_rcboatbox01x', health = false },
    { item = 'chest01', object = 'p_chest01x', health = false },
    { item = 'lootchest', object = 's_lootablebedchest', health = false },

-- ===================== WALLS ====================  
    { item = 'plankwall2', object = 'p_plankwall_02', health = 6000 },
    { item = 'fencewall1', object = 'p_fence_wall01x', health = 6000 },
    { item = 'fencewall2', object = 'p_fence_wall02x', health = 6000 },
    { item = 'barricadewood', object = 'p_barricadewood_lrg01x', health = 10000 },
    { item = 'barricade', object = 'p_barricade03x', health = 10000 },
    { item = 'fortmercerbarricade', object = 'p_fortmercerbarricade01x', health = 12000 },
    { item = 'cornwindow', object = 'p_corn_uwindow_02', health = 6000 },
    { item = 'woodramp01', object = 'p_woodramp01x_sea', health = 6000 },

-- ===================== POSSE TENTS ====================  
    { item = 'possetentbountyhunter7', object = 'mp005_s_posse_tent_bountyhunter07x', health = 12000 },
    { item = 'possetentbountyhunter2', object = 'mp005_s_posse_tent_bountyhunter02x', health = 12000 },
    { item = 'possetentbountyhunter6', object = 'mp005_s_posse_tent_bountyhunter06x', health = 12000 },
    { item = 'possetentcollector4', object = 'mp005_s_posse_tent_collector04x', health = 12000 },

-- ===================== FURNITURES ==================== 
    { item = 'tablemil', object = 'p_cratetablemil01x', health = true },  
    { item = 'table11', object = 'p_table11x', health = true },
    { item = 'saloontable', object = 'p_cs_mtsaloontable', health = true },

    { item = 'chairrustic1', object = 'p_chairrusticsav01x', health = true },  
    { item = 'chairoffice2', object = 'p_chairoffice02x', health = true },
    { item = 'chairrustic5', object = 'p_chairrustic05x', health = true },
    { item = 'seatbench1', object = 'p_seatbench01x', health = true },
    { item = 'bench1', object = 'p_benchch01x', health = true },

    { item = 'bed10', object = 'p_bed10x', health = true },
    { item = 'bed12', object = 'p_bed12x', health = true },
    { item = 'bed01', object = 's_bedarthur01x', health = true },
    { item = 'bed21', object = 'p_bed21x', health = true },

-- ===================== DOORS ====================  
    { item = 'door1', object = 'val_p_door_lckd_1', health = 12000 },
    { item = 'casedoor', object = 's_clothingcasedoor01x', health = 20000 },
    { item = 'bankdoor', object = 's_door_val_bankvault', health = 12000 },
    { item = 'doornbd', object = 'p_doornbd39x_destruct', health = 4000 },
    
-- ===================== LIGHTS ====================  
    { item = 'torchpostal', object = 'p_torchpostalwayson01x', health = true },
    { item = 's_interact_torch', object = 's_interact_torch', health = true },
    { item = 'lamp', object = 'p_lampkerosene01xint', health = true },
    { item = 'lamphang', object = 'p_lamphangnbx01x', health = true },
    
-- ===================== OTHERS ==================== 
    { item = 'hitchingpost', object = 'p_hitchingpost01x', health = 6000 }, 
    { item = 'ladder1', object = 'p_beechers_ladder01x', health = 12000 },
    { item = 'waterpump', object = 'p_waterpump01x', health = 6000 },
    { item = 'campfirecombined', object = 'p_campfirecombined03x', health = false },
}
    
