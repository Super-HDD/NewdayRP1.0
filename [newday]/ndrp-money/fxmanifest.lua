fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'Veronica'
description 'NewdayRP货币系统'

shared_script {
	'@qb-core/shared/locale.lua',
	"config.lua",
	"locale/en.lua"
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}


-- exports {
-- 	'GetCash',
-- 	'AddMoney',
-- 	'RemoveMoney',
-- }

dependency 'qb-core'

lua54 'yes'
