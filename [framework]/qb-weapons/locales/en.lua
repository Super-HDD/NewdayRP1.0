local Translations = {
    error = {
        no_arrows_your_inventory_load = '你的背包里没有箭矢可供装填',
        max_mmo_capacity = '最大弹药容量',
        wrong_ammo_for_weapon = '错误的弹药类型！',
        you_are_not_holding_weapon = '你没有拿着武器！',
    },
    success = {
        Weapon_reloaded = '武器重新装弹',
    },
    primary = {
        var = 'text goes here',
    },
    menu = {
        var = 'text goes here',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        var = 'text goes here',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
