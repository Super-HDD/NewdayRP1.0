fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 'Oliann97'
description 'Multi Job'

shared_scripts { '@ox_lib/init.lua', 'config.lua'}

client_scripts { 'cl_jobs.lua' }

server_scripts { '@oxmysql/lib/MySQL.lua', 'sv_jobs.lua' }

lua54 'yes'
