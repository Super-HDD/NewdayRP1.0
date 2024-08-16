Config = Config or {}

-- debug on/off
Config.Debug = false

-- Max Server Players
Config.MaxPlayers = GetConvarInt('sv_maxclients', 2023) -- It returnes 48 if it cant find the Convar Int

-- Minimum Police for Actions
Config.IllegalActions = {
    ["功能1"] = {minimumPolice = 1, busy = false},
    ["功能2"] = {minimumPolice = 1, busy = false},
    ["功能3"]     = {minimumPolice = 1, busy = false},
}

-- Current Cops Online
Config.CurrentPolice = 0

-- Current Ambulance / Doctors Online
Config.CurrentMedic = 0
