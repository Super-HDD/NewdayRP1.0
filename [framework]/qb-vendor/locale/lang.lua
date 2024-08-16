local en = {
  error = {
    error = '错误，请联系支持',
    error_cid = '错误，CID 未识别',
    market_no_money = '商人摊位上没有钱！',
    player_no_money = '您的资金不足',
  },

  success = {
    robreward = '您已回收$',
    newname = '名称成功更改',
    transfer_t = '转移',
    transfer = '已转移给Stalker ',
    buy_t = '购买',
    buy = '您购买了该摊位',
    refill = '您已存入',
    buy_prod = '购买 ',
  },

  menu = {
    market = '市场',
    quit = "退出",
    return_m = "返回",
    buy = '购买',
    buy_sub = "购买价格",
    open_market = '摊位',
    open_market_sub = '购买各种商品',
    rob = '抢劫',
    rob_sub = '自担风险',
    refill = '补充货物',
    refill_sub = '将商品放在摊位上',
    refill_in = '这是可供出售的商品列表！',
    checkmoney = '查看收银机',
    checkmoney_sub = '检查/收取余额',
    manage = '摊位管理',
    manage_sub = '管理名称、授予摊位、取回商品',
    market_sub = '这是商品列表、库存和单价',
    instock = '一份记录',
    price = '单价：$',
    no_item = '无产品',
    no_item_sub = '您没有产品放在摊位上！',
    in_inv = '在库存中',
    checkmoney_in = '这是您的收银机',
    currentmoney = '收银机余额',
    withdraw = '取款',
    withdraw_sub = '现金给你！',
    confirm_buy = '确认购买',
    confirm_buy_sub = '（购买时必须有足够的现金）！',
    manage_in = '管理您的摊位',
    manage_in_name = '更改名称',
    manage_in_name_sub = '为您的摊位选择一个新名称？',
    manage_in_give_market = '授予摊位',
    manage_in_give_market_sub = '注意，这是不可逆转的操作',
    buy_price = '价格',
  },

  input  = {
    validate = '验证',
    give_market = '请输入接收者的永久性ID (/cid)',
    give_market_champ = '(区分大小写)',
    name = '您的摊位的新名称',
    name_champ = '您的摊位名称',
    withdraw = '取出现金：（最大金额：$',
    withdraw_champ = '金额',
    refill = '销售',
    howmany_buy = '您想购买多少个？',
    qt = '数量？',
    refill_price = '销售价格',
  },

  rob = {
    fail = '商人拿起武器了！逃跑！',
    good = '正在进行抢劫..',
    already = '该摊位已经被洗劫过了，请稍后再来！',
    need_gun = '您必须持有武器才能抢劫商人！',
  },

    other = {
      blips = '市场摊贩',
      prompt = '打开市场',
    },

}

----------------------------------------------------------------------------------------

Lang = Locale:new({
  phrases = en,
  warnOnMissing = true
})
