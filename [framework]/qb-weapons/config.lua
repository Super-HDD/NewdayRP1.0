Config = {}

Config.Debug = false

-- settings
Config.UpdateAmmo = 10000 -- 保存玩家弹药之前的时间量（以毫秒为单位）

-- 限制玩家可以装载的弹药量
Config.MaxArrowAmmo = 12
Config.MaxRevolverAmmo = 12
Config.MaxPistolAmmo = 12
Config.MaxRepeaterAmmo = 12
Config.MaxRifleAmmo = 12
Config.MaxVarmintAmmo = 12
Config.MaxShotgunAmmo = 12

-- 每次装载的弹药量
Config.AmountArrowAmmo = 12
Config.AmountRevolverAmmo = 12
Config.AmountPistolAmmo = 12
Config.AmountRepeaterAmmo = 12
Config.AmountRifleAmmo = 12
Config.AmountVarmintAmmo = 12
Config.AmountShotgunAmmo = 12
Config.AmountThrowablesAmmo = 10

--- 伤害武器
Config.WeaponDmg = 1.0
Config.MeleeDmg = 1.0

Config.AmmoTypes = {
    ['weapon_thrown_throwing_knives'] = `AMMO_THROWING_KNIVES`,
    ['weapon_thrown_tomahawk'] = `AMMO_TOMAHAWK`,
    ['weapon_thrown_tomahawk_ancient'] = `AMMO_TOMAHAWK_ANCIENT`,
    ['weapon_thrown_bolas'] = `AMMO_BOLAS`,
    ['weapon_thrown_bolas_hawkmoth'] = `AMMO_BOLAS_HAWKMOTH`,
    ['weapon_thrown_bolas_ironspiked'] = `AMMO_BOLAS_IRONSPIKED`,
    ['weapon_thrown_bolas_intertwined']  = `AMMO_BOLAS_INTERTWINED`,
    ['weapon_thrown_dynamite'] = `AMMO_DYNAMITE`,
    ['weapon_thrown_molotov'] = `AMMO_MOLOTOV`,
    ['weapon_thrown_poisonbottle'] = `AMMO_POISONBOTTLE`
}

