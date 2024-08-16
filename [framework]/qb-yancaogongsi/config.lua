Config = {}

-- debug
Config.Debug = false

-- settings
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 1000
Config.DukeBoxDefaultVolume = 0.5 -- music default volume 0.01 - 1
Config.DukeBoxRadius = 40 -- music radius

-----------------------------------------------------------------------------------

-- job blip
Config.Blip = {
    blipName = '黑水镇烟草公司', -- Config.Blip.blipName
    blipSprite = 'blip_saloon', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- job prompt locations
Config.SaloonTenderLocations = {
    {name = '黑水镇烟草公司办事处',         location = 'hsyancao',      coords = vector3(2645.7507, -1159.4243, 30.9509), showblip = false, showmarker = false}, 
    }




    -- tobacco factory
--    ['drytobacco'] = {['name'] = 'drytobacco', ['label'] = '干烟草', ['weight'] = 100,  ['type'] = 'item', ['image'] = 'drytobacco.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '加工后的干烟草'},
--    ['cigar']      = {['name'] = 'cigar',      ['label'] = '雪茄',       ['weight'] = 200,  ['type'] = 'item', ['image'] = 'cigar.png',      ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '加工后的雪茄'},
--    ['cigarette']      = {['name'] = 'cigarette',      ['label'] = '香烟',       ['weight'] = 200,  ['type'] = 'item', ['image'] = 'cigarette.png',      ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '加工后的香烟'},
--    ['cigarbox']   = {['name'] = 'cigarbox',   ['label'] = '雪茄盒',   ['weight'] = 2000, ['type'] = 'item', ['image'] = 'cigarbox.png',   ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '一盒雪茄'},
--    ['cigarettebox']   = {['name'] = 'cigarettebox',   ['label'] = '香烟盒',   ['weight'] = 2000, ['type'] = 'item', ['image'] = 'cigarettebox.png',   ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = '一盒香烟'},

--    ['tobaccoseed']  = {['name'] = 'tobaccoseed',  ['label'] = '烟草种子',  ['weight'] = 0,   ['type'] = 'item', ['image'] = 'seeds.png',       ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'used in farming'},
--    ['tobacco']      = {['name'] = 'tobacco',      ['label'] = '烟草',       ['weight'] = 1000, ['type'] = 'item', ['image'] = 'tobacco.png',     ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['level'] = 0, ['description'] = 'product from farming'},