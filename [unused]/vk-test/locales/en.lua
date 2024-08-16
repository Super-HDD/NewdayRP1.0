local Translations = {
    error = {
        you_are_not_authorised = '你没有权限！',
        you_must_be_holding_weapon = '你必须握着武器！',
        you_dont_have_the_required_items = "你没有所需的物品！",
    },
    success = {
        weapon_cleaned = '武器清洁完成',
        crafting_finished = '制作完成',
    },
    primary = {
        var = 'text goes here',
    },
    menu = {
        open = '打开',
        workshop = '制作台',
        weapon_crafting = '武器制作',
        weapon_parts_crafting = '武器部件制作',
        weaponsmith_storage = '武器店仓库',
        job_management = '事务管理',
        close_menu = '>> 关闭菜单 <<',
        revolver_crafting = '左轮手枪制作',
        pistol_crafting = '手枪制作',
        repeater_crafting = '连发枪制作',
        ammo_crafting='弹药制作',
        rifle_crafting = '步枪制作',
        shotgun_crafting = '霰弹枪制作',
        tools_crafting = '工具制作',
        moonshine_crafting='酿酒器制作'
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
