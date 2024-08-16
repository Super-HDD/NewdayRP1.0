local Translations = {
    error = {
            you_need_use_your_fishing_rod_first = '你需要先使用你的钓鱼竿.',
    },
    success = {
            var = 'text goes here',
    },
    primary = {
            you_got_fish_name = '你钓上来了 %{fish_name}',
    },
    menu = {
            var = 'text goes here',
    },
    commands = {
            var = 'text goes here',
    },
    progressbar = {
            var = '钓鱼中',
    },
    text = {
        Ready_to_fish = '准备钓鱼！',
        fishing ='钓鱼',
         get_the_fish = '抓住鱼！',
         name = '名称',
         weight = '重量',
         prepare_fishing_rod = '准备鱼竿',
         cast_fishing_rod = '抛竿',
         hook ='盯着鱼竿',
         reset_cast = '快速收杆',
         reel_lure = '晃动鱼竿',
         reel_in = '卷入',
         keep_fish = '保留鱼',
         throw_fish = '扔掉鱼',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
