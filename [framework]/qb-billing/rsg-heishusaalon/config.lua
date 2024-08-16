Config = {}

-- debug
Config.Debug = false

-- settings
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48
Config.DukeBoxDefaultVolume = 0.5 -- music default volume 0.01 - 1
Config.DukeBoxRadius = 40 -- music radius

-----------------------------------------------------------------------------------

-- job blip
Config.Blip = {
    blipName = '罗德镇酒馆', -- Config.Blip.blipName
    blipSprite = 'blip_saloon', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- job prompt locations
Config.SaloonTenderLocations = {
    {name = '罗德镇酒馆',         location = 'rhosaloontender',      coords = vector3(1340.2045, -1374.6832, 80.4807), showblip = true, showmarker = true}, 
    }
