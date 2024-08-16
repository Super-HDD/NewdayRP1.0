Translations = {}

Translations['en'] = {
	["good"] = "赢了",
	["bad"] = "输了", 
	["impartial"] = "平局",

    ['press_e_to_play'] = '按 ~pa~E~q~ 玩二十一点。',
     ['dealer_waiting_bets'] = '庄家正在等待下注。',
    
     ['bets_amount'] = '投注 $',

     ['button_leave_table'] = '放弃',
     ['button_amount_bet'] = '金额',
     ['button_place_bet'] = '投注',

     ['button_hit_game'] = '叫牌',
     ['button_double_game'] = '双倍',
     ['button_stand_game'] = '停叫',

     ['you_dont_enough_money'] = "您没有足够的钱来投注。",
     ['you_dont_enough_money_double'] = "您没有足够的钱来加倍投注。",
     ['make_your_game'] = "开始你的游戏 | 剩余时间：",

     ['player_bets'] = "$%d 下注",

     ['waiting_player'] = "[ %s ] 等待轮到你",
     ['waiting_player_action'] = "[ %s ] 等待行动",

    
     ['player_brust_with'] = "用[%s]爆发",

     ['player_win_with'] = "%s 与 [ %d ]",

     ["let_blackjack"] = "二十一点！",

     ["idle"] = "",
     ["waiting_players"] = "等待所有玩家准备就绪",
     ["betting_round"] = '下注轮即将开始...',
     ["place_bets"] = "下注。",
     ["dealing_hand"] = "分发牌",
     ["dealer_actions"] = "庄家选择他的手牌",
     ["dealer_checking"] = "庄家有一张 10,他正在检查他的第二张牌。",
     ["awarding"] = "本轮结束，庄家拿起牌。",
     ["dealer_have"] = "庄家手牌 [ %d ] ",

     ['you_place_bet'] = "您下注 %sx 筹码",
     ['you_win_amount'] = "您收到了 %sx 筹码",
}

Translations['pt'] = {
    ["good"] = "Ganhou",
	["bad"] = "Perdeu", 
	["impartial"] = "Empatou",

    ['press_e_to_play']       = 'Aperte ~pa~E~q~ para jogar Blackjack.',
    ['dealer_waiting_bets']         = 'O dealer está aguardando as apostas.',
    
    ['bets_amount']         = 'Apostar $',

    ['button_leave_table'] = 'Levantar',
    ['button_amount_bet'] = 'Quantidade',
    ['button_place_bet'] = 'Apostar',

    ['button_hit_game'] = 'Pedir',
    ['button_double_game'] = 'Dobrar',
    ['button_stand_game'] = 'Parar',

    ['you_dont_enough_money'] = "Você não tem dinheiro suficientes para a aposta.",
    ['you_dont_enough_money_double'] = "Você não tem dinheiro suficiente para dobrar.",
    ['make_your_game'] = "FAÇA SUA JOGADA | TEMPO RESTANTE: ",

    ['player_bets'] = "$ %d Aposta feita",

    ['waiting_player'] =  "[ %s ] Aguardando vez",
    ['waiting_player_action'] =  "[ %s ] Aguardando uma ação",

    
    ['player_brust_with'] =  "Estourou com [ %s ]",

    ['player_win_with'] =  "%s com [ %d ]",

    ["let_blackjack"] = "Blackjack!",

    ["idle"] = "",
    ["waiting_players"] = "Aguardando todos os jogadores estarem prontos",
    ["betting_round"] = 'A rodada de apostas está prestes a começar...',
    ["place_bets"] = "Façam suas apostas.",
    ["dealing_hand"] = "Distribuindo as cartas",    
    ["dealer_actions"] = "Dealer escolhendo suas ações",
    ["dealer_checking"] = "O dealer possúi um 10, ele está checando sua segunda carta.",
    ["awarding"] = "Fim da rodada, o dealer está recolhendo as cartas.",
    ["dealer_have"] = "Cartas do dealer [ %d ] ",

    ['you_place_bet'] = "Você apostou %sx fichas",
    ['you_win_amount'] = "Você recebeu %sx fichas",
}

Locale = Translations[language_selected]

resultNames = {
	["good"] = Locale['good'],
	["bad"] =  Locale['bad'],
	["impartial"] =  Locale['impartial'],
}