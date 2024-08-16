local Translations = {
    error = {
        you_do_not_have_enough_blood_money_to_do_that = '你没有足够的血钱来做到这一点！',
         you_do_not_have_any_blood_money = '你没有血钱！',
         you_do_not_have_enough_gold_bars = '你没有足够的金条来做到这一点！',
         you_do_not_have_any_gold_bars = '你没有任何金条！',
    },
    success = {
        you_sold_money_for = '您以 $ %{totalcash} 的价格出售了 %{amount} 血钱',
         you_sold_gold_bars_for_totalcash = '您以 %{totalcash} 的价格出售了 %{amount} 金条',
    },
    primary = {
        started_selling_contraband = "开始贩卖违禁品",
    },
    menu = {
        open = '打开 ',
        outlaw_menu = '| 亡命之徒菜单 |',
        Blood_money_wash = '血钱清洗',
        sell_gold_bars = '出售金条',
        open_outlaw_shop = '开不法商店',
        close_menu = '关闭菜单',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        var = 'text goes here',
    },
    text = {
        wash_the_blood_off_your_money = '洗净你的血钱',
        sell_your_gold_bars_here = '在这里出售你的金条',
        buy_outlawed_items = '购买违禁物品',
        amount_to_wash = '要洗净的金额（美元）',
        amount_of_bars = '金条数量',
    },
    label = {
        outlaw_shop = '亡命之徒商店',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
