local Translations = {
  error = {
      key_cowshed = "您没有钥匙！",
      milk_ranch = "您只能在牧场上给奶牛挤奶！",
      lead_ranch = "您需要将奶牛至少带离牧场200米！",
      should_cowshed = "您应该在牛棚里！",
      enough_cash = "您没有足够的现金！"
  },
  success = {
      buys_cow = "您购买了一头奶牛 ",
      brought_cow = "您将奶牛带进了谷仓",
      cow_grazing = "您的奶牛正在吃草！"
  },
  primary = {
      closer_must = "您必须靠近一点！",
      milking_cow = "正在挤奶..."
  },
  menu = {
      farm_cow = "养殖奶牛",
      buy_cow = "购买奶牛",
      cowshed_cow = "牛棚",
      cowshed_cows = "奶牛",
      
  cowshed_cowsgo = "将所有奶牛带入牛棚",
      name_cow = "给您的奶牛取个名字",
      lead_cow = "带领奶牛",
      choose_cow = "选择一头奶牛：",
      
  state_menu = "状态",
      lead_menu = "带领",
      to_milk = "挤奶",
      to_graze = "放牧",
      leads_cowshed = "引导到牛棚",
      close_menu = "关闭",
  }
}


Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
