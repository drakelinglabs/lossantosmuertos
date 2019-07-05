
resource_type 'gametype' { name = 'Los Santos Muertos' }

--resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description 'Los Santos Muertos'

client_scripts {
'lsm_cl.lua',
}


export 'getRandomSpawnPoint'
export 'spawnPlayer'
export 'addSpawnPoint'
export 'removeSpawnPoint'
export 'loadSpawns'
export 'setAutoSpawn'
export 'setAutoSpawnCallback'
export 'forceRespawn'

server_scripts {
'lsm_sv.lua',
}


-- files{
-- "peds.meta"
-- }

--data_file "PED_METADATA_FILE" "peds.meta"
