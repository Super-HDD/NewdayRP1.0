local Translations = {
    error = {
        something_went_wrong = '发生了一些错误！',
        dont_have_animal = "你身上没有动物"
    },
    success = {
        var = 'text goes here',
    },
    primary = {
        var = 'text goes here',
    },
    menu = {
        open = '打开 ',
        sell_your_animal_the_butcher = '卖出你的动物',
        buy_items_from_butcher = '从屠夫购买物品',
        close_menu = '关闭菜单',
        open_shop = '打开商店',
        sell_animal = '出售动物',
        butcher_shop = '屠夫店'
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        selling = '销售 ',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
