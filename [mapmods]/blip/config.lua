Config = Config or {}


-- farm zone settings
Config.FarmZone = { 
    [1] = {
        zones = { -- example
            vector2(-347.09591674805, 894.11151123047),
            vector2(-390.92279052734, 889.30194091797),
            vector2(-392.01412963867, 911.32104492188),
            vector2(-373.91583251953, 913.11346435547),
            vector2(-369.53713989258, 944.28149414063),
            vector2(-349.36514282227, 941.19653320313)
        },
        name = "carrot",
        blipname =  '赏金猎人协会',
        minZ = 115.78807830811,
        maxZ = 122.06151580811,
        showblip = true,
        blipcoords = vector3(1893.7760, -1859.8019, 43.1507)
    },
}

Config.WaterProps = {
    `p_watertrough01x`,
    `p_watertroughsml01x`,
    `p_watertrough01x_new`,
    `p_watertrough02x`,
    `p_watertrough03x`,
}

Config.FertilizerProps = {
    `p_horsepoop02x`,
    `p_horsepoop03x`,
    `new_p_horsepoop02x_static`,
    `p_poop01x`,
    `p_poop02x`,
    `p_poopile01x`,
    `p_sheeppoop01`,
    `p_sheeppoop02x`,
    `p_sheeppoop03x`,
    `p_wolfpoop01x`,
    `p_wolfpoop02x`,
    `p_wolfpoop03x`,
    `s_horsepoop01x`,
    `s_horsepoop02x`,
    `s_horsepoop03x`,
    `mp007_p_mp_horsepoop03x`,
}
