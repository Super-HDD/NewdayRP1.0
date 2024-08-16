Config = {}

Config.VendorShops = {
    -- valentine
    {
        prompt = "val-sellshop",  -- must be unique
        header = "瓦伦丁杂货商人", -- menu header
        coords = vector3(-355.7784, 775.41345, 116.23655 -0.8), -- location of sell shop
        blip = { -- blip settings
            blipSprite = 'blip_shop_market_stall',
            blipScale = 0.2,
            blipName = "瓦伦丁杂货商人",
        },
        showblip = true,
        shopdata = { -- shop data
            {
                title = "面包",
                description = "卖面包",
                price = 0.03,
                item = "bread",
            image = "bread.png"
            },
            {
                title = "水",
                description = "卖水",
                price = 0.03,
                item = "water",
                image = "water.png"
            },
        },
    },
    -- mining vendor
    {
        prompt = "mining1-sellshop",  -- must be unique
        header = "矿业杂货商人", -- menu header
        coords = vector3(2435.36, -1511.59, 45.97), -- location of sell shop
        blip = { -- blip settings
            blipSprite = 'blip_shop_market_stall',
            blipScale = 0.2,
            blipName = "矿业杂货商人",
        },
        showblip = true,
        shopdata = { -- shop data
            {
                title = "铜",
                description = "卖铜",
                price = 1,
                item = "copper",
            image = "copper.png"
            },
            {
                title = "铝",
                description = "卖铝",
                price = 1,
                item = "aluminum",
                image = "aluminum.png"
            },
            {
                title = "铁",
                description = "卖铁",
                price = 1,
                item = "iron",
                image = "iron.png"
            },
            {
                title = "钢",
                description = "卖钢材",
                price = 1,
                item = "steel",
                image = "steel.png"
            },
        },
    },
        -- wood vendor
        {
            prompt = "wood1-sellshop",  -- must be unique
            header = "木材杂货商人", -- menu header
            coords = vector3(2417.8496, -1468.6090, 45.7387), -- location of sell shop
            blip = { -- blip settings
                blipSprite = 'blip_shop_market_stall',
                blipScale = 0.2,
                blipName = "木材杂货商人",
            },
            showblip = true,
            shopdata = { -- shop data
                {
                    title = "木材",
                    description = "卖木材",
                    price = 1,
                    item = "wood",
                    image = "wood.png"
                },
            },
    },
    -- guarma trade point
    {
        prompt = "guarma-sellshop",  -- must be unique
        header = "瓜玛商人", -- menu header
        coords = vector3(1284.16, -6871.74, 43.4), -- location of sell shop
        blip = { -- blip settings
            blipSprite = 'blip_shop_market_stall',
            blipScale = 0.2,
            blipName = "瓜玛商人",
        },
        showblip = true,
        shopdata = { -- shop data
            {
                title = "盒雪茄",
                description = "卖掉你的雪茄盒",
                price = 20,
                item = "cigarbox",
                image = "cigarbox.png"
            },
        },
    },

    {
        prompt = "shuiguo-sellshop",  -- must be unique
        header = "水果商人", -- menu header
        coords = vector3(-1674.0614, -350.0521, 174.1262), -- location of sell shop
        blip = { -- blip settings
            blipSprite = 'blip_shop_market_stall',
            blipScale = 0.2,
            blipName = "草莓镇水果商人",
        },
        showblip = true,
        shopdata = { -- shop data
            {
                title = "苹果",
                description = "卖掉你的苹果",
                price = 3,
                item = "apple",
                image = "apple.png"
            },
            {
                title = "香蕉",
                description = "卖掉你的香蕉",
                price = 3,
                item = "banana",
                image = "banana.png"
            },
            {
                title = "椰子",
                description = "卖掉你的椰子",
                price = 3,
                item = "coconut",
                image = "coconut.png"
            },
            {
                title = "猕猴桃",
                description = "卖掉你的猕猴桃",
                price = 3,
                item = "kiwi",
                image = "kiwi.png"
            },
            {
                title = "柠檬",
                description = "卖掉你的柠檬",
                price = 3,
                item = "lemon",
                image = "lemon.png"
            },
            {
                title = "芒果",
                description = "卖掉你的芒果",
                price = 3,
                item = "mango",
                image = "mango.png"
            },
            {
                title = "橘子",
                description = "卖掉你的橘子",
                price = 3,
                item = "orange",
                image = "orange.png"
            },
            {
                title = "香梨",
                description = "卖掉你的香梨",
                price = 3,
                item = "pear",
                image = "pear.png"
            },
            {
                title = "甜瓜",
                description = "卖掉你的甜瓜",
                price = 3,
                item = "melon",
                image = "melon.png"
            },
            {
                title = "菠萝",
                description = "卖掉你的菠萝",
                price = 3,
                item = "pineapple",
                image = "pineapple.png"
            },
        },
    },

}
