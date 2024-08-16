fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

description 'qb-target'

ui_page 'html/index.html'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua',
}

files {
    'config.lua',
    'html/**',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'

dependency 'PolyZone'