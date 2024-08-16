local Translations = {
    error = {
        you_dont_have_the_ingredients_to_make_this = "你没有足够的材料来制作这个！",
something_went_wrong = '出了点问题！',
you_dont_have_that_much_on_you = "你身上没有那么多物品。",
you_dont_have_an_item_on_you = "你身上没有该物品。",
must_not_be_a_negative_value = '数值不能为负数。'
    },
    success = {
        you_made_some_moonshine = '你制作了一些蒸馏酒',
you_sold = '你出售了 %{amount} 个，获得了 $ %{totalcash}'
    },
    primary = {
        moonshine_destroyed = '月光被毁!',
    },
    menu = {
        close_menu = '关闭菜单',
price = ' (价格 $',
enter_the_number_of_1pc = "输入1个的数量 / ${price} $",
brew = '酿造 [J]',
destroy = '销毁 [J]',
moonshine = '| 蒸馏酒 |',
make_moonshine = '制作蒸馏酒',
sell_moonshine = '出售蒸馏酒',
    },
    commands = {
            var = 'text goes here',
    },
    progressbar = {
            var = 'text goes here',
    },
    blip = {
      moonshine_vendor = '私酒商人',
    },
    text = {
        xsugar_1xWater_and_1xcorn = '1 x 糖、1 x 水和 1 x 玉米',
        sell = '卖',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
