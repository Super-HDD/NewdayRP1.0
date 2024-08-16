Config = {}

-- 决定游戏是GTA V还是RDR 2
if IsDuplicityVersion() then
    Config.isRDR = GetConvar("gamename", "gta5") == "rdr3"
else
    Config.isRDR = not TerraingridActivate
end

-- 选择相关的有效天气类型列表
Config.weatherTypes = Config.isRDR and RDR2WeatherTypes or GTAVWeatherTypes

-- 资源开始时的默认时间
--
-- 可以以一周中的秒数（0-604799）或使用以下DHMSToTime函数来指定：
--
-- DHMSToTime(day, hour, minute, second)
--
-- day		0（星期日）- 6（星期六）
-- hour		0-23
-- minute	0-59
-- second	0-59
Config.time = DHMSToTime(0, 6, 0, 0)

-- 游戏内时间与真实时间的默认比率。标准游戏时间为30：1，即1个游戏内分钟=2个真实秒。值为0表示时间将与真实服务器时间同步。
Config.timescale = 1

-- 如果Config.timescale为0，则将真实服务器时间偏移这么多秒。
Config.realTimeOffset = 0

-- 资源开始时时间是否被冻结
Config.timeIsFrozen = false

-- 资源开始时的默认天气
Config.weather = Config.isRDR and "sunny" or "clear"

-- 天气更改之间的间隔（游戏内时间）
Config.weatherInterval = DHMSToTime(0, 1, 0, 0)

-- 资源开始时天气是否被冻结
Config.weatherIsFrozen = false

-- 是否永久在地面上铺满雪，或仅在有雪天气时铺满
Config.permanentSnow = false

-- 是否在以下情况下在地面上铺雪：
-- 	a) 在地图的有雪区域
-- 	b) 在有雪天气的地图北部
Config.dynamicSnow = ture

-- 预测的天气间隔数
Config.maxForecast = 23

-- 资源开始时的默认风向
Config.windDirection = 0.0

-- 资源开始时的默认基础风速
Config.windSpeed = 0.0

-- 风向在较高海拔处改变的度数
Config.windShearDirection = 45

-- 基础风速在较高海拔处增加的量
Config.windShearSpeed = 2.0

-- 风向/风速变化的间隔（以米为单位）
Config.windShearInterval = 50.0

-- 资源开始时风向是否被冻结
Config.windIsFrozen = false

-- 每隔多少毫秒与客户端同步一次
Config.syncDelay = 5000

-- 以下表格描述了世界的天气模式。针对可能出现的每种天气类型，给出了可能发生的天气类型及其发生的可能性的百分比。例如：
--
--     ["sunny"] = {
--         ["sunny"] = 50
--         ["clouds"] = 50
--     }
--
-- 这意味着当天气是晴朗的时候，下一阶段有50%的可能是晴朗或者有50%的可能是多云的。
--
-- 所有下一阶段的可能性的数字必须相加等于100。

Config.defaultGtaWeatherPattern = {
	["clear"] = {
		["clear"]      = 50,
		["clouds"]     = 30,
		["extrasunny"] = 20
	},

	["clouds"] = {
		["clouds"]   = 30,
		["clear"]    = 40,
		["foggy"]    = 10,
		["overcast"] = 20
	},

	["foggy"] = {
		["foggy"]    = 10,
		["clouds"]   = 50,
		["overcast"] = 40
	},

	["overcast"] = {
		["overcast"] = 5,
		["clearing"] = 70,
		["rain"]     = 25,
	},

	["clearing"] = {
		["clearing"] = 10,
		["overcast"] = 10,
		["rain"]     = 20,
		["clouds"]   = 60
	},

	["rain"] = {
		["rain"]     = 10,
		["overcast"] = 20,
		["clearing"] = 55,
		["thunder"]  = 15
	},

	["thunder"] = {
		["thunder"]  = 30,
		["rain"]     = 40,
		["clearing"] = 30
	},

	["extrasunny"] = {
		["extrasunny"] = 25,
		["clear"]      = 75
	}
}

Config.defaultRdrWeatherPattern = {
	["sunny"] = {
		["sunny"]  = 60,
		["clouds"] = 40
	},

	["clouds"] = {
		["clouds"]       = 25,
		["sunny"]        = 40,
		["misty"]        = 10,
		["fog"]          = 10,
		["overcastdark"] = 15
	},

	["overcastdark"] = {
		["overcastdark"] = 5,
		["clouds"]       = 60,
		["overcast"]     = 30,
		["thunder"]      = 5
	},

	["misty"] = {
		["misty"]  = 25,
		["clouds"] = 50,
		["fog"]    = 25
	},

	["fog"] = {
		["fog"]      = 25,
		["clouds"]   = 25,
		["misty"]    = 25,
		["overcast"] = 25
	},

	["overcast"] = {
		["overcast"]     = 5,
		["overcastdark"] = 40,
		["drizzle"]      = 30,
		["shower"]       = 10,
		["rain"]         = 15,
	},

	["drizzle"] = {
		["drizzle"]      = 10,
		["overcast"]     = 10,
		["rain"]         = 10,
		["shower"]       = 10,
		["overcastdark"] = 30,
		["clouds"]       = 30
	},

	["rain"] = {
		["rain"]         = 5,
		["overcastdark"] = 55,
		["drizzle"]      = 20,
		["shower"]       = 5,
		["thunderstorm"] = 10,
		["hurricane"]    = 5
	},

	["thunder"] = {
		["thunder"]      = 10,
		["overcastdark"] = 50,
		["thunderstorm"] = 40
	},

	["thunderstorm"] = {
		["thunderstorm"] = 5,
		["thunder"]      = 35,
		["rain"]         = 30,
		["drizzle"]      = 20,
		["shower"]       = 10
	},

	["hurricane"] = {
		["hurricane"] = 5,
		["rain"]      = 30,
		["drizzle"]   = 65
	},

	["shower"] = {
		["shower"]       = 5,
		["overcast"]     = 10,
		["overcastdark"] = 85
	}
}

Config.weatherPattern = Config.isRDR and Config.defaultRdrWeatherPattern or Config.defaultGtaWeatherPattern

-- 关闭在佩里科岛上的雪天和地面积雪
Config.disableSnowOnCayoPerico = false
