fx_version 'cerulean'
game 'gta5'
lua54 'yes'

title 'SEM_InteractionMenu'
author 'Scott M & Nexeum Studios'
description 'Interaction Menu with Dynamic Permissions, forked by github.com/nexeumstudios'
version 'v1.8.0'

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