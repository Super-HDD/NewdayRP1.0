local Translations = {
    error = {
        not_authorised = '你没有被授权!',
    },
    menu = {
        wholesale_trader = '杂货商人',
        wholesale_storage = '批发存储',
        wholesale_imports = '批发进口',
        job_management = '工作管理',
        job_wagon = '工作马车',
        close_menu = '>> 关闭菜单 <<',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})