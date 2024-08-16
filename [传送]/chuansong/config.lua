-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = true -- 检查更新？

Config.Elevators = {
    PillboxElevatorNorth = { -- Elevator name(Doesn't show it's just to name table)
        -- [1] = {
        --     coords = vec3(2659.69, -1151.07, 49.94), -- Coords, if you're new; last number is heading
        --     heading = 311.01, -- Heading of how will spawn on floor
        --     title = '圣丹尼斯艾丁格酒厂办事处', -- Title 
        --     description = '出去', -- Description
        --     target = { -- 目标长度/宽度
        --         width = 5,
        --         length = 10
        --     },
            
        -- },
        -- [2] = {
        --     coords = vec3(2656.47, -1152.61, 29.98), -- Coords, if you're new; last number is heading
        --     heading = 140.66,
        --     title = '圣丹尼斯艾丁格酒厂办事处',
        --     description = '进入',
        --     target = {
        --     width = 5,
        --     length = 10
        --     } -- Example without group
        -- },
    },

    jiuChang = { -- Elevator name(Doesn't show it's just to name table)
        -- [1] = {
        --     coords = vec3(2691.2134, -858.8030, 42.3723), -- Coords, if you're new; last number is heading
        --     heading = 22.7607, -- Heading of how will spawn on floor
        --     title = '艾丁格酒厂生产基地', -- Title 
        --     description = '出去', -- Description
        --     target = { -- Target length/width
        --         width = 5,
        --         length = 10
        --     },
        --     groups = {-- Job locks
        --         'aidingge',    
        --     },
        -- },
        -- [2] = {
        --     coords = vec3(2683.5991, -856.9782, 22.3127), -- Coords, if you're new; last number is heading
        --     heading = 291.7952,
        --     title = '艾丁格酒厂生产基地',
        --     description = '进入',
        --     target = {
        --     width = 5,
        --     length = 10
        --     }, -- Example without group，
        --     groups = {-- Job locks
        --     'aidingge',
            
        -- },
        -- },
    },

    HeiShuiYanCao = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(-791.49, -1313.38, 43.57), -- Coords, if you're new; last number is heading
            heading = 22.7607, -- Heading of how will spawn on floor
            title = '黑水镇烟草行', -- Title 
            description = '离开黑水镇烟草行', -- Description
            target = { -- 目标长度/宽度
                width = 5,
                length = 10
            },
        },
        [2] = {
            coords = vec3(-789.07, -1313.29, 43.65), -- Coords, if you're new; last number is heading
            heading = 291.7952,
            title = '黑水镇烟草行',
            description = '进入黑水镇烟草行',
            target = { -- 目标长度/宽度
                width = 5,
                length = 10
        },
        },
    },

    yewaixiaowu01 = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(747.93,1823.86,239.20), -- Coords, if you're new; last number is heading
            heading = 22.7607, -- Heading of how will spawn on floor
            title = '荒野猎人小屋', -- Title 
            description = '进入荒野猎人小屋', -- Description
            target = { -- 目标长度/宽度
                width = 5,
                length = 10
            },
        },
        [2] = {
            coords = vec3(745.42,1827.42,238.44), -- Coords, if you're new; last number is heading
            heading = 291.7952,
            title = '荒野猎人小屋',
            description = '离开荒野猎人小屋',
            target = { -- 目标长度/宽度
                width = 5,
                length = 10
        },
        },
    },
  
    sdnsmedic01 = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(2730.8672, -1233.3719, 50.3704), -- Coords, if you're new; last number is heading
            heading = 22.7607, -- Heading of how will spawn on floor
            title = '圣丹尼斯诊所', -- Title 
            description = '离开圣丹尼斯诊所前台', -- Description
            target = { -- 目标长度/宽度
                width = 5,
                length = 10
            },
        },
        [2] = {
            coords = vec3(2728.8699, -1234.6360, 50.3778), -- Coords, if you're new; last number is heading
            heading = 291.7952,
            title = '圣丹尼斯诊所',
            description = '进入圣丹尼斯诊所前台',
            target = { -- 目标长度/宽度
                width = 5,
                length = 10
        },
        },
    },


    caomeidongwu = { -- Elevator name(Doesn't show it's just to name table)
        [1] = {
            coords = vec3(-1681.8771, -340.3735, 173.9464), -- Coords, if you're new; last number is heading
            heading = 22.7607, -- Heading of how will spawn on floor
            title = '草莓镇宠物商店', -- Title 
            description = '进入草莓镇宠物商店', -- Description
            target = { -- 目标长度/宽度
                width = 5,
                length = 10
            },
        },
        [2] = {
            coords = vec3(-1683.5568, -342.6472, 173.8850), -- Coords, if you're new; last number is heading
            heading = 291.7952,
            title = '草莓镇宠物商店',
            description = '离开草莓镇宠物商店',
            target = { -- 目标长度/宽度
                width = 5,
                length = 10
        },
        },
    },

    sd_duchuang_sea01 = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(3146.1870, -1386.6471, 42.3464), -- Coords, if you're new; last number is heading
        heading = 131.4939, -- Heading of how will spawn on floor
        title = '圣丹尼斯红浪漫海上赌坊', -- Title 
        description = '登上圣丹尼斯红浪漫海上赌船', -- Description
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
    },
    [2] = {
        coords = vec3(2533.5369, -1563.7245, 45.9694), -- Coords, if you're new; last number is heading
        heading = 359.4100,
        title = '圣丹尼斯红浪漫海上赌坊',
        description = '离开圣丹尼斯红浪漫海上赌船',
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
        },
    },

    sd_jiaotang01 = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(2748.1169, -1264.9501, 31.2583), -- Coords, if you're new; last number is heading
        heading = 51.2361, -- Heading of how will spawn on floor
        title = '圣丹尼斯黑山羊大教堂', -- Title 
        description = '进入圣丹尼斯黑山羊大教堂', -- Description
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
    },
    [2] = {
        coords = vec3(2763.8430, -1279.6757, 48.0007), -- Coords, if you're new; last number is heading
        heading = 55.0296,
        title = '圣丹尼斯黑山羊大教堂',
        description = '离开圣丹尼斯黑山羊大教堂',
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
        },
    },

    sd_jiaotang02 = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(2778.0474, -1271.3960, 25.0050), -- Coords, if you're new; last number is heading
        heading = 135.8822, -- Heading of how will spawn on floor
        title = '圣丹尼斯黑山羊大教堂秘密地下室', -- Title 
        description = '进入圣丹尼斯黑山羊大教堂秘密地下室', -- Description
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
    },
    [2] = {
        coords = vec3(2725.4272, -1057.7734, 47.4910), -- Coords, if you're new; last number is heading
        heading = 339.6596,
        title = '圣丹尼斯黑山羊大教堂秘密地下室',
        description = '离开圣丹尼斯黑山羊大教堂秘密地下室',
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
        },
    },

    sd_quanji01 = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(3922.8999, -1695.7855, 50.1750), -- Coords, if you're new; last number is heading
        heading = 9.2228, -- Heading of how will spawn on floor
        title = '圣丹尼斯赤血地下拳击馆', -- Title 
        description = '进入圣丹尼斯赤血地下拳击馆前门', -- Description
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
    },
    [2] = {
        coords = vec3(2777.7007, -1314.4872, 46.5624), -- Coords, if you're new; last number is heading
        heading = 232.6708,
        title = '圣丹尼斯赤血地下拳击馆',
        description = '离开圣丹尼斯赤血地下拳击馆',
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
        },
    },

    sd_quanji02 = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(3970.4360, -1716.5760, 36.2592), -- Coords, if you're new; last number is heading
        heading = 347.3001, -- Heading of how will spawn on floor
        title = '圣丹尼斯赤血地下拳击馆正门', -- Title 
        description = '进入圣丹尼斯赤血地下拳击馆正门', -- Description
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
    },
    [2] = {
        coords = vec3(3922.8337, -1699.5184, 50.1750), -- Coords, if you're new; last number is heading
        heading = 179.6688,
        title = '圣丹尼斯赤血地下拳击馆正门',
        description = '离开圣丹尼斯赤血地下拳击馆正门',
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
        },
    },

    heishuifayuan = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(-756.4321, -1174.7474, 23.8295), -- Coords, if you're new; last number is heading
        heading = 82.4728, -- Heading of how will spawn on floor
        title = '黑水镇法院', -- Title 
        description = '进入黑水镇法院', -- Description
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
    },
    [2] = {
        coords = vec3(-798.6459, -1202.5034, 44.1436), -- Coords, if you're new; last number is heading
        heading = 359.9893,
        title = '黑水镇法院',
        description = '离开黑水镇法院',
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
        },
    },


    
    yancaogongchang = { -- Elevator name(Doesn't show it's just to name table)
    [1] = {
        coords = vec3(2317.3450, -1420.2762, 46.9140), -- Coords, if you're new; last number is heading
        heading = 358.4072, -- Heading of how will spawn on floor
        title = '烟草公司工厂', -- Title 
        description = '进入烟草公司工厂', -- Description
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        },
        groups = {-- Job locks
        'hsyancao',
            
        },
    },
    [2] = {
        coords = vec3(2317.1687, -1419.0427, 46.6239), -- Coords, if you're new; last number is heading
        heading = 185.1634,
        title = '烟草公司工厂',
        description = '离开烟草公司工厂',
        target = { -- 目标长度/宽度
            width = 5,
            length = 10
        }, -- Example without group，
        groups = {-- Job locks
        'hsyancao',
        
    },
    },
},
    

    
}


