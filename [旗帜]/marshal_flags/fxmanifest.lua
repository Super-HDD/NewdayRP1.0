fx_version "adamant"
games {"rdr3"}

author 'Marshal Scripts'
description 'A RedM resource for players to use various flags'
version '1.0.0'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
    'config.lua',
    'client/client.lua'
    
}
server_scripts {
    'config.lua',
    'server/server.lua'
}

escrow_ignore {
    'config.lua',
    'itemsREDEMRP.lua'
}

lua54 'yes'
dependency '/assetpacks'