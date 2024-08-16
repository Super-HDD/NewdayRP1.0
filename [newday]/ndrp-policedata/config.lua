Config={}

Config.Debug=true

Config.PoliceDeskLocation={
    ['瓦伦丁警察局']={
        name = '瓦伦丁警察局',         
        prompt = 'valpolicestation',      
        coords = vector3(-277.09, 804.04, 119.38), 
        showblip = true, 
        showmarker = true,
        garageCoords=vector3(-279.02, 829.17, 119.33),
        garageHeading=285.42,
    },
}

Config.WeaponList={
    {name="weapon_revolver_cattleman",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="weapon_lasso_reinforced",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="weapon_sniperrifle_carcano",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="weapon_melee_lantern",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="weapon_shotgun_pump",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="weapon_rifle_boltaction",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="weapon_thrown_bolas_ironspiked",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="weapon_repeater_winchester",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
}

Config.AmmoList={
    {name="ammo_pistol",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="ammo_revolver",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="ammo_rifle",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
    {name="ammo_shotgun",authorizedJobGrades = {0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14}},
}

Config.WagonList={
    {
        name="巡逻马车",hash="policeWagon01x",coords=vector3(-279.02, 829.17, 119.33)
    }
}