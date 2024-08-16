Config = {}

-- settings
Config.MinimumLawmen = 5 -- 抢劫所需的执法人员数量
Config.BankLockdown = 300 -- 银行锁定之前的秒数（300 = 5 分钟）
Config.BankCooldown = 259200 -- 银行再次被抢劫之前的时间（以秒为单位）（3600 = 1 小时）

-- lock bank doors
Config.VaultDoors = {
	1634148892, -- gate locked (no access)
	3142122679, -- backdoor locked (no access)
	2058564250, -- corridor door (use lockpick)
	3483244267, -- vault door (use dynamite)
}

-- set the item rewards
Config.RewardItems = {
    'goldbar', -- example
    'goldwatch', -- example
    'treasure1', -- example
}

-- set item rewards amount
Config.SmallRewardAmount = 1
Config.MediumRewardAmount = 2
Config.LargeRewardAmount = 3

-- set the money award given for large reward amount
Config.MoneyRewardType = 'cash' -- cash or bloodmoney
Config.MoneyRewardAmount = math.random(4000,6000) -- amount of money to give player

Config.HeistNpcs = {
	[1] = { ["Model"] = "RE_POLICECHASE_MALES_01", ["Pos"] = vector3(1298.1922, -1298.921, 77.028564 -1), ["Heading"] = 323.39672 },
	[2] = { ["Model"] = "RE_POLICECHASE_MALES_01", ["Pos"] = vector3(1291.1708, -1293.379, 76.439674 -1), ["Heading"] = 306.5007 },
	[3] = { ["Model"] = "RE_POLICECHASE_MALES_01", ["Pos"] = vector3(1278.746, -1311.409, 76.929656 -1), ["Heading"] = 141.41909 },
	[4] = { ["Model"] = "RE_POLICECHASE_MALES_01", ["Pos"] = vector3(1290.0343, -1304.887, 81.971908 -1), ["Heading"] = 140.40957 },
	[5] = { ["Model"] = "RE_POLICECHASE_MALES_01", ["Pos"] = vector3(1297.2199, -1304.808, 77.041122 -1), ["Heading"] = 65.686851 },
}

-- -1 DOORSTATE_INVALID,
-- 0 DOORSTATE_UNLOCKED,
-- 1 DOORSTATE_LOCKED_UNBREAKABLE,
-- 2 DOORSTATE_LOCKED_BREAKABLE,
-- 3 DOORSTATE_HOLD_OPEN_POSITIVE,
-- 4 DOORSTATE_HOLD_OPEN_NEGATIVE