Config = {}

Config.BPOCopyTime = 30000

------------------------------
Config.ShovelCopyCost = 1       -- 每个复制品的成本
Config.ShovelRepRequired = 0    -- 需要的制作声望
Config.ShovelCraftTime = 30000  -- 制作物品所需的时间
------------------------------
Config.AxeCopyCost = 1          -- 每个复制品的成本
Config.AxeRepRequired = 0       -- 需要的制作声望
Config.AxeCraftTime = 30000     -- 制作物品所需的时间
------------------------------
Config.PickAxeCopyCost = 1      -- 每个复制品的成本
Config.PickAxeRepRequired = 0   -- 需要的制作声望
Config.PickAxeCraftTime = 30000 -- 制作物品所需的时间
------------------------------

-- blueprint original shop items
Config.InvensionShop = {
    [1] = { name = "bposhovel",  price = 500, amount = 1, info = {}, type = "item", slot = 1, }, -- crafting level 0
    [2] = { name = "bpoaxe",     price = 500, amount = 1, info = {}, type = "item", slot = 2, }, -- crafting level 0
    [3] = { name = "bpopickaxe", price = 500, amount = 1, info = {}, type = "item", slot = 3, }, -- crafting level 0
}

-- blueprint original shope locations
Config.InvensionShopLocations = {
    {name = '大发明家商店', location = 'invension-shop1', coords = vector3(2516.7561, 2285.0756, 177.35156), showblip = false, showmarker = true},
}

-- crafting locations
Config.CraftingLocations = {
    {name = '制作', location = 'crafting-valentine',  coords = vector3(-369.44, 796.08, 116.2),          showblip = false, showmarker = true},
    {name = '制作', location = 'crafting-macfarlane', coords = vector3(-2396.77, -2378.013, 61.259555),  showblip = false, showmarker = true},
    {name = '制作', location = 'crafting-tumbleweed', coords = vector3(-5515.188, -3039.042, -2.387692), showblip = false, showmarker = true},
    {name = '制作', location = 'crafting-stdenis',    coords = vector3(2515.6494, -1456.475, 46.312046), showblip = false, showmarker = true},
    {name = '制作', location = 'crafting-rhodes',     coords = vector3(1310.8607, -1354.886, 78.023361), showblip = false, showmarker = true},
    {name = '制作', location = 'crafting-blackwater', coords = vector3(-878.9779, -1368.06, 43.526493),  showblip = false, showmarker = true},
    {name = '制作', location = 'crafting-annesburg',  coords = vector3(2982.2646, 1433.3532, 44.759983), showblip = false, showmarker = true},
}
