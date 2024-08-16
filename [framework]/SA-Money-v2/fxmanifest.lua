fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'San Andreas - Money as Item'
author "Dragodast"
version "2.6.1"

shared_scripts {
	'config.lua',
  '@qb-core/shared/locale.lua',
  'locale/en.lua', -- Here you can change your language
}

server_scripts {
    "server/cash.lua",
    "server/debug.lua",
    "server/functions.lua",
    "server/versioncheck.lua",
}

client_scripts {
  "client/refresh.lua",
  "client/main.lua",
}

escrow_ignore {
    'config.lua', -- Config
    'locale/*.lua',
    "server/functions.lua"
}

exports{
  'GetCash',
  'AddMoney',
  'RemoveMoney',
}

lua54 'yes'

dependency '/assetpacks'