local Translations = {
    error = {
      you_dont_have_the_required_items = "缺少所需的物品",
    },
    success = {
      cooking_finished = '烹饪完成',
      cooking_successful = '烹饪完成',
    },
    primary = {
      campfire_put_out = '已扑灭营火',
      campfire_deployed = '已搭建营火',
      campfire_existed='原有营火将被扑灭',
      settingup_campfire='正在生火',
      removing_campfire='正在熄灭营火',
    },
    menu = {
      fish_steak = '鱼排',
      -- baked_bread = '面包',
      -- apple_pie = '苹果派',
      fish_stew = '炖鱼',
      meat_steak = '肉排',
      -- bacon_food = '野猪肉培根',
      commanche_stew = '大杂烩',
      -- baked_goods = 'Pie Crust',
      -- animal_food = '宠物粮',
      cooking_menu = '🥩 | 烹饪菜单',
      close_menu = '❌ | 关闭菜单',
    },
    commands = {
      deploy_campfire = '正在生火',
    },
    progressbar = {
      cooking_a = '烹饪中',
    },
    label = {
      open_cooking_menu = '打开烹饪菜单'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
