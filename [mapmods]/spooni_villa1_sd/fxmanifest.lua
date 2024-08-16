fx_version "adamant"
author 'Spooni-Mapping'
game "rdr3"

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."
this_is_a_map "yes"
lua54 'yes'

client_scripts {
    'client.lua'
  }

  files {
   'stream/*.ytyp'

  } 
  
escrow_ignore {
    'stream/*.ydr'   -- Ignore all .ydr
  }
  
  data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

dependency '/assetpacks'