local Translations = {
    error = {

    },
    success = {

    },
    primary = {
        var = 'text goes here',
    },
    menu = {
        system_name='NewdayRP警察局系统',
        get_police_equipment='领取警械',
        get_weapon='领取武器',
        get_ammo='领取弹药',
        weapon_records='警械领取记录',
        citizen_managment='公民信息管理',
        main_menu='主菜单',
        options= '选项',
        align='左上角',
        police_wagon='呼叫警用马车'
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        crafting_a = '制作一个 ',
    },
    text = {
        var = 'text goes here',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
