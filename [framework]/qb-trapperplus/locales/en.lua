local Translations = {
    error = {
        something_went_wrong = '出现了问题！',
        you_dont_have_any_pelts_to_sell = "你没有任何皮革可供出售！"
    },
    success = {
        you_have_sold_all_your_pelts_for = '你已经卖掉了所有的毛皮 $',
    },
    primary = {
        stored = ' 已存储',
    },
    menu = {
        open = '打开 ',
        sell_stored_pelts = '出售存放的皮革',
        trapper_menu = '皮革商菜单',
        open_trapper_shop = '打开皮革商店',
        close_menu = '关闭菜单',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        checking_pelts = '检查毛皮',
    },
    text = {
        buy_items_from_the_trapper = '从皮革商购买物品',
        sell_store_pelts = '出售存放的物品皮革',
        trapper_shop =  '皮革商店',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
