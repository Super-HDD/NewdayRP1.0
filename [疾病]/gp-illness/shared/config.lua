Config = {}

Config.Framework = "rsg" -- standalone, qbr, vorp, rsg

Config.GlobalSettings = {
    debugMod = false,

    notifyPlayer = true,
    notifyTextInfect = "你被感染了",
    notifyTextCure = "你痊愈了。",

    npcChanceToCough = 100.0,
    
    -- Not usable if Config.Framework = "standalone"
    dehydratateValue = 15.0, -- 如果出现脱水症状，口渴会消除多少
    nameOfTable = "players", -- for qbr, rsg: players, for vorp: characters
    nameOfIdentifierColumn = "citizenid", -- for qbr, rsg: citizenid, for vorp: characterid
}

Config.Illnesses = {
    ["Smallpox"] = {
        chance = 0.05,
        Symptoms = {
            "Sweating",
        }
    },
    ["Cholera"] = {
        chance = 0.05,
        Symptoms = {
            "Sweating",
            "Vomitting",
            "Dehydratation"
        }
    },
    ["Hypothermia"] = {
        chance = 0.05,
        Symptoms = {
            "LowTemperature",
            "Chills",
            "Coughing",
        }
    },
    ["Tubercolosis"] = {
        chance = 0.05,
        Symptoms = {
            "Coughing",
        }
    },
    ["Rabies"] = {
        chance = 0.05,
        Symptoms = {
            "Fear"
        }
    },
    ["Flu"] = {
        chance = 0.05,
        Symptoms = {
            "Coughing",
            "Fever"
        }
    },
    ["Dysentery"] = {
        chance = 0.05,
        Symptoms = {
            "Vomitting",
            "Dehydratation"
        }
    },
    ["Typhus"] = {
        chance = 0.05,
        Symptoms = {
            "Fear",
            "Dehydratation",
            "Vomitting",
            "Chills"
        }
    },
    ["Pneumonia"] = {
        chance = 0.05,
        Symptoms = {
            "Coughing",
            "Fever"
        }
    },
    ["Malaria"] = {
        chance = 0.05,
        Symptoms = {
            "Chills",
            "Sweating",
            "Vomitting",
            "Cramps",
            "Coma"
        }
    },
    ["Burns"] = {
        chance = 0.05,
        Symptoms = {
            "Vulnerability"
        }
    }
}

Config.Infection = {
    Enviromental = {
        fastChangeOfTemperatures = {
            radius = 5,
            infectBy = "Flu"
        },
        inLowTemperatures = {
            radius = 5,
            infectBy = "Hypothermia",
            longerInfectBy = "Pneumonia"
        }
    },
    ByDrink = {
        SaintDenis = {
            "Dysentery",
            "Typhus"
        },
        DonJulioLake = {
            "Cholera"
        },
        VanHorn = {
            "Dysentery",
            "Typhus"
        },
        AnesBurg = {
            "Dysentery",
            "Typhus"
        },
        LaGras = {
            "Typhus",
            "Malaria"
        }
    },
    ByAnimal = {
        "Smallpox",
        "Rabies"
    },
    ByNpcOnLocation = {
        SaintDenis = {
            "Flu"
        }
    },
    ByPlayerCough = {
        "Flu",
        "Tubercolosis"
    },
    ByPlayerHit = {
        "Rabies"
    }
}

Config.GeyserSite = {
    hotRadius = 150.0,
    hotWater = {
        {
            pos = vector3(170.1795, 1877.451, 202.858)
        }
    },
    chanceToExplose = 100.0,
    geyserRadius = 3.5,
    geyserLoadRadius = 35.0,
    Geysers = {
        {
            pos = vector3(224.3794, 1906.645, 205.6101)
        },
        {
            pos = vector3(191.5159, 1831.245, 202.5894)
        },
        {
            pos = vector3(129.1813, 1878.429, 199.5073)
        }
    },
    infectedBy = {
        "Burns"
    }
}

Config.Locations = {
    SaintDenis = {
        multiplier = 2,
        pos = {
            {
                coords = vector3(2555.7957, -1263.2139, 50.3156),
                radius = 500.0
            }
        }
    },
    VanHorn = {
        multiplier = 2,
        pos = {
            {
                coords = vector3(2981.9421, 537.0211, 43.4828),
                radius = 80.0
            }
        }
    },
    AnesBurg = {
        multiplier = 2,
        pos = {
            {
                coords = vector3(2936.1038, 1372.2913, 44.2226),
                radius = 80.0
            }
        }
    },
    LaGras = {
        multiplier = 2,
        pos = {
            {
                coords = vector3(2280.4956, -640.5715, 41.7384),
                radius = 80.0
            }
        }
    },
    DonJulioLake = {
        multiplier = 2,
        pos = {
            {
                coords = vector3(-3317.8477, -3248.6736, -5.4770),
                radius = 80.0,
            }
        }
    }
}

Config.ComaTime = 16 -- TIME IN SECONDS