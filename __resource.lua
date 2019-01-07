
resource_type 'gametype' { name = 'Los Santos Muertos' }

--resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description 'Los Santos Muertos'

client_scripts {
'zombiemod_cl.lua',
}
server_scripts {
'zombiemod_sv.lua',
}

