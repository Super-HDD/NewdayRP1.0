Config = {
    
    Framework = 'qb-core',  -- Don't touch this. Change it only if you have renamed qb
    Debug = false, -- Command for me to debug script. It print to console passes trough conditions. true/false
    Rights = 'admin', -- Here you can set a rights for this command
    CharKill = "ck", -- 将从数据库中删除你的角色的命令名称（通过 ID 玩家/公民 ID） ------ (ck)

    -----------------------------------------------------------------

    Wipe = 'wipe', -- 移除所有玩家
    WipeRights = 'god', -- 擦除命令的权限
    WipeSecureWord = 'NeverGonnaGiveYouUp', -- 您必须使用这个词来确认擦除 /wipe NeverGonnaGiveYouUp

    -----------------------------------------------------------------

    -- 此消息向服务器上的玩家显示，他们因擦除而被踢出
    WipeMessage = '服务器当前正在擦除所有辛苦获得的东西:Wink:。 停电后见.' ,

    -----------------------------------------------------------------
    VersionCheck = true,
}

Delete = {
    'players',                -- Remove Player from DB
    'player_vehicles',      -- Remove Player vehicles from DB
    'player_outfits',        -- Remove Player outfits from DB
    'player_contacts',      -- Remove Player contacts from DB
    'player_houses',          -- Remove Player houses from DB
    'player_mails',            -- Remove Player mails from DB 
    'apartments',         -- Remove Player apartments from DB
    'bank_accounts',        -- Remove Player bank accounts from DB
    'bank_statements',     -- Remove Player bank statements from DB
    --To add own remove just follow format (Removes thanks to CitizenID if isn't CID in the table it wouldn't remove anything)
    --'name_of_the_DB'
}


--THIS FEATURE IS UNDER DEVELOPMENT
--[[ Item = { 
    enabled = true, --This option disables/enables players to do CK with the item with the authorization of the admin.
    Radius = 5.0, --Radius how far can people do a CK

    ----------------------------------------------------------------------------------------------------------------------
    ItemCreation = true, --This option disable the fuse. Disable it only if you are getting errors in console. (Older QB-Core)
    name = 'black_bag',
    label = 'Black Bag',
    weight = 0,
    type = 'item',
    image = 'blackbag.png',
    unique = false,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = 'Just a black bag, maybe for body? or rubbish :)',
    ----------------------------------------------------------------------------------------------------------------------
}
 ]]