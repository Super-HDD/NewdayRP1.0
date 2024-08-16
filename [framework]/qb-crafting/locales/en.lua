local Translations = {
    error = {
        you_dont_have_this_blueprint_original = "你没有这个蓝图原件",
        need_more_crafting_items = '需要更多的制作物品！',
        you_dont_have_enough_cash_to_do_that = '你没有足够的现金来做这件事！',
        not_enough_reputation_repneeded_required = '没有足够的声誉%{repneeded}！',
    },
    success = {
        take_for_the_copy = '用于副本的$ %{copycost}',
        crafting_successful = '制作成功',
        not_enough_crafting_reputation_to_make_this = '没有足够的制作声望来制作这个！'
    },
    primary = {
        your_crafting_rep_is = '您的制作代表是：',
        your_crafting_reputation_increased_to = '你的制作声望增加到 '
    },
    menu = {
        open = '打开',
        crafting_menu = '制作菜单',
        craft_shovel = '制作铁锨',
        craft_axe = '制作斧头',
        craft_pickAxe = '制作镐',
    },
    commands = {
        get_your_crafting_reputation = '获取你的制作声誉。',
    },
    progressbar = {
        Making_copy_of = '制作副本',
        copy = '复制-',
        crafting_shovel = '制作铲子..',
        crafting_axe= '制作斧头..',
        crafting_pickAxe = '制作镐..',
    },
    text = {
      xbpc_xsteel_xwood = '1 x BPC / 3 x 钢 / 1 x 木'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- wooden_cart = '"Wooden Cart %{numbercart}',