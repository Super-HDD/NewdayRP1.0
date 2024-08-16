fx_version "adamant"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game "rdr3"

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

shared_scripts {
    'shared/*.lua'
}

ui_page {
    "html/index.html"
}

files {
    "html/*.*"
}

export 'GetIllnesses'
export 'CurePlayer'
export 'CurePlayerFromIllness'
export 'InfectPlayer'
export 'GetPlayerVulnerability'
export 'SetPlayerVulnerability'

escrow_ignore {
    'html/css/*.css',
	'html/js/*.js',
	'html/index.html',
    'shared/config.lua',
    'client/additionals.lua',
    'client/editable.lua',
    'server/editable.lua'
}

lua54 'yes'
dependency '/assetpacks'