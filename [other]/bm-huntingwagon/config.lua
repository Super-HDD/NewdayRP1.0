BMConfig = {}

BMConfig.Framework          = 'rsg' -- 'rsg' = RSG, 'vorp' = VORP, 'redemrp' = RedEM-RP

BMConfig.Debug              = false

BMConfig.WagonContentsTitle = 'Hunting Wagon Contents'
BMConfig.PromptGroupName    = '狩猎马车'
BMConfig.StowPromptName     = '堆放'
BMConfig.FetchPromptName    = '取出'
BMConfig.StowPromptKey      = 0xE30CD707 -- R
BMConfig.FetchPromptKey     = 0xE30CD707 -- R

BMConfig.EnableHorseLantern = true
BMConfig.MaxAnimalStowed    = 30

BMConfig.SupportedPelts =
{
    -- Bull Pelt
    {name = '劣质公牛皮',               hash = 9293261,         model = 'p_cs_pelt_xlarge'}, -- Poor
    {name = '优质公牛皮',               hash = -336086818,      model = 'p_cs_pelt_xlarge'}, -- Good
    {name = '完美公牛皮',            hash = -53270317,       model = 'p_cs_pelt_xlarge'}, -- Perfect

    -- Ox Pelt
    {name = '劣质阉牛皮',                 hash = 462348928,       model = 'p_cs_pelt_xlarge'}, -- Poor
    {name = '优质阉牛皮',                 hash = 1208128650,      model = 'p_cs_pelt_xlarge'}, -- Good
    {name = '完美阉牛皮',              hash = 659601266,       model = 'p_cs_pelt_xlarge'}, -- Perfect

    -- Cow Pelt
    {name = '劣质母牛皮',                hash = 334093551,       model = 'p_cs_cowpelt2_xlarge'}, -- Poor
    {name = '优质母牛皮',                hash = 1150594075,      model = 'p_cs_cowpelt2_xlarge'}, -- Good
    {name = '完美母牛皮',             hash = -845037222,      model = 'p_cs_cowpelt2_xlarge'}, -- Perfect

    -- Elk  
    {name = '劣质驼鹿皮',                hash = 2053771712,      model = 'p_cs_pelt_xlarge_elk'}, -- Poor
    {name = '优质驼鹿皮',                hash = 1181652728,      model = 'p_cs_pelt_xlarge_elk'}, -- Good
    {name = '完美驼鹿皮',             hash = -1332163079,     model = 'p_cs_pelt_xlarge_elk'}, -- Perfect
    {name = '传说驼鹿皮',           hash = 229379699,       model = 'p_cs_pelt_elklegendary'}, -- Legendary

    -- Alligator
    {name = '劣质鳄鱼皮',          hash = -1243878166,     model = 'p_cs_pelt_ws_alligator'}, -- Poor
    {name = '优质鳄鱼皮',       hash = -1475338121,     model = 'p_cs_pelt_ws_alligator'}, -- Perfect
    {name = '传说鳄鱼皮',     hash = -444893329,      model = 'p_cs_bullgator_xlarge_roll'}, -- Legendary

    -- Bear
    {name = '劣质棕熊皮',               hash = 957520252,       model = 'p_cs_pelt_xlarge_bear'}, -- Poor
    {name = '优质棕熊皮',               hash = 143941906,       model = 'p_cs_pelt_xlarge_bear'}, -- Good
    {name = '完美棕熊皮',            hash = 1292673537,      model = 'p_cs_pelt_xlarge_bear'}, -- Perfect
    {name = '传说棕熊皮',          hash = -514494287,      model = 'p_cs_pelt_xlarge_bearlegendary'}, -- Legendary

    -- Black Bear
    {name = '劣质黑熊皮',         hash = 1083865179,      model = 'p_cs_blackbearskin_medlarge'}, -- Poor
    {name = '优质黑熊皮',         hash = 1490032862,      model = 'p_cs_blackbearskin_medlarge'}, -- Good
    {name = '完美黑熊皮',      hash = 663376218,       model = 'p_cs_blackbearskin_medlarge'}, -- Perfect

    -- Bison/Buffalo
    {name = '劣质野牛皮',              hash = -1730060063,     model = 'p_cs_pelt_xlarge_buffalo'}, -- Poor
    {name = '优质野牛皮',              hash = -591117838,      model = 'p_cs_pelt_xlarge_buffalo'}, -- Good
    {name = '完美野牛皮',           hash = -237756948,      model = 'p_cs_pelt_xlarge_buffalo'}, -- Perfect
    {name = '传说白色野牛皮',   hash = 2022985736,      model = 'p_cs_pelt_xlarge_wbuffalo'}, -- Legendary White
    {name = '传说takanta野牛皮', hash = -987731097,      model = 'p_cs_pelt_xlarge_tbuffalo'}, -- Legendary Takanta

    -- Moose
    {name = '劣质野熊皮',               hash = 1868576868,      model = 'p_bespokemoosexlpelt01x'}, -- Poor
    {name = '优质野熊皮',               hash = 1636891382,      model = 'p_bespokemoosexlpelt01x'}, -- Good
    {name = '完美野熊皮t',            hash = -217731719,      model = 'p_bespokemoosexlpelt01x'}, -- Perfect
    {name = '传说野熊皮',          hash = -687487191,      model = 'p_lgrymoosexlpelt01x'}, -- Legendary
}