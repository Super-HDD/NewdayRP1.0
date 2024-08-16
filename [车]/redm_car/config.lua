Config = {}
Config.framework = "qbr2" --"redemrp" or "redemrp-reboot" or "qbr" or "qbr2" or "vorp" | CHANGE THE SQL PATH IN FXMANIFEST TOO IF USING DIFFERENT THAN DEFAULT ("redemrp-reboot")
Config.VorpNotif = false 
Config.menuapi = "menu_base" --"redemrp_menu_base" or "menuapi"

Config.Textures = {
  cross = {"scoretimer_textures", "scoretimer_generic_cross"},
  locked = {"menu_textures","stamp_locked_rank"},
  tick = {"scoretimer_textures","scoretimer_generic_tick"},
  money = {"inventory_items", "money_moneystack"},
  alert = {"menu_textures", "menu_icon_alert"},
}


Config.Engine = 0x8AAA0AD4 -- LEFT ALT
Config.Headlight = 0x80F28E95 -- L
Config.Shop = 0x8AAA0AD4 -- LEFT ALT
Config.Horn = 0xF1301666 -- O

Config.WeirdSmokeAndSound = true

Config.SpawnCommand = true 
Config.Command = "spawn_motor"
Config.DeleteCommand = "motor_delete"
Config.ResetCommand = "motor_reset"

Config.NativeHUD = true

Config.CarSpawns = {
    {pos = {2454.492, -1319.561, 45.433}, spawn = {x = 2447.080, y = -1321.614, z = 45.405, h = 95.208}, 
    --job = {"mechanic"}, 
    job = {"lbzf"}, 
    name = "Car Mechanic"}
}

Config.Carmodels = {
  [GetHashKey("fjordmodeltea")] = {model = GetHashKey("fjordmodeltea"), price = 999999999, attach = {0.0, -0.22, -0.83, 0.0, 0.0, 90.0}, name = "Fjord Model Tea"},
  --[GetHashKey("btype3")] = {model = GetHashKey("btype3"), price = 1000, attach = {0.0, -0.22, -0.83, 0.0, 0.0, 90.0}, name = "Roosevelt Revolver"},
}

Config.Upgrades = {
  [1] = {label = "Engine I",   value = "engine", value2 = 1, desc = "Engine Level 1", price = 100},
  [2] = {label = "Engine II",  value = "engine", value2 = 2, desc = "Engine Level 2", price = 200},
  [3] = {label = "Engine III", value = "engine", value2 = 3, desc = "Engine Level 3", price = 300},
  [4] = {label = "Engine IV",  value = "engine", value2 = 4, desc = "Engine Level 4", price = 400},
  [5] = {label = "Engine V",   value = "engine", value2 = 5, desc = "Engine Level 5", price = 500},
  [6] = {label = "Engine VI",  value = "engine", value2 = 6, desc = "Engine Level 6", price = 600},
}

Config.Texts = {
  Cars = "汽车",
  Spawn = "部署汽车",
  SpawnD = "生成购买的汽车",
  BuyThis = "购买此型号",
  Upgrade = "提升汽车属性",
  UpgradeD = "为您的汽车购买升级",
  Upgrades = "改装汽车",
  BuyThis2 = "购买此升级",
  CarDealer = "汽车代理商",
  NoMoney = "你没有足够的钱!",
  NoJob = "您没有所需的工作!",
  BetterEngine = "你的车里有更好的发动机!",
  Car = "教练",
  AlreadySpawned = "你已经生成了汽车!",
  FarAway = "车太远了!",
  NotSpawned = "汽车未生成!",
  AlreadyHave = "你已经有一辆车了!",
  NoCar = "你没有车！",
  BuyPrevious = "你必须提高以前的水平!",
  UpgradePurchased = "已购买升级!",
  CarPurchased = "买了车!",
  }

Config.maxspeeds = {
  [1] = {v1 = 6.8, v2 = 5.4, r1 = -3.5, r2 = -2.0},
  [2] = {v1 = 9.8, v2 = 8.5, r1 = -4.5, r2 = -3.0},
  [3] = {v1 = 11.8, v2 = 8.9, r1 = -4.5, r2 = -3.0},
  [4] = {v1 = 14.8, v2 = 11.5, r1 = -6.5, r2 = -3.8},
  [5] = {v1 = 19.9, v2 = 17.5, r1 = -6.5, r2 = -3.8},
  [6] = {v1 = 22.9, v2 = 19.5, r1 = -6.5, r2 = -3.8},
}