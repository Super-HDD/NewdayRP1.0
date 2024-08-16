local Translations = {
    error = {
        no_wagon_setup = '没有设置货车',
already_have_wagon = '你已经拥有一辆公司货车',
not_the_boss = '你不是老板',
    },
    success = {
        wagon_stored = '公司货车已存储',
        wagon_setup_successfully = '成功设置你的公司货车',
    },
    primary = {
        wagon_out = '公司货车已取出',
wagon_already_out = '你的公司货车已经在外面了',
    },
    menu = {
        wagon_menu = '货车菜单',
wagon_setup = '设置货车 (老板)',
wagon_get = '取出货车',
wagon_store = '存储货车',
close_menu = '>> 关闭菜单 <<',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})