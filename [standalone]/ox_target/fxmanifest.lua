-- FX Information
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Resource Information
name 'ox_target'
author 'Overextended'
version '1.13.1'
repository 'https://github.com/overextended/ox_target'
description ''

-- Manifest
ui_page 'web/index.html'

shared_scripts {
	'@ox_lib/init.lua',
}

client_scripts {
	'@ox_lib/init.lua',
	'client/main.lua',
}

server_scripts {
	'server/main.lua'
}

files {
	'web/**',
	'locales/*.json',
	'client/api.lua',
	'client/utils.lua',
	'client/state.lua',
	'client/debug.lua',
	'client/defaults.lua',
	'client/framework/ox.lua',
	'client/framework/esx.lua',
	'client/framework/qb.lua',
	'client/compat/qtarget.lua',
	'client/compat/qb-target.lua',
}

provide 'qtarget'
provide 'qb-target'

dependency 'ox_lib'
