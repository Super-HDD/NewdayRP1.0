local Translations = {
    error = {
        Something_went_wrong = '出了点问题！',
         you_need_item_to_do_that = '你需要 %{item1} 和 %{item2} 才能做到这一点！',
         only_farmers_can_plant_seeds = '只有农民才能种植种子！',
         you_are_not_in_a_farming_zone = '你不在农业区！',
         you_may_only_plant_seeds_here = '你只能在这里种植 %{zonename} 颗种子！',
         Too_close_to_another_plant = '距离另一株植物太近！',
         you_already_have_plants_down = '你已经有 %{MaxPlantCount} 株植物倒下',
         only_farmers_can_collect_water = '只有农民才能收集水！',
         you_need_bucket_collect_water = '你需要一个桶来接水！',
         only_farmers_can_collect_poo = '只有农民才能收集粪便！',
         you_need_a_bucket_collect_fertilizer = '你需要一个桶来收集肥料！',
    },
    success = {
        you_distroyed_the_plant = '你毁掉了植物',
         you_harvest_label = '您收获了 %{amount} %{label}',
         youve_got_bucketful_water = "你有一桶水！",
         youve_got_bucketful_pregner = "你有一桶肥料！",
    },
    primary = {
        you_have_entered_farm_zone = '您已进入农场区域！',
         you_have_entered_farm_zone_zonename = '您已进入 %{zonename} 农场区域！',
         you_may_only_plant_seeds_here = '你只能在这里种植 %{zonename} 颗种子！',
    },
    menu = {
        open = '访问 ',
    },
    commands = {
        var = 'text goes here',
    },
    progressbar = {
        destroying_the_plants = '摧毁植物...',
         Harveting_plants = '收获植物...',
         watering_the_plants = '给植物浇水...',
         fertilising_the_plants = '给植物施肥...',
         planting_seeds = '种植 %{planttype} 种子...',
         collecting_water = '正在收集水...',
         collecting_poo = '正在收集便便...',
    },
    blip = {
        farm_zone = '农业区',
         farm_shop = '瓦伦丁农场商店',
         farmzone_farm_zone = '农场区',
    },
    text = {
        thirst_hunger = '水分： %{thirst} % - 肥料： %{hunger} %',
growth_quality = '成长： %{growth} % -  品质： %{quality} %',
destroy_plant = '摧毁植物 [G]',
water_feed = '浇水 [G] ：施肥 [J]',
quality = '[品质: %{quality %]',
harvest = '收获 [E]',
collect_water = '收集水源',
pickup_poo = '清理粪便',
    },
    label = {
        corn = '玉米',
        sugar = '糖',
        tobacco = '烟草',
        carrot = '胡萝卜',
        tomato = '番茄',
        broccoli = '西兰花',
        potato = '土豆',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})


