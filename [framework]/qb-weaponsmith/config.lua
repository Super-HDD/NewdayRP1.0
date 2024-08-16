Config = {}

-- debug
Config.Debug = true

-- settings
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 1000

-- 通用武器店配置

-- blip settings
Config.WeaponCraftingPoint = {

    ['weaponsmith-saint']={   -- 圣丹尼斯武器铺 
        name='圣丹尼斯红色左轮枪械铺',
        prompt = 'weaponsmith-saint',
        job = 'stdenisweaponsmith',
        coords = vector3(2709.7432, -1285.9431, 49.5804), 
        showblip = true, 
        showmarker = true,
        AvilableParts= 'all',
        AvilableRevlover= {
            'weapon_revolver_cattleman',
            'weapon_revolver_cattleman_mexican',
            'weapon_pistol_volcanic',
        },
        AvilableRepeater={
            'weapon_repeater_carbine',
        },
        AvilableShotgun={
            -- 'weapon_shotgun_doublebarrel',
        },
        AvilableRifle= 'all',
        AvilableTools= {
            'weapon_lasso',
            'weapon_melee_knife',
            'cleankit',
        },
        AvilableAmmo='all',
    },

    ['weaponsmith-valentine']={   -- 瓦伦丁武器铺 
        name='瓦伦丁丹尼牛根枪械铺',
        prompt = 'weaponsmith-valentine',
        job = 'valweaponsmith',
        coords = vector3(-277.2185, 779.09729, 119.50399), 
        showblip = true, 
        showmarker = true,
        AvilableParts= 'all',
        AvilableRevlover= {
            'weapon_revolver_cattleman',
            'weapon_revolver_cattleman_mexican',
            'weapon_pistol_volcanic',
        },
        AvilableRepeater={
            'weapon_repeater_carbine',
        },
        AvilableShotgun={
            -- 'weapon_shotgun_doublebarrel',
        },
        AvilableRifle= 'all',
        AvilableTools= {
            'weapon_lasso',
            'weapon_melee_knife',
            'cleankit',
        },
        AvilableAmmo='all',
    },

    ['weaponsmith-rhodes']={   -- 罗德武器铺
        name='罗德镇枪械铺',
        prompt = 'weaponsmith-rhodes',
        job = 'rhoweaponsmith',
        coords = vector3(1327.06, -1322.06, 77.89), 
        showblip = true, 
        showmarker = true,
        AvilableParts= 'all',
        AvilableTools= {
            'weapon_lasso',
            'weapon_melee_knife',
            'cleankit',
        },
        AvilableAmmo='all',
        AvilableRevlover= {
            'weapon_revolver_cattleman',
            'weapon_revolver_cattleman_mexican',
            'weapon_pistol_volcanic',
        },
        AvilableRifle= 'all',
    },

    ['weaponsmith-blackwater']={   -- 黑水镇武器铺
        name='黑水镇枪械铺',
        prompt = 'weaponsmith-blackwater',
        job = 'blaweaponsmith',
        coords = vector3(-829.9905, -1276.6718, 43.7331), 
        showblip = true, 
        showmarker = true,
        AvilableParts= 'all',
        AvilableTools= {
            'weapon_lasso',
            'weapon_melee_knife',
            'cleankit',
        },
        AvilableAmmo='all',
        AvilableRevlover= {
            'weapon_revolver_cattleman',
            'weapon_revolver_cattleman_mexican',
            'weapon_pistol_volcanic',
        },
        AvilableRifle= 'all',
    },
    ['weaponworkshop-1']={   -- 新汉诺威工作台
        name='新汉诺威工作台',
        prompt = 'weaponworkshop-1',
        job = nil,
        coords = vector3(2546.7915, 853.2935, 81.2935), 
        showblip = false, 
        showmarker = false,
        AvilableParts= nil,
        AvilableRevlover={
            'weapon_revolver_schofield'
        },
        AvilablePistol=nil,
        AvilableRepeater={
            'weapon_repeater_henry'
        },
        AvilableAmmo=nil,
        AvilableTools=nil,
        AvilableRifle=nil,
        AvilableShotgun = {
            'weapon_shotgun_repeating'
        }
    },
    ['moonshineworkshop-1']={   -- 新汉诺威工作台
        name='酿酒器工作台',
        prompt = 'moonshineworkshop-1',
        job = nil,
        coords = vector3(1944.5403, 681.3810, 42.0650), 
        showblip = false, 
        showmarker = false,
        AvilableParts= nil,
        AvilableRevlover=nil,
        AvilablePistol=nil,
        AvilableRepeater=nil,
        AvilableAmmo=nil,
        AvilableTools={
            'moonshinekit'
        },
        AvilableRifle=nil,
        AvilableShotgun = nil,

    },

}

Config.WeaponPartsCrafting = {

    -- base weapon items
    'trigger',
    'hammer',
    'barrel',
    'spring',
    'frame',
    'grip',
    'cylinder',
    'stock'
}

Config.RevloverCrafting = {
    
    -- 手枪制作
    'weapon_revolver_cattleman',
    'weapon_revolver_cattleman_mexican',
    'weapon_pistol_volcanic',
    'weapon_revolver_schofield',   
}

Config.PistolCrafting = {
    
    -- 手枪制作
   
}

Config.RepeaterCrafting={
    'weapon_repeater_carbine',
    'weapon_repeater_henry',
}

Config.AmmoCrafting = {
    
    -- 子弹制作
    'ammo_repeater',

    'ammo_revolver',

    'ammo_rifle',

    'ammo_rifle_elephant',

    'ammo_pistol',

    'ammo_shotgun',

    'ammo_arrow',

    'ammo_varmint', 
}

Config.RifleCrafting = {
    
    -- 步枪制作
    'weapon_rifle_boltaction',
    
}

Config.ShotgunCrafting = {
    
    -- 霰弹枪制作
    'weapon_shotgun_repeating',
    'weapon_shotgun_doublebarre',
}

Config.ToolsCrafting = {
    
    -- 工具制作
    'weapon_lasso',
    'weapon_melee_knife',
    'cleankit',
    'moonshinekit',
}

Config.CraftingRecipes={
    -- base weapon items
    ['trigger'] = {
        name = 'trigger',
        label = '扳机',
        crafttime = 5000,
        txt='钢x5',
        craftitems = {
            [1] = { item = 'steel', amount = 5 },
        },
        receive = 'trigger'
    },
    
    ['hammer'] = {
        name = 'hammer',
        label = '气锤',
        crafttime = 5000,
        txt='钢x5',
        craftitems = {
            [1] = { item = 'steel', amount = 5 },
        },
        receive = 'hammer'
    },
    
    ['barrel'] = {
        name = 'barrel',
        label = '枪管',
        crafttime = 5000,
        txt='钢x5',
        craftitems = {
            [1] = { item = 'steel', amount = 5 },
        },
        receive = 'barrel'
    },
    
    ['spring'] = {
        name = 'spring',
        label = '弹簧',
        crafttime = 5000,
        txt='钢x5',
        craftitems = {
            [1] = { item = 'steel', amount = 5 },
        },
        receive = 'spring'
    },
    
    ['frame'] = {
        name = 'frame',
        label = '框架',
        crafttime = 5000,
        txt='钢x5',
        craftitems = {
            [1] = { item = 'steel', amount = 5 },
        },
        receive = 'frame'
    },

    ['grip'] = {
        name = 'grip',
        label = '握把',
        txt='钢x5 木头x5',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'steel', amount = 5 },
            [2] = { item = 'wood', amount = 5 },
        },
        receive = 'grip'
    },

    ['stock'] = {
        name = 'stock',
        label = '枪托',
        txt='木头x5',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'wood', amount = 5 },
        },
        receive = 'stock'
    },

    ['cylinder'] = {
        name = 'cylinder',
        label = '气缸',
        txt='钢x5',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'steel', amount = 5 },
        },
        receive = 'cylinder'
    },

    -- 左轮手枪制作
    ['weapon_revolver_cattleman'] = {
        name = 'weapon_revolver_cattleman',
        label = '牛仔左轮',
        crafttime = 5000,
        txt='扳机x1 击锤x1 枪管x1 框架x1 握把x1 气缸x1',
        craftitems = {
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
            
        },
        receive = 'weapon_revolver_cattleman'
    },

    ['weapon_revolver_cattleman_mexican'] = {
        name = 'weapon_revolver_cattleman_mexican',
        label = '墨西哥牛仔左轮',
        crafttime = 5000,
        txt='扳机x1 击锤x1 枪管x1 框架x1 握把x1 气缸x1',
        craftitems = {
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
            
        },
        receive = 'weapon_revolver_cattleman_mexican'
    },

    ['weapon_pistol_volcanic'] = {
        name = 'weapon_pistol_volcanic',
        label = '火山手枪',
        crafttime = 5000,
        txt='扳机x1 击锤x1 枪管x1 框架x1 握把x1 气缸x1',
        craftitems = {
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
            
        },
        receive = 'weapon_pistol_volcanic'
    },

    ['weapon_revolver_schofield'] ={
        name = 'weapon_revolver_schofield',
        label = '斯科菲尔德左轮手枪',
        crafttime = 5000,
        txt='钢x50 铁x10 木头x2',
        craftitems = {
            [1] = { item = 'steel',  amount = 50 },
            [2] = { item = 'iron',   amount = 10 },
            [3] = { item = 'wood',   amount = 2 },
            
        },
        receive = 'weapon_revolver_schofield'
    },

    -- 手枪制作
    -- 连发枪制作
    ['weapon_repeater_henry'] ={
        name = 'weapon_repeater_henry',
        label = '里奇菲尔德连发步枪',
        txt='钢x70 铁x15 木头x10',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'steel',  amount = 70 },
            [2] = { item = 'iron',   amount = 15 },
            [3] = { item = 'wood',   amount = 10 },
            
        },
        receive = 'weapon_repeater_henry'
    },
    ['weapon_repeater_carbine'] = {
        name = 'weapon_repeater_carbine',
        label = '卡宾连发步枪',
        crafttime = 5000,
        txt='扳机x1 击锤x1 枪管x1 框架x1 握把x1 气缸x1 枪托x1',
        craftitems = {
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
            [7] = { item = 'stock',amount = 1},
        },
        receive = 'weapon_repeater_carbine'
    },
    -- 子弹制作
    ['ammo_repeater'] = {
        name = 'ammo_repeater',
        label = '连发步枪子弹 (N)',
        crafttime = 5000,
        txt='木头x1 硫磺x1',
        craftitems = {
            [1] = { item = 'wood',  amount = 1 },
            [2] = { item = 'sulphur',  amount = 1 },
            
        },
        receive = 'ammo_repeater'
    },

    ['ammo_revolver'] = {
        name = 'ammo_revolver',
        label = '左轮手枪子弹 (N)',
        crafttime = 5000,
        txt='木头x1 硫磺x1',
        craftitems = {
            [1] = { item = 'wood',  amount = 1 },
            [2] = { item = 'sulphur',  amount = 1 },
            
        },
        receive = 'ammo_revolver'
    },

    ['ammo_rifle'] = {
        name = 'ammo_rifle',
        label = '步枪子弹 (N)',
        crafttime = 5000,
        txt='木头x1 硫磺x1',
        craftitems = {
            [1] = { item = 'wood',  amount = 1 },
            [2] = { item = 'sulphur',  amount = 1 },
            
        },
        receive = 'ammo_rifle'
    },

    ['ammo_rifle_elephant'] = {
        name = 'ammo_rifle_elephant',
        label = '猎象步枪子弹 (N)',
        txt='木头x1 硫磺x1',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'wood',  amount = 1 },
            [2] = { item = 'sulphur',  amount = 1 },
            
        },
        receive = 'ammo_rifle_elephant'
    },

    ['ammo_pistol'] = {
        name = 'ammo_pistol',
        label = '手枪子弹 (N)',
        txt='木头x1 硫磺x1',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'wood',  amount = 1 },
            [2] = { item = 'sulphur',  amount = 1 },
            
        },
        receive = 'ammo_pistol'
    },

    ['ammo_shotgun'] = {
        name = 'ammo_shotgun',
        label = '霰弹枪子弹 (N)',
        txt='木头x1 硫磺x1',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'wood',  amount = 1 },
            [2] = { item = 'sulphur',  amount = 1 },
            
        },
        receive = 'ammo_shotgun'
    },

    ['ammo_arrow'] = {
        name = 'ammo_arrow',
        label = '箭矢 (N)',
        txt='木头x2',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'wood',  amount = 2 },
            
        },
        receive = 'ammo_arrow'
    },

    ['ammo_varmint'] = {
        name = 'ammo_varmint',
        label = '22lr子弹 (N)',
        crafttime = 5000,
        txt='木头x1 硫磺x1',
        craftitems = {
            [1] = { item = 'wood',  amount = 1 },
            [2] = { item = 'sulphur',  amount = 1 },
            
        },
        receive = 'ammo_varmint'
    },

    -- 步枪制作
    ['weapon_rifle_boltaction'] = {
        name = 'weapon_rifle_boltaction',
        label = '拉栓式步枪',
        crafttime = 5000,
        txt='扳机x1 击锤x1 枪管x1 框架x1 握把x1 气缸x1',
        craftitems = {
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
        },
        receive = 'weapon_rifle_boltaction'
    },

    -- 散弹枪制作
    ['weapon_shotgun_repeating'] ={
        name = 'weapon_shotgun_repeating',
        label = '连发霰弹枪',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'steel',  amount = 70 },
            [2] = { item = 'iron',   amount = 15 },
            [3] = { item = 'wood',   amount = 10 },
            
        },
        txt='钢x70 铁x15 木头x10',
        receive = 'weapon_shotgun_repeating',
        prob=30
    },

    ['weapon_shotgun_doublebarrel'] = {
        name = 'weapon_shotgun_doublebarrel',
        label = '双管霰弹枪 ',
        crafttime = 5000,
        txt='扳机x1 击锤x1 枪管x1 框架x1 握把x1 气缸x1 枪托x1',
        craftitems = {
            [1] = { item = 'trigger',  amount = 1 },
            [2] = { item = 'hammer',   amount = 1 },
            [3] = { item = 'barrel',   amount = 1 },
            [4] = { item = 'frame',    amount = 1 },
            [5] = { item = 'grip',     amount = 1 },
            [6] = { item = 'cylinder', amount = 1 },
            [7] = { item = 'stock',amount = 1},
        },
        receive = 'weapon_shotgun_doublebarrel'
    },
    -- 工具制作
    ['weapon_lasso'] = {
        name = 'weapon_lasso',
        label = '套索',
        txt='狼皮x10',
        crafttime = 5000,
        craftitems = {
            [1] = { item = {'poor_coyote_pelt','good_coyote_pelt','perfect_coyote_pelt'},
                    amount = {10,10,10}
                },
        },
        receive = 'weapon_lasso'
    },

    ['weapon_melee_knife'] = {
        name = 'weapon_melee_knife',
        label = '狩猎小刀',
        crafttime = 5000,
        txt='钢x3 铁x3 铜x3 铝x3 木头x3',
        craftitems = {
            [1] = { item = 'wood',  amount = 3 },
            [2] = { item = 'copper',   amount = 3 },
            [3] = { item = 'aluminum',   amount = 3 },
            [4] = { item = 'iron',    amount = 3 },
            [5] = { item = 'steel',     amount = 3 },
        },
        receive = 'weapon_melee_knife'
    },

    ['cleankit'] = {
        name = 'cleankit',
        label = '枪械清洁工具',
        txt='钢x5 铁x5 铜x5 铝x5 木头x5',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'wood',  amount = 5 },
            [2] = { item = 'copper',   amount = 5 },
            [3] = { item = 'aluminum',   amount = 5 },
            [4] = { item = 'iron',    amount = 5 },
            [5] = { item = 'steel',     amount = 5 },
        },
        receive = 'cleankit'
    },

    ['moonshine'] = {
        name = 'moonshine',
        label = '酿酒器',
        crafttime = 5000,
        txt='面包x2',
        craftitems = {
            [1]={item='bread',amount=2}
        },
        receive = 'moonshine'
    },

}


--['copper']   = {['name'] = 'copper',   ['label'] = '铜',     ['weight'] = 1000, ['type'] = 'item', ['image'] = 'copper.png',   ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'crafting material'},
--['aluminum'] = {['name'] = 'aluminum', ['label'] = '铝',     ['weight'] = 1000, ['type'] = 'item', ['image'] = 'aluminum.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'crafting material'},
--['iron']     = {['name'] = 'iron',     ['label'] = '铁',     ['weight'] = 1000, ['type'] = 'item', ['image'] = 'iron.png',     ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'crafting material'},
--['steel']    = {['name'] = 'steel',    ['label'] = '钢',     ['weight'] = 1000, ['type'] = 'item', ['image'] = 'steel.png',    ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'crafting material'},
--['wood']     = {['name'] = 'wood',     ['label'] = '木头',   ['weight'] = 1000, ['type'] = 'item', ['image'] = 'wood.png',     ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'crafting material'},
--['sulphur']  = {['name'] = 'sulphur',  ['label'] = '硫磺',   ['weight'] = 1000, ['type'] = 'item', ['image'] = 'sulphur.png',     ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'crafting material'},