fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
games {'rdr3'}
lua54 'yes'

author 'Goghor (Discord: Goghor#6666)'
description 'BM Prone/Crawling'
version '1.0.8'

client_script
{
    'config.lua',
    'client.lua'
}

escrow_ignore
{
    'config.lua'
}
dependency '/assetpacks'