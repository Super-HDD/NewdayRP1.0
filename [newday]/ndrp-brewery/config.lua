Config = {}

-- debug
Config.Debug = false
Config.StorageMaxWeight=1200000
Config.StorageMaxSlots=120

Config.WineryLocations={
    ['ErdingerBrewery']={
        name='艾丁格酿酒厂',
        WorkMenuCoords=vector3(2686.56, -851.09, 23.55),
        OutsideDoorCoords=vector3(2690.98, -858.86, 42.37),
        InsideDoorCoords=vector3(2682.7, -857.37, 22.31),
    }
}

Config.RecipeList={
    ['whiskey'] ={
        name = 'whiskey',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'beer_hua',  amount = 20 },     
        },
        txt='啤酒花x20',
    },
    ['beer']={
        name='beer',
        crafttime = 5000,
        craftitems = {
            [1] = { item = 'beer_hua',  amount = 5 },     
        },
        txt='啤酒花x5',
    }
}

Config.Alcohol={
    ['jiekedanni']=2
}

Config.AddThurst=25

