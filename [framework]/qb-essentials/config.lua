Config = Config or {}

Config.Debug = false

ConsumeablesEat = {
    ["bread"] = math.random(10, 20),
    ["stew"] = math.random(40, 50),
    ["cooked_meat"] = math.random(40, 50),
    ["cooked_fish"] = math.random(40, 50),

    ["whiskey_mooncake"] = math.random(10, 20),
    ["wuren_mooncake"] = math.random(10, 20),
    ["egg_mooncake"] = math.random(10, 20),

    ["niupa"] = math.random(40, 50),

    ["tudouniupa"] = math.random(40, 50),
    ["tudouni"] = math.random(40, 50),
    ["hulobodunrou"] = math.random(40, 50),
    ["yanmeizhou"] = math.random(40, 50),
    ["niunaiyanmaizhou"] = math.random(40, 50),
    ["luroudasan"] = math.random(40, 50),
    ["shucaidun"] = math.random(40, 50),
    ["moxigeroujuan"] = math.random(40, 50),
    ["daluandun"] = math.random(40, 50),
    ["juwuba"] = math.random(40, 50),

    ["daxianaiyoumogutang"] = math.random(40, 50),

    ["jiroukuai"] = math.random(40, 50),
    ["huilingdun"] = math.random(40, 50),
    ["lingmengmulicishi"] = math.random(40, 50),
    ["xiangkaoeyupai"] = math.random(40, 50),
    ["huangyoujianlongxia"] = math.random(40, 50),
    ["kaozhuzhupai"] = math.random(40, 50),
    ["kaoquanyang"] = math.random(40, 50),
    

}

ConsumeablesDrink = {
    ["water"] = math.random(10, 20),
    ["napolunganyi"] = math.random(40, 50),
    ["jiekedanni"] = math.random(40, 50),
    ["baiweipijiu"] = math.random(40, 50),
    ["yishabeilaputaojiu"] = math.random(40, 50),
    ["putaojiu"] = math.random(40, 50),
    ["coffee"] = math.random(40, 50),
    ["niunai"] = math.random(40, 50),

    
}

Config.Discord = {
    ["discord_id"]              = 12345678910,
    ["discord_joinurl"]         = "",
    ["discord_connecturl"]      = "https://example.org",
    ["discord_big_image"]       = "dc_rich",
    ["discord_small_image"]     = "dc_rich_small",
}

-- discord webhook config
Config.DiscordWHImage = 'https://cdn.discordapp.com/attachments/1032260791669375006/1066811751389208596/QB256x256.png'
Config.DiscordWHLogUserName = 'Rexshack Gaming Logs'
Config.DiscordWHAuthorName = 'Rexshack Gaming'

-- density config
Config.Density = {
    -- Ambient Animal Density
    [1] = 1.0,
    -- Scenario Animal Density
    [2] = 1.0,
    -- Ambient Human Density
    [3] = 1.0,
    -- Scenario Human Density
    [4] = 1.0,
    -- Ambient Ped Density
    [5] = 1.0,
    -- Scenario Ped Density
    [6] = 1.0,
    -- Parked Vehicle Density
    [7] = 1.0,
    -- Random Vehicle Density
    [8] = 1.0,
    -- Vehicle Density
    [9] = 1.0,
}

-- 水域类型配置
Config.WaterTypes = {
    [1] =  {["name"] = "科罗纳多海",                ["waterhash"] = -247856387,     ["watertype"] = "sea"},
    [2] =  {["name"] = "圣路易斯河",                ["waterhash"] = -1504425495,    ["watertype"] = "river"},
    [3] =  {["name"] = "唐胡利奥湖",                ["waterhash"] = -1369817450,    ["watertype"] = "lake"},
    [4] =  {["name"] = "铁扒湖",                    ["waterhash"] = -1356490953,    ["watertype"] = "lake"},
    [5] =  {["name"] = "蒙大拿上游河",              ["waterhash"] = -1781130443,    ["watertype"] = "river"},
    [6] =  {["name"] = "奥万吉拉河",                ["waterhash"] = -1300497193,    ["watertype"] = "river"},
    [7] =  {["name"] = "鹰眼溪",                    ["waterhash"] = -1276586360,    ["watertype"] = "river"},
    [8] =  {["name"] = "小溪河",                    ["waterhash"] = -1410384421,    ["watertype"] = "river"},
    [9] =  {["name"] = "达科他河",                  ["waterhash"] = 370072007,      ["watertype"] = "river"},
    [10] =  {["name"] = "贝尔图斯溪",               ["waterhash"] = 650214731,      ["watertype"] = "river"},
    [11] =  {["name"] = "伊莎贝拉湖",                ["waterhash"] = 592454541,      ["watertype"] = "lake"},
    [12] =  {["name"] = "香蒲池塘",                  ["waterhash"] = -804804953,     ["watertype"] = "lake"},
    [13] =  {["name"] = "死石小溪",                  ["waterhash"] = 1245451421,     ["watertype"] = "river"},
    [14] =  {["name"] = "蜘蛛峡谷",                  ["waterhash"] = -218679770,     ["watertype"] = "river"},
    [15] =  {["name"] = "克雷格的泉水",              ["waterhash"] = -1817904483,    ["watertype"] = "lake"},
    [16] =  {["name"] = "月石池塘",                  ["waterhash"] = -811730579,     ["watertype"] = "lake"},
    [17] =  {["name"] = "罗诺克山谷",                ["waterhash"] = -1229593481,    ["watertype"] = "river"},
    [18] =  {["name"] = "伊丽西安瀑布",              ["waterhash"] = -105598602,     ["watertype"] = "lake"},
    [19] =  {["name"] = "兰纳斯河",                  ["waterhash"] = -2040708515,    ["watertype"] = "river"},
    [20] =  {["name"] = "随机河流1",                ["waterhash"] = 231313522,      ["watertype"] = "river"},
    [21] =  {["name"] = "随机河流2",                ["waterhash"] = 2005774838,     ["watertype"] = "river"},
    [22] =  {["name"] = "随机河流3",                ["waterhash"] = -1287619521,    ["watertype"] = "river"},
    [23] =  {["name"] = "随机河流4",                ["waterhash"] = -1308233316,    ["watertype"] = "river"},
    [24] =  {["name"] = "随机河流5",                ["waterhash"] = -196675805,     ["watertype"] = "river"},
    [25] =  {["name"] = "巴希亚德拉帕兹",            ["waterhash"] = -1168459546,    ["watertype"] = "sea"},
    [26] =  {["name"] = "蛇谷溪",                    ["waterhash"] = -49694339,      ["watertype"] = "river"},
}

Config.Emotes = {
    Actions = {
        ['banjo'] = {
            desc = '弹班卓琴动作',
            anim = -1861447822
        },
        ['becon'] = {
            desc = '你过来',
            anim = 2143329621
        },
        ['goldcoin'] = {
            desc = '金币',
            anim = 397025279
        },
        ['blowkiss'] = {
            desc = '飞吻',
            anim = 1927505461
        },
        ['boast'] = {
            desc = '大拇指指自己',
            anim = -1252070669
        },
        ['watch'] = {
            desc = '怀表',
            anim = -380388425
        },
        ['coinflip'] = {
            desc = '抛硬币',
            anim = -667707842
        },
        ['fistpump'] = {
            desc = '欢呼',
            anim = -402959
        },
        ['flex'] = {
            desc = '展示强壮',
            anim = -773960361
        },
        ['followme'] = {
            desc = '跟着我',
            anim = 1115379199
        },
        ['hissyfit'] = {
            desc = '无能狂怒',
            anim = 796723886
        },
        ['howl'] = {
            desc = '狼叫',
            anim = 877603501
        },
        ['hypnowatch'] = {
            desc = '怀表催眠',
            anim = -869481556
        },
        ['idea'] = {
            desc = '有点子',
            anim = -289055561
        },
        ['letscraft'] = {
            desc = '砸东西',
            anim = -415456998
        },
        ['letsfish'] = {
            desc = '一起去钓鱼',
            anim = 1159716480
        },
        ['letsgo'] = {
            desc = '一起走',
            anim = 1593752891
        },
        ['letsplaycards'] = {
            desc = '一起玩卡片吧',
            anim = -843470756
        },
        ['listen'] = {
            desc = '听声音',
            anim = -1251254114
        },
        ['lookdistance'] = {
            desc = '望远',
            anim = 935157006
        },
        ['lookyonder'] = {
            desc = '看手心',
            anim = 7918540
        },
        ['newthreads'] = {
            desc = '擦手',
            anim = -919436740
        },
        ['point'] = {
            desc = '指你',
            anim = 486225122
        },
        ['posseup'] = {
            desc = '向上挥舞',
            anim = 474409519
        },
        ['prayer'] = {
            desc = '祈祷',
            anim = 844130790
        },
        ['jig'] = {
            desc = '手舞足蹈',
            anim = 1307697675
        },
        ['rps'] = {
            desc = '石头剪子布',
            anim = -1219119695
        },
        ['scheme'] = {
            desc = '阴谋诡计',
            anim = 589481092
        },
        ['shoothip'] = {
            desc = '中弹',
            anim = 1639456476
        },
        ['skyshoot'] = {
            desc = '假装朝天开枪',
            anim = 1939251934
        },
        ['smokecigar'] = {
            desc = '抽雪茄',
            anim = -2124325981
        },
        ['smokecigarette'] = {
            desc = '抽香烟',
            anim = -1954574613
        },
        ['snotrocket'] = {
            desc = '吐痰',
            anim = 1695841551
        },
        ['spinaim'] = {
            desc = '晃手臂',
            anim = 988397866
        },
        ['slit'] = {
            desc = '威胁割脖子',
            anim = 1256841324
        },
        ['spooky'] = {
            desc = '施展魔法',
            anim = -799896264
        },
        ['stophere'] = {
            desc = '四处挥手',
            anim = -1691237868
        },
        ['takenotes'] = {
            desc = '记笔记',
            anim = -1169051375
        },
        ['wetwhistle'] = {
            desc = '酒瓶喝酒',
            anim = -1548499813
        },
    },
    Greeting = {
        ['fancybow'] = {
            desc = '华丽鞠躬',
            anim = -2121881035
        },
        ['flyingkiss'] = {
            desc = '飞吻2',
            anim = 1329464356
        },
        ['gentalwave'] = {
            desc = '绅士挥手',
            anim = 901097731
        },
        ['getoverhere'] = {
            desc = '到那去',
            anim = -1666834415
        },
        ['glad'] = {
            desc = '感谢',
            anim = 523585988
        },
        ['handshake'] = {
            desc = '握手',
            anim = 1785080714
        },
        ['hatflick'] = {
            desc = '飞帽致敬',
            anim = -511010399
        },
        ['hattip'] = {
            desc = '扶帽致敬',
            anim = -1457020913
        },
        ['heyyou'] = {
            desc = '你好',
            anim = 831975651
        },
        ['outpour'] = {
            desc = '敞开心扉',
            anim = -427334733
        },
        ['roughhousing'] = {
            desc = '拳击',
            anim = -1389921219
        },
        ['seven'] = {
            desc = '比出七',
            anim = 1018554126
        },
        ['sutlewave'] = {
            desc = '挥手',
            anim = -1551032732
        },
        ['tada'] = {
            desc = '欢呼',
            anim = -462132925
        },
        ['thumbsdown'] = {
            desc = '大拇指向下',
            anim = 1509171361
        },
        ['thumbsup'] = {
            desc = '大拇指向上',
            anim = 425751659
        },
        ['wavenear'] = {
            desc = '打招呼',
            anim = -339257980
        },
    },
    Reactions = {
        ['amazed'] = {
            desc = '喜笑颜开',
            anim = -48594731
        },
        ['applause'] = {
            desc = '鼓掌',
            anim = -221241824
        },
        ['begmercy'] = {
            desc = '祈求天使',
            anim = 164860528
        },
        ['clapalong'] = {
            desc = '鼓掌2',
            anim = -934299978
        },
        ['facepalm'] = {
            desc = '捂脸',
            anim = -1384541404
        },
        ['hangover'] = {
            desc = '感到恶心',
            anim = -78874669
        },
        ['howdareyou'] = {
            desc = '感到惊讶',
            anim = 1802342943
        },
        ['hurl'] = {
            desc = '呕吐',
            anim = -1118911493
        },
        ['hushyourmouth'] = {
            desc = '嘘',
            anim = -1644757697
        },
        ['joviallaugh'] = {
            desc = '大笑',
            anim = 296809845
        },
        ['nodhead'] = {
            desc = '点头',
            anim = -822629770
        },
        ['phew'] = {
            desc = '擦汗',
            anim = -1362920197
        },
        ['pointlaugh'] = {
            desc = '指着大笑',
            anim = 803206066
        },
        ['scared'] = {
            desc = '惊吓',
            anim = -1312563584
        },
        ['shakehead'] = {
            desc = '摇头2',
            anim = -653113914
        },
        ['shot'] = {
            desc = '中枪',
            anim = -110352861
        },
        ['shrug'] = {
            desc = '无所谓',
            anim = 772373429
        },
        ['shuffle'] = {
            desc = '跟随音乐起舞',
            anim = -1000272583
        },
        ['slowclap'] = {
            desc = '缓慢拍手',
            anim = 1023735814
        },
        ['sniffing'] = {
            desc = '闻味道',
            anim = -1343104589
        },
        ['sob'] = {
            desc = '掩面痛哭',
            anim = 81347960
        },
        ['surrender'] = {
            desc = '举白旗',
            anim = -1023149885
        },
        ['thanks'] = {
            desc = '谢谢',
            anim = 2144049308
        },
        ['thisguy'] = {
            desc = '这个家伙',
            anim = 593885605
        },
        ['wagfinger'] = {
            desc = '食指拒绝摇晃',
            anim = -12201726
        },
        ['谁?我?'] = {
            desc = 'Do the whome Emote',
            anim = 329631369
        },
        ['耶'] = {
            desc = 'Do the yeehaw Emote',
            anim = 445839715
        },
    },
    Taunting = {
        ['bestshot'] = {
            desc = '来你打我',
            anim = 1582069421
        },
        ['boohoo'] = {
            desc = '大哭',
            anim = 246916594
        },
        ['chicken'] = {
            desc = '小鸡',
            anim = 1825177171
        },
        ['cocksnook'] = {
            desc = '鼻子整蛊',
            anim = 1379772889
        },
        ['cougarsnarl'] = {
            desc = '我是老虎老虎',
            anim = 698079535
        },
        ['cruisingbrusing'] = {
            desc = '要打人',
            anim = 456609832
        },
        ['cuckoo'] = {
            desc = '脑子有问题',
            anim = -1570999495
        },
        ['fiddlehead'] = {
            desc = '做鬼脸',
            anim = 541002968
        },
        ['fingerslinger'] = {
            desc = '假装掏枪是中指',
            anim = -795365613
        },
        ['flipoff'] = {
            desc = '竖起中指',
            anim = 969312568
        },
        ['frighten'] = {
            desc = '我是豹豹',
            anim = -1169275072
        },
        ['gorillachest'] = {
            desc = '捶胸大喊',
            anim = 1897736735
        },
        ['watchingyou'] = {
            desc = '盯着你呢',
            anim = -553424129
        },
        ['insignificant'] = {
            desc = '用手比大小',
            anim = 547084638
        },
        ['provoke'] = {
            desc = '蒸馍不服气',
            anim = 1533402397
        },
        ['ripper'] = {
            desc = '耍飞刀',
            anim = 1814567801
        },
        ['throatslit'] = {
            desc = '割脖子2',
            anim = 1256841324
        },
        ['upyours'] = {
            desc = '举臂嘲讽',
            anim = 354512356
        },
        ['versus'] = {
            desc = '来单挑啊',
            anim = -2104721573
        },
        ['warcry'] = {
            desc = '战斗咆哮',
            anim = 987239450
        },
        ['youstink'] = {
            desc = '太臭了',
            anim = -166523388
        },
    },
    Dancing = {
        ['dance1'] = {
            desc = '舞蹈动作',
            anim = "script_mp@emotes@dance@carefree@a@male@unarmed@full",
            dict = "fullbody",
            duration = 9000,
        },
        ['dance2'] = {
            desc = '舞蹈动作2',
            anim = "script_mp@emotes@dance@carefree@b@male@unarmed@full",
            dict = "fullbody",
            duration = 9000,
        },
    },
}

-- map zones
Config.Zones = {
--AMBARINO
    {Hash = 0x3B8DD21A, Color = 'BLIP_MODIFIER_MP_COLOR_1'}, --STATE_AMBARINO
    {Hash = 0x3BBA228A, Color = 'BLIP_MODIFIER_MP_COLOR_13'}, --LBS_AMBARINO_BOUNTY
    --{Hash = 0x9125D14C, Color = 'BLIP_MODIFIER_MP_COLOR_22'}, --DISTRICT_GRIZZLIES
    --{Hash = 0x943198D3, Color = 'BLIP_MODIFIER_MP_COLOR_1'}, --DISTRICT_GRIZZLIES_EAST
    --{Hash = 0xD41D039A, Color = 'BLIP_MODIFIER_MP_COLOR_21'}, --DISTRICT_GRIZZLIES_WEST
    --{Hash = 0xBB785C8A, Color = 'BLIP_MODIFIER_MP_COLOR_2'}, --REGION_GRZ_WAPITI
    --{Hash = 0x4F45BE43, Color = 'BLIP_MODIFIER_MP_COLOR_2'}, --OUTLINE_WAPITI

--LEMOYNE
    {Hash = 0x945395DF, Color = 'BLIP_MODIFIER_MP_COLOR_3'}, --STATE_LEMOYNE
    {Hash = 0x0F32B44D, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --LBS_LEMOYNE_BOUNTY
    --{Hash = 0x2843E325, Color = 'BLIP_MODIFIER_MP_COLOR_3'}, --DISTRICT_BAYOU_NWA
    --{Hash = 0x024C01CA, Color = 'BLIP_MODIFIER_MP_COLOR_14'}, --DISTRICT_BLUEGILL_MARSH
    --{Hash = 0x0BB92EEF, Color = 'BLIP_MODIFIER_MP_COLOR_22'}, --DISTRICT_SCARLETT_MEADOWS
    --{Hash = 0x9652B96E, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --REGION_BAY_LAGRAS
    --{Hash = 0x049BBBD4, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --OUTLINE_LAGRAS
    --{Hash = 0x2A6CBBA2, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --REGION_BAY_SAINT_DENIS
    --{Hash = 0xC354EAC2, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --OUTLINE_SAINT_DENIS
    --{Hash = 0x2D1A7AF2, Color = 'BLIP_MODIFIER_MP_COLOR_2'}, --REGION_BLU_SISIKA
    --{Hash = 0xFC531E7A, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --REGION_SCM_BRAITHWAITEMANOR
    --{Hash = 0x5E68036B, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --OUTLINE_BRAITHWAITEMANOR
    --{Hash = 0xD218D90D, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --REGION_SCM_CALIGAHALL
    --{Hash = 0xE074391B, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --OUTLINE_CALIGAHALL
    --{Hash = 0xD3F2B8A7, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --REGION_SCM_RHODES
    --{Hash = 0x09FAE063, Color = 'BLIP_MODIFIER_MP_COLOR_15'}, --OUTLINE_RHODES


--NEW AUSTIN
    {Hash = 0x41759831, Color = 'BLIP_MODIFIER_MP_COLOR_4'}, --STATE_NEW_AUSTIN
    {Hash = 0xD339F6AB, Color = 'BLIP_MODIFIER_MP_COLOR_16'}, --LBS_NEW_AUSTIN_BOUNTY
    --{Hash = 0x99B6A1E6, Color = 'BLIP_MODIFIER_MP_COLOR_4'}, --DISTRICT_CHOLLA_SPRINGS
    --{Hash = 0x3AC128F9, Color = 'BLIP_MODIFIER_MP_COLOR_30'}, --DISTRICT_GAPTOOTH_RIDGE
    --{Hash = 0x33D88587, Color = 'BLIP_MODIFIER_MP_COLOR_18'}, --DISTRICT_HENNIGANS_STEAD
    --{Hash = 0xD428627B, Color = 'BLIP_MODIFIER_MP_COLOR_29'}, --DISTRICT_RIO_BRAVO


--NEW HANOVER
    {Hash = 0x41332496, Color = 'BLIP_MODIFIER_MP_COLOR_8'}, --STATE_NEW_HANOVER
    {Hash = 0x5CD2A36F, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --LBS_NEW_HANOVER_BOUNTY

    --{Hash = 0x717F4A96, Color = 'BLIP_MODIFIER_MP_COLOR_11'}, --DISTRICT_CUMBERLAND_FOREST
    --{Hash = 0x724E7654, Color = 'BLIP_MODIFIER_MP_COLOR_8'}, --DISTRICT_HEARTLAND
    --{Hash = 0x30FAE29B, Color = 'BLIP_MODIFIER_MP_COLOR_19'}, --DISTRICT_ROANOKE_RIDGE
    --{Hash = 0x1BDD5A12, Color = 'BLIP_MODIFIER_MP_COLOR_2'}, --REGION_CML_OLDFORTWALLACE
    --{Hash = 0x2FE84F0E, Color = 'BLIP_MODIFIER_MP_COLOR_2'}, --OUTLINE_OLDFORTWALLACE
    --{Hash = 0x7B23B4C7, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --REGION_HRT_CORNWALLKEROSENE
    --{Hash = 0x150D72E9, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --OUTLINE_CORNWALLKEROSEN
    --{Hash = 0x6E7BDAC4, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --REGION_HRT_EMERALDRANCH
    --{Hash = 0x13A98173, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --OUTLINE_EMERALD
    --{Hash = 0x0079B7EE, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --REGION_HRT_VALENTINE
    --{Hash = 0x2A24C8D9, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --OUTLINE_VALENTINE
    --{Hash = 0x0A8B2CBE, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --REGION_ROA_ANNESBURG
    --{Hash = 0x9CC09C3D, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --OUTLINE_ANNESBURG
    --{Hash = 0xA053D058, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --REGION_ROA_BUTCHERCREEK
    --{Hash = 0xB6831F62, Color = 'BLIP_MODIFIER_MP_COLOR_20'}, --OUTLINE_BUTCHERCREEK
    --{Hash = 0x507B5360, Color = 'BLIP_MODIFIER_MP_COLOR_2'}, --REGION_ROA_VANHORNPOST
    --{Hash = 0x194E52AF, Color = 'BLIP_MODIFIER_MP_COLOR_2'}, --OUTLINE_VANHORNPOST

--WEST ELIZABETH
    {Hash = 0xD69B5B49, Color = 'BLIP_MODIFIER_MP_COLOR_6'}, --STATE_WEST_ELIZABETH
    {Hash = 0xF030C0B2, Color = 'BLIP_MODIFIER_MP_COLOR_23'}, --LBS_W_ELIZABETH_BOUNTY
    --{Hash = 0x8DCC574F, Color = 'BLIP_MODIFIER_MP_COLOR_6'}, --DISTRICT_BIG_VALLEY
    --{Hash = 0x0E95FF51, Color = 'BLIP_MODIFIER_MP_COLOR_28'}, --DISTRICT_GREAT_PLAINS
    --{Hash = 0x763A8A87, Color = 'BLIP_MODIFIER_MP_COLOR_31'}, --DISTRICT_TALL_TREES
    --{Hash = 0x4663EEB9, Color = 'BLIP_MODIFIER_MP_COLOR_23'}, --REGION_BGV_STRAWBERRY
    --{Hash = 0x3B4A5D5B, Color = 'BLIP_MODIFIER_MP_COLOR_23'}, --OUTLINE_STRAWBERRY
    --{Hash = 0x5647E155, Color = 'BLIP_MODIFIER_MP_COLOR_23'}, --REGION_GRT_BLACKWATER
    --{Hash = 0x129E1411, Color = 'BLIP_MODIFIER_MP_COLOR_23'}, --OUTLINE_BLACKWATER
    --{Hash = 0xDC87C0C8, Color = 'BLIP_MODIFIER_MP_COLOR_23'}, --REGION_TAL_MANZANITAPOST


--GUARMA
    --{Hash = 0x9307FD41, Color = 'BLIP_MODIFIER_MP_COLOR_7'}, --STATE_GUARMA
    --{Hash = 0x6009F334, Color = 'BLIP_MODIFIER_MP_COLOR_7'}, --LBS_GUARMA_BOUNTY

    --{Hash = 0x6E10D212, Color = 'BLIP_MODIFIER_MP_COLOR_7'}, --REGION_GUA_MANICATO


--NUEVO PARAÍSO
    --{Hash = 0x8966022D, Color = 'BLIP_MODIFIER_MP_COLOR_22'}, --DISTRICT_DIEZ_CORONAS
    --{Hash = 0x27253ED3, Color = 'BLIP_MODIFIER_MP_COLOR_22'}, --DISTRICT_PERDIDO
    --{Hash = 0x5046DD11, Color = 'BLIP_MODIFIER_MP_COLOR_22'}, --DISTRICT_PUNTA_ORGULL


--UNKNOWN
    --{Hash = 0xFAF570C5, Color = 'BLIP_MODIFIER_MP_COLOR_22'}, --LOCKOUT_EASTSIDE
    --{Hash = 0xAF5E7C06, Color = 'BLIP_MODIFIER_MP_COLOR_22'}, --STATE_DEFAULT
    --{Hash = 0x21FE6ED8, Color = 'BLIP_MODIFIER_MP_COLOR_1'}, --¿?
    --{Hash = 0x28181665, Color = 'BLIP_MODIFIER_MP_COLOR_2'}, --¿?
    --{Hash = 0x33F2D34F, Color = 'BLIP_MODIFIER_MP_COLOR_3'}, --¿?
    --{Hash = 0x3FB16CC9, Color = 'BLIP_MODIFIER_MP_COLOR_4'}, --¿?
    --{Hash = 0x46837F42, Color = 'BLIP_MODIFIER_MP_COLOR_5'}, --¿?
    --{Hash = 0x703A27B1, Color = 'BLIP_MODIFIER_MP_COLOR_6'}, --¿?
    --{Hash = 0x89C0A213, Color = 'BLIP_MODIFIER_MP_COLOR_7'}, --¿?
    --{Hash = 0x90CA4AF8, Color = 'BLIP_MODIFIER_MP_COLOR_8'}, --¿?
    --{Hash = 0x95B1E77A, Color = 'BLIP_MODIFIER_MP_COLOR_9'}, --¿?
    --{Hash = 0xAE021C70, Color = 'BLIP_MODIFIER_MP_COLOR_10'}, --¿?
    --{Hash = 0xBBB91AAD, Color = 'BLIP_MODIFIER_MP_COLOR_11'}, --¿?
    --{Hash = 0xC1C68746, Color = 'BLIP_MODIFIER_MP_COLOR_12'}, --¿?
}
