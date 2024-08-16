# RexshackGaming
- discord : https://discord.gg/s5uSk56B65
- youtube : https://www.youtube.com/channel/UCikEgGfXO-HCPxV5rYHEVbA
- github : https://github.com/Rexshack-RedM

# Limitations
- be aware due to OneSync and NPC culling a player needs to remain on the train if you are using the NPC to drive
- failure to stay on the train the NPC will despawn and the train will stop

# Dependancies
- qb-core
- qb-menu
- qb-npcs

# Installation
- ensure that the dependancies are added and started
- add qb-railroadjob to your resources folder

# Add Job
- add the following to qb-core/shared/jobs.lua if not there already
```
    ['railroad'] = {
        label = 'Railroad',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Conductor',
                payment = 25
            },
            ['1'] = {
                name = 'Driver',
                payment = 50
            },
            ['2'] = {
                name = 'Station Manager',
                isboss = true,
                payment = 75
            },
        },
    },
```

# Add NPC
- add the following NPC to qb-npcs/config.lua if not there already
```
    {   -- railroad job npc
        model = `U_M_O_RigTrainStationWorker_01`,
        coords = vector4(-162.6976, 638.8612, 114.03211, 146.25543),
    },
```

# Starting the resource
- add the following to your server.cfg file : ensure qb-railroadjob

# Commands Use
- /deletetrain (deletes train at its current location)
- /resettrain (resets you back to valentine station)
