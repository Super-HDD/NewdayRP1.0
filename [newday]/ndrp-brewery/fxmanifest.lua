fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'Veronica'
description 'NewdayRP酿酒厂'

shared_scripts {
    '@qb-core/shared/locale.lua',
    "locale/en.lua",
    'config.lua',
}

client_scripts {
    'client/client.lua',
    'client/drinker.lua'
}

server_scripts {
    'server/server.lua',
    'server/drinker.lua'
}

dependency 'qb-core'

lua54 'yes'
