fx_version 'cerulean'
game "rdr3"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

author 'rexshack and qbcore'
description 'qb-shops'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
    'locales/en.lua',
    'locales/*.lua',
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'qb-core',
    'qb-inventory'
}