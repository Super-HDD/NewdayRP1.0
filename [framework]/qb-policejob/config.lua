Config = {}

Config.ShowBlips = true
Config.PromptKey = 0xE30CD707 -- R

Config.Objects = {
    ["barrier"] = {model = `p_barricade05x`, freeze = true},
    ["roadsign"] = {model = `p_closedsignmed02x`, freeze = true},
    ["tent"] = {model = `p_ambtentburlap01x`, freeze = true},
    ["light"] = {model = `p_lanternnbx01x`, freeze = true},
}

Config.HandCuffItem = 'handcuffs'

Config.LicenseRank = 2

Config.Locations = {
    ["duty"] = {
        [1] = vector3(1362.05, -1301.83, 77.77), -- Rhodes
        [2] = vector3(2507.53, -1301.41, 48.95), -- Saint Denis
        [3] = vector3(-768.03, -1266.37, 44.05), -- Blackwater
        [4] = vector3(-1812.03, -354.09, 164.65), -- Strawberry
        [5] = vector3(-277.86, 807.47, 119.38), --valentine
    },
    ["stash"] = {
        [1] = vector3(1359.24, -1299.65, 77.76), -- Rhodes
        [2] = vector3(2497.01, -1301.2, 48.96), -- Saint Denis
        [3] = vector3(-766.55, -1271.61, 44.05), -- Blackwater
        [4] = vector3(-1812.43, -355.87, 164.65), -- Strawberry
        [5] = vector3(-277.57, 810.22, 119.38) --valentine
    },
    ["vehicle"] = {
        [1] = vector4(-278.82, 826.41, 119.33, 7.5), -- Valentine Stable
        [2] = vector4(2493.22, -1321.87, 48.87, 271.06), -- Saint Denis
        [3] = vector4(1380.34, -1329.07, 77.64, 176.64), -- Rhodes
        [4] = vector4(-1801.48, -354.12, 164.13, 222.05), -- Strawberry
        [5] = vector4(-769.05, -1254.9, 43.4, 358.53) -- Blackwater
    },
    ["armory"] = {
        [1] = vector3(1361.16, -1305.7, 77.76), -- Rhodes
        [2] = vector3(2494.53, -1304.32, 48.95), -- Saint Denis
        [3] = vector3(-764.86, -1272.4, 44.04), -- Blackwater
        [4] = vector3(-1814.01, -354.93, 164.65), -- Strawberry
        [5] = vector3(-278.38, 805.15, 119.38), --valentine
    },
    ["evidence"] = {
        [1] = vector3(1361.39, -1303.77, 77.77), -- Rhodes
        [2] = vector3(2494.44, -1313.39, 48.95), -- Saint Denis
        [3] = vector3(-761.98, -1272.62, 44.05), -- Blackwater
        [4] = vector3(-1812.43, -355.87, 164.65), -- Strawberry
        [5] = vector3(-278.61, 807.48, 119.38) --valentine
    },
    ["stations"] = {
        [1] = {label = "罗德镇警长办公室", coords = vector3(1360.88, -1301.53, 77.77)}, -- Rhodes
        [2] = {label = "圣丹尼斯警察局", coords = vector3(2501.83, -1309.04, 48.95)}, -- Saint Denis
        [3] = {label = "黑水镇警察局", coords = vector3(-760.47, -1269.14, 44.04)}, -- Blackwater
        [4] = {label = "草莓镇警长办公室", coords = vector3(-1810.57, -350.91, 164.66)}, -- Strawberry
        [5] = {label = "瓦伦丁警长办公室", coords = vector3(-275.65, 808.62, 119.38)}, --valentine
    },
}

Config.AuthorizedVehicles = {
    -- Grade 0
    [0] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 1
    [1] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 2
    [2] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 3
    [3] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 4
    [4] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 5
    [5] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 6
    [6] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 7
    [7] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 8
    [8] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 9
    [9] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 10
    [10] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 11
    [11] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 12
    [12] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 13
    [13] = {
        ["policewagon01x"] = "Police Vagon",
    },
    -- Grade 14
    [14] = {
        ["policewagon01x"] = "Police Vagon",
    }
}

Config.WeaponHashes = {}


Config.Items = {
    label = "武器库",
    slots = 10,
    items = {
        {
            name = "weapon_revolver_cattleman",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 1,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },
        {
            name = "weapon_repeater_winchester",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 2,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },
        {
            name = "weapon_melee_lantern",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 3,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },
        {
            name = "weapon_lasso",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 4,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },
        {
            name = "ammo_revolver",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 5,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },
        {
            name = "ammo_repeater",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 6,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },
        {
            name = "ammo_rifle",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 7,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },
        {
            name = "ammo_shotgun",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },

        


        {
            name = "weapon_lasso_reinforced",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 7,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },

        {
            name = "weapon_sniperrifle_carcano",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 8,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },

        {
            name = "weapon_shotgun_semiauto",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 9,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },

        {
            name = "barrier",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "item",
            slot = 10,
            authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}
        },
    }
}
