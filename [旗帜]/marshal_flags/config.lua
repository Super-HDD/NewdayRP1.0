Config = {}



-- 推荐设置，如果使用 RedEMRP，请切换它！在 Discord 中获取支持

-- 这是您选择的框架，如果您正在使用框架
Config.framework = 'OTHER' -- 选项: "VORP", "REDEMRP", "OTHER"

Config.nativeText = false -- 使用本机文本提示，而不是框架文本，如果选择 "OTHER"，则默认为此

-- 显示消息的持续时间
Config.timeDisplay = 5 * 1000 -- 显示消息 5 秒钟，将数字 5 更改为减少或增加时间

-- 默认情况下，马背上禁用使用动画，将其设置为 false 以启用它们
Config.disableHorseAnimation = true

-- 使用斜杠命令，通过在游戏中的聊天中键入命令来激活
Config.slashCommands = true
Config.flaguse = "flag" -- /flag --在游戏中的聊天中
Config.flagdrop = "flagdrop" -- /flagdrop
Config.flagpickup = "flagpickup" -- /flagpickup
Config.flagdelete = "flagdelete" -- /flagdelete
-- 如果不使用框架，可以根据项目类型设置默认旗帜以拉出 /flagdefault aceflag [这将设置默认旗帜为 aceflag，对于独立框架非常有用]
Config.setDefaultType = 'flagdefault'

-- 有关不同旗帜类型，请参考项目
Config.defaultFlagType = 'american'

-- 斜杠命令的聊天建议，可以更改为其他语言
Config.flagdefaultdescription = '设置默认旗帜类型'
Config.flagtakeouttdescription = '取出一面旗帜'
Config.flagdropdescription = '放下一个旗帜'
Config.flagpickupdescription = '拾起您的旗帜'
Config.flagdeletedescription = '删除一个旗帜'

-- 使用键来拾取旗帜，放下它以及删除它
Config.useKeys = true --

-- 如果您不希望控制器按钮干扰您的键选择，请将其设置为 true
Config.disableKeyPressUsingContoller = false

--[[ REDM 中可用键的列表 -
A、B、C、D、E、F、G、H、I、J、L、M、N、P、Q、R、S、U、V、W、X、Y、Z
RIGHTBRACKET、LEFTBRACKET、CTRL、TAB、SHIFT、ENTER、BACKSPACE、LEFTALT、DEL、PGUP、PGDN
F1、F4、F6、1、2、3、4、6、7、8、DOWN、UP、LEFT、RIGHT（箭头键）
]] --

-- 请记住，根据您当前的操作，某些其他脚本或本机函数可能会阻止某些键的使用。

Config.takeOutFlag = false -- [取出旗帜键] 默认情况下，您应该使用物品来取出它，但已禁用
-- 用于取出旗帜的键，默认情况下禁用，我建议使用 /flag 或物品来取出旗帜
Config.flaguseKey = "B"
-- 用于拾取旗帜的键
Config.pickupKey = "G"
-- 用于放下旗帜的键
Config.dropKey = "G"
-- 用于删除旗帜的键
Config.deleteKey = "BACKSPACE"

-- 显示拾取旗帜提示的距离，仅在启用键时使用
Config.displayPickupDist = 2.0

-- 最大拾取旗帜距离
Config.maxPickupDist = 5.0

Config.pickupFlagPrompt = '按 [' .. Config.pickupKey .. '] 键拾取'

Config.deployFlagPrompt = ' 按 [' .. Config.dropKey .. '] 键放下旗帜'

Config.textOnUse = true
Config.flagouttext = '旗帜已取出！'

-- 允许在放下旗帜时发送消息
Config.textOnDrop = true
Config.flagdroptext = '旗帜已放下！'

-- 允许在拾取旗帜时发送消息
Config.textOnPickup = true
Config.flagpickuptext = '旗帜已拾取！'

Config.flagfartext = '旗帜距离太远，无法拾取！'

-- 锁定到特定职业， 默认关闭
Config.joblock = false

--whitelist
Config.jobs = {
    "army",
    "ranger",
    "police",
    "lbzf",
}

Config.itemRequired = true -- item required to take out a flag

-- DO NOT MESS WITH THIS, UNLESS YOU KNOW WHAT YOU ARE DOING!!!
Config.items = {
    {name = 'americanflag', label = 'American Flag', type = 'american', c = 1},
    {name = 'whiteflag', label = 'White Flag', type = 'white', c = 1},
    {name = "redflag", label = 'Red Flag', type = 'red', c = 1},
    {name = 'campflag', label = 'Camp Flag', type = 'campflag', c = 1},
    {name = 'lemoynelongflag', label = 'Lemoyne Flag (Long)', type = 'lemoynelongflag', c = 1}, 
    {name = 'whitelongflag', label = 'White Flag (Long)', type = 'whitelongflag', c = 1},
    {name = 'alligatorflag', label = 'Alligator Flag', type = 'alligator', c = 0},
    {name = 'ambarinoflag', label = 'Ambarino Flag', type = 'ambarino', c = 0},
    {name = 'aceflag', label = 'Ace Flag', type = 'ace', c = 0},
    {name = 'anchorflag', label = 'Anchor Flag', type = 'anchour', c = 0},
    {name = 'breweryflag', label = 'Brewery Flag', type = 'baltz', c = 0},
    {name = 'bearflag', label = 'Bear Flag', type = 'bear', c = 0},
    {name = 'buckflag', label = 'Buck Flag', type = 'buck', c = 0},
    {name = 'clamjuiceflag', label = 'Clam Juice Flag', type = 'clamjuice', c = 0},
    {name = 'coyoteflag', label = 'Coyote Flag', type = 'coyote', c = 0},
    {name = 'eagleflag', label = 'Eagle Flag', type = 'eagle', c = 0},
    {name = 'festaflag', label = 'Festa Flag', type = 'festa', c = 0},
    {name = 'fishflag', label = 'Fish Flag', type = 'fish', c = 0},
    {name = 'gelatinflag', label = 'Gelatin Flag', type = 'gelatin', c = 0},
    {name = 'gilamonsterflag', label = 'Gila Monster Flag', type = 'gilamonster', c = 0},
    {name = 'guarmaflag', label = 'Guarma Flag', type = 'guarma', c = 0},
    {name = 'jollyjacksflag', label = 'Jolly Jacks Flag', type = 'jollyjacks', c = 0},
    {name = 'lallycolaflag', label = 'Lally Cola Flag', type = 'lallycola', c = 0},
    {name = 'lemoyneflag', label = 'Lemoyne Flag', type = 'lemoyne', c = 0},
    {name = 'morganflag', label = 'Morgan Flag', type = 'morgan', c = 0},
    {name = 'newhanoverflag', label = 'New Hanover Flag', type = 'newhanover', c = 0},
    {name = 'oldbloodeyesflag', label = 'Old Blood Eyes Flag', type = 'oldbloodeyes', c = 0},
    {name = 'pirateskullsflag', label = 'Pirate Skulls Flag', type = 'pirateskulls', c = 0},
    {name = 'prairiemoonginflag', label = 'Prairie Moongin Flag', type = 'prairiemoongin', c = 0},
    {name = 'schifferflag', label = 'Schiffer Flag', type = 'schiffer', c = 0},
    {name = 'stdenisflag', label = 'St. Denis Flag', type = 'stdenis', c = 0},
    {name = 'sturgeonflag', label = 'Sturogen Flag', type = 'sturgeon', c = 0},
    {name = 'tennesseeflag', label = 'Tennessee Flag', type = 'tennessee', c = 0},
    {name = 'vultureflag', label = 'Vulture Flag', type = 'vulture', c = 0},
    {name = 'westelizabethflag', label = 'West Elizabeth Flag', type = 'westelizabeth', c = 0},
    {name = 'catfishflag', label = 'Catfish Flag', type = 'catfish', c = 0},
}

Config.debug = false






