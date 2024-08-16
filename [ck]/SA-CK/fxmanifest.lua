fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'San Andreas - Character Kill'
author "Dragodast"
version '1.3.8'

client_scripts {
	'client/client.lua',
}

shared_scripts {
	'config.lua',
    '@qb-core/shared/locale.lua',
    'locale/en.lua', --Here change your locale locale/en.lua for example
}

server_scripts {
    "server/server.lua",
    "server/functions.lua",
    '@oxmysql/lib/MySQL.lua',
    "server/versioncheck.lua",
}

escrow_ignore {
    'locale/*.lua',  -- Languages
    'config.lua', -- Config
    "server/functions.lua", --Notify
}

dependency 'oxmysql'

lua54 'yes'
dependency '/assetpacks'