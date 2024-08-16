local Translations = {
    error = {
        no_small_fish = '你没有任何小鱼可卖！',
         no_medium_fish = '您没有任何中型鱼可卖！',
         no_large_fish = '您没有任何大鱼可卖！',
    },
    success = {
        small_fish_sold = '您已经以$ 的价格出售了您的小鱼',
         medium_fish_sold = '您已经以$ 的价格出售了中型鱼',
         large_fish_sold = '您已经以$ 的价格出售了您的大鱼',
    },
    menu = {
        open_prompt = '打开',
         sell_small_fish = '卖小鱼',
         sell_medium_fish = '出售中型鱼',
         sell_large_fish = '出售大鱼',
         we_currently_pay = '我们支付 $',
         per_small_fish = '.00 每条小鱼',
         per_medium_fish = '每条中型鱼.00',
         per_large_fish = '每条大鱼.00',
         open_shop = '开鱼贩店',
         buy_items_txt = '从鱼贩处购买物品',
         close_menu = '关闭菜单',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
