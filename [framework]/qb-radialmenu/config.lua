Config = {}

Config.EnableExtraMenu = false

Config.MenuItems = {
    [1] = {
        id = 'world',
        title = '基础',
        icon = 'info',
        items = {
            
            {
                id = 'info',
                title = '个人信息',
                icon = 'info',
                type = 'client',
                event = 'qb-radialmenu:client:info',
                shouldClose = true
            },
            {
                id = 'info',
                title = '联系管理员',
                icon = 'info',
                type = 'client',
                event = 'report:NewFeedback',
                shouldClose = true
            }
        }
    }, 
    [2] = {
        id = 'horse',
        title = '马',
        icon = 'horse-head',
        items = {
            {
                id = 'horselantern',
                title = '马灯笼',
                icon = 'lightbulb',
                type = 'client',
                event = 'qb-horses:client:equipHorseLantern',
                shouldClose = true
            },
            {
                id = 'horseinventory',
                title = '存货',
                icon = 'box',
                type = 'client',
                event = 'qb-horses:client:inventoryHorse',
                shouldClose = true
            },
        },
    },
    [3] = {
        id = 'user',
        title = '市民互动',
        icon = 'user',
        items = {
            {     
                id = 'walkstyles',
                title = '步行风格',
                icon = 'person-walking',
                items = {
                    {
                        id = 'normal',
                        title = '正常',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:normal',
                        shouldClose = true
                    },
                    {
                        id = 'angry',
                        title = '愤怒',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:angry',
                        shouldClose = true
                    },
                    {
                        id = 'war_veteran',
                        title = '老将',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:war_veteran',
                        shouldClose = true
                    },
                    {
                        id = 'gold_panner',
                        title = 'Gold Panner',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:gold_panner',
                        shouldClose = true
                    },
                    {
                        id = 'lost_Man',
                        title = '失魂',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:lost_Man',
                        shouldClose = true
                    },
                    {
                        id = 'murfree',
                        title = '默弗里',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:murfree',
                        shouldClose = true
                    },
                    {
                        id = 'primate',
                        title = 'Primate',
                        icon = 'person-walking',
                        type = 'client',
                        event = 'walkstyles:client:primate',
                        shouldClose = true
                    },
                }
            },
            {
                id = 'emotes',
                title = '表情',
                icon = 'hand',
                type = 'command',
                event = 'em',
                shouldClose = true
            },
            {
                id = 'contraband',
                title = '违禁品',
                icon = 'skull-crossbones',
                type = 'command',
                event = 'sellcontraband',
                shouldClose = true
            },
            
            {
                id = 'billing',
                title = '账单',
                icon = 'file-invoice-dollar',
                type = 'client',
                event = 'src-billing:openmenu',
                shouldClose = true
            },
            {
                id= 'adressbook',
                title = '地址簿',
                icon = 'address-book',
                type = 'client',
                event = 'qb-telegram:client:OpenAddressbook',
                shouldClose = true
            },
            {
                id = 'stealplayer',
                title = '抢劫',
                icon = 'mask',
                type = 'client',
                event = 'qb-looting:client:RobPlayer',
                shouldClose = true
            },
        },
    },
    [4] = {
        id = 'clothing',
        title = '服装',
        icon = 'shirt',
        items = {
            {
                id = 'dress',
                title = '刷新',
                icon = 'person-dress',
                type = 'command',
                event = 'dress',
                shouldClose = true
            },
            {
                id = 'undress',
                title = '脱衣服',
                icon = 'person-half-dress',
                type = 'command',
                event = 'undress',
                shouldClose = true
            },
            {
                id = 'onoffhat',
                title = '帽子',
                icon = 'hat-cowboy',
                type = 'command',
                event = 'hat',
                shouldClose = true
            },
            {
                id = 'onoffvest',
                title = '背心',
                icon = 'vest',
                type = 'command',
                event = 'vest',
                shouldClose = true
            },
            {
                id = 'onoffboots',
                title = '靴子',
                icon = 'shoe-prints',
                type = 'command',
                event = 'boots',
                shouldClose = true
            },
            {
                id = 'onoffpants',
                title = '裤子',
                icon = 'socks',
                type = 'command',
                event = 'pants',
                shouldClose = true
            },
            {
                id = 'onoffshirt',
                title = '衬衫',
                icon = 'shirt',
                type = 'command',
                event = 'shirt',
                shouldClose = true
            },
            {
                id = 'onoffgunbelt',
                title = '枪带',
                icon = 'gun',
                type = 'command',
                event = 'gunbelt',
                shouldClose = true
            },
            {
                id = 'onoffmask',
                title = '面具',
                icon = 'masks-theater',
                type = 'command',
                event = 'mask',
                shouldClose = true
            },
            {
                id = 'onoffcoat',
                title = '外套',
                icon = 'vest-patches',
                type = 'command',
                event = 'coat',
                shouldClose = true
            },
            {
                id = 'onoffclosedcoat',
                title = '封闭外套',
                icon = 'vest-patches',
                type = 'command',
                event = 'closedcoat',
                shouldClose = true
            },
            {
                id = 'onoffbandana',
                title = '蒙面巾',
                icon = 'masks-theater',
                type = 'command',
                event = 'bandana',
                shouldClose = true
            },
        },
    },
    
}

Config.JobInteractions = {
    ["medic"] = {
        {
            id = 'medicbutton',
            title = '紧急按钮',
            icon = 'exclamation',
            type = 'client',
            event = 'qb-radialmenu:client:SendMedicEmergencyAlert',
            shouldClose = true
        },{
            id = 'revivep',
            title = '治疗',
            icon = 'user-doctor',
            type = 'client',
            event = 'qb-medic:client:RevivePlayer',
            shouldClose = true
        },{
            id = 'treatwounds',
            title = '治愈伤口',
            icon = 'bandage',
            type = 'client',
            event = 'qb-medic:client:TreatWounds',
            shouldClose = true
        },
        { 
            id = 'yihufuzhuang', 
            title = '医护服装', 
            icon = 'shirt', 
            type = 'client', 
            event = 'qb-medic:client:clothing', 
            shouldClose = true
         },
    },
    ["police"] = {
        {
            id = 'policebutton',
            title = '紧急按钮',
            icon = 'exclamation',
            type = 'client',
            event = 'qb-radialmenu:client:SendPoliceEmergencyAlert',
            shouldClose = true
        },{
            id = 'handcuff',
            title = '上拷/解拷',
            icon = 'user-lock',
            type = 'client',
            event = 'police:client:CuffPlayerSoft',
            shouldClose = true
        },{
            id = 'checkstatus',
            title = '检查状态',
            icon = 'question',
            type = 'client',
            event = 'police:client:CheckStatus',
            shouldClose = true
        },{
            id = 'escort',
            title = '护送',
            icon = 'user-group',
            type = 'client',
            event = 'police:client:EscortPlayer',
            shouldClose = true
        }, {
            id = 'searchplayer',
            title = '搜身',
            icon = 'magnifying-glass',
            type = 'client',
            event = 'police:client:SearchPlayer',
            shouldClose = true
        }, {
            id = 'searchhorse',
            title = '搜索马匹',
            icon = 'magnifying-glass',
            type = 'client',
            event = 'police:client:SearchHorse',
            shouldClose = true
        }, {
            id = 'jailplayer',
            title = '监狱',
            icon = 'user-lock',
            type = 'client',
            event = 'police:client:JailPlayer',
            shouldClose = true
        }, {
            id = 'lawbadge',
            title = '徽章开/关',
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        }, { 
            id = 'jingfu', 
            title = '警服', 
            icon = 'shirt', 
            type = 'client', 
            event = 'sirevlc_law_and_order_menu', 
            shouldClose = true
         },

         { 
            id = 'mdt', 
            title = '公民信息登记簿', 
            icon = 'mobile-screen', 
            type = 'command', 
            event = 'mdt', 
            shouldClose = true
         },
    },
    ["horsetrainer"] = {
        {
            id = 'starttraining',
            title = '开启/关闭训练',
            icon = 'horse-head',
            type = 'client',
            event = 'qb-horsetrainer:client:startTraining',
            shouldClose = true
        },
        {
            id = 'trainerbrush',
            title = '给马匹刷毛',
            icon = 'horse-head',
            type = 'client',
            event = 'qb-horsetrainer:client:brushHorse',
            shouldClose = true
        },
        {
            id = 'trainercarrot',
            title = '喂马匹吃胡萝卜',
            icon = 'horse-head',
            type = 'client',
            event = 'qb-horsetrainer:client:feedHorse',
            shouldClose = true
        },
        {
            id = 'checkhorsexp',
            title = '检查马匹经验值',
            icon = 'horse-head',
            type = 'client',
            event = 'qb-horsetrainer:client:checkHorseEXP',
            shouldClose = true
        }
    },
}
