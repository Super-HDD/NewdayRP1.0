Config = {}

-- config settings
Config.RemoveJob = true -- if true then player loses job
Config.MarkerDistance = 10.0 -- distance for the marker to show

-- blip config
Config.Blip = {
    blipName = '赏金猎人协会', -- Config.Blip.blipName
    blipSprite = 'blip_mp_roles_bounty_hunter_lock', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

-- locations
Config.Locations = {
    ["outside"] = { coords = vector4(1900.6239, -1864.7355, 43.1487, 225.4185) },
    ["middle"] = { coords = vector4(1900.6239, -1864.7355, 43.1487, 225.4185) },
    spawns = {
        [1] = { coords = vector4(1900.6239, -1864.7355, 43.1487, 225.4185) },
        [2] = { coords = vector4(3349.62, -650.41, 45.38, 207.53) },
        [3] = { coords = vector4(3380.62, -672.35, 46.27, 110.95) },
        [4] = { coords = vector4(3366.75, -666.08, 46.34, 297.69) }
    }
}

-- prison menu location
Config.MenuLocations = {
    {    --sisika jail
        name = '赏金猎人协会',
        prompt = '赏金猎人协会',
        coords = vector3(1900.6239, -1864.7355, 43.1487 -0.8),
        showblip = true,
        showmarker = true 
    }, 
}

-- jail shop
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 48
Config.DukeBoxDefaultVolume = 0.5 -- music default volume 0.01 - 1
Config.DukeBoxRadius = 40 -- music radius

Config.SaloonTenderLocations = {
    {name = '储存',         location = 'baoquan',      coords = vector3(1906.7688, -1862.5385, 43.1372), showblip = false, showmarker = false}, --valentine
    }