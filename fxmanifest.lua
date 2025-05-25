fx_version 'cerulean'
game 'gta5'
lua54 'yes'

title 'SEM_InteractionMenu'
author 'Scott M [SEM Development]'
description 'Multi Purpose Interaction Menu'
version 'v1.7.1'

shared_scripts {
    'shared/config.lua',
}

client_scripts {
    'client/functions.lua',
    'client/dependencies/NativeUI.lua',
    'client/client.lua',
    'client/menu.lua',
}

server_scripts {
    'server/server.lua',
}

exports {
    'IsOndutyLEO',
    'IsOndutyFire',
}