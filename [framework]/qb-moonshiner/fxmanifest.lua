fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'RexShack#3041'
description 'qb-moonshiner'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

client_script {
    'client/client.lua',
}

server_script {
    'server/server.lua',
    '@oxmysql/lib/MySQL.lua',
}

dependencies {
    'qb-core',
    'qb-menu',
    'qb-input',
    'map-moonshineshacks'
}

lua54 'yes'