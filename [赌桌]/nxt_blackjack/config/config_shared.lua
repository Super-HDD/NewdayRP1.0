-- 打印调试信息
_DEBUG = false

-- Polyzone 调试模式
isDebugActive = false

framework = "rsg" -- "redem" / "redem-2" / "vorp" / "custom"

language_selected = "en" -- "pt" / "en" / "other"

-- 庄家发牌的牌堆数量，一般为6
deck_cards_amount = 6

-- 生成自定义桌子的最小距离
distanceToRenderCustomTables = 20

-- 启用此选项以生成 CasinoShip
enableCasinoShip = ture

-- 等待所有玩家下注的时间
bettingTime = 50

-- 玩家决定行动的时间
moveTime = 30

-- 下注金额顺序
bettingNums = {
    1,
    2,
    
    5,
    10,
    
     20,
    
     50
}

-- 如果你想添加自定义的赌桌，只需按照下面的示例进行操作。
customTables = {
    {
		-- Table 1 on Casino ship
        coords = vec3(2871.983643, -1404.490356, 42.45),
		heading =  225.00,
		npcModel = "S_M_M_RHDDEALER_01",

		--这个方法使用卡片旋转，并且需要手动设置旋转角度，旋转角度的范围为-2.0到2.0之间。
		--需要手动测试每个表格的旋转角度的数值。
		propsRot = -0.65,

		tableModel = "p_tableblackjack01x",
		chairModel = "p_windsorchair03x",
	},
	{
		-- Table 2 on Casino ship
        coords = vec3(2876.241211, -1407.875977, 42.45),
		heading =  225.00,
		npcModel = "S_M_M_BLWDEALER_01",

		--这个方法使用卡片旋转，并且需要手动设置旋转角度，旋转角度的范围为-2.0到2.0之间。
		--需要手动测试每个表格的旋转角度的数值。
		propsRot = -0.65,

		tableModel = "bla_sal_int_blackjack001",
		chairModel = "p_windsorchair03x",
	},
	{
		-- Table 3 on Casino ship
        coords = vec3(2880.399414, -1411.261475, 42.45),
		heading =  225.00,
		npcModel = "S_M_M_VHTDEALER_01",

		--这个方法使用卡片旋转，并且需要手动设置旋转角度，旋转角度的范围为-2.0到2.0之间。
		--需要手动测试每个表格的旋转角度的数值。
		propsRot = -0.65,

		tableModel = "bla_sal_int_blackjack001",
		chairModel = "p_windsorchair03x",
	},
	{
		-- 海上赌船1-桌子1
        coords = vec3(3155.9338, -1382.7705, 45.2000),
		heading =  225.00,
		npcModel = "S_M_M_VHTDEALER_01",

		--这个方法使用卡片旋转，并且需要手动设置旋转角度，旋转角度的范围为-2.0到2.0之间。
		--需要手动测试每个表格的旋转角度的数值。
		propsRot = -0.65,

		tableModel = "bla_sal_int_blackjack001",
		chairModel = "p_windsorchair03x",
	},
	{
		-- 海上赌船1-桌子2
        coords = vec3(3152.9900, -1378.8390, 45.2000),
		heading =  225.00,
		npcModel = "S_M_M_VHTDEALER_01",

		--这个方法使用卡片旋转，并且需要手动设置旋转角度，旋转角度的范围为-2.0到2.0之间。
		--需要手动测试每个表格的旋转角度的数值。
		propsRot = -0.65,

		tableModel = "bla_sal_int_blackjack001",
		chairModel = "p_windsorchair03x",
	},
	{
		-- 海上赌船1-桌子3
        coords = vec3(3159.2510, -1379.4983, 45.2000),
		heading =  225.00,
		npcModel = "S_M_M_VHTDEALER_01",

		--这个方法使用卡片旋转，并且需要手动设置旋转角度，旋转角度的范围为-2.0到2.0之间。
		--需要手动测试每个表格的旋转角度的数值。
		propsRot = -0.65,

		tableModel = "bla_sal_int_blackjack001",
		chairModel = "p_windsorchair03x",
	},
	{
		-- 海上赌船1-桌子4
        coords = vec3(3155.9817, -1375.4952, 45.2000),
		heading =  225.00,
		npcModel = "S_M_M_VHTDEALER_01",

		--这个方法使用卡片旋转，并且需要手动设置旋转角度，旋转角度的范围为-2.0到2.0之间。
		--需要手动测试每个表格的旋转角度的数值。
		propsRot = -0.65,

		tableModel = "bla_sal_int_blackjack001",
		chairModel = "p_windsorchair03x",
	},
	
	
	
}    


-- 道具筹码投注
chipModels = {
	[1] = "prop_chip_white_x1",
	[2] = "prop_chip_white_x2",
	[5] = "prop_chip_white_x5",
	-- [4] = "prop_chip_white_x10",
	-- [5] = "prop_chip_green_x10",
	[10] = "prop_chip_green_x10",
	-- [15] = "prop_chip_pink_x10",
	-- [20] = "prop_chip_pink_x10",
	-- [25] = "prop_chip_red_x10",
	-- [30] = "prop_chip_red_x10",
	-- [35] = "prop_chip_black_x10",
	-- [40] = "prop_chip_black_x10",
	-- [50] = "prop_chip_all_x10",
	-- [100] = "prop_chip_all_x10",
}


--- DONT TOUCH HERE!!
if IsDuplicityVersion() then
	for i,v in pairs(customTables) do
		table.insert(tables, v)
	end
end
