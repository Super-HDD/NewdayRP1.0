fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'qb-hud'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'dist/client.js',
}

server_scripts {
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua',
}

dependencies {
    'qb-telegram',
    'yarn',
	'/server:6279',
	'/onesync',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/*.css',
    'html/min.css',
    'html/quasar.prod.css',
    'html/*.js',
}

