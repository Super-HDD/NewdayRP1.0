fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'Conversion of original qb-menu for QBCore'
version '0.0.1'

client_script 'client/main.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/puiL8kX.png'
}

lua54 'yes'


shared_scripts {
    '@ox_lib/init.lua'
}