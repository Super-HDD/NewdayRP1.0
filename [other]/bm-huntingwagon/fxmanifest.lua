fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
games {'rdr3'}
lua54 'yes'

author 'Goghor (Discord: Goghor#6666)'
description 'BM Hunting Wagon'
version '1.0.7'

client_scripts
{
    'client/client.lua'
}

server_scripts
{
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_scripts
{
    'config.lua'
}

escrow_ignore
{
    'hunting_wagon.sql',
    'config.lua',
    'server/server.lua'
}
dependency '/assetpacks'