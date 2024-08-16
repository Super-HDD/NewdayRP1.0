Config = {}

Config.RicXDog = true

Config.MenuJob = {"farmer", "lbzf"} --for no job: Config.MenuJob = false

Config.LevelXPs = {
    [1] = {max = 50, min = 0},
    [2] = {max = 100, min = 51},
    [3] = {max = 150, min = 101},
    [4] = {max = 200, min = 151},
    [5] = {max = 250, min = 201},
    [6] = {max = 300, min = 251},
    [7] = {max = 350, min = 301},
    [8] = {max = 400, min = 351},
    [9] = {max = 450, min = 401},
    [10] = {max = 500, min = 451},
    [11] = {max = 550, min = 501},
    [12] = {max = 600, min = 551},
    [13] = {max = 650, min = 601},
    [14] = {max = 700, min = 651},
    [15] = {max = 10000000, min = 701},
}


Config.AnimalLevel = {
    [1] = {
        ["Scale"] = 0.5,
        ["MoneyOdds"] = 0.1,
        ["Items"] = {--add ["Items"] array like example to any Level for item reward instead money, make sure to define animal model
        [`a_c_chicken_01`] = {{item = "chicken_egg", label = "Chicken egg", amount = 1}, {item = "chicken_meat", label = "Chicken Meat", amount = 1}},
        [`a_c_rooster_01`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
        [`a_c_turkey_01`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
        [`a_c_rabbit_01`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
        [`a_c_goat_01`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
        [`a_c_pig_01`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
        [`a_c_sheep_01`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
        [`a_c_cow`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
        [`a_c_ox_01`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
        [`a_c_bull_01`] = {{item = "item", label = "Item (1)", amount = 1}, {item = "item", label = "Item (2)", amount = 1}},
            --add here more animals with items like chicken example
        }
    },
    [2] = {
        ["Scale"] = 0.55,
        ["MoneyOdds"] = 0.2,
    },
    [3] = {
        ["Scale"] = 0.6,
        ["MoneyOdds"] = 0.3,
    },
    [4] = {
        ["Scale"] = 0.65,
        ["MoneyOdds"] = 0.4,
    },
    [5] = {
        ["Scale"] = 0.7,
        ["MoneyOdds"] = 0.5,
    },
    [6] = {
        ["Scale"] = 0.75,
        ["MoneyOdds"] = 0.6,
    },
    [7] = {
        ["Scale"] = 0.8,
        ["MoneyOdds"] = 0.7,
    },
    [8] = {
        ["Scale"] = 0.85,
        ["MoneyOdds"] = 0.8,
    },
    [9] = {
        ["Scale"] = 0.9,
        ["MoneyOdds"] = 0.9,
    },
    [10] = {
        ["Scale"] = 0.95,
        ["MoneyOdds"] = 1.1,
    },
    [11] = {
        ["Scale"] = 1.0,
        ["MoneyOdds"] = 1.3,
    },
    [12] = {
        ["Scale"] = 1.05,
        ["MoneyOdds"] = 1.5,
    },
    [13] = {
        ["Scale"] = 1.15,
        ["MoneyOdds"] = 1.7,
    },
    [14] = {
        ["Scale"] = 1.2,
        ["MoneyOdds"] = 2.0,
    },
    [15] = {
        ["Scale"] = 1.25,
        ["MoneyOdds"] = 2.2,
    },
}

Config.Options = {
    OpenText = "打开",
    ["ControlKey"] = 0xD8F73058, -- [U] for shop
    ["MaxAnimals"] = 10,
    ["AnimalControls"] = {
        ["Graze"] = {'吃草', 0x05CA7C52},
        ["Follow"] = {'跟随', 0xA65EBAB4},
        ["Home"] = {'回家', 0x6319DB71},
        ["Herd"] = {'驱赶', 0xDEB34313},
    },
    ["BlipEnable"] = true,
    ["ShopBlipName"] = "牧场商店",
    ["ShopBlipSprite"] =  -1733535731,
    ["ButcherySprite"] = -1852063472,
    ["GrazeTime"] = 20, --seconds for grazing function. Animal gets xp after finishing grazeing
    ["GrazeXP"] = 5,
    ["GrazeXPs"] = {
        ["Bull"] = 1,
        ["Ox"] = 1,
        ["Chicken"] = 20,
        ["Cow"] = 1,
        ["Goat"] = 10,
        ["Sheep"] = 10,
        ["Pig"] = 10,
        ["Rooster"] = 20,
        ["Turkey"] = 10,
        ["Rabbit"] = 15,
    },
    ["Messages"] = {
        ["AnimalSpawned"] = "你的动物已经出生了！",
        ["AnimalHere"] = "你的动物已经出生。",
        ["AnimalGrazing"] = "你的动物已经在吃草！",
        ["AnimalBusy"] = "你的动物正在忙碌！",
        ["GrazeError"] = "动物不能在城镇和城市里吃草！",
        ["AnimalHome"] = "你把你的动物送回家了！",
        ["AnimalSold"] = "你卖掉了一只动物！",
        ["NoAnimal"] = "在屠宰场附近没有动物！",
        ["BoughtAnimal"] = "你买了一只动物！",
        ["NoMoney"] = "你没有钱！",
        ["AnimalShop"] = "动物商店",
        ["NoJob"] = "你没有所需的工作！",
        ["RicXDogs"] = {
            ["GuardSuccess"] = "你的动物吃草结束并重新开始，因为你的狗很有技巧！",
            ["FinishedGraze"] = "你的动物吃草结束，开始漫游！",
            ["GuardFail"] = "你的动物吃草结束。~n~你的狗不擅长守卫，动物正在漫游。",
        },
    },
    ["MenuTexts"] = {
        ["Butchery"] = "屠宰场",
        ["SellSubText"] = "出售动物",
        ["SellBtn"] = "出售",
        ["Title"] = "农场动物",
        ["SubText"] = "选项",
        ["OwnedAnimals"] = "拥有的动物",
        ["OwnedDesc"] = "你的动物",
        ["Chickens"] = "鸡",
        ["Roosters"] = "公鸡",
        ["Turkeys"] = "火鸡",
        ["Rabbits"] = "兔子",
        ["Goats"] = "山羊",
        ["Pigs"] = "猪",
        ["Sheeps"] = "绵羊",
        ["Cows"] = "牛",
        ["Bulls"] = "公牛",
    },
    ["MenuOptions"] = {
        ["ChooseAnimal"] = "选择",
        ["ChooseAnimalSub"] = "选择你的动物",
        ["DeleteAnimal"] = "删除",
        ["DeleteAnimalSub"] = "删除你的动物",
        ["Chickens"] = {
            [1] = "莱格霍恩鸡",
            [2] = "多米尼克鸡",
            [3] = "爪哇鸡",
        },
        ["Roosters"] = {
            [1] = "多米尼克公鸡",
            [2] = "爪哇公鸡",
        },
        ["Turkeys"] = {
            [1] = "火鸡",
        },
        ["Rabbits"] = {
            [1] = "灰兔",
            [2] = "兔子",
            [3] = "白兔",
        },
        ["Goats"] = {
            [1] = "白色阿尔卑斯山山羊",
            [2] = "黑色阿尔卑斯山山羊",
        },
        ["Pigs"] = {
            [1] = "中国猪",
            [2] = "伯克希尔猪",
            [3] = "老斑点猪",
        },
        ["Sheep"] = {
            [1] = "灰色羊",
            [2] = "白羊",
            [3] = "黑羊",
        },
        ["Cows"] = {
            [1] = "奶牛（棕白色）",
            [2] = "奶牛（深棕色）",
            [3] = "奶牛（棕白色）",
            [4] = "奶牛（浅色）",
            [5] = "奶牛（黑白色）",
            [6] = "奶牛（白棕色）",
            [7] = "奶牛（黑白色）",
            [8] = "奶牛（浅色）",
            [9] = "奶牛（白黑色）",
            [10] = "奶牛（黑白色）",
            [11] = "奶牛（白化病变）",
            [12] = "奶牛（深棕色）",
            [13] = "奶牛（黑色）",
        },
        ["Bulls"] = {
            [1] = "德文阉牛",
            [2] = "安格斯阉牛",
            [3] = "赫里福德公牛",
            [4] = "德文公牛",
            [5] = "安格斯公牛",
        },
    },
}


Config.AnimalShops = {
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=-267.862, y=649.469, z=112.448, enabled = true}, --valentine 
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=1425.027, y=-1301.340, z=76.73, enabled = true},-- rhodes
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=1434.978, y=270.945, z=89.217, enabled = true},-- emerald
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=-1818.062, y=-584.705, z=154.953, enabled = true},-- strawberry
    { name = Config.Options.ShopBlipName, sprite = Config.Options.ShopBlipSprite, x=-2399.422, y=-2442.643, z=59.171, enabled = true},-- mcfarlane
}

Config.Butcheries = {
    { name = Config.Options.MenuTexts.Butchery, sprite = Config.Options.ButcherySprite, x=2148.404, y=-1301.273, z=42.624, enabled = true},
    { name = Config.Options.MenuTexts.Butchery, sprite = Config.Options.ButcherySprite, x=583.166, y=1666.126, z=185.250, enabled = true}, 
    { name = Config.Options.MenuTexts.Butchery, sprite = Config.Options.ButcherySprite, x=-957.262, y=-1314.851, z=49.550, enabled = true}, 
    { name = Config.Options.MenuTexts.Butchery, sprite = Config.Options.ButcherySprite, x=-1446.658, y=-2301.603, z=42.268, enabled = true}, 
}


Config.AnimalPrices = {
    [1] = 30,
    [2] = 30, 
    [3] = 30,
    [4] = 30,
    [5] = 30,
    [6] = 30,
    [7] = 30,
    [8] = 30,
    [9] = 35,
    [10] = 60,
    [11] = 60,
    [12] = 60,
    [13] = 60,
    [14] = 60,
    [15] = 60,
    [16] = 60,
    [17] = 60,
    [18] = 90,
    [19] = 90,
    [20] = 90,
    [21] = 90,
    [22] = 90,
    [23] = 90,
    [24] = 90,
    [25] = 90,
    [26] = 90,
    [27] = 90,
    [28] = 90,
    [29] = 90,
    [30] = 90,
    [31] = 100,
    [32] = 100,
    [33] = 100,
    [34] = 100,
    [35] = 100,
}