version '1.0'
author 'GamerKim'
description 'Emerald Ranch'

fx_version "adamant"
game "rdr3"

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
this_is_a_map "yes"

lua54 'yes'

client_scripts {
    'client.lua'
  }

escrow_ignore {
    'stream/*.ydr'
}
dependency '/assetpacks'