fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'qb-multicharacter'

ui_page "html/index.html"

client_scripts {
    'client/main.lua'
}

shared_script 'config.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/script.js',
    'html/profanity.js',
    'html/materialize.min.js',
    'html/jquery-3.6.0.min.js',
    'html/*.png',
    'html/*.jpg'
}

dependencies {
    'qb-core'
}