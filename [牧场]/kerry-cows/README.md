# author
- discord : nk.kerry

# Dependancies
- rsg-core

# Installation
- add the player_cow.sql to your database
- ensure that the dependancies are added and started
- add kerry-cows to your resources folder
- add items to your '\rsg-core\shared\items.lua':

['cowshedkey'] = {['name'] = 'cowshedkey', ['label'] = 'Cowshed key', ['weight'] = 10,  ['type'] = 'item', ['image'] = 'cowshedkey.png', ['unique'] = false,  ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = ''},
['milk']       = {['name'] = 'milk',       ['label'] = 'Milk',        ['weight'] = 1000,['type'] = 'item', ['image'] = 'milk.png',       ['unique'] = false,  ['useable'] = true,  ['shouldClose'] = true, ['combinable'] = nil, ['description'] = ''},

- add images to your '\rsg-inventory\html\images'

# Starting the resource
- add the following to your server.cfg file : ensure kerry-cows

# Gratitude
- Many thanks to the guys from the RSG, I am learning from your resources, you are cool!