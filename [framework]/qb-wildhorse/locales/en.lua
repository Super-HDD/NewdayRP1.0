local Translations =
{
    error =
    {
        something_went_wrong = '此刻出现了一些问题！',
you_dont_have_any_horse_to_sell = "您没有任何可以出售的马！",
owned_horse = '很抱歉，您不能出售自己的坐骑！',
not_tamed = '您只能出售自己亲手驯服的野马，亲爱的！'
    },
    success =
    {
        you_have_sold_all_your_horse_for = '你已经把野马卖掉了 $',
    },
    primary =
    {
        var = 'text goes here',
    },
    menu =
    {
        open = '打开',
        sell_stored_horse = '出售存储的马匹',
        sellwildhorse_menu = '野马出售菜单',
        open_sellwildhorse_shop = '打开野马店铺',
        close_menu = '关闭菜单',
    },
    commands =
    {
        var = 'text goes here',
    },
    progressbar =
    {
        checking_horse = '检查马匹 ',
    },
    text =
    {
        sell_store_horse = '给我看看你这次又带了什么回来，大宝贝!',
        sellwildhorse_shop =  '野马回收商人',
    }
}

Lang = Locale:new(
{
    phrases = Translations,
    warnOnMissing = true
})