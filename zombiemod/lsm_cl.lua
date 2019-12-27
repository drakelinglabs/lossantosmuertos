local devmode=(GetConvarInt("lsm_devmode",0)~=0)

local messages={

--DEPRECIATED MESSAGES
press_e_to_talk="~c~Press ~g~E ~c~to talk",
search_the_area_for_car="~c~Search the area for car",
you_can_leave_server_now="~g~You can leave server now",
this_trailer_tank_has_x_gasoline="~c~This trailer tank has ~o~~1~ gasoline",
this_trailer_tank_has_no_gasoline="~c~This trailer tank has ~o~no gasoline ~c~inside",
inventory_full_cant_take_anything="Your ~r~inventory is full~s~, you can't take anything.",
blood_loss_caused_faster_dehydration="~c~You've lost some blood and now dehydrating faster",
cant_fit_itemname_in_inventory="Can't fit ~a~ in inventory, drop something.",
become_enemy_to_raid_base_warehouse="This is base warehouse. Become enemy with faction to start raid.",
you_started_safezone_raid="You started safezone raid.",
press_e_to_give_required_items="Press ~g~E ~s~to give required items.",
e_to_talk="~g~E ~s~to talk",
you_finished_quest="~g~You've finished quest.",

--HINT MESSAGES
press_e_to_interact="~c~Press ~g~E ~c~to interact",
encountered_radioactive_fallout="You have encountered ~r~RADIOACTIVE FALLOUT~s~! Equip a gasmask!",
press_to_open_helpmenu="~c~Press ~s~PAGE UP ~c~to open help menu",
press_to_close_helpmenu="~c~Press ~s~BACKSPACE ~c~to close help menu",
press_to_turn_pages="~c~Press ~s~ARROW KEYS ~c~to turn pages",
press_e_to_open_inventory="~c~Press ~s~ENTER ~c~to open inventory",
press_backspace_to_close_inventory="~c~Press ~s~BACKSPACE ~c~to close inventory",
press_arrows_to_navigate_inventory="~c~Press ~s~ARROW KEYS ~c~to navigate inventory",
press_to_deattach_upgrades="~c~Press ~s~INSERT ~c~to deattach weapon upgrades",
press_enter_to_use_item="~c~Press ~s~ENTER ~c~to use item",
press_delete_to_drop_item="~c~Press ~s~DELETE ~c~to drop item",

--HEALTH
youre_dying_dehydration="~s~You are dying of ~r~DEHYDRATION~s~! Drink something!",
youre_dying_starvation="~s~You are dying of ~r~STARVATION~s~! Eat something!",
youre_overencumbered="~s~You are ~r~OVER ENCUMBERED~s~! Your HYDRATION and NOURISHMENT is now draining faster!",
you_have_bleeding_wound="You have ~r~1 BLEEDING WOUND~s~! Stop the bleeding with bandages, rags, or a medical kit!",
you_have_x_bleeding_wounds="You have ~r~~1~ BLEEDING WOUNDS~s~! Stop the bleeding with bandages, rags, or a medical kit!",

--PATROLS
encountered_marauder_patrol="You have encountered a ~r~MARAUDER ~s~patrol of ~1~ ~r~MARAUDERS~s~.",
encountered_scavenger_patrol="You have encountered a ~y~SCAVENGER ~s~patrol of ~1~ ~y~SCAVENGERS~s~.",
encountered_mercenary_patrol="You have encountered a ~r~MERCENARY ~s~patrol of ~1~ ~r~MERCENARIES~s~.",
encountered_military_patrol="You have encountered a ~r~MILITARY ~s~patrol of ~1~ ~r~SOLDIERS~s~.",
encountered_raider_patrol="You have encountered a ~r~RAIDER ~s~patrol of ~1~ ~r~RAIDERS~s~.",
encountered_government_patrol="You have encountered a ~y~GOVERNMENT ~s~patrol of ~1~ ~y~OFFICERS~s~.",
encountered_marauder_base="You have encountered a ~r~MARAUDER ~s~stronghold.",
encountered_scavenger_base="You have encountered a ~y~SCAVENGER ~s~stronghold.",
encountered_government_base="You have encountered a ~y~GOVERNMENT ~s~stronghold.",
patrol_eliminated="Patrol has been ~r~eliminated~s~.",

--FACTIONS
youre_in_friendly_territory="You're in ~g~FRIENDLY TERRITORY~s~.",
youre_in_enemy_territory="You are in ~r~ENEMY TERRITORY~s~! Defend yourself!",
youre_in_neutral_territory="You are in ~y~NEUTRAL TERRITORY~s~! Holster your weapons.",
press_e_to_trade="~c~Press ~s~E ~c~to trade",
press_e_to_join_faction_for_cash="~c~Press ~s~E ~c~to join ~s~~a~ ~c~for ~g~$~1~",
already_in_this_faction="You are already in this faction. Press ~g~E ~s~again ~y~to leave faction~s~.",
you_left_faction="You left faction.",
you_joined_factionname="~g~You've joined ~a~",
you_joined_faction="You have joined faction.",
leave_faction_before_joining_new_one="You need to leave current faction first.",

--GARAGE
vehiclename_saved_in_garage="~g~~a~ ~s~saved in garage.",
you_have_to_be_in_this_faction_to_use_garage="You have to be in this faction to use this garage.",
you_cannot_use_enemy_garages="You can not use enemy garages.",
you_took_vehiclename_from_garage="You took ~g~~a~ ~s~from your garage.",
dont_have_anything_in_your_garage="You don't have anything in your garage.",

--TRADING
need_to_be_in_this_faction_to_trade="You need to be in this faction in order to trade.",
new_shipment_in_strH_strM="New Shipment in ~a~:~a~",
not_enough_cash="Not enough cash.",
trade="Trade",--торговля

--CRAFTING & STORAGE
have_nothing_in_your_storage="You have nothing in your storage",
you_have_to_be_in_this_faction_to_use_this_storage="You have to be in this faction to use this storage.",
cant_use_enemy_storages="You can not use enemy storages.",
you_dont_have_any_blueprints="You don't have any blueprints.",
you_dont_have_storage_slots_for_that_item="You ~r~don't have ~s~storage slots for that item!",

--VEHICLES
vehicle_out_of_fuel="~c~This vehicle is out of fuel",
fuel_level_low="~c~Fuel level is low, use gasoline to refill vehicle",
cant_repair_aircraft_engine_with_this_kit="You can not repair aircraft engine with this kit.",
engine_in_perfect_condition="Vehicle engine is in perfect condition.",
you_must_be_in_driver_seat_to_refuel="You must be in driver seat to refuel vehicle.",
you_must_be_in_driver_seat_to_repair="You must be in driver seat to repair vehicle.",
you_need_aircraft_fuel_for_that_vehicle="You need aircraft fuel for that vehicle.",
this_fuel_can_be_used_only_in_aircraft="This fuel can only be used for aircraft",

--LOOTING
e_to_take_fuel="~g~E ~s~to take fuel",
e_to_take_engine_parts="~g~E ~s~to take engine parts",
e_to_take_one_item="~g~E ~s~to take ~b~~1~ ~a~",
e_to_take_item="~g~E ~s~to take ~b~~a~",
e_to_search_for_items="~g~E ~s~to search for items",
press_e_to_loot_corpse="~c~Press ~s~E ~c~to loot corpse",
press_e_to_pickup_two_items="~c~Press ~s~E ~c~to pick up ~g~~a~~c~ and ~g~~a~",
press_e_to_seach_for_items="~c~Press ~s~E ~c~to search for items",
press_e_to_pickup="~c~Press ~s~E ~c~to pick up ~g~~a~",
this_container_is_empty="This container is ~r~empty~s~.",
this_food_is_spoiled="This food is ~r~spoiled~s~.",

--EXTRACTION
cant_use_faction_extraction_point="This extraction point can only be used by allied faction members.",
cant_use_enemy_extraction_points="This extraction point can only be used by allied faction members.",
press_e_to_save_and_quit="~g~Press E to save your character, and quit the server.",

--MISC
empty="empty",
nothing_selected="Nothing selected",
not_enough_itemname="Not enough ~g~~a~~s~!",
you_dont_have_required_items="You don't have the required items",
you_need_number_more_reputation="You need to have ~1~ more reputation",
you_need_bodyarmor_to_insert_armor_plate_in="You cannot equip armor plates without body armor!",
cant_find_itemname_in_inventory="Can't find ~a~ in inventory",

--REPUTATION
you_got_killed_and_reputation_changed="~r~An enemy ~a~ has killed you! You have lost ~1~ reputation for dying by their hands.",
you_gained_num_retutation_for_killing_str="~g~You gained ~1~ reputation for killing ~a~.",
you_lost_num_retutation_for_killing_str="~r~You lost ~1~ reputation for killing ~a~.",

--CACHE
cache_spawned="New cache spawned at ~g~~a~~s~!",
}





--"local events" not using event system
local load_save_event=function() print("ERROR lsm line 3") end
local death_event=function() print("ERROR lsm line 4") end

local function square_dist(v1,v2)
	local dx,dy,dz=v1.x-v2.x,v1.y-v2.y,v1.z-v2.z
	return dx*dx+dy*dy+dz*dz
end

local function square_dist_2d(v1,v2)
	local dx,dy=v1.x-v2.x,v1.y-v2.y
	return dx*dx+dy*dy
end

local function sqrt_dist(v1,v2)
	local dx,dy,dz=v1.x-v2.x,v1.y-v2.y,v1.z-v2.z
	return math.sqrt(dx*dx+dy*dy+dz*dz)
end

local function split_text(text, symbol)
	if symbol==nil then
		return false
	end
	local t={}
	for str in string.gmatch(text, "([^"..symbol.."]+)") do
		table.insert(t, str)
	end
	return t
end

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
----------------------------------  _____     _______ _____ _    _ ______  _____  ----------------------------------
---------------------------------- |  __ \ /\|__   __/ ____| |  | |  ____|/ ____| ----------------------------------
---------------------------------- | |__) /  \  | | | |    | |__| | |__  | (___   ----------------------------------
---------------------------------- |  ___/ /\ \ | | | |    |  __  |  __|  \___ \  ----------------------------------
---------------------------------- | |  / ____ \| | | |____| |  | | |____ ____) | ----------------------------------
---------------------------------- |_| /_/    \_\_|  \_____|_|  |_|______|_____/  ----------------------------------
----------------------------------                                                ----------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------


local _i, _f, _v, _r, _ri, _rf, _rl, _s, _rv, _ro, _in, _ii, _fi =
	Citizen.PointerValueInt(), Citizen.PointerValueFloat(), Citizen.PointerValueVector(),
	Citizen.ReturnResultAnyway(), Citizen.ResultAsInteger(), Citizen.ResultAsFloat(), Citizen.ResultAsLong(), Citizen.ResultAsString(), Citizen.ResultAsVector(), Citizen.ResultAsObject(),
	Citizen.InvokeNative, Citizen.PointerValueIntInitialized, Citizen.PointerValueFloatInitialized

function IsPedCop(ped)
    local pedType = GetPedType(ped)
    return (pedType==6) or (pedType==27)
end

local function _ch(hash)
	if type(hash) == 'string' then
		return GetHashKey(hash)
	end
	return hash
end


-- local HookIsVehicleTyreBurst=IsVehicleTyreBurst
-- function IsVehicleTyreBurst(v,t,b)
    -- local ret=HookIsVehicleTyreBurst(v,t,b)
    -- if ret==nil or ret==false or ret==0 then return false end
    -- return true
-- end

function IsVehicleTyreBurst(vehicle, wheelID, completely)
	return _in(0xBA291848A0815CA9, vehicle, wheelID, completely, _r)
end

function IsVehicleDoorFullyOpen(v, door)
	return _in(0x3E933CFF7B111C22, v, door, _r)
end

-- local HookIsVehicleDoorFullyOpen=IsVehicleDoorFullyOpen
-- function IsVehicleDoorFullyOpen(v,d)
    -- local ret=HookIsVehicleDoorFullyOpen(v,d)
    -- if ret==nil or ret==false or ret==0 then return false end
    -- return true
-- end


local HookGetEntityModel=GetEntityModel
function GetEntityModel(ent)
    if DoesEntityExist(ent) then
        return HookGetEntityModel(ent)
    end
    return 0
end

function IsPedShooting(ped)
	return _in(0x34616828CD07F1A1, ped, _r)
end

function ScGetNickname()
	return _in(0x198D161F458ECC7F, _r, _s)
end

function IsPedReloading(ped)
    return _in(0x24B100C68C645951, ped, _r)
end

function GetVehicleMaxSpeed(vehicle)
	return _in(0x53AF99BAA671CA47, vehicle, _r, _rf)
end

function GetVehicleModelMaxSpeed(modelHash)
	return _in(0xF417C2502FFFED43, _ch(modelHash), _r, _rf)
end

function NetworkGetPlayerIndexFromPed(ped)
	return _in(0x6C0E2E0125610278, ped, _r, _ri)
end

function ExpandWorldLimits(x, y, z)
	return _in(0x5006D96C995A5827, x, y, z)
end

function NetworkIsCableConnected()
	return _in(0xEFFB25453D8600F9, _r)
end

function SetEntityMaxSpeed(entity, speed)
	return _in(0x0E46A3FCBDE2A1B1, entity, speed)
end

function GetVehicleHoverModePercentage(veh)
    return _in(0xDA62027C8BDB326E, veh, _r, _rf)
end

function GetLandingGearState(veh)
    return _in(0x9B0F3DCA3DB0F4CD, veh, _r, _ri)
end

function DeleteVehicle(vehicle)
	return _in(0xEA386986E786A54F, _ii(vehicle) --[[ may be optional ]])
end

function DeletePed(ped)
	return _in(0x9614299DCB53E54B, _ii(ped) --[[ may be optional ]])
end

---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
local time_to_update_shops=0
Citizen.CreateThread(function()
	while true do Wait(1000)
		time_to_update_shops=time_to_update_shops-1
		if time_to_update_shops<0 then time_to_update_shops=0 end
	end
end)


local kerosine_vehicles={
[782665360]=true,
}

WEAPON={
UNARMED=0xFFFFFFFFA2719263, 
KNIFE=0xFFFFFFFF99B507EA, --2578778090	--0x99B507EA
NIGHTSTICK=1737195953,	--0x678B81B1
HAMMER=1317494643,	--0x4E875F73
BAT=0xFFFFFFFF958A4A8F, --2508868239	--0x958A4A8F
GOLFCLUB=1141786504,	--0x440E4788
CROWBAR=0xFFFFFFFF84BD7BFD, --2227010557	--0x84BD7BFD
BOTTLE=0xFFFFFFFFF9E6AA4B, --4192643659	--0xF9E6AA4B
DAGGER=0xFFFFFFFF92A27487, --2460120199	--0x92A27487
KNUCKLE=0xFFFFFFFFD8DF3C3C, --3638508604	--0xD8DF3C3C
HATCHET=0xFFFFFFFFF9DCBF2D, --4191993645	--0xF9DCBF2D
MACHETE=0xFFFFFFFFDD5DF8D9, --3713923289	--0xDD5DF8D9
SWITCHBLADE=0xFFFFFFFFDFE37640, --3756226112	--0xDFE37640
BATTLEAXE=0xFFFFFFFFCD274149, --3441901897	--0xCD274149
POOLCUE=0xFFFFFFFF94117305, --2484171525	--0x94117305
WRENCH=419712736,	--0x19044EE0
FLASHLIGHT=-1951375401,

DOUBLEACTION=GetHashKey("weapon_doubleaction"),
PISTOL=453432689,	--0x1B06D571
COMBATPISTOL=1593441988,	--0x5EF9FEC4
APPISTOL=584646201,	--0x22D8FE39
PISTOL50=0xFFFFFFFF99AEEB3B, --2578377531	--0x99AEEB3B
MICROSMG=324215364,	--0x13532244
SMG=736523883,	--0x2BE6766B
ASSAULTSMG=0xFFFFFFFFEFE7E2DF, --4024951519	--0xEFE7E2DF
ASSAULTRIFLE=0xFFFFFFFFBFEFFF6D, --3220176749	--0xBFEFFF6D
CARBINERIFLE=0xFFFFFFFF83BF0278, --2210333304	--0x83BF0278
ADVANCEDRIFLE=0xFFFFFFFFAF113F99, --2937143193	--0xAF113F99
MG=0xFFFFFFFF9D07F764, --2634544996	--0x9D07F764
COMBATMG=2144741730,	--0x7FD62962
PUMPSHOTGUN=487013001,	--0x1D073A89
SAWNOFFSHOTGUN=2017895192,	--0x7846A318
ASSAULTSHOTGUN=0xFFFFFFFFE284C527, --3800352039	--0xE284C527
BULLPUPSHOTGUN=0xFFFFFFFF9D61E50F, --2640438543	--0x9D61E50F
STUNGUN=911657153,	--0x3656C8C1
SNIPERRIFLE=100416529,	--0x05FC3C11
HEAVYSNIPER=205991906,	--0x0C472FE2
SNSPISTOL=0xFFFFFFFFBFD21232, --3218215474	--0xBFD21232
SNSPISTOLMK2=GetHashKey("weapon_snspistol_mk2"), --3218215474	--0xBFD21232
GUSENBERG=1627465347,	--0x61012683
SPECIALCARBINE=0xFFFFFFFFC0A3098D, --3231910285	--0xC0A3098D
HEAVYPISTOL=0xFFFFFFFFD205520E, --3523564046	--0xD205520E
BULLPUPRIFLE=2132975508,	--0x7F229F94
VINTAGEPISTOL=137902532,	--0x083839C4
MUSKET=0xFFFFFFFFA89CB99E, --2828843422	--0xA89CB99E
HEAVYSHOTGUN=984333226,	--0x3AABBBAA
MARKSMANRIFLE=0xFFFFFFFFC734385A, --3342088282	--0xC734385A
GRENADELAUNCHER=0xFFFFFFFFA284510B, --2726580491	--0xA284510B
RPG=0xFFFFFFFFB1CA77B1, --2982836145	--0xB1CA77B1
BZGAS=0xFFFFFFFFA0973D5E, --2694266206	--0xA0973D5E
GRENADE=0xFFFFFFFF93E220BD, --2481070269	--0x93E220BD
STICKYBOMB=741814745,	--0x2C3731D9
MOLOTOV=615608432,	--0x24B17070
PROXMINE=0xFFFFFFFFAB564B93, --2874559379	--0xAB564B93
COMBATPDW=171789620,	--0x0A3D4D34
MARKSMANPISTOL=0xFFFFFFFFDC4DB296, --3696079510	--0xDC4DB296
RAILGUN=1834241177,	--0x6D544C99
MACHINEPISTOL=0xFFFFFFFFDB1AA450, --3675956304	--0xDB1AA450
REVOLVER=0xFFFFFFFFC1B3C3D1, --3249783761	--0xC1B3C3D1
DBSHOTGUN=0xFFFFFFFFEF951FBB, --4019527611	--0xEF951FBB
COMPACTRIFLE=1649403952,	--0x624FE830
AUTOSHOTGUN=317205821,	--0x12E82D3D
COMPACTLAUNCHER=125959754,	--0x0781FE4A
MINISMG=0xFFFFFFFFBD248B55, --3173288789	--0xBD248B55
PIPEBOMB=0xFFFFFFFFBA45E8B8, --3125143736	--0xBA45E8B8
ASSAULTRIFLEMK2=961495388,
CARBINERIFLEMK2=0xFFFFFFFFFAD1F1C9,
COMBATMGMK2=0xFFFFFFFFDBBD7280,
HEAVYSNIPERMK2=177293209,
PISTOLMK2=0xFFFFFFFFBFE256D4,
SMGMK2=2024373456,
PUMPSHOTGUNMK2=0x555AF99A,

MARKSMANRIFLEMK2=GetHashKey("weapon_marksmanrifle_mk2"),
BULLPUPRIFLEMK2=GetHashKey("weapon_bullpuprifle_mk2"),
REVOLVERMK2=GetHashKey("weapon_revolver_mk2"),
SPECIALCARBINEMK2=GetHashKey("weapon_specialcarbine_mk2"),
BALL=GetHashKey("weapon_ball"),

PARACHUTE=0xFFFFFFFFFBAB5776,
HOMINGLAUNCHER=1672152130,	--0x63AB0442
EXTINGUISHER=101631238,
PETROLCAN=883325847,

MINIGUN=0x42BF8A85,
FLAREGUN=1198879012,
FLARE=1233104067,
}


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------   _____ _    _         _____  _____   ---------------------------------------
-------------------------------------   / ____| |  | |  /\   |  __ \|  __ \   --------------------------------------
-------------------------------------  | |  __| |  | | /  \  | |__) | |  | |  --------------------------------------
-------------------------------------  | | |_ | |  | |/ /\ \ |  _  /| |  | |  --------------------------------------
-------------------------------------  | |__| | |__| / ____ \| | \ \| |__| |  --------------------------------------
-------------------------------------   \_____|\____/_/    \_\_|  \_\_____/   --------------------------------------
--------------------------------------                                       ---------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
local _rne,_aeh,_tse,event=_G["\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74"],_G["\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72"],_G["\x54\x72\x69\x67\x67\x65\x72\x53\x65\x72\x76\x65\x72\x45\x76\x65\x6e\x74"],_G["\x65\x76\x65\x6e\x74"]

local event={debug="dfhjsfj"}


local guard_decor_legal="spawn_by_script_normally"
local guard_decor_illegal="unknsource"
local guard_decor_dist="spwndist"
DecorRegister(guard_decor_legal,3)
DecorRegister(guard_decor_illegal,3)
DecorRegister(guard_decor_dist,1)


Citizen.CreateThread(function()

local guard_debug=false
local guard_remove_pickups=false
local guard_health=200
local guard_health_timestamp=0
local guard_max_health=200
local guard_max_health_altered=false
local guard_model=nil
local guard_armor=0
local guard_legal_camera=-1
local guard_x=0.0
local guard_y=0.0
local guard_z=0.0
local guard_altpos={x=.0,y=.0,z=.0,vehmdl=0,frame=0}
local guard_frame_counter=0
local guard_internal_wanted=0
local guard_wanted=0
local guard_wanted_set_timestamp=0
local guard_wanted_got_timestamp=0
local guard_wanted_flashed_last_time=false
local guard_lost_cops_at_frame=0
local guard_max_wanted=5
local guard_is_driver=false
local guard_vehicle=0
local guard_veh_engine_health=1000.0
local guard_veh_body_health=1000.0
local guard_veh_explosion_timestamp=nil
local guard_veh_damaged_timestamp=nil
local guard_invincible_1=false
local guard_invincibility_timestamp=0
local guard_invincible_2=false
local guard_last_check=0
local guard_police_radar_blips=true
local guard_player_blips=0
local guard_ok_player_blips={}
local guard_blip_removal_frame={}
local guard_blipped_players={}
local guard_player_tags=0
local guard_tagscanner=0
local guard_tagscanner_tags=0
local guard_ok_tags={}
local guard_explosions=0
local peds_with_armor={
    [-1920001264]=100,--swat
    [GetHashKey("s_m_y_swat_02")]=100,--custom swat
}

local guard_SetPoliceRadarBlips=SetPoliceRadarBlips
function SetPoliceRadarBlips(bool)
    guard_police_radar_blips=bool
    return guard_SetPoliceRadarBlips(bool)
end
local guard_CreateVehicle=CreateVehicle
function CreateVehicle(model,x,y,z,h,bool1,bool2)
    local ret={guard_CreateVehicle(model,x,y,z,h,bool1,bool2)}
    DecorSetInt(ret[1],guard_decor_legal,GetPlayerServerId(PlayerId()))
    return table.unpack(ret)
end
local guard_CreatePed=CreatePed
function CreatePed(pedtype,model,x,y,z,h,bool1,bool2)
    local ret={guard_CreatePed(pedtype,model,x,y,z,h,bool1,bool2)}
    DecorSetInt(ret[1],guard_decor_legal,GetPlayerServerId(PlayerId()))
    return table.unpack(ret)
end
local guard_CreateObject=CreateObject
function CreateObject(model,x,y,z,bool1,bool2,bool3)
    local ret={guard_CreateObject(model,x,y,z,bool1,bool2,bool3)}
    DecorSetInt(ret[1],guard_decor_legal,GetPlayerServerId(PlayerId()))
    return table.unpack(ret)
end
local guard_SetVehicleBodyHealth=SetVehicleBodyHealth
function SetVehicleBodyHealth(veh,health)
    health=health+.5-.5
    if veh==guard_vehicle and NetworkHasControlOfEntity(veh) then
        guard_veh_body_health=health
    end
    return guard_SetVehicleBodyHealth(veh,health)
end
local guard_SetVehicleEngineHealth=SetVehicleEngineHealth
function SetVehicleEngineHealth(veh,health)
    health=health+.5-.5
    if veh==guard_vehicle and NetworkHasControlOfEntity(veh) then
        guard_veh_engine_health=health
    end
    return guard_SetVehicleEngineHealth(veh,health)
end
local guard_SetVehicleFixed=SetVehicleFixed
function SetVehicleFixed(veh)
    if veh==guard_vehicle and NetworkHasControlOfEntity(veh) then -- control check is not needed i think but whatever
        guard_veh_body_health=1000.0
        guard_veh_engine_health=1000.0
    end
    return guard_SetVehicleFixed(veh)
end
local guard_SetEntityHealth=SetEntityHealth
function SetEntityHealth(ped,health)
    health=math.floor(health)
    if PlayerPedId()==ped and health>=0 then
        guard_health=health
    end
    local ret={guard_SetEntityHealth(ped,health)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." health="..health) end
    return table.unpack(ret)
end
local guard_SetEntityMaxHealth=SetEntityMaxHealth
function SetEntityMaxHealth(ped,max_health)
    max_health=math.floor(max_health)
    if PlayerPedId()==ped then
     guard_max_health=max_health
     guard_max_health_altered=true
    end
    local ret={guard_SetEntityMaxHealth(ped,max_health)}
    if guard_debug then print(GetGameTimer()..":ent="..ped.." max_health="..max_health) end
    return table.unpack(ret)
end
local guard_SetPedMaxHealth=SetPedMaxHealth
function SetPedMaxHealth(ped,max_health)
    max_health=math.floor(max_health)
    if PlayerPedId()==ped then
     guard_max_health=max_health
     guard_max_health_altered=true
    end
    local ret={guard_SetPedMaxHealth(ped,max_health)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." max_health="..max_health) end
    return table.unpack(ret)
end
local guard_SetPedArmour=SetPedArmour
function SetPedArmour(ped,armor)
    armor=math.floor(armor)
    if PlayerPedId()==ped then
        if armor>100 then
            guard_armor=100
        elseif armor<0 then
            guard_armor=0
        else
            guard_armor=armor
        end
    end
    local ret={guard_SetPedArmour(ped,armor)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." armor="..armor) end
    return table.unpack(ret)
end
local guard_SetPedAmmo=SetPedAmmo
function SetPedAmmo(ped,weapon,ammo)
    if PlayerPedId()==ped and (guard_weapon==weapon or GetPedAmmoTypeFromWeapon(ped,guard_weapon)==GetPedAmmoTypeFromWeapon(ped,weapon)) then
        guard_ammo=ammo
    end
    local ret={guard_SetPedAmmo(ped,weapon,ammo)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." ammo="..ammo) end
    return table.unpack(ret)
end
local guard_SetPedAmmoByType=SetPedAmmoByType
function SetPedAmmoByType(ped,ammotype,ammo)
    if PlayerPedId()==ped and GetPedAmmoTypeFromWeapon(ped,guard_weapon)==ammotype then
        guard_ammo=ammo
    end
    local ret={guard_SetPedAmmoByType(ped,ammotype,ammo)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." ammo="..ammo) end
    return table.unpack(ret)
end
local guard_GiveWeaponToPed=GiveWeaponToPed
function GiveWeaponToPed(ped,weapon,ammo,hidden,equip)
    if PlayerPedId()==ped and guard_weapon==weapon then
        guard_ammo=guard_ammo+ammo
    end
    local ret={guard_GiveWeaponToPed(ped,weapon,ammo,hidden,equip)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." ammo="..ammo) end
    return table.unpack(ret)
end
local guard_SetPlayerModel=SetPlayerModel
function SetPlayerModel(player,model)
    local myself=PlayerId()
    local ret={guard_SetPlayerModel(player,model)}
    if player==-1 or myself==player then
     local def_armor=peds_with_armor[model]
     if def_armor~=nil then
      guard_armor=def_armor
     end
     guard_model=model
     local ped=GetPlayerPed(player)
     guard_max_health=GetPedMaxHealth(ped)
     guard_health=GetEntityHealth(ped)
     guard_max_health_altered=false
     DecorSetInt(ped,guard_decor_legal,GetPlayerServerId(myself))
    end
    if guard_debug then print(GetGameTimer()..":player="..player.." model="..model.." max_health="..guard_max_health) end
    return table.unpack(ret)
end
local guard_SetEntityCoords=SetEntityCoords
function SetEntityCoords(ped,x,y,z)
    x,y,z=x+.5-.5,y+.5-.5,z+.5-.5
    local myself=PlayerPedId()
    if myself==ped or ped==GetVehiclePedIsUsing(myself) then guard_x,guard_y,guard_z=x,y,z+1 end
    local ret={guard_SetEntityCoords(ped,x,y,z)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." x="..x.." y="..y.." z="..z) end
    return table.unpack(ret)
end
local guard_SetPedCoordsKeepVehicle=SetPedCoordsKeepVehicle
function SetPedCoordsKeepVehicle(ped,x,y,z)
    x,y,z=x+.5-.5,y+.5-.5,z+.5-.5
    if PlayerPedId()==ped then guard_x,guard_y,guard_z=x,y,z+1 end
    local ret={guard_SetPedCoordsKeepVehicle(ped,x,y,z)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." x="..x.." y="..y.." z="..z) end
    return table.unpack(ret)
end
local guard_CreateMpGamerTag=CreateMpGamerTag
function CreateMpGamerTag(ped, username, pointedClanTag, isRockstarClan, clanTag, p5)
    local ret=CreateMpGamerTag(ped, username, pointedClanTag, isRockstarClan, clanTag, p5)
    guard_ok_tags[ret]=true
    return ret
end
local guard_RemoveMpGamerTag=RemoveMpGamerTag
function RemoveMpGamerTag(tag)
    guard_ok_tags[tag]=nil
    return RemoveMpGamerTag(tag)
end
local guard_AddBlipForEntity=AddBlipForEntity
function AddBlipForEntity(ent)
    if IsEntityAPed(ent) and IsPedAPlayer(ent) then
        local player_index=NetworkGetPlayerIndexFromPed(ent)
        local blip=guard_AddBlipForEntity(ent)
        local old_blip=guard_blipped_players[player_index]
        if old_blip~=nil then
            guard_ok_player_blips[old_blip]=nil
        end
        guard_ok_player_blips[blip]=player_index
        guard_blipped_players[player_index]=blip
        return blip
    else
        return guard_AddBlipForEntity(ent)
    end
end
local guard_RemoveBlip=RemoveBlip
function RemoveBlip(blip)
    local player_index=guard_ok_player_blips[blip]
    if player_index~=nil then
        local old_blip=guard_blipped_players[player_index]
        if old_blip~=blip then
            guard_ok_player_blips[old_blip]=nil
        end
        guard_blipped_players[player_index]=nil
        guard_ok_player_blips[blip]=nil
        guard_blip_removal_frame[player_index]=guard_frame_counter
    end
    return guard_RemoveBlip(blip)
end
local guard_SetMaxWantedLevel=SetMaxWantedLevel --bool is always false
function SetMaxWantedLevel(maxwanted)
    if maxwanted>=0 then
     if maxwanted>5 then maxwanted=5 end
     guard_max_wanted=maxwanted
     if maxwanted<guard_wanted then
      guard_wanted=maxwanted
      if guard_wanted==0 then guard_lost_cops_at_frame=guard_frame_counter end
     end
     if maxwanted<guard_internal_wanted then
      guard_internal_wanted=maxwanted
     end
    end
    local ret={guard_SetMaxWantedLevel(maxwanted)}
    if guard_debug then print(GetGameTimer()..":max_wanted="..maxwanted) end
    return table.unpack(ret)
end
local guard_SetPlayerWantedLevel=SetPlayerWantedLevel --bool is always false
function SetPlayerWantedLevel(player,wanted,bool)
    if (player==-1 or PlayerId()==player) and not IsEntityDead(PlayerPedId()) then
      local actual_wanted=wanted
      if actual_wanted>guard_max_wanted then
        actual_wanted=guard_max_wanted
      end
      if actual_wanted>guard_wanted then
       guard_internal_wanted=actual_wanted
       guard_wanted_set_timestamp=GetGameTimer()
      elseif actual_wanted<guard_wanted then
       guard_wanted=actual_wanted
       guard_wanted_set_timestamp=0
       guard_internal_wanted=0
       if guard_wanted==0 then guard_lost_cops_at_frame=guard_frame_counter end
      end
    end
    local ret={guard_SetPlayerWantedLevel(player,wanted,bool)}
    if guard_debug then print(GetGameTimer()..":player="..player.." wanted="..wanted) end
    return table.unpack(ret)
end
local guard_SetPlayerWantedLevelNow=SetPlayerWantedLevelNow --bool is always false
function SetPlayerWantedLevelNow(player,bool)
    if (player==-1 or PlayerId()==player) and guard_wanted_set_timestamp~=0 and not IsEntityDead(PlayerPedId()) then
     if guard_wanted==0 then
      guard_wanted_got_timestamp=GetGameTimer()
     end
     guard_wanted_set_timestamp=0
     guard_wanted=guard_internal_wanted
     guard_internal_wanted=0
     if guard_wanted==0 then guard_lost_cops_at_frame=guard_frame_counter end
    end
    local ret={guard_SetPlayerWantedLevelNow(player,bool)}
    if guard_debug then print(GetGameTimer()..":player="..player.." wanted now") end
    return table.unpack(ret)
end
local guard_ClearPlayerWantedLevel=ClearPlayerWantedLevel
function ClearPlayerWantedLevel(player)
    if player==-1 or PlayerId()==player then
     if guard_wanted>0 then guard_lost_cops_at_frame=guard_frame_counter end
     guard_wanted=0
     guard_internal_wanted=0
     guard_wanted_set_timestamp=0
    end
    local ret={guard_ClearPlayerWantedLevel(player)}
    if guard_debug then print(GetGameTimer()..":player="..player.." no longer wanted") end
    return table.unpack(ret)
end

local guard_SetEntityCoordsNoOffset=SetEntityCoordsNoOffset
function SetEntityCoordsNoOffset(ent,x,y,z,b1,b2,b3,b4)
    x,y,z=x+.5-.5,y+.5-.5,z+.5-.5
    if PlayerPedId()==ent then guard_x,guard_y,guard_z=x,y,z end
    local ret={guard_SetEntityCoordsNoOffset(ent,x,y,z,b1,b2,b3,b4)}
    if guard_debug then print(GetGameTimer()..":entity="..ent.." x="..x.." y="..y.." z="..z) end
    return table.unpack(ret)
end
local guard_SetEntityInvincible=SetEntityInvincible
function SetEntityInvincible(ent,toggle)
    if PlayerPedId()==ent then guard_invincible_1=toggle end
    local ret={guard_SetEntityInvincible(ent,toggle)}
    return table.unpack(ret)
end
local guard_SetPlayerInvincible=SetPlayerInvincible
function SetPlayerInvincible(player,toggle)
    if PlayerId()==player then guard_invincible_2=toggle end
    local ret={guard_SetPlayerInvincible(player,toggle)}
    return table.unpack(ret)
end
local guard_SetCamActive=SetCamActive
function SetCamActive(camera,toggle)
    guard_legal_camera=camera
    if guard_debug then print(GetGameTimer()..":SET camera="..camera) end
    local ret={guard_SetCamActive(camera,toggle)}
    return table.unpack(ret)
end
local guard_NetworkResurrectLocalPlayer=NetworkResurrectLocalPlayer
function NetworkResurrectLocalPlayer(x,y,z,heading,protection,b2,b3)
    x,y,z=x+.5-.5,y+.5-.5,z+.5-.5
    heading=heading+.5-.5
    guard_x,guard_y,guard_z=x,y,z+1
    local ret={guard_NetworkResurrectLocalPlayer(x,y,z,heading,protection,b2,b3)}
    local ped=PlayerPedId()
    guard_health=GetEntityHealth(ped)
    guard_max_health=GetPedMaxHealth(ped)
    if guard_wanted>0 then guard_lost_cops_at_frame=guard_frame_counter end
    guard_wanted=0
    local timestamp=GetGameTimer()
    if protection then
        guard_invincibility_timestamp=timestamp
        guard_invincible_1=true
    end
    guard_health_timestamp=timestamp
    DecorSetInt(ped,guard_decor_legal,GetPlayerServerId(PlayerId()))
    if guard_debug then print(GetGameTimer()..":player resurrected x="..x.." y="..y.." z="..z) end
    return table.unpack(ret)
end
local guard_TaskWarpPedIntoVehicle=TaskWarpPedIntoVehicle
function TaskWarpPedIntoVehicle(ped,veh,seat)
    if veh~=0 and PlayerPedId()==ped then
        local mdl=GetEntityModel(veh)
        if mdl~=0 then
            guard_altpos.x,guard_altpos.y,guard_altpos.z=table.unpack(GetEntityCoords(veh))
            guard_altpos.vehmdl=mdl
            guard_altpos.frame=guard_frame_counter
        end
    end
    local ret={guard_TaskWarpPedIntoVehicle(ped,veh,seat)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." warped into vehicle="..veh.." seat="..seat) end
    return table.unpack(ret)
end
local guard_SetPedIntoVehicle=SetPedIntoVehicle
function SetPedIntoVehicle(ped,veh,seat)
    if veh~=0 and PlayerPedId()==ped then
        local mdl=GetEntityModel(veh)
        if mdl~=0 then
            guard_x,guard_y,guard_z=table.unpack(GetEntityCoords(veh))
            guard_altpos.x,guard_altpos.y,guard_altpos.z=guard_x,guard_y,guard_z
            guard_altpos.vehmdl=mdl
            guard_altpos.frame=guard_frame_counter
        end
    end
    local ret={guard_SetPedIntoVehicle(ped,veh,seat)}
    if guard_debug then print(GetGameTimer()..":ped="..ped.." set into vehicle="..veh.." seat="..seat) end
    return table.unpack(ret)
end

-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
local code_rgnv=39000000
local code_rgn=35105140
local code_xpl=35105000
local code_stp=30001000
local code_godv=30000989
local code_inv1=30000990
local code_inv2=30000991
local code_maxh=30000992
local code_mdl=30000993
local code_want=30000994
local code_maxw=30000995
local code_evwnt=30000996
local code_infcl=30000997
local code_infam=30000998
local code_cam=30000999
local code_armr=20000100
local code_blp=20000000
local code_tag=15000000
local code_obj=10000000
local code_ped=5000000
local code_xml=4500000
local code_xam=4000000
local code_veh=1000000
    local EXPLOSION={
        GRENADE=0,
        GRENADELAUNCHER=1,
        STICKYBOMB=2,
        MOLOTOV=3,
        ROCKET=4,
        TANKSHELL=5,
        HI_OCTANE=6,
        CAR=7,
        PLANE=8,
        PETROL_PUMP=9,
        BIKE=10,
        DIR_STEAM=11,
        DIR_FLAME=12,
        DIR_WATER_HYDRANT=13,
        DIR_GAS_CANISTER=14,
        BOAT=15,
        SHIP_DESTROY=16,
        TRUCK=17,
        BULLET=18,
        SMOKEGRENADELAUNCHER=19,
        SMOKEGRENADE=20,
        BZGAS=21,
        FLARE=22,
        GAS_CANISTER=23,
        EXTINGUISHER=24,
        PROGRAMMABLEAR=25,
        TRAIN=26,
        BARREL=27,
        PROPANE=28,
        BLIMP=29,
        DIR_FLAME_EXPLODE=30,
        TANKER=31,
        PLANE_ROCKET=32,
        VEHICLE_BULLET=33,
        GAS_TANK=34,
        --BIRD_CRAP=35,
        
        FIREWORK = 35,
        SNOWBALL = 36,
        PROXMINE = 37,
        VALKYRIE_CANNON = 38,
    }
    local vehicles_with_cannons={
    --[-1600252419]=true,--valkyrie
    [970385471]=true,--hydra
    [-1281684762]=true,--lazer
    [-82626025]=true,--savage
    --[562680400]=true,--apc
    --[782665360]=true,--rhino tank
    [-1881846085]=true,--anti air trailer
    }
    
    local cars_with_armor={--vehicle rewards
    [-1205689942]=100,--riot
    [GetHashKey("insurgent7")]=100,--custom insurgent
    }
    
    local banned_peds={
    --[307287994]=true,--puma
    --[1885233650]=true,--freemode
    [-1667301416]=true,--freemode f
    }
    local banned_objects={
    [1952396163]=true,--windmill
    [-1268267712]=true,--fbi ufo
    [-320283514]=true,--damaged ufo
    [-733833763]=true,--cable cart
    [-528704006]=true,
    [234083239]=true,
    [959275690]=true,--small cage
    [-1968824367]=true,--stunts fat ramp/wall
    }
    local banned_vehicles={
    ----[410882957]=true,--armored kuruma
    --[562680400]=true,--APC
    [884483972]=true,--oppressor
    [-1435527158]=true,--gauss tank
    [941494461]=true,--ruiner 2000
    [1483171323]=true,--deluxo
    [886810209]=true,--stromberg
    ----[433954513]=true,--nightshark
    [-1924433270]=true,--insurgent mk2
    [-1590337689]=true,--blazer aqua
    --[1356124575]=true,--technical3 can be found in "forests of san andreas"
    ----[-326143852]=true,--duke'o'death
    [-1210451983]=true,--tampa3
    ----[-32236122]=true,--halftrack
    [-638562243]=true,--scramjet
    [-1242608589]=true,--vigilante
    [2069146067]=true,--oppressor2
    }

    local dispatched={}
    local max_dispatched={}
    for i=1,15 do
        dispatched[i]=0
        max_dispatched[i]=0
    end
    local vehicle_size={
    [368211810]=30, --andromaga
    [1058115860]=30, --jet
    }
    local veh_timestamp=0
    local water_timestamp=0
    local det_infam=0
    local det_infcl=0
    local last_weapon_impact_coord={x=.0,y=.0,z=.0}
    local last_shot=0
    local last_attack_was_melee=false
    local explosive_ammo_detected=true --true to wait for first shot
    local vehmodel=0
    while true do
        Wait(0)
        guard_frame_counter=guard_frame_counter+1
        for i=1,15 do
            local dis=GetNumberOfDispatchedUnitsForPlayer(i)
            if max_dispatched[i]<dis then max_dispatched[i]=dis end
            if dispatched[i]~=dis then
                if guard_debug then print(GetGameTimer()..":DETECTED dispatched["..i.."]="..dis) end
            end
            dispatched[i]=dis
        end
        local player=PlayerId()
        local serverid=GetPlayerServerId(player)
        local ped=PlayerPedId()
        local explosions=0
        local blips=0
        --local inveh=IsPedInAnyVehicle(ped,true)
        local inveh=IsPedInAnyVehicle(ped,false)
        local isdriver=false
        local veh=GetVehiclePedIsIn(ped,true)
        local veh_engine=1000.0
        local veh_body=1000.0
        local in_water=IsEntityInWater(inveh and veh or ped)
        local pos=GetEntityCoords(ped)
        local health=GetEntityHealth(ped)
        local max_health=GetPedMaxHealth(ped)
        local armor=GetPedArmour(ped)
        local model=GetEntityModel(ped)
        local wanted=GetPlayerWantedLevel(player)
        local max_wanted=GetMaxWantedLevel()
        local stars_about_to_drop=ArePlayerFlashingStarsAboutToDrop(player)
        local damaged_by_obj=HasEntityBeenDamagedByAnyObject(ped)
        local damaged_by_ped=HasEntityBeenDamagedByAnyPed(ped)
        local damaged_by_veh=HasEntityBeenDamagedByAnyVehicle(ped)
        local invincible_1=NetworkIsLocalPlayerInvincible()
        local invincible_2=GetPlayerInvincible(player)
        local weapon=GetSelectedPedWeapon(ped)
        if not IsWeaponValid(weapon) then weapon=nil end
        local shooting=IsPedShooting(ped)
        local reloading=IsPedReloading(ped)
        local camera=GetRenderingCam()
        local timestamp=GetGameTimer()
        local attached=false
        
        if inveh then
            vehmodel=GetEntityModel(veh)
            if GetPedInVehicleSeat(veh,-1)==ped then
                if NetworkHasControlOfEntity(veh) then isdriver=true end
                attached=IsEntityAttached(veh)
                SetEntityInvincible(veh,false)
                veh_engine=GetVehicleEngineHealth(veh)
                veh_body=GetVehicleBodyHealth(veh)
                if guard_vehicle~=veh then
                    guard_vehicle=veh
                    guard_veh_engine_health=veh_engine
                    guard_veh_body_health=veh_body
                    --if guard_debug then print(timestamp..":DETECTED took control over vehicle") end
                    guard_veh_explosion_timestamp=nil
                else
                    local damaged=false
                    if guard_veh_engine_health~=veh_engine then
                        if guard_veh_engine_health<veh_engine then
                            _tse(event.debug,code_rgnv+veh_engine-guard_veh_engine_health)
                        else
                            guard_veh_damaged_timestamp=timestamp
                        end
                        guard_veh_engine_health=veh_engine
                    end
                    if guard_veh_body_health~=veh_body then
                        if guard_veh_body_health<veh_body then
                            _tse(event.debug,code_rgnv+veh_body-guard_veh_body_health)
                        else
                            guard_veh_damaged_timestamp=timestamp
                        end
                        guard_veh_body_health=veh_body
                    end
                    if veh_body>0.0 and veh_engine>0.0 and guard_veh_explosion_timestamp~=nil then
                        if guard_veh_damaged_timestamp==nil and timestamp-guard_veh_explosion_timestamp>2000
                        or guard_veh_damaged_timestamp~=nil and timestamp-guard_veh_explosion_timestamp>1000 and guard_veh_explosion_timestamp-guard_veh_damaged_timestamp>2000 then
                            guard_veh_damaged_timestamp=guard_veh_explosion_timestamp
                            _tse(event.debug,code_godv)
                        end
                    end
                    local x0,y0,z0,x1,y1,z1=pos.x-4,pos.y-4,pos.z-4,pos.x+4,pos.y+4,pos.z+4
                    if IsExplosionInArea(EXPLOSION.GRENADE,x0,y0,z0,x1,y1,z1)
                    or IsExplosionInArea(EXPLOSION.GRENADELAUNCHER,x0,y0,z0,x1,y1,z1)
                    or IsExplosionInArea(EXPLOSION.STICKYBOMB,x0,y0,z0,x1,y1,z1)
                    or IsExplosionInArea(EXPLOSION.ROCKET,x0,y0,z0,x1,y1,z1)
                    or IsExplosionInArea(EXPLOSION.TANKSHELL,x0,y0,z0,x1,y1,z1)
                    or IsExplosionInArea(EXPLOSION.VEHICLE_BULLET,x0,y0,z0,x1,y1,z1)
                    or IsExplosionInArea(EXPLOSION.PLANE_ROCKET,x0,y0,z0,x1,y1,z1)
                    or IsExplosionInArea(EXPLOSION.VALKYRIE_CANNON,x0,y0,z0,x1,y1,z1)
                    or IsExplosionInArea(EXPLOSION.PROXMINE,x0,y0,z0,x1,y1,z1)
                    then
                        guard_veh_explosion_timestamp=timestamp
                    end
                end
            end
        end
        if not isdriver then
            attached=IsEntityAttached(ped)
            --if guard_vehicle~=0 and guard_debug then print(timestamp..":DETECTED lost control over vehicle") end
            guard_vehicle=0
            guard_veh_explosion_timestamp=nil
            guard_veh_damaged_timestamp=nil
        end
        --local damaged_by_ent=HasEntityBeenDamagedByAnyEntity(ped)
        if guard_damaged_by_obj~=damaged_by_obj then
            guard_damaged_by_obj=damaged_by_obj
            --if guard_debug and damaged_by_obj then print(timestamp..":DETECTED damaged_by_obj") end
        end
        if guard_damaged_by_ped~=damaged_by_ped then
            guard_damaged_by_ped=damaged_by_ped
            --if guard_debug and damaged_by_ped then print(timestamp..":DETECTED damaged_by_ped") end
        end
        if guard_damaged_by_veh~=damaged_by_veh then
            guard_damaged_by_veh=damaged_by_veh
            --if guard_debug and damaged_by_veh then print(timestamp..":DETECTED damaged_by_veh") end
        end
        if guard_invincible_1~=invincible_1 then
            guard_invincible_1=invincible_1
            --if guard_debug then
             if invincible_1 then
              --if guard_debug then print(timestamp..":DETECTED invincibility type 1 ENABLED") end
              _tse(event.debug,code_inv1)
             --else
              --if guard_debug then print(timestamp..":DETECTED invincibility type 1 DISABLED") end
             end
            --end
        end
        if invincible_1 and timestamp-guard_invincibility_timestamp>2000 then
            --print(timestamp..":DETECTED invincibility type 1 ENABLED")
            _tse(event.debug,code_inv1)
        end
        if guard_invincible_2~=invincible_2 then
            guard_invincible_2=invincible_2
            --if guard_debug then
             if invincible_2 then
              --if guard_debug then print(timestamp..":DETECTED invincibility type 2 ENABLED") end
              _tse(event.debug,code_inv2)
             --else
             -- if guard_debug then print(timestamp..":DETECTED invincibility type 2 DISABLED") end
             end
            --end
        end
        -- -- if guard_max_health_altered==false and guard_model_maxhealth[model]==nil then
            -- -- guard_max_health=GetPedMaxHealth(ped)
            -- -- guard_model_maxhealth[model]=guard_max_health
            -- -- guard_max_health_altered=false
            -- -- if guard_debug then print("model "..model.." maxhealth updated to "..guard_model_maxhealth[model]) end
        -- -- end
        if guard_model~=model then
            if guard_model~=nil then _tse(event.debug,code_mdl) end
            guard_model=model
            --if guard_debug then print(timestamp..":DETECTED model changed to "..model) end
        end
        if guard_max_health~=max_health then
            if max_health>guard_max_health then _tse(event.debug,code_maxh) end
            guard_max_health=max_health
            --if guard_debug then print(timestamp..":DETECTED max_health="..health) end
        end

        if guard_health~=health then
            if health>guard_health then
             if health>guard_max_health/2+50 or (health-guard_health)*120>(timestamp-guard_health_timestamp) then
              if (not inveh) or vehmodel~=1171614426 then --ambulance
               _tse(event.debug,code_rgn+health-guard_health)
              end
             end
            end
            guard_health=health
            guard_health_timestamp=timestamp
            --if guard_debug then print(timestamp..":DETECTED health="..health) end
        end
        
        if guard_z>-192.0 and not attached then
            local dx,dy,dz=guard_x-pos.x,guard_y-pos.y,guard_z-pos.z
            local delta=math.sqrt(dx*dx+dy*dy+dz*dz)
            local vel=(delta*1000.0)/(timestamp-guard_last_check)
            delta=math.floor(delta+.5)
            vel=math.floor(vel+.5)
            local detect=false
            if (guard_inveh~=inveh) then
                local veh_size=vehicle_size[vehmodel]
                if veh_size~=nil and delta<veh_size and veh_timestamp+400<timestamp then
                    veh_timestamp=timestamp
                elseif vel>555 then
                    detect=true
                end
            elseif veh==0 then
                if vel>80 then
                    detect=true
                elseif (vel>8 and in_water) then
                    local d=(timestamp-water_timestamp)
                    if (d&0xFFFFF800)~=0 then
                        water_timestamp=timestamp
                    elseif (d&0xFFFFFE00)~=0 then
                        detect=true
                    end
                end
            elseif (isdriver and vel>555) then
                detect=true
            end
            if detect then
                _tse(event.debug,code_stp+delta,vel,{from={guard_x,guard_y,guard_z},to={pos.x,pos.y,pos.z},alt={guard_altpos.x,guard_altpos.y,guard_altpos.z},vm=(guard_altpos.vehmdl),frames=(guard_frame_counter-guard_altpos.frame)})
            end
            -- if guard_debug then
                -- SetTextOutline()
                -- SetTextFont(4)
                -- SetTextScale(.3,.3)
                -- SetTextEntry("STRING")
                -- AddTextComponentString("velocity="..vel)
                -- EndTextCommandDisplayText(.5,.8)
            -- end
        end
        guard_x,guard_y,guard_z=pos.x,pos.y,pos.z
        if guard_inveh~=inveh then
            guard_inveh=inveh
            --if guard_debug then print(timestamp..":DETECTED entered/exited") end
        end
        guard_is_driver=isdriver
        if guard_armor~=armor then
            if armor>guard_armor then
             if (not inveh) or cars_with_armor[vehmodel]==nil then
              _tse(event.debug,code_armr+armor-guard_armor)
             end
            end
            guard_armor=armor
            --if guard_debug then print(timestamp..":DETECTED armor="..armor) end
        end
        if guard_police_radar_blips and (guard_wanted>0 or wanted>0 or stars_about_to_drop or guard_wanted_flashed_last_time or (guard_frame_counter-guard_lost_cops_at_frame)<30) then
            for p=0,31 do
                if NetworkIsPlayerActive(p) then
                    local target=GetPlayerPed(p)
                    if player~=p and GetBlipFromEntity(target)~=0 then
                        if not guard_blipped_players[p] and (guard_blip_removal_frame[p]==nil or (guard_frame_counter-guard_blip_removal_frame[p])>30) then
                            if not IsPedCop(target) then
                                blips=blips+1
                            end
                        end
                    end
                    local pl_pos=GetEntityCoords(target)
                    local x0,y0,z0,x1,y1,z1=pl_pos.x-10.0,pl_pos.y-10.0,pl_pos.z-10.0,pl_pos.x+10.0,pl_pos.y+10.0,pl_pos.z+10.0
                    for t=0,38 do
                        if IsExplosionInArea(t,x0,y0,z0,x1,y1,z1) then
                            explosions=explosions+1
                        end
                    end
                end
            end
        else
            for p=0,31 do
                if NetworkIsPlayerActive(p) then
                    local target=GetPlayerPed(p)
                    if player~=p and GetBlipFromEntity(target)~=0 then
                        if not guard_blipped_players[p] and (guard_blip_removal_frame[p]==nil or (guard_frame_counter-guard_blip_removal_frame[p])>30) then
                            blips=blips+1
                        end
                    end
                    local pl_pos=GetEntityCoords(target)
                    local x0,y0,z0,x1,y1,z1=pl_pos.x-10.0,pl_pos.y-10.0,pl_pos.z-10.0,pl_pos.x+10.0,pl_pos.y+10.0,pl_pos.z+10.0
                    for t=0,38 do
                        if IsExplosionInArea(t,x0,y0,z0,x1,y1,z1) then
                            explosions=explosions+1
                        end
                    end
                end
            end
        end
        for i=guard_tagscanner,(guard_tagscanner|0xFF) do
            if IsMpGamerTagActive(i) and guard_ok_tags[i]==nil then guard_tagscanner_tags=guard_tagscanner_tags+1 end
        end
        if guard_tagscanner==0x7FF00 then
            if guard_player_tags~=guard_tagscanner_tags then
                guard_player_tags=guard_tagscanner_tags
                -- if guard_debug then
                    -- print(GetGameTimer()..":DETECTED tags="..guard_tagscanner_tags)
                -- end
                _tse(event.debug,code_tag+guard_tagscanner_tags)
            end
            guard_tagscanner=0
            guard_tagscanner_tags=0
        else
            guard_tagscanner=guard_tagscanner+0x100
        end
        if guard_explosions~=explosions then
            guard_explosions=explosions
            --if guard_debug then print(GetGameTimer()..":DETECTED explosions="..explosions) end
            _tse(event.debug,code_xpl+explosions)
        end
        if guard_player_blips~=blips then
            guard_player_blips=blips
            -- if guard_debug then
                -- print(GetGameTimer()..":DETECTED blips="..blips)
                -- print("lost cops "..(guard_frame_counter-guard_lost_cops_at_frame).." frames ago")
            -- end
            _tse(event.debug,code_blp+blips)
        end
        if guard_wanted~=wanted then
            if wanted>guard_wanted then
                guard_wanted_got_timestamp=timestamp
            elseif wanted<guard_wanted then --and timestamp-guard_wanted_timestamp<1000 then
                if timestamp-guard_wanted_got_timestamp<39000 and guard_wanted_flashed_last_time==false then
                    _tse(event.debug,code_want)
                end
                if wanted==0 then guard_lost_cops_at_frame=guard_frame_counter end
                --if guard_debug then print("you were wanted for "..(timestamp-guard_wanted_got_timestamp).."ms") end
            end
            guard_wanted=wanted
            --if guard_debug then print(timestamp..":DETECTED wanted="..wanted) end
        end
        if guard_max_wanted~=max_wanted then
            guard_max_wanted=max_wanted
            _tse(event.debug,code_maxw)
            --if guard_debug then print(timestamp..":DETECTED max_wanted="..max_wanted) end
        end
        if guard_wanted_set_timestamp~=0 and timestamp-guard_wanted_set_timestamp>10000 then
            if wanted<guard_internal_wanted then
                _tse(event.debug,code_evwnt)
                --if guard_debug then print(timestamp..":DETECTED evaded pending wanted level") end
            end
            guard_wanted_set_timestamp=0
            guard_internal_wanted=0
        end
        guard_wanted_flashed_last_time=stars_about_to_drop
        if weapon~=nil and weapon~=guard_weapon then
            guard_weapon=weapon
            guard_clip=GetAmmoInClip(ped,weapon)
            guard_ammo=GetAmmoInPedWeapon(ped,weapon)
            --if guard_debug then print(timestamp..":DETECTED switched weapon to "..weapon) end
        end
        if shooting and weapon~=911657153 then --not for tazer
            local bool,clip=GetAmmoInClip(ped,weapon)
            local ammo=GetAmmoInPedWeapon(ped,weapon)
            if bool and clip==guard_clip and GetMaxAmmoInClip(ped,weapon,1)~=1 then
                det_infcl=det_infcl+1
                if det_infcl>50 then
                    det_infcl=det_infcl-50
                    _tse(event.debug,code_infcl)
                end
            end
            if bool and ammo==guard_ammo then
                det_infam=det_infam+1
                if det_infam>50 then
                    det_infam=det_infam-50
                    _tse(event.debug,code_infam)
                end
            end
            guard_clip=clip
            guard_ammo=ammo
            --if guard_debug then print("ammo="..GetAmmoInPedWeapon(ped,weapon).." clip="..clip.." clip_size="..GetWeaponClipSize(weapon)) end
        end
        if (not inveh and weapon~=1834241177) --not a railgun
           or
           (inveh and vehicles_with_cannons[vehmodel]==nil)
        then
            local success,hitpos=GetPedLastWeaponImpactCoord(ped)
            if success then
                last_weapon_impact_coord.x,last_weapon_impact_coord.y,last_weapon_impact_coord.z=hitpos.x,hitpos.y,hitpos.z
                last_shot=timestamp
                explosive_ammo_detected=false
                last_attack_was_melee=IsPedInMeleeCombat(ped)
                --print("hit "..last_weapon_impact_coord.x.." "..last_weapon_impact_coord.y.." "..last_weapon_impact_coord.z)
            end
            if not explosive_ammo_detected and timestamp-last_shot<500 then
                local explosions=0
                local x0,y0,z0=last_weapon_impact_coord.x-.4,last_weapon_impact_coord.y-.4,last_weapon_impact_coord.z-.4
                local x1,y1,z1=last_weapon_impact_coord.x+.4,last_weapon_impact_coord.y+.4,last_weapon_impact_coord.z+.4
                for t=0,38 do
                    if IsExplosionInArea(t,x0,y0,z0,x1,y1,z1) then
                        explosions=explosions+1
                    end
                end
                if explosions>0 then
                    explosive_ammo_detected=true
                    if last_attack_was_melee then
                        _tse(event.debug,code_xml+explosions)
                    else
                        _tse(event.debug,code_xam+explosions)
                    end
                end
            end
        end
        --if guard_camera~=camera then
        --    guard_camera=camera
            if camera~=-1 and camera~=guard_legal_camera then
                local campos=GetCamCoord(camera)
                local normcampos={x=-2153.6411132813,y=4597.95703125,z=116.66200256348}
                if math.abs(normcampos.x-campos.x)+math.abs(normcampos.y-campos.y)+math.abs(normcampos.z-campos.z)>.001 then
                    if guard_camera~=camera then
                        guard_camera=camera
                        _tse(event.debug,code_cam)
                    end
                    --print(timestamp..":DETECTED camera_pos={x="..campos.x..",y="..campos.y..",z="..campos.z.."}")
                    --if guard_debug then print(timestamp..":DETECTED camera="..camera) end
                end
            end
        --end
        if banned_peds~=nil then
            local peds=0
            local loop,handle,ped
            
            handle,ped=FindFirstPed()
            loop=(handle~=-1)
            while loop do
                if not IsPedAPlayer(ped) then
                    if not DecorExistOn(ped,guard_decor_legal) and not DecorExistOn(ped,guard_decor_illegal) then
                        DecorSetInt(ped,guard_decor_illegal,serverid)
                        local model=GetEntityModel(ped)
                        if banned_peds[model] then
                            peds=peds+1
                        end
                    end
                end
                loop,ped=FindNextPed(handle)
            end
            EndFindPed(handle)
            
            if guard_peds~=peds then
                guard_peds=peds
                --if guard_debug then print(GetGameTimer()..":DETECTED peds="..peds) end
                _tse(event.debug,code_ped+peds)
            end
        end
        if banned_objects~=nil then
            local objects=0
            local loop,handle,obj
            
            handle,obj=FindFirstObject()
            loop=(handle~=-1)
            while loop do
                if NetworkGetEntityIsNetworked(obj) and not DecorExistOn(obj,guard_decor_legal) and not DecorExistOn(obj,guard_decor_illegal) then
                    DecorSetInt(obj,guard_decor_illegal,serverid)
                    local model=GetEntityModel(obj)
                    if banned_objects[model] then
                        SetEntityAsMissionEntity(obj,true,true)
                        DeleteObject(obj)
                        objects=objects+1
                    end
                end
                loop,obj=FindNextObject(handle)
            end
            EndFindObject(handle)
            if guard_objects~=objects then
                guard_objects=objects
                --if guard_debug then print(GetGameTimer()..":DETECTED objects="..objects) end
                _tse(event.debug,code_obj+objects)
            end
        end
        if banned_vehicles~=nil then
            local vehicles=0
            local loop,handle,veh
            
            handle,veh=FindFirstVehicle()
            loop=(handle~=-1)
            while loop do
                if not DecorExistOn(veh,guard_decor_legal) and not DecorExistOn(veh,guard_decor_illegal) then
                    DecorSetInt(veh,guard_decor_illegal,serverid)
                    local model=GetEntityModel(veh)
                    if banned_vehicles[model] then
                        SetEntityAsMissionEntity(veh,true,true)
                        DeleteVehicle(veh)
                        vehicles=vehicles+1
                    else
                        DecorSetFloat(veh,guard_decor_dist,sqrt_dist(GetEntityCoords(veh),pos))
                    end
                end
                loop,veh=FindNextVehicle(handle)
            end
            EndFindVehicle(handle)
            if guard_vehicles~=vehicles then
                guard_vehicles=vehicles
                --if guard_debug then print(GetGameTimer()..":DETECTED vehicles="..vehicles) end
                _tse(event.debug,code_veh+vehicles)
            end
        end
        guard_last_check=timestamp
        
        if guard_debug then
            SetTextOutline()
            SetTextFont(4)
            SetTextScale(.3,.3)
            TextCommandDisplayText(.5,.82,"wanted=~1~",wanted)
            SetTextOutline()
            SetTextFont(4)
            SetTextScale(.3,.3)
            TextCommandDisplayText(.5,.84,"int_wanted=~1~",guard_internal_wanted)
            SetTextOutline()
            SetTextFont(4)
            SetTextScale(.3,.3)
            TextCommandDisplayText(.5,.86,"max_wanted=~1~",guard_max_wanted)
            
            -- SetTextOutline()
            -- SetTextFont(4)
            -- SetTextScale(.3,.3)
            -- SetTextEntry("STRING")
            -- AddTextComponentString("tr0="..GetWantedLevelThreshold(0))
            -- EndTextCommandDisplayText(.6,.78)
            -- SetTextOutline()
            -- SetTextFont(4)
            -- SetTextScale(.3,.3)
            -- SetTextEntry("STRING")
            -- AddTextComponentString("tr1="..GetWantedLevelThreshold(1))
            -- EndTextCommandDisplayText(.6,.8)
            -- SetTextOutline()
            -- SetTextFont(4)
            -- SetTextScale(.3,.3)
            -- SetTextEntry("STRING")
            -- AddTextComponentString("tr2="..GetWantedLevelThreshold(2))
            -- EndTextCommandDisplayText(.6,.82)
            -- SetTextOutline()
            -- SetTextFont(4)
            -- SetTextScale(.3,.3)
            -- SetTextEntry("STRING")
            -- AddTextComponentString("tr3="..GetWantedLevelThreshold(3))
            -- EndTextCommandDisplayText(.6,.84)
            -- SetTextOutline()
            -- SetTextFont(4)
            -- SetTextScale(.3,.3)
            -- SetTextEntry("STRING")
            -- AddTextComponentString("tr4="..GetWantedLevelThreshold(4))
            -- EndTextCommandDisplayText(.6,.86)
            -- SetTextOutline()
            -- SetTextFont(4)
            -- SetTextScale(.3,.3)
            -- SetTextEntry("STRING")
            -- AddTextComponentString("tr5="..GetWantedLevelThreshold(5))
            -- EndTextCommandDisplayText(.6,.88)
            -- SetTextOutline()
            -- SetTextFont(4)
            -- SetTextScale(.3,.3)
            -- SetTextEntry("STRING")
            -- AddTextComponentString("tr6="..GetWantedLevelThreshold(6))
            -- EndTextCommandDisplayText(.6,.9)
        end
    end
end)

if guard_remove_pickups then Citizen.CreateThread(function()
    -- local banned_pickups={ --pickup hashes
    -- [0x5C517D97]=true, --PICKUP_AMMO_HOMINGLAUNCHER
    -- [0xFFFFFFFFF25A01B9]=true, --PICKUP_AMMO_MINIGUN
    -- [0x1CD2CF66]=true, --PICKUP_HEALTH_SNACK
    -- [0xFFFFFFFF8F707C18]=true, --PICKUP_HEALTH_STANDARD
    -- [0xC01EB678]=true, --PICKUP_WEAPON_HOMINGLAUNCHER
    -- [0x2F36B434]=true, --PICKUP_WEAPON_MINIGUN
    -- [0x4316CC09]=true, --PICKUP_VEHICLE_ARMOUR_STANDARD
    -- [0x098D79EF]=true, --PICKUP_VEHICLE_HEALTH_STANDARD
    -- [0xFFFFFFFFFDEE8368]=true, --PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW
    -- }
    local banned_pickup_models={} --model hashes
    banned_pickup_models[GetHashKey("prop_ld_health_pack")]=true
    local banned_weapons={
        --[WEAPON.HOMINGLAUNCHER]=true,
        [WEAPON.MINIGUN]=true,
        [GetHashKey("WEAPON_RAYPISTOL")]=true,
        [GetHashKey("WEAPON_RAYCARBINE")]=true,
        [GetHashKey("WEAPON_RAYMINIGUN")]=true,
    }
    --banned_pickups[GetHashKey("prop_ld_health_pack")]=true
    -- prop_bodyarmour_02
-- prop_bodyarmour_03
-- prop_bodyarmour_04
-- prop_bodyarmour_05
-- prop_bodyarmour_06
--prop_ld_armour
    while true do
        Wait(0)
        local n=0
        local delet_this={}
        local loop,handle,pickup
        
        handle,pickup=FindFirstPickup()
        loop=(handle~=-1)
        while loop do
            local model=GetEntityModel(pickup)
            if model~=0 then
                local whash=GetWeaponHashFromPickup(pickup)
                if whash==0 then
                    --if banned_pickup_models[model] then
                    n=n+1
                    delet_this[n]=pickup
                    --end
                elseif banned_weapons[whash] then
                    n=n+1
                    delet_this[n]=pickup
                end
            end
            loop,pickup=FindNextPickup(handle)
        end
        EndFindPickup(handle)
        for _,pickup in pairs(delet_this) do
            --guard_SetEntityCoords(pickup,10000.0,12000.0,-13000.0)
            SetEntityAsMissionEntity(pickup,false,false)
            RemovePickup(pickup)
            DeleteObject(pickup)
        end
        if guard_debug and n~=0 then
            print(GetGameTimer()..":pickups removed "..n)
        end
    end
end) end

-- _rne('initiate_standard_procedure')
-- _aeh('initiate_standard_procedure',function(error_code)
    -- if error_code~=nil and error_code==13374 then
        -- guard_debug=true
    -- end
-- end)

end)

----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
-------------   _____ _____    __          ___   _ __  __          _   _          _____ ______ _____   -------------
-------------  / ____|  __ \ /\\ \        / / \ | |  \/  |   /\   | \ | |   /\   / ____|  ____|  __ \  -------------
------------- | (___ | |__) /  \\ \  /\  / /|  \| | \  / |  /  \  |  \| |  /  \ | |  __| |__  | |__) | -------------
-------------  \___ \|  ___/ /\ \\ \/  \/ / | . ` | |\/| | / /\ \ | . ` | / /\ \| | |_ |  __| |  _  /  -------------
-------------  ____) | |  / ____ \\  /\  /  | |\  | |  | |/ ____ \| |\  |/ ____ \ |__| | |____| | \ \  -------------
------------- |_____/|_| /_/    \_\\/  \/   |_| \_|_|  |_/_/    \_\_| \_/_/    \_\_____|______|_|  \_\ -------------
-------------                                                                                          -------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
-- in-memory spawnpoint array for this script execution instance
local spawnPoints = {
	{x=506.08898925781,y=3099.5561523438,z=41.30786895752,heading=307.49545288086,model=GetHashKey('mp_m_freemode_01')},
	{x=162.0185546875,y=3132.2092285156,z=43.584144592285,heading=286.70404052734,model=GetHashKey('mp_m_freemode_01')},
	{x=-36.899517059326,y=2867.2209472656,z=59.123546600342,heading=295.75900268555,model=GetHashKey('mp_m_freemode_01')},
	{x=-326.44372558594,y=2818.7707519531,z=58.896278381348,heading=68.388191223145,model=GetHashKey('mp_m_freemode_01')},
	{x=260.50314331055,y=2578.5812988281,z=45.094295501709,heading=326.01617431641,model=GetHashKey('mp_m_freemode_01')},
	{x=707.50109863281,y=4180.2143554688,z=40.709232330322,heading=199.02793884277,model=GetHashKey('mp_m_freemode_01')},
	{x=1337.1436767578,y=4388.8486328125,z=44.343147277832,heading=121.13133239746,model=GetHashKey('mp_m_freemode_01')},
	{x=379.47799682617,y=2575.4753417969,z=43.51957321167,heading=287.33660888672,model=GetHashKey('mp_m_freemode_01')},
	{x=562.19866943359,y=2598.1745605469,z=43.054641723633,heading=248.04971313477,model=GetHashKey('mp_m_freemode_01')},
	{x=1583.9979248047,y=2904.6918945313,z=56.886501312256,heading=300.78237915039,model=GetHashKey('mp_m_freemode_01')},
	{x=-287.33755493164,y=2535.7421875,z=75.473251342773,heading=265.09255981445,model=GetHashKey('mp_m_freemode_01')},
	{x=-263.36853027344,y=2195.8813476563,z=130.39883422852,heading=247.2370300293,model=GetHashKey('mp_m_freemode_01')},
	{x=-43.901203155518,y=1960.1064453125,z=190.35336303711,heading=31.263597488403,model=GetHashKey('mp_m_freemode_01')},
	{x=739.4560546875,y=2579.1052246094,z=75.463600158691,heading=209.29257202148,model=GetHashKey('mp_m_freemode_01')},
	{x=2162.9470214844,y=3375.0041503906,z=46.456100463867,heading=219.02297973633,model=GetHashKey('mp_m_freemode_01')},
	{x=2697.1813964844,y=4324.8930664063,z=45.852005004883,heading=41.926979064941,model=GetHashKey('mp_m_freemode_01')},
	{x=2555.1843261719,y=4651.3701171875,z=34.076778411865,heading=134.81283569336,model=GetHashKey('mp_m_freemode_01')},
}

-- auto-spawn enabled flag
local autoSpawnEnabled = false
local autoSpawnCallback

-- support for mapmanager maps
AddEventHandler('getMapDirectives', function(add)
    -- call the remote callback
    add('spawnpoint', function(state, model)
        -- return another callback to pass coordinates and so on (as such syntax would be [spawnpoint 'model' { options/coords }])
        return function(opts)
            local x, y, z, heading

            local s, e = pcall(function()
                -- is this a map or an array?
                if opts.x then
                    x = opts.x
                    y = opts.y
                    z = opts.z
                else
                    x = opts[1]
                    y = opts[2]
                    z = opts[3]
                end

                x = x + 0.0001
                y = y + 0.0001
                z = z + 0.0001

                -- get a heading and force it to a float, or just default to null
                heading = opts.heading and (opts.heading + 0.01) or 0

                -- add the spawnpoint
                addSpawnPoint({
                    x = x, y = y, z = z,
                    heading = heading,
                    model = model
                })

                -- recalculate the model for storage
                if not tonumber(model) then
                    model = GetHashKey(model, _r)
                end

                -- store the spawn data in the state so we can erase it later on
                state.add('xyz', { x, y, z })
                state.add('model', model)
            end)

            if not s then
                Citizen.Trace(e .. "\n")
            end
        end
        -- delete callback follows on the next line
    end, function(state, arg)
        -- loop through all spawn points to find one with our state
        for i, sp in ipairs(spawnPoints) do
            -- if it matches...
            if sp.x == state.xyz[1] and sp.y == state.xyz[2] and sp.z == state.xyz[3] and sp.model == state.model then
                -- remove it.
                table.remove(spawnPoints, i)
                return
            end
        end
    end)
end)


-- loads a set of spawn points from a JSON string
function loadSpawns(spawnString)
    -- decode the JSON string
    local data = json.decode(spawnString)

    -- do we have a 'spawns' field?
    if not data.spawns then
        error("no 'spawns' in JSON data")
    end

    -- loop through the spawns
    for i, spawn in ipairs(data.spawns) do
        -- and add it to the list (validating as we go)
        addSpawnPoint(spawn)
    end
end

local spawnNum = 1

function addSpawnPoint(spawn)
    -- validate the spawn (position)
    if not tonumber(spawn.x) or not tonumber(spawn.y) or not tonumber(spawn.z) then
        error("invalid spawn position")
    end

    -- heading
    if not tonumber(spawn.heading) then
        error("invalid spawn heading")
    end

    -- model (try integer first, if not, hash it)
    local model = spawn.model

    if not tonumber(spawn.model) then
        model = GetHashKey(spawn.model)
    end

    -- is the model actually a model?
    if not IsModelInCdimage(model) then
        error("invalid spawn model")
    end

    -- is is even a ped?
    -- not in V?
    --[[if not IsThisModelAPed(model) then
        error("this model ain't a ped!")
    end]]

    -- overwrite the model in case we hashed it
    spawn.model = model

    -- add an index
    spawn.idx = spawnNum
    spawnNum = spawnNum + 1

    -- all OK, add the spawn entry to the list
    table.insert(spawnPoints, spawn)

    return spawn.idx
end

-- removes a spawn point
function removeSpawnPoint(spawn)
    for i = 1, #spawnPoints do
        if spawnPoints[i].idx == spawn then
            table.remove(spawnPoints, i)
            return
        end
    end
end

-- changes the auto-spawn flag
function setAutoSpawn(enabled)
    autoSpawnEnabled = enabled
end

-- sets a callback to execute instead of 'native' spawning when trying to auto-spawn
function setAutoSpawnCallback(cb)
    autoSpawnCallback = cb
    autoSpawnEnabled = true
end

-- function as existing in original R* scripts
local function freezePlayer(id, freeze)
    local player = id
    SetPlayerControl(player, not freeze, false)

    local ped = GetPlayerPed(player)

    if not freeze then
        if not IsEntityVisible(ped) then
            SetEntityVisible(ped, true)
        end

        if not IsPedInAnyVehicle(ped) then
            SetEntityCollision(ped, true)
        end

        FreezeEntityPosition(ped, false)
        --SetCharNeverTargetted(ped, false)
        --SetPlayerInvincible(player, false)
    else
        if IsEntityVisible(ped) then
            SetEntityVisible(ped, false)
        end

        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        --SetCharNeverTargetted(ped, true)
        --SetPlayerInvincible(player, true)
        --RemovePtfxFromPed(ped)

        if not IsPedFatallyInjured(ped) then
            ClearPedTasksImmediately(ped)
        end
    end
end

function loadScene(x, y, z)
    NewLoadSceneStart(x, y, z, 0.0, 0.0, 0.0, 20.0, 0)

    while IsNewLoadSceneActive() do
        networkTimer = GetNetworkTimer()

        NetworkUpdateLoadScene()
    end
end

-- to prevent trying to spawn multiple times
local spawnLock = false

-- spawns the current player at a certain spawn point index (or a random one, for that matter)
function spawnPlayer(spawnIdx, cb)
    if spawnLock then
        return
    end

    spawnLock = true

    Citizen.CreateThread(function()
        DoScreenFadeOut(500)

        while IsScreenFadingOut() do
            Citizen.Wait(0)
        end

        -- if the spawn isn't set, select a random one
        if not spawnIdx then
            spawnIdx = GetRandomIntInRange(1, #spawnPoints + 1)
        end

        -- get the spawn from the array
        local spawn

        if type(spawnIdx) == 'table' then
            spawn = spawnIdx
        else
            spawn = spawnPoints[spawnIdx]
        end

        -- validate the index
        if not spawn then
            Citizen.Trace("tried to spawn at an invalid spawn index\n")

            spawnLock = false

            return
        end

        -- freeze the local player
        freezePlayer(PlayerId(), true)

        -- if the spawn has a model set
        if spawn.model then
            RequestModel(spawn.model)

            -- load the model for this spawn
            while not HasModelLoaded(spawn.model) do
                RequestModel(spawn.model)

                Wait(0)
            end

            -- change the player model
            SetPlayerModel(PlayerId(), spawn.model)

            -- release the player model
            SetModelAsNoLongerNeeded(spawn.model)
        end

        -- preload collisions for the spawnpoint
        RequestCollisionAtCoord(spawn.x, spawn.y, spawn.z)

        -- spawn the player
        --ResurrectNetworkPlayer(GetPlayerId(), spawn.x, spawn.y, spawn.z, spawn.heading)
        local ped = GetPlayerPed(-1)

        -- V requires setting coords as well
        SetEntityCoordsNoOffset(ped, spawn.x, spawn.y, spawn.z, false, false, false, true)

        NetworkResurrectLocalPlayer(spawn.x, spawn.y, spawn.z, spawn.heading, false, false, false)

        -- gamelogic-style cleanup stuff
        ClearPedTasksImmediately(ped)
        --SetEntityHealth(ped, 300) -- TODO: allow configuration of this?
        RemoveAllPedWeapons(ped) -- TODO: make configurable (V behavior?)
        ClearPlayerWantedLevel(PlayerId())

        -- why is this even a flag?
        --SetCharWillFlyThroughWindscreen(ped, false)

        -- set primary camera heading
        --SetGameCamHeading(spawn.heading)
        --CamRestoreJumpcut(GetGameCam())

        -- load the scene; streaming expects us to do it
        --ForceLoadingScreen(true)
        --loadScene(spawn.x, spawn.y, spawn.z)
        --ForceLoadingScreen(false)

        while not HasCollisionLoadedAroundEntity(ped) do
            Citizen.Wait(0)
        end

        ShutdownLoadingScreen()

        DoScreenFadeIn(500)

        while IsScreenFadingIn() do
            Citizen.Wait(0)
        end

        -- and unfreeze the player
        freezePlayer(PlayerId(), false)

        TriggerEvent('playerSpawned', spawn)

        if cb then
            cb(spawn)
        end

        spawnLock = false
    end)
end

-- automatic spawning monitor thread, too
local respawnForced
local diedAt

Citizen.CreateThread(function()
    -- main loop thing
    while true do
        Citizen.Wait(50)

        local playerPed = GetPlayerPed(-1)

        if playerPed and playerPed ~= -1 then
            -- check if we want to autospawn
            if autoSpawnEnabled then
                if NetworkIsPlayerActive(PlayerId()) then
                    if (diedAt and (GetTimeDifference(GetGameTimer(), diedAt) > 10000)) or respawnForced then
                        if autoSpawnCallback then
                            autoSpawnCallback()
                        else
                            spawnPlayer()
                        end

                        respawnForced = false
                    end
                end
            end

            if IsEntityDead(playerPed) then
                if not diedAt then
                    diedAt = GetGameTimer()
					death_event()
                end
				-- DisableAllControlActions(0)
				-- EnableControlAction(0, 47, true)
				-- EnableControlAction(0, 245, true)
				-- EnableControlAction(0, 38, true)
            else
                diedAt = nil
            end
        end
    end
end)

function forceRespawn()
    spawnLock = false
    respawnForced = true
end

AddEventHandler('onClientMapStart', function()
    setAutoSpawn(true)
    forceRespawn()
  --exports.spawnmanager:setAutoSpawn(true)
  --exports.spawnmanager:forceRespawn()
end)

end)



----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

local npcslimiter={}
npcslimiter.max=30
npcslimiter.current=0
npcslimiter.enablelimit=false
npcslimiter.basedonplayers=true
npcslimiter.totalmax=75

-- local vehslimiter={}
-- vehslimiter.max=5
-- vehslimiter.current=0
-- vehslimiter.enablelimit=true


local persistence={}
persistence.distance=90000.0
persistence.npcsdistance=50000.0

local weapon_slot={
hatchet="melee",
golfclub="melee",
switchblade="melee",
knife="melee",
dagger="melee",
bat="melee",
battleaxe="melee",
crowbar="melee",
flashlight="melee",
knuckle="melee",
machete="melee",
wrench="melee",
poolcue="melee",
molotov="throwable",
pipebomb="throwable",
grenade="throwable",
bzgas="throwable",
flaregun="secondary",
ball="throwable",
snspistol="secondary",
vintagepistol="secondary",
pistol="secondary",
combatpistol="secondary",
doubleaction="secondary",
revolver="secondary",
appistol="secondary",
heavypistol="secondary",
marksmanpistol="secondary",
pistol50="secondary",
pistol_mk2="secondary",
revolver_mk2="secondary",
pistol_mk2="secondary",
dbshotgun="secondary",
musket="primary",
assaultshotgun="primary",
bullpupshotgun="primary",
heavyshotgun="primary",
pumpshotgun="primary",
pumpshotgun_mk2="primary",
snspistol_mk2="primary",
sawnoffshotgun="primary",
autoshotgun="primary",
assaultsmg="primary",
combatmg="primary",
combatmg_mk2="primary",
combatpdw="primary",
gusenberg="primary",
machinepistol="primary",
mg="primary",
microsmg="secondary",
minismg="secondary",
smg="primary",
smg_mk2="secondary",
advancedrifle="primary",
assaultrifle="primary",
assaultrifle_mk2="primary",
bullpuprifle="primary",
bullpuprifle_mk2="primary",
carbinerifle="primary",
carbinerifle_mk2="primary",
compactrifle="primary",
specialcarbine="primary",
specialcarbine_mk2="primary",
heavysniper="primary",
sniperrifle="primary",
marksmanrifle="primary",
marksmanrifle_mk2="primary",
heavysniper_mk2="primary",
compactlauncher=1,
grenadelauncher="primary",
assaultshotgun="primary",
petrolcan="secondary",
bottle="melee",
rpg="primary",
flare="throwable",
minigun="primary",
extinguisher="secondary",
nightstick="melee",
proxmine="throwable",
stickybomb="throwable",
hammer="melee",
parachute="back",
}
local all_weapon_slots={
"primary","secondary","melee","throwable"
}

for k,v in pairs(weapon_slot) do
	weapon_slot[k]="singleslot"
end all_weapon_slots={"singleslot"}

local function get_weapon_slot(str)
	local fresult=string.find(str,"+")
	if fresult then
		return weapon_slot[string.sub(str,1,fresult-1)]
	else
		return weapon_slot[str]
	end
end

local weapons={
hatchet=1,
golfclub=1,
switchblade=1,
knife=1,
dagger=1,
bat=1,
battleaxe=1,
crowbar=1,
flashlight=1,
knuckle=1,
machete=1,
wrench=1,
poolcue=1,
molotov=1,
grenade=1,
pipebomb=1,
flaregun=1,
ball=1,
stickybomb=1,
snspistol=1,
vintagepistol=1,
pistol=1,
combatpistol=1,
doubleaction=1,
revolver=1,
appistol=1,
heavypistol=1,
marksmanpistol=1,
pistol50=1,
pistol_mk2=1,
revolver_mk2=1,
pistol_mk2=1,
dbshotgun=1,
musket=1,
assaultshotgun=1,
bullpupshotgun=1,
heavyshotgun=1,
pumpshotgun=1,
pumpshotgun_mk2=1,
snspistol_mk2=1,
sawnoffshotgun=1,
autoshotgun=1,
assaultsmg=1,
combatmg=1,
combatmg_mk2=1,
combatpdw=1,
gusenberg=1,
machinepistol=1,
mg=1,
microsmg=1,
minismg=1,
smg=1,
smg_mk2=1,
advancedrifle=1,
assaultrifle=1,
assaultrifle_mk2=1,
bullpuprifle=1,
bullpuprifle_mk2=1,
carbinerifle=1,
carbinerifle_mk2=1,
compactrifle=1,
specialcarbine=1,
specialcarbine_mk2=1,
heavysniper=1,
sniperrifle=1,
marksmanrifle=1,
marksmanrifle_mk2=1,
heavysniper_mk2=1,
compactlauncher=1,
grenadelauncher=1,
assaultshotgun=1,
petrolcan=1,
bottle=1,
rpg=1,
flare=1,
minigun=1,
extinguisher=1,
nightstick=1,
proxmine=1,
hammer=1,
parachute=1,
}
for k,v in pairs(weapons) do
	weapons[k]=GetHashKey("weapon_"..k)
end
weapons.parachute=GetHashKey("gadget_parachute")

local weapon_model_to_hash={}
for _,v in pairs(WEAPON) do
	weapon_model_to_hash[GetWeapontypeModel(v)]=v
end

local ammo_types={
ammo=218444191,
pistolammo=1950175060,
shotgunammo=-1878508229,
heavyrifleammo=1285032059,
flaregunammo=1173416293,
smgammo=1820140472,
mgammo=1788949567,
launchergrenade=1003267566,
grenade=1003688881,
molotov=1446246869,
pipebomb=357983224,
flare=1808594799,
proxmine=-1356724057,
ball=-6986138,
stickybomb=1411692055,
rocketammo=1742569970,
guidedammo=-1726673363,
vulcanammo=-1614428030,
}
local ammo_name={}
for k,v in pairs(ammo_types) do
	ammo_name[v]=k
end

local amounttodrop
local droppingitem=false
local droppingtext="Press E to drop the selected item. Use arrow keys to adjust the amount you want to drop. Press backspace or right mouse button to cancel."

local saving_enabled=true --don't touch, it means that hooks are not applied by default, that IS initialy true
local saving_buffer={}
local saving_kvp_read_functions={
    GetResourceKvpString=GetResourceKvpString,
    GetResourceKvpInt=GetResourceKvpInt,
    GetResourceKvpFloat=GetResourceKvpFloat,
}
local saving_kvp_mode={
    SetResourceKvp=SetResourceKvp,
    SetResourceKvpInt=SetResourceKvpInt,
    SetResourceKvpFloat=SetResourceKvpFloat,
    DeleteResourceKvp=DeleteResourceKvp,
}
local saving_things_to_remove={--cheap way to "delete" things from kvp
    inventory_total={v=0,f=saving_kvp_mode.SetResourceKvpInt,g=saving_kvp_read_functions.GetResourceKvpInt},
    inventory_current={v=0,f=saving_kvp_mode.SetResourceKvpInt,g=saving_kvp_read_functions.GetResourceKvpInt},
    --garage_1_model={v=0,f=saving_kvp_mode.SetResourceKvpInt,g=saving_kvp_read_functions.GetResourceKvpInt},
}
for k,_ in pairs(weapons) do
    saving_things_to_remove[k]={f=saving_kvp_mode.DeleteResourceKvp,g=saving_kvp_read_functions.GetResourceKvpInt}
end
for k,_ in pairs(ammo_types) do
    saving_things_to_remove[k]={f=saving_kvp_mode.DeleteResourceKvp,g=saving_kvp_read_functions.GetResourceKvpInt}
end
local saving_buf_mode={
    SetResourceKvp=function(key,value)
        saving_buffer[key]={v=value,f=saving_kvp_mode.SetResourceKvp}
    end,
    SetResourceKvpInt=function(key,value)
        saving_buffer[key]={v=value,f=saving_kvp_mode.SetResourceKvpInt}
    end,
    SetResourceKvpFloat=function(key,value)
        saving_buffer[key]={v=value,f=saving_kvp_mode.SetResourceKvpFloat}
    end,
    DeleteResourceKvp=function(key)
        saving_buffer[key]={f=saving_kvp_mode.DeleteResourceKvp}
    end,
    GetResourceKvpString=function(key)
        if saving_buffer[key]~=nil then
            return saving_buffer[key].v
        end
        return saving_kvp_read_functions.GetResourceKvpString(key)
    end,
    GetResourceKvpInt=function(key)
        if saving_buffer[key]~=nil then
            return saving_buffer[key].v or 0
        end
        return saving_kvp_read_functions.GetResourceKvpInt(key)
    end,
    GetResourceKvpFloat=function(key,value)
        if saving_buffer[key]~=nil then
            return saving_buffer[key].v or (.5-.5)
        end
        return saving_kvp_read_functions.GetResourceKvpFloat(key)
    end,
}
local function disable_kvp_saving()
    if saving_enabled then
        for key,t in pairs(saving_things_to_remove) do
            saving_buffer[key]={v=t.g(key),f=t.f}
            t.f(key,t.v)
        end
        for k,v in pairs(saving_buf_mode) do
            _G[k]=v
        end
        saving_enabled=false
    end
end
local function enable_kvp_saving()
    if not saving_enabled then
        for key,t in pairs(saving_buffer) do
            t.f(key,t.v)
            saving_buffer[key]=nil--not sure what is better way
        end
        --saving_buffer={}--not sure what is better way
        for k,v in pairs(saving_kvp_mode) do
            _G[k]=v
        end
        saving_enabled=true
    end
end

local disablehud=false
local disableradar=false
RegisterCommand("hud",function()
    disablehud=not disablehud
end,false)
RegisterCommand("radar",function()
    disableradar=not disableradar
    while disableradar do
        HideHudAndRadarThisFrame()
        Wait(0)
    end
end,false)

local function range(a,b,except)
    local ret={}
    if except~=nil then
        local blacklist={}
        if type(except)=="table" then
            for k,v in pairs(except) do
                blacklist[v]=true
            end
        else
            blacklist[except]=true
        end
        for i=a,b do
            if not blacklist[i] then
                table.insert(ret,i)
            end
        end
    else
        for i=a,b do
            table.insert(ret,i)
        end
    end
    return ret
end

local suits={ --need to substract 1 from var and tex --done
standard={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=1-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=range(1-1,13-1,{8-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=2-1,tex=range(1-1,16-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=1-1,tex=range(2-1,12-1,{7-1,10-1,11-1})}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
bandit={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=6-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=range(1-1,13-1,{8-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=4-1,tex=range(1-1,8-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=6-1,tex=range(1-1,3-1)}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
vigilante={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=9-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=range(1-1,13-1,{8-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=4-1,tex=range(1-1,16-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=39-1,tex=range(1-1,5-1)}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
hero={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=7-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=range(1-1,13-1,{8-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=4-1,tex=range(1-1,16-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=42-1,tex=range(1-1,4-1)}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
guerilla={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=1-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=range(1-1,13-1,{8-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=4-1,tex=range(1-1,8-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=64-1,tex=range(1-1,1-1)}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
renegade={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=6-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=range(1-1,13-1,{8-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=4-1,tex=range(1-1,8-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=239-1,tex=range(1-1,6-1,{3-1,4-1})}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
outlaw={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=12-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=range(1-1,13-1,{8-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=4-1,tex=range(1-1,8-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=44-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
trucker={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=4-1,tex=range(1-1,16-1)}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=4-1,tex=range(1-1,16-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=1-1,tex=range(2-1,5-1)}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=4-1,tex=range(1-1,16-1)}, --additional parts for torso
bodyarmor={[9]={var=4-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
business={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=11-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=11-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=4-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=5-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=4-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
ordinary={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=2-1,tex=range(1-1,16-1)}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=2-1,tex=range(1-1,16-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=1-1,tex=range(2-1,5-1)}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=8-1,tex=range(1-1,16-1)}, --additional parts for torso
bodyarmor={[9]={var=4-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
gang={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=8-1,tex=range(1-1,16-1)}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=2-1,tex=range(1-1,16-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=15-1,tex=range(1-1,16-1)}, --additional parts for torso
bodyarmor={[9]={var=7-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
marauder={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=21-1,tex=1-1}, --"torso" hands
[4]={var=10-1,tex=range(1-1,16-1,{5-1,6-1,9-1,16-1})}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=25-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=51-1,tex=range(1-1,5-1)}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
marauder_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=21-1,tex=1-1}, --"torso" hands
[4]={var=10-1,tex=range(1-1,16-1,{5-1,6-1,9-1,16-1})}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=25-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=51-1,tex=range(1-1,5-1)}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},--
},
camouflage={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=32-1,tex=5-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=54-1,tex=4-1}, --additional parts for torso
bodyarmor={[9]={var=8-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
camouflage_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=32-1,tex=5-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=54-1,tex=4-1}, --additional parts for torso
bodyarmor={[9]={var=8-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=39-1,tex=1-1}},
},
-- offdutysheriff={
-- [0]={var=1-1,tex=1-1}, --head
-- [1]={var=1-1,tex=1-1}, --"beard" masks
-- [2]={var=5-1,tex=range(2-1,6-1)}, --hair
-- [3]={var=2-1,tex=1-1}, --"torso" hands
-- [4]={var=8-1,tex=5-1}, --legs
-- [5]={var=1-1,tex=1-1}, --"hands" parachutes
-- [6]={var=12-1,tex=13-1}, --foot 
-- [7]={var=1-1,tex=1-1}, --additional 
-- [8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
-- [9]={var=0-1,tex=1-1}, --accesories 2 (armor)
-- [10]={var=0-1,tex=1-1}, --decals
-- [11]={var=218-1,tex=12-1}, --additional parts for torso
-- bodyarmor={[9]={var=14-1,tex=1-1}},
-- backpack={[5]={var=46-1,tex=1-1}},
-- --backpack={[5]={var=39-1,tex=1-1}},
-- },
offdutysheriff={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=7-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=64-1,tex={2-1,5-1}}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=218-1,tex={1-1,2-1}}, --additional parts for torso
bodyarmor={[9]={var=1-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
offdutysheriff_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=8-1,tex=5-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=12-1,tex=13-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=218-1,tex=12-1}, --additional parts for torso
bodyarmor={[9]={var=14-1,tex=1-1}},
backpack={[5]={var=39-1,tex=1-1}},
},
explorer={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=19-1,tex=1-1}, --"torso" hands
[4]={var=99-1,tex=range(1-1,5-1)}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=72-1,tex=range(1-1,5-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=254-1,tex=range(1-1,5-1)}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=33-1,tex=5-1}},
hood={[11]={var=252-1,tex=range(1-1,5-1)}},
same_texvar={4,6,11},
},
scavenger={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=19-1,tex=range(1-1,5-1)}, --"torso" hands
[4]={var=60-1,tex=range(1-1,10-1,{3-1,4-1,9-1})}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=76-1,tex=range(1-1,8-1)}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=69-1,tex=range(1-1,6-1)}, --additional parts for torso
bodyarmor={[9]={var=10-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=67-1,tex=1-1}},
hood={[11]={var=70-1,tex=range(1-1,6-1)}},
},
scavenger_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=19-1,tex=range(1-1,5-1)}, --"torso" hands
[4]={var=60-1,tex=range(1-1,10-1,{3-1,4-1,9-1})}, --legs
[5]={var=67-1,tex=1-1}, --"hands" parachutes
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=76-1,tex=range(1-1,8-1)}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=69-1,tex=range(1-1,6-1)}, --additional parts for torso
bodyarmor={[9]={var=10-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=10-1,tex=2-1}},
hood={[11]={var=70-1,tex=range(1-1,6-1)}},
},
mercenary={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=55-1,tex=1-1}, --"torso" hands
[4]={var=108-1,tex=2-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=85-1,tex=2-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=290-1,tex=11-1}, --additional parts for torso
bodyarmor={[9]={var=14-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=70-1,tex=7-1}},
},
banditgoon={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=6-1,tex={3-1,11-1}}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=13-1,tex=7-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=15-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=169-1,tex={1-1,2-1}}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=52-1,tex=1-1}},
},
banditgoon_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=6-1,tex={3-1,11-1}}, --legs
[5]={var=52-1,tex=1-1}, --"hands" parachutes
[6]={var=13-1,tex=7-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=15-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=169-1,tex={1-1,2-1}}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=52-1,tex=1-1}},
},
banditauthority={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=20-1,tex=1-1}, --"torso" hands
[4]={var=32-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=25-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=3-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=265-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=9-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=67-1,tex=1-1}},
},
dawn={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=166-1,tex=18-1}, --"torso" hands
[4]={var=99-1,tex=24-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=76-1,tex=26-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=249-1,tex=16-1}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=58-1,tex=10-1}},
},
dawn_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=166-1,tex=18-1}, --"torso" hands
[4]={var=99-1,tex=24-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=76-1,tex=26-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=249-1,tex=16-1}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=58-1,tex=10-1}},
},
banditauthority_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=20-1,tex=1-1}, --"torso" hands
[4]={var=32-1,tex=1-1}, --legs
[5]={var=67-1,tex=1-1}, --"hands" parachutes
[6]={var=25-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=3-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=265-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=9-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=67-1,tex=1-1}},
},
police={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=1-1,tex=1-1}, --"torso" hands
[4]={var=36-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=25-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=59-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=56-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=11-1,tex=2-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=67-1,tex=1-1}},
},
banditmercenary={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=55-1,tex=1-1}, --"torso" hands
[4]={var=108-1,tex=2-1}, --legs
[5]={var=1-1,tex=1-1}, --"hands" parachutes
[6]={var=85-1,tex=2-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=290-1,tex=12-1}, --additional parts for torso
bodyarmor={[9]={var=14-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
--backpack={[5]={var=70-1,tex=7-1}},
},
trash={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=76-1,tex=range(1-1,8-1)}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=58-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
-- pmc={
-- [0]={var=1-1,tex=1-1}, --head
-- [1]={var=1-1,tex=1-1}, --"beard" masks
-- [2]={var=5-1,tex=range(2-1,6-1)}, --hair
-- [3]={var=18-1,tex=range(1-1,5-1)}, --"torso" hands
-- [4]={var=1-1,tex=range(1-1,15-1,{8-1,12-1,14-1})}, --legs
-- [5]={var=1-1,tex=1-1}, --hands "parachutes"
-- [6]={var=26-1,tex=1-1}, --foot 
-- [7]={var=113-1,tex=1-1}, --additional 
-- [8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
-- [9]={var=17-1,tex=range(1-1,3-1)}, --accesories 2 (armor)
-- [10]={var=1-1,tex=1-1}, --decals
-- [11]={var=42-1,tex=range(1-1,4-1)}, --additional parts for torso
-- bodyarmor={[9]={var=17-1,tex=range(1-1,3-1)}},
-- --backpack={[5]={var=39-1,tex=1-1}},
-- backpack={[5]={var=46-1,tex=1-1}},
-- },
pmc={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=12-1,tex=1-1}, --"torso" hands
[4]={var=48-1,tex={1-1,2-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=64-1,tex=range(1-1,5-1)}, --foot 
[7]={var=113-1,tex=range(1-1,3-1)}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=17-1,tex=range(1-1,3-1)}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=96-1,tex=range(1-1,3-1)}, --additional parts for torso
bodyarmor={[9]={var=17-1,tex=range(1-1,3-1)}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
pmc_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=18-1,tex=range(1-1,5-1)}, --"torso" hands
[4]={var=1-1,tex=range(1-1,15-1,{8-1,12-1,14-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=26-1,tex=1-1}, --foot 
[7]={var=113-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=17-1,tex=range(1-1,3-1)}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=42-1,tex=range(1-1,4-1)}, --additional parts for torso
bodyarmor={[9]={var=17-1,tex=range(1-1,3-1)}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
combat_desert_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=18-1,tex=4-1}, --"torso" hands
[4]={var=47-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=16-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=99-1,tex=1-1}, --additional parts for torso
hat={var=40-1,tex=4-1},
noheadgear=true,
bodyarmor={[9]={var=16-1,tex=1-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
combat_green={
[0]={var=1-1,tex=1-1}, --head
[1]={var=29-1,tex=5-1}, --"beard" masks
[2]={var=1-1,tex=1-1}, --hair
[3]={var=18-1,tex=5-1}, --"torso" hands
[4]={var=47-1,tex=2-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=16-1,tex=2-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=99-1,tex=2-1}, --additional parts for torso
hat={var=40-1,tex=5-1},
noheadgear=true,
bodyarmor={[9]={var=16-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
combat_desert={
[0]={var=1-1,tex=1-1}, --head
[1]={var=29-1,tex=4-1}, --"beard" masks
[2]={var=1-1,tex=1-1}, --hair
[3]={var=18-1,tex=4-1}, --"torso" hands
[4]={var=47-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=16-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=99-1,tex=1-1}, --additional parts for torso
hat={var=40-1,tex=4-1},
noheadgear=true,
bodyarmor={[9]={var=16-1,tex=1-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
loner={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=4-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=19-1,tex=1-1}, --"torso" hands
[4]={var=1-1,tex=range(1-1,13-1,{3-1,4-1,6-1,8-1,11-1,6-1})}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=25-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=56-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=169-1,tex=range(1-1,3-1)}, --additional parts for torso
bodyarmor={[9]={var=14-1,tex=1-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
riot={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=111-1,tex=4-1}, --"torso" hands
[4]={var=34-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=25-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=59-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=54-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=11-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
riot_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=range(1-1,16-1),tex=range(2-1,6-1)}, --hair
[3]={var=111-1,tex=4-1}, --"torso" hands
[4]={var=34-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=25-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=59-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=11-1,tex=2-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=54-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=11-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
smugglerslight={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=6-1,tex=1-1}, --"torso" hands
[4]={var=93-1,tex={16-1,19-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=131-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=239-1,tex={4-1,6-1}}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
smugglers={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=16-1,tex=1-1}, --"torso" hands
[4]={var=34-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=131-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=248-1,tex={1-1,5-1,24-1}}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
smugglerslight_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=6-1,tex=1-1}, --"torso" hands
[4]={var=93-1,tex={16-1,19-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=131-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=239-1,tex={4-1,6-1}}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
smugglers_npc={
[0]={var=range(1-1,18-1,{3-1,4-1,15-1,16-1}),tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=16-1,tex=1-1}, --"torso" hands
[4]={var=34-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=131-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=248-1,tex={1-1,5-1,24-1}}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
gunrunner={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=5-1,tex=1-1}, --"torso" hands
[4]={var=70-1,tex={2-1,3-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=123-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=140-1,tex={1-1,4-1}}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
toughguy={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=23-1,tex={1-1,2-1}}, --"torso" hands
[4]={var=34-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=116-1,tex=4-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=71-1,tex={3-1,8-1,11-1,12-1}}, --additional parts for torso
bodyarmor={[9]={var=4-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
rookie={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=1-1,tex=1-1}, --"torso" hands
[4]={var=64-1,tex=1-1}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=62-1,tex={1-1,4-1}}, --foot 
[7]={var=126-1,tex=1-1}, --additional 
[8]={var=131-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=1-1,tex={3-1,5-1,6-1,12-1}}, --additional parts for torso
bodyarmor={[9]={var=13-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
breekiscavenger={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=2-1,tex=1-1}, --"torso" hands
[4]={var=98-1,tex={1-1,5-1,6-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=75-1,tex={1-1,3-1,4-1,8-1}}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=114-1,tex=2-1}, --additional parts for torso
bodyarmor={[9]={var=1-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
breekicombatoutfit={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=1-1,tex=1-1}, --"torso" hands
[4]={var=98-1,tex={1-1,5-1,6-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=range(1-1,16-1)}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=75-1,tex={1-1,3-1,4-1,8-1}}, --accesories 1 (parts of tshirts)
[9]={var=17-1,tex=3-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=114-1,tex={2-1}}, --additional parts for torso
bodyarmor={[9]={var=1-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
combatmarauder={
--marauder={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=16-1,tex=1-1}, --"torso" hands
[4]={var=104-1,tex={1-1,4-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=85-1,tex={1-1,2-1}}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=16-1,tex={1-1,3-1,4-1,8-1}}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=3-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=176-1,tex={1-1,2-1,3-1,4-1}}, --additional parts for torso
bodyarmor={[9]={var=10-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
mercexperimental={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=148-1,tex=10-1}, --"torso" hands
[4]={var=32-1,tex={2-1,3-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=28-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=127-1,tex=1-1}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=54-1,tex=2-1}, --additional parts for torso
bodyarmor={[9]={var=10-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
merclight={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
[3]={var=6-1,tex=1-1}, --"torso" hands
[4]={var=103-1,tex={2-1,7-1}}, --legs
[5]={var=1-1,tex=1-1}, --hands "parachutes"
[6]={var=26-1,tex=1-1}, --foot 
[7]={var=1-1,tex=1-1}, --additional 
[8]={var=132-1,tex={1-1,2-1}}, --accesories 1 (parts of tshirts)
[9]={var=1-1,tex=1-1}, --accesories 2 (armor)
[10]={var=1-1,tex=1-1}, --decals
[11]={var=16-1,tex=1-1}, --additional parts for torso
bodyarmor={[9]={var=1-1,tex=2-1}},
--backpack={[5]={var=39-1,tex=1-1}},
backpack={[5]={var=46-1,tex=1-1}},
},
}

local hats={
["cowboyhat"]={var=14-1,tex=8-1},
["camocap"]={var=7-1,tex=6-1},
["lowcap"]={var=121-1,tex=1-1,removehair=true},
["pmccap"]={var=59-1,tex=range(1-1,3-1)},
["riothelmet"]={var=126-1,tex=19-1},
["merctacticalhelmet"]={var=118-1,tex=18-1},
["blackopstacticalhelmet"]={var=120-1,tex=range(1-1,2-1)},
["maraudercombathelmet"]={var=113-1,tex={2-1,5-1,18-1}},
["specopscommsgear"]={var=20-1,tex=1-1},
["cheekiheavyhelmet"]={var=125-1,tex={1-1,4-1,17-1}},
}
local masks={
["gasmask"]={[1]={var=47-1,tex=1-1},blockglasses=true},
["halfmask"]={[1]={var=52-1,tex=1-1}},
["balaclava"]={[1]={var=53-1,tex=1-1}},
["tshirtmask"]={[1]={var=55-1,tex=range(1-1,11-1)},blockhat=true},
["roninmask"]={[1]={var=126-1,tex=1-1},removehair=true},
["tapemask"]={[1]={var=48-1,tex=range(1-1,4-1)},removehair=true},
["blackopstacticalhelmet"]={[1]={var=105-1,tex=26-1}},
["maraudercombathelmet"]={[1]={var=131-1,tex=1-1}},
["specopscommsgear"]={[1]={var=36-1,tex=1-1}},
["cheekiheavyhelmet"]={[1]={var=58-1,tex={1-1,2-1,8-1}}},
["smugglersgarb"]={[1]={var=115-1,tex={1-1,13-1,22-1}},removehair=true},
["smugglersshemagh"]={[1]={var=116-1,tex={1-1,7-1,12-1}},removehair=true},
}
local glasses={
["tacticalglasses"]={var=16-1,tex=range(1-1,11-1)},
}


local relationship_name={
[GetHashKey("SURVIVOR")]="Scavenger",
[GetHashKey("NEUTRAL")]="Survivor",
[GetHashKey("DAWN")]="Dawn",
[GetHashKey("GOVERNMENT")]="Government",
[GetHashKey("BANDIT")]="Marauder",
[GetHashKey("RAIDER")]="Raider",
[GetHashKey("MARAUDER")]="Bandit",
[GetHashKey("HERO")]="Hero",
[GetHashKey("VIGILANTE")]="Vigilante",
[GetHashKey("GUERILLA")]="Guerilla",
[GetHashKey("OUTLAW")]="Outlaw",
[GetHashKey("RENEGADE")]="Renegade",
[GetHashKey("MILITARY")]="Military",
[GetHashKey("SMUGGLERS")]="Smuggler",
[GetHashKey("MERC")]="Mercenary",

}
local relationship_names={
[0]="You are allied with this faction. You may use your weapons freely.",
[1]="You have a friendly relationship with this faction. You may use your weapons freely.",
[2]="You have a neutral relationship with this faction. Keep your weapons holstered or be fired upon.",
[3]="You have a neutral relationship with this faction. Keep your weapons holstered or be fired upon.",
[4]="You have a neutral relationship with this faction. Keep your weapons holstered or be fired upon.",
[5]="Your relationship with this faction is hostile. You will be attacked on sight.",
[GetHashKey("SURVIVOR")]="Scavengers",
[GetHashKey("NEUTRAL")]="Survivors",
[GetHashKey("DAWN")]="Dawn",
[GetHashKey("GOVERNMENT")]="Government",
[GetHashKey("BANDIT")]="Marauders",
[GetHashKey("RAIDER")]="Raiders",
[GetHashKey("MARAUDER")]="Bandits",
[GetHashKey("HERO")]="Heroes",
[GetHashKey("VIGILANTE")]="Vigilantes",
[GetHashKey("GUERILLA")]="Guerllas",
[GetHashKey("OUTLAW")]="Outlaws",
[GetHashKey("RENEGADE")]="Renegades",
[GetHashKey("MILITARY")]="Military",
[GetHashKey("SMUGGLERS")]="Smugglers",
[GetHashKey("MERC")]="Mercenaries",
}

local relationship_reputation_changes={}
relationship_reputation_changes.npc={
[GetHashKey("MARAUDER")]=1,
[GetHashKey("BANDIT")]=1,
[GetHashKey("SURVIVOR")]=-1,
[GetHashKey("NEUTRAL")]=-1,
[GetHashKey("SMUGGLERS")]=3,
[GetHashKey("GOVERNMENT")]=-3,
[GetHashKey("MERC")]=5,
[GetHashKey("MILITARY")]=-5,
}
relationship_reputation_changes.player={
[GetHashKey("RENEGADE")]=0,
[GetHashKey("MARAUDER")]=5,
[GetHashKey("NEUTRAL")]=-5,
[GetHashKey("OUTLAW")]=7,
[GetHashKey("VIGILANTE")]=-7,
[GetHashKey("GUERILLA")]=10,
[GetHashKey("HERO")]=-10,
[GetHashKey("BANDIT")]=10,
[GetHashKey("SURVIVOR")]=-10,
[GetHashKey("SMUGGLERS")]=15,
[GetHashKey("GOVERNMENT")]=-15,
[GetHashKey("MERC")]=25,
[GetHashKey("MILITARY")]=-25,
}

local relationship_requirements={
[GetHashKey("SURVIVOR")]={moreorless="more",howmuch=50},
[GetHashKey("BANDIT")]={moreorless="less",howmuch=-50},
[GetHashKey("GOVERNMENT")]={moreorless="more",howmuch=300},
[GetHashKey("DAWN")]={moreorless="more",howmuch=150},
}


-- for suitname,suit in pairs(suits) do
    -- for comp,params in pairs(suit) do
        -- if type(comp)=="number" then
            -- if type(params.var)=="number" then
                -- params.var=params.var-1
            -- else
                -- for k,v in pairs(params.var) do
                    -- params.var[k]=v-1
                -- end
            -- end
            -- if type(params.tex)=="number" then
                -- params.tex=params.tex-1
            -- else
                -- for k,v in pairs(params.tex) do
                    -- params.tex[k]=v-1
                -- end
            -- end
        -- elseif type(comp)=="string" then
            -- for com,par in pairs(params) do
                -- par.var=par.var-1
                -- par.tex=par.tex-1
            -- end
        -- end
    -- end
-- end
extraction={
{x=-1609.5236816406,y=5258.9194335938,z=3.9741017818451,r=2.0},
{x=2824.3920898438,y=-748.71466064453,z=1.5879430770874,r=2.0},
{x=-1803.7950439453,y=-1229.6433105469,z=1.5942938327789,r=2.0},
}

-- air
-- {x=1303.2777099609,y=4358.4536132813,z=-193.69143676758},
-- {x=980.90032958984,y=2330.0258789063,z=-195.55923461914},

extraction_spawns={
{x=-3132.7097167969,y=3715.3798828125,z=1.9997624158859,angle=218.88287353516},
{x=-923.96728515625,y=6674.509765625,z=1.789999961853,angle=224.63050842285},
{x=1961.4853515625,y=7054.9809570313,z=1.789999961853,angle=192.7882232666},
{x=3549.5229492188,y=5677.9975585938,z=1.789999961853,angle=111.76022338867},
{x=4157.2338867188,y=3343.8518066406,z=1.789999961853,angle=69.952743530273},
{x=3414.9748535156,y=300.43109130859,z=2.8899998664856,angle=73.988624572754},
{x=-3338.015625,y=592.30609130859,z=1.789999961853,angle=270.37200927734},
}


local npc_items_pricelist={
water=15,
pistolammo=70,
shotgunammo=50,
snspistol=150,
quest_bag=400,
quest_pouch=300,
quest_id=300,
quest_usb=300,
quest_harddrive=300,
quest_laptop=400,
quest_cellphone=300,
quest_docs=300,
quest_disc=300,
quest_gameconsole=400,
quest_medicalrecords=300,
quest_box=400,
quest_keys=300,
}

local survivor_hash,bandit_hash,government_hash,raider_hash,
neutral_hash,dawn_hash,marauder_hash,military_hash,merc_hash,
hero_hash,vigilante_hash,guerilla_hash,outlaw_hash,renegade_hash,
smugglers_hash


local localization={
cruiser="Cruiser Bicycle",
scorcher="Scorcher Mountain Bicycle",
ratbike="Ratbike Motorcycle",
cerberus="Cerberus Truck",
scarab="Scarab ATV",
a_m_y_hiker_01="Male Hiker",
a_f_y_hiker_01="Female Hiker",
pipebomb="Pipe bomb",
molotov="Molotov Cocktail",
s_m_y_cop_01="Male Cop",
s_f_y_cop_01="Female Cop",
dbshotgun="Double Barrel Shotgun",
GBurrito2="Dawn van",
pistol="Pistol",
pumpshotgun="Pump shotgun",
impaler2="Impaler",
imperator2="Imperator",
dominator4="Dominator",
}

local string_registered_labels={}
local string_workarounds=0
if true then --disabled
    local function cache_format_string(formatstring)
        if formatstring==nil then formatstring="nil" end
        local index=string_registered_labels[formatstring]
        if index==nil then
            local label=string.format("WRND%X",string_workarounds)
            string_registered_labels[formatstring]=string_workarounds
            string_workarounds=string_workarounds+1
            AddTextEntry(label,formatstring)
            return label
        else
            return string.format("WRND%X",index)
        end
    end
    local function add_text_function_arguments(first,args)
        local i=first
        while args[i]~=nil do
            local type_of_arg=type(args[i])
            if type_of_arg=='string' then
                --AddTextComponentSubstringPlayerName(args[i])
                AddTextComponentSubstringTextLabel(cache_format_string(args[i]))
            elseif type_of_arg=='number' then
                type_of_arg=math.type(args[i])
                if type_of_arg=="float" then
                    AddTextComponentFloat(args[i],3)
                elseif type_of_arg=="integer" then
                    AddTextComponentInteger(args[i])
                else
                    AddTextComponentSubstringPlayerName(type_of_arg)
                end
            else
                AddTextComponentSubstringPlayerName(type_of_arg)
            end
            i=i+1
        end
    end
    SetBlipName=function(...)
        local args={...}
        BeginTextCommandSetBlipName(cache_format_string(args[2]))
        add_text_function_arguments(3,args)
        EndTextCommandSetBlipName(args[1])
    end
    SimpleNotification=function(...)
        local args={...}
        SetNotificationTextEntry(cache_format_string(args[1]))
        add_text_function_arguments(2,args)
        DrawNotification(false,false)
    end
    TextCommandPrint=function(...)
        local args={...}
        BeginTextCommandPrint(cache_format_string(args[3]))
        add_text_function_arguments(4,args)
        EndTextCommandPrint(args[1], args[2])
    end
    -- BeginTextCommandSetBlipName("STRING")
    -- AddTextComponentString("Trailer");
    -- EndTextCommandSetBlipName(blip)
    
    -- AddTextEntry('DOLLAR_TEXT', '$~1~') -- call once
    -- BeginTextCommandDrawText('DOLLAR_TEXT')
    -- AddTextComponentInteger(5)
    -- EndTextCommandDrawText(0.0, 0.0)
    
    TextCommandDisplayText=function(...)
        local args={...}
        --if args[4]==nil then
        --    BeginTextCommandDisplayText("STRING")
        --    AddTextComponentSubstringPlayerName(args[3])
        --else
            BeginTextCommandDisplayText(cache_format_string(args[3]))
            add_text_function_arguments(4,args)
        --end
        EndTextCommandDisplayText(args[1],args[2])
    end
    SimpleHelpText=function(...)
        local args={...}
        BeginTextCommandDisplayHelp(cache_format_string(args[1]))
        add_text_function_arguments(2,args)
        EndTextCommandDisplayHelp(0,0,1,-1)
    end
    
    function WriteText(font,text,scale,r,g,b,a,posx,posy)
        SetTextOutline()
        SetTextFont(font)
        SetTextScale(scale, scale)
        SetTextColour(r,g,b,a)
        if text==nil then
            TextCommandDisplayText(posx,posy,"~r~NULL")
        elseif type(text)=='table' then
            TextCommandDisplayText(posx,posy,table.unpack(text))
        elseif localization[text]~=nil then
            TextCommandDisplayText(posx,posy,localization[text])
        else
            TextCommandDisplayText(posx,posy,text)
        end
    end
    function WriteTextNoOutline(font,text,scale,r,g,b,a,posx,posy)
        SetTextFont(font)
        SetTextScale(scale, scale)
        SetTextColour(r,g,b,a)
        if type(text)=='table' then
            TextCommandDisplayText(posx,posy,table.unpack(text))
        elseif localization[text]~=nil then
            TextCommandDisplayText(posx,posy,localization[text])
        else
            TextCommandDisplayText(posx,posy,text)
        end
    end
end

-- local hint_y=0.32
-- local hint_frame=GetFrameCount()
-- local hint_table={}
-- local hint_minpriority=1
-- local hint_maxpriority=1
-- local function WriteHint(priority,text)
    -- if not disablehud then
		-- if priority and text then
			-- local frame=GetFrameCount()
			-- if hint_frame~=frame then
				-- hint_frame=frame
				-- hint_y=0.32
				-- for p=hint_minpriority,hint_maxpriority do
					-- local t=hint_table[p]
					-- if t~=nil then
						-- for n,l in pairs(t) do
							-- WriteText(4,l,0.4,255,255,255,255,0.005,hint_y) hint_y=hint_y+0.025
							-- t[n]=nil
						-- end
						-- hint_table[p]=nil
					-- end
				-- end
			-- end
			-- if hint_minpriority>priority then
				-- hint_minpriority=priority
			-- end
			-- if hint_maxpriority<priority then
				-- hint_maxpriority=priority
			-- end
			-- if hint_table[priority]==nil then
				-- hint_table[priority]={}
			-- end
			-- table.insert(hint_table[priority],text)
		-- else
			-- WriteText(4,"~r~ ERROR! ~s~Priority not set",0.4,255,255,255,255,0.005,hint_y) hint_y=hint_y+0.025
		-- end
    -- end
-- end

local hint_y=0.32
local hintframe=GetFrameCount()
local hinttable={}
local function WriteHint(priority,text)
    if not disablehud then
		if priority and text then
			local frame=GetFrameCount()
			if hintframe~=frame then
				hintframe=frame
				hint_y=0.32
				for p,t in pairs(hinttable) do
					for n,l in pairs(t) do
						WriteText(4,l,0.4,255,255,255,255,0.005,hint_y) hint_y=hint_y+0.025
						t[n]=nil
					end
					hinttable[p]=nil
				end
			end
			if hinttable[priority]==nil then
				hinttable[priority]={}
			end
			table.insert(hinttable[priority],text)
		else
			WriteText(4,"~r~ ERROR! ~s~Priority not set",0.4,255,255,255,255,0.005,hint_y) hint_y=hint_y+0.025
		end
    end
end


Citizen.CreateThread(function()
	local help_menu=false
	local maxpages=8
    while true do Wait(0)
		if IsControlJustPressed(0,208) then
			help_menu=1
		elseif IsControlJustPressed(0,177) then
			help_menu=false
		end
		if help_menu then
			if IsControlJustPressed(0,173) or IsControlJustPressed(0,174) then --down
				help_menu=help_menu-1
			elseif IsControlJustPressed(0,172) or IsControlJustPressed(0,175) then --up
				help_menu=help_menu+1
			end
			if help_menu<1 then help_menu=1 elseif help_menu>maxpages then help_menu=maxpages end
			WriteHint(4379,messages.press_to_close_helpmenu)
			WriteHint(4379,messages.press_to_turn_pages)
			DrawSprite("lsm",tostring("Page-"..help_menu),.35,.525,0.5*(9/16),0.67,0.0,255,255,255,255)
		else
			WriteHint(4379,messages.press_to_open_helpmenu)
		end
	end
end)

local signals={}

-- local function WriteText(font,text,scale,r,g,b,a,posx,posy)
    -- SetTextOutline()
    -- SetTextFont(font)
    -- SetTextScale(scale, scale)
    -- SetTextColour(r,g,b,a)
    -- SetTextEntry("STRING")
    -- if localization[text]~=nil then text=localization[text] end
    -- AddTextComponentString(text)
    -- EndTextCommandDisplayText(posx,posy)
-- end

local function WriteNotification(notif_string)
    SetNotificationTextEntry("STRING");
    AddTextComponentString(notif_string)
    DrawNotification(false, false);
end


local no_engine_parts=400 --minimal lootable engine health

local player={}
player.health=100
player.blood=100
player.hydration=100
player.saturation=100
player.drunk=0
player.in_safe_zone=false
player.bodyarmor=false
player.backpack=false
player.mask=nil
player.hat=nil
player.glasses=nil
player.face={}
player.face.face1=faceid
player.face.face2=faceid2
player.face.skin1=skinid
player.face.skin2=skinid2
player.face.mixshape=math.random(0,66)*0.01
player.face.mixskin=math.random(0,100)*0.01

player.face.hair=math.random(0,16)
player.face.haircolor=math.random(1,58)

player.face.facialhair=math.random(-18,18)
player.face.eyebrows=math.random(1,33)
player.face.facialhairopacity=math.random(0,100)*0.01

player.face.ageing=math.random(-10,14)
player.face.ageingopacity=math.random(0,100)*0.01
player.face.sundamage=math.random(-10,10)

player.brasscatcher=false
player.radio=false
player.bleeding=0
player.reputation=GetResourceKvpInt("reputation") or 40
player.faction=GetResourceKvpInt("player_faction") or nil
print("loaded player faction "..player.faction or "nil")
player.standardweight=35.0
player.maxweight=35.0
player.weight=0.0
player.storageweight=100.0

local function change_reputation(howmuch)
    saving_kvp_mode.SetResourceKvpInt("reputation",player.reputation+howmuch)
    player.reputation=player.reputation+howmuch
end

local faction_reputation_requirements={
	[GetHashKey("GUERILLA")]=-101,
	[GetHashKey("OUTLAW")]=-90,
	[GetHashKey("MARAUDER")]=-65,
	[GetHashKey("RENEGADE")]=-25,
	[GetHashKey("NEUTRAL")]=25,
	[GetHashKey("VIGILANTE")]=65,
	[GetHashKey("HERO")]=90,
}

local function return_player_standard_outfit()
	local rep=player.reputation
	if rep==nil then
		return "standard"
	elseif rep<faction_reputation_requirements[GetHashKey("OUTLAW")] then
		return "guerilla"
	elseif rep<faction_reputation_requirements[GetHashKey("MARAUDER")] then
		return "outlaw"
	elseif rep<faction_reputation_requirements[GetHashKey("RENEGADE")] then
		return "bandit"
	elseif rep<faction_reputation_requirements[GetHashKey("NEUTRAL")] then
		return "renegade"
	elseif rep<faction_reputation_requirements[GetHashKey("VIGILANTE")] then
		return "standard"
	elseif rep<faction_reputation_requirements[GetHashKey("HERO")] then
		return "vigilante"
	else
		return "hero"
	end
end
player.suit=return_player_standard_outfit()

-- local function SwitchFaction(rel)
	-- local myped=PlayerPedId()
	-- SetPedRelationshipGroupHash(myped,GetHashKey(rel))
-- end



local weaponsarray={
    raiders={-- 1 raiders
    "dagger","knife","machete","crowbar","hatchet","bat","poolcue","switchblade","poolcue","knuckle",
    "dagger","knife","machete","crowbar","hatchet","bat","poolcue","switchblade","poolcue","knuckle",
    "dagger","knife","machete","crowbar","hatchet","bat","poolcue","switchblade","poolcue","knuckle",
    "dagger","knife","machete","crowbar","hatchet","bat","poolcue","switchblade","poolcue","knuckle",
    "dagger","knife","machete","crowbar","hatchet","bat","flaregun","poolcue","switchblade","poolcue","knuckle",
    "pistol","snspistol","vintagepistol","combatpistol",
    "dbshotgun","doubleaction","revolver","machinepistol",
    "musket"},
    bandit={-- 
    "pistol","snspistol","vintagepistol","combatpistol",
    "dbshotgun","compactrifle","doubleaction","revolver","machinepistol",
    "musket"},
    survivor={-- 
    "pistol","snspistol","vintagepistol","combatpistol",
    "dbshotgun","doubleaction","revolver","machinepistol",
    "musket"},
    government={-- 
    "pistol","pumpshotgun","smg","carbinerifle"},
    military={-- 2 military
    "carbinerifle","pistol","pumpshotgun","smg","sniperrifle"
    },
    mercenaries={-- 4 mercenaries
    "carbinerifle_mk2","pistol_mk2","assaultrifle_mk2","marksmanrifle_mk2","smg_mk2"
    },
}
local modelgroups={
    military={-- 2 military
    GetHashKey("s_m_y_armymech_01"),
    GetHashKey("s_m_m_marine_01"),
    GetHashKey("s_m_m_marine_02"),
    GetHashKey("s_m_y_marine_01"),
    GetHashKey("s_m_y_marine_02"),
    GetHashKey("s_m_y_marine_03"),
    },
    mercenaries={-- 4 mercenaries
    GetHashKey("s_m_y_blackops_01"),
    GetHashKey("s_m_y_blackops_02"),
    GetHashKey("s_m_y_blackops_03"),
    },
    survivor={-- 5
    1885233650,
    },
    government={-- 3
    1885233650,
    },
    bandit={-- 5
    1885233650,
    },
}

local function GetBlipFromFaction(faction)
	if faction==GetHashKey("BANDIT") then
		return 79
	elseif faction==GetHashKey("SURVIVOR") then
		return 77
	elseif faction==GetHashKey("GOVERNMENT") then
		return 84
	elseif faction==GetHashKey("MILITARY") then
		return 90
	elseif faction==GetHashKey("MERC") then
		return 89
	elseif faction==GetHashKey("SMUGGLERS") then
		return 96
	else
		return nil
	end
end

local raids={}
Citizen.CreateThread(function()

    --local blipcolors={military=2,mercenaries=4,raiders=1}
    local types={
        [1]="bandit",
        [2]="military",
        [3]="government",
        [4]="mercenaries",
        [5]="survivor",
    }

    local relationships={
        [1]=GetHashKey("BANDIT"),-- 1 raiders
        [2]=GetHashKey("MILITARY"),-- 2 military
        [3]=GetHashKey("GOVERNMENT"),-- 3 gov
        [4]=GetHashKey("MERC"),-- 4 mercenaries
        [5]=GetHashKey("SURVIVOR"),-- 
    }
    RegisterNetEvent("raid")
    AddEventHandler("raid",function(k,x,y,r,t,maxlives,lives)
        --r=r+0.5
        --print("raid "..k,x,y,r,t)
        local v=raids[k]
        if v==nil then
            if t==nil then
                raids[k]={x=x,y=y,r=r}
            else
                if modelgroups[types[t]]~=nil or relationships[t]~=nil then
                    raids[k]={x=x,y=y,r=r,t=t,guard=true,models=modelgroups[types[t]],relationship=relationships[t],weapons=weaponsarray[types[t]],maxlives=maxlives,lives=lives}
                    print("raid"..k.." r="..tostring(raids[k].r or "nil").." t="..tostring(raids[k].t or "nil").." rel="..tostring(raids[k].relationship or "nil").." models="..tostring(raids[k].models or "nil").." weapons="..tostring(raids[k].weapons or "nil"))
                else
                    raids[k]={x=x,y=y,r=r,t=t}
                end
            end
        else
            if x~=nil then
                -- if t<=5 and t>=1 then
                    -- local success,nodepos=GetClosestMajorVehicleNode(x, y, 0.0, 3.0, 0)
                    -- if success then
                        -- x=nodepos.x
                        -- y=nodepos.y
                    -- end
                -- end
                v.x=x
                v.y=y
                v.r=r
                v.maxlives=maxlives
                v.lives=lives
                if v.blip==nil then 
                    if v.t==72 then
                        if v.blipadditional==nil then
                            v.blipadditional=AddBlipForRadius(x,y,0,r)
                            SetBlipAlpha(v.blipadditional,100)
                            SetBlipColour(v.blipadditional,1)
                        end
                        v.blip=AddBlipForCoord(x,y,0)
                        --SetBlipAlpha(v.blip,255)
                        SetBlipDisplay(v.blip,3)
                        SetBlipSprite(v.blip,80)
                        SetBlipName(v.blip,"Radiation Zone")
                        SetBlipScale(v.blip,1.5)
                        --SetBlipColour(v.blip,t)
                    else
                        v.blip=AddBlipForCoord(x,y,0)
                        SetBlipAsShortRange(v.blip,true)
                        SetBlipDisplay(v.blip,2)
                        if v.relationship==GetHashKey("SURVIVOR") then
							SetBlipDisplay(v.blip,5)
                            SetBlipSprite(v.blip,77)
                            --SetBlipName(v.blip,"Survivor Scavenging Party")
                        elseif v.relationship==GetHashKey("BANDIT") then
							SetBlipDisplay(v.blip,5)
                            SetBlipSprite(v.blip,79)
                            --SetBlipName(v.blip,"Marauder Death Squad")
                        elseif v.relationship==GetHashKey("GOVERNMENT") then
							SetBlipDisplay(v.blip,5)
                            SetBlipSprite(v.blip,84)
                            --SetBlipName(v.blip,"Government Peacekeeper Patrol")
                        elseif v.relationship==GetHashKey("MILITARY") then
							SetBlipDisplay(v.blip,5)
							SetBlipSprite(v.blip,90)
                        elseif v.relationship==GetHashKey("MERC") then
							SetBlipDisplay(v.blip,5)
							SetBlipSprite(v.blip,89)
                        end
                        SetBlipScale(v.blip,1.0)
                        SetBlipColour(v.blip,t)
                    end
                else
                    SetBlipCoords(v.blip,x,y,0)
                    if v.blipadditional~=nil then
                        SetBlipCoords(v.blipadditional,x,y,0)
                    end
                end
            else
                if v.blip~=nil then
                    RemoveBlip(v.blip)
                end
                raids[k]=nil
            end
        end
    end)
    local prevtime=0
    while true do Wait(0)
        for k,v in pairs(raids) do
            if v.t~=nil and v.r~=nil then
                if v.t==72 then
                    if player.mask==nil or player.mask~="gasmask" then
                        local ped=PlayerPedId()
                        local pos=GetEntityCoords(ped)
                        local dx,dy=pos.x-v.x,pos.y-v.y
                        if dx*dx+dy*dy<v.r*v.r then
                            local currenttime=GetGameTimer()
                            WriteHint(1,messages.encountered_radioactive_fallout)
                            local currenttimeprevtime=currenttime~prevtime
                            currenttimeprevtime=currenttimeprevtime&-2048
                            if currenttimeprevtime~=0 then
                                prevtime=currenttime
                                SetEntityHealth(ped,GetEntityHealth(ped)-1)
                            end
                        end
                    end
                else
                end
            end
            --WriteHint(1,{"Zone: Rel=~a~, Name=~a~, Models=~a~, Type=~a~, Lives: ~1~/~1~",tostring(v.relationship),tostring(v.name),tostring(v.models),tostring(v.t),v.lives,v.maxlives})
        end
    end
end)

--local vehiclesave={}

local inv_big_x=0.072 local inv_big_y=0.1279999
local inv_sml_x=0.0333333334 local inv_sml_y=0.0592592592
local inv_size_x=0.0576 local inv_size_y=0.1023999

local inv_new={}
      inv_new.item_scl_x=0.036
      inv_new.item_scl_y=0.063

            
local current_date=GetResourceKvpInt("date")
local lastprovisiontime=GetResourceKvpInt("provisiontaken")
local respawn_time=720 --two real days

local looted_array={}

local normal_crafts={
	{"flashlight_small",1,
        {"flashlight",1,
		"electronicscrap",1,
		},
    },
	{"flashlight_large",1,
        {"flashlight",1,
		"industrialelectronicscrap",1,
		},
    },
	{"gasoline",10,
        {"aircraftfuel",5,
		"chemicals",1,
		},
    },
	{"bodyarmor",1,
        {"milspecfabrics",2,
		"industrialfabrics",2,
		},
    },
    {"armorplate",1,
        {"milspecmetal",2,
		"industrialplastic",2,
		},
    },
    {"bandage",1,
        {"rags",2,
		"alcohol",1,
		},
    },
    {"medkit",1,
        {"bandage",2,
		"painkillers",1,
		},
    },
    {"pistolammo",65,
        {"leadscrap",1,
		"gunpowder",1,
		"scrapmetal",1,
		},
    },
    {"shotgunammo",35,
        {"leadscrap",1,
		"gunpowder",1,
		"scrapmetal",2,
		},
    },
    {"smgammo",120,
        {"leadscrap",1,
		"gunpowder",1,
		"scrapmetal",1,
		},
    },
    {"ammo",60,
        {"leadscrap",1,
		"gunpowder",1,
		"milspecmetal",1,
		},
    },
    {"mgammo",60,
        {"leadscrap",1,
		"gunpowder",1,
		"milspecmetal",1,
		"industrialplastic",1,
		},
    },
    {"heavyrifleammo",30,
        {"leadscrap",2,
		"gunpowder",1,
		"milspecmetal",1,
		},
    },
    {"rocket",1,
        {"gunpowder",1,
		"milspecelectronicscrap",1,
		"industrialplastic",1,
		},
    },
    {"grenade",1,
        {"milspecmetal",1,
		"gunpowder",1,
		"industrialelectronicscrap",1,
		},
    },
    {"launchergrenade",1,
        {"gunpowder",1,
		"gunpowder",1,
		"milspecmetal",1,
		},
    },
    {"proxmine",1,
        {"gunpowder",1,
		"milspecelectronicscrap",1,
		"industrialscrapmetal",1,
		},
    },
    {"clothes_marauder",1,
        {"industrialscrapmetal",4,
		"fabrics",6,
		"industrialfabrics",4,
		"rags",8,
		},
    },
    {"molotov",1,
        {"rags",1,
		"alcohol",1,
		"gasoline",1,
		},
    },
    {"pipebomb",2,
        {"industrialplastic",1,
		"scrapmetal",3,
		"gunpowder",1,
		"industrialelectronicscrap",1,
		},
    },
    {"level3plates",1,
        {"milspecmetal",2,
		"industrialplastic",1,
		},
    },
    {"bzgas",1,
        {"industrialscrapmetal",1,
		"chemicals",1,
		},
    },
    {"clothes_loner",1,
        {"industrialfabrics",1,
		"scrapfabrics",4,
		"rags",6,
		},
    },
    {"duffelbag",1,
        {"milspecfabrics",1,
		"scrapfabrics",5,
		"industrialfabrics",10,
		},
    },
    {"flaregun",1,
        {"industrialscrapmetal",3,
		"industrialplastic",2,
		},
    },
    {"flaregunammo",10,
        {"gunpowder",1,
		"industrialplastic",1,
		"scrapplastic",10,
		"scrapmetal",2,
		},
    },
    {"tshirtmask",1,
        {"rags",5},
    },
    -- {"molotov",1,
        -- {"gasoline",1,
        -- "alcohol",1,
        -- "rags",1},
    -- },
    -- {"pipebomb",1,
        -- {"engineparts",1,
        -- "chemicals",1,
        -- "scrapmetal",1},
    -- },
    -- {"proxmine",1,
        -- {"engineparts",1,
        -- "chemicals",3,
        -- "scrapmetal",2,
        -- "scrapplastic",2},
    -- },
    -- {"mgammo",50,
        -- {"ammo",50,
        -- "scrapplastic",1},
    -- },
    -- {"flare",3,
        -- {"chemicals",1,
        -- "scrapplastic",1},
    -- },
    -- {"flaregun",1,
        -- {"scrapplastic",1,
        -- "scrapmetal",1},
    -- },
    -- {"flaregunammo",5,
        -- {"chemicals",1,
        -- "gunpowder",1,
        -- "scrapplastic",1},
    -- },
    -- {"bandage",1,
        -- {"alcohol",1,
        -- "rags",2},
    -- },
}

if true then
	local duplicates={}
	for k,v in pairs(normal_crafts) do
		if duplicates[v[1]] then
			print("duplicate_blueprint "..v[1])
		else
			duplicates[v[1]]=true
		end
	end
end


local dawn_crafts={
    {"tshirtmask",1,
        {"rags",5},
    },
    {"molotov",1,
        {"gasoline",1,
        "alcohol",1,
        "rags",1},
    },
    {"pipebomb",1,
        {"engineparts",1,
        "chemicals",1,
        "scrapmetal",1},
    },
    {"proxmine",1,
        {"engineparts",1,
        "chemicals",3,
        "scrapmetal",2,
        "scrapplastic",2},
    },
    {"mgammo",50,
        {"ammo",50,
        "scrapplastic",1},
    },
    {"ammo",30,
        {"riflecasings",30,
        "gunpowder",2,
        "scrapmetal",1},
    },
    {"pistolammo",50,
        {"casings",50,
        "gunpowder",1,
        "scrapmetal",1},
    },
    {"shotgunammo",20,
        {"scrapplastic",10,
        "gunpowder",3,
        "scrapmetal",1},
    },
    {"heavyrifleammo",20,
        {"riflecasings",20,
        "gunpowder",5,
        "scrapmetal",1},
    },
}

for _,v in pairs(weaponsarray) do
    for i,name in pairs(v) do
        v[i]=GetHashKey("weapon_"..name)
    end
end

local safezones={

--[[
    {x=1986.5546875,y=3049.6391601563,z=47.215106964111,r=100.0,blip=93,color=1,
    models={1885233650},
    name="~r~Yellow Jack~s~",
    tradespace=3,
    trade={
        {"alcohol",1,"cash",15},
        {"juice",1,"cash",20},
        {"food",1,"cash",25},
        
        {"cash",20,"cigarettes",1},
        {"cash",50,"pistolammo",30},
        {"cash",35,"gunpowder",1},
        {"cash",10,"soda",1},
        {"cash",10,"juice",1},
    },
    questpos={x=1982.9342041016,y=3026.30859375,z=47.977756500244},
    tradepos={x=1985.3439941406,y=3048.78125,z=47.215045928955},
    weapons={"dagger","knife","machete","crowbar","hatchet","bat","pistol","snspistol","vintagepistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    relationship="BANDIT"},--yellow jack


    {x=913.80059814453,y=-1699.5369873047,z=51.125102996826,r=15.0,blip=140,color=36,
    models={1885233650},--{275618457},
    name="~y~Polak's hideout~s~",
    friends=true,
    trade={
        {"cash",75,"weed",1},
    },
    tradepos={x=914.97869873047,y=-1702.4061279297,z=51.258224487305},
    weapons={"dagger","knife","machete","crowbar","hatchet","bat","pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    relationship="SURVIVOR"},--Pookys
    
    {x=975.88543701172,y=-119.29508972168,z=74.220664978027,r=50.0,blip=495,color=1,
    --models={275618457},
    models={1885233650},
    name="~r~Lost M.C.~s~",
    tradespace=2,
    trade={
        {"gasoline",1,"cash",15},
        {"bandage",1,"cash",20},
        
        {"cash",20,"cigarettes",1},
        {"cash",50,"pistolammo",30},
        {"cash",35,"gunpowder",1},
        {"cash",10,"soda",1},
        {"cash",10,"juice",1},
        {"cash",20,"alcohol",1},
    },
    questpos={x=1005.7758789063,y=-114.66290283203,z=73.973709106445},
    tradepos={x=978.20086669922,y=-101.90658569336,z=74.845115661621},
    craftpos={x=985.07043457031,y=-125.30889892578,z=73.930976867676},
    crafts=normal_crafts,
    weapons={"dagger","knife","machete","crowbar","hatchet","bat","pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},    
    garagepos={x=971.41748046875,y=-114.88080596924,z=74.353141784668,angle=228.43922424316},
    vehpos={x=973.37133789063,y=-130.03402709961,z=74.218101501465,angle=143.63526916504},
    vehshop={
        {"ratbike",
            {"cash",1000,
            "engineparts",5,
            "scrapmetal",500},
        },
    },
    relationship="BANDIT"},--Lost MC
    
    {x=2212.3063964844,y=5600.5561523438,z=53.88920211792,r=150.0,blip=140,color=1,
    models={1885233650},--{275618457},
    name="~r~Weed Farm~s~",
    trade={
        {"cash",20,"cigarettes",1},
        {"cash",50,"pistolammo",30},
        {"cash",35,"gunpowder",1},
        {"cash",10,"soda",1},
        {"cash",10,"juice",1},
        {"cash",20,"alcohol",1},
        {"cash",10,"food",1},
        {"cash",45,"chemicals",1},
    },
    questpos={x=2221.8840332031,y=5614.6821289063,z=54.9016456604},
    tradepos={x=2224.767578125,y=5604.6811523438,z=54.9225730896},
    craftpos={x=2196.4743652344,y=5596.7768554688,z=53.784450531006},
    crafts=normal_crafts,
    weapons={"dagger","knife","machete","crowbar","hatchet","bat","pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},    
    garagepos={x=2196.2426757813,y=5607.2358398438,z=53.513969421387,angle=349.04583740234},
    relationship="BANDIT"},--weed farm
]]
    --Altruists camp
    {x=-1096.5206298828,y=4914.2548828125,z=215.85502624512,r=125.0,blip=85,color=2,
    models={1885233650},--{-12678997,1694362237,-1105135100},--,1939545845
	border={
		{
			{x=-1043.67,y=4918.80,z=208.30},
			{x=-1041.50,y=4934.52,z=206.56},
			{x=-1048.74,y=4951.33,z=208.97},
			{x=-1060.97,y=4973.48,z=206.63},
			{x=-1083.72,y=4976.52,z=207.31},
			{x=-1146.46,y=4970.70,z=220.31},
			{x=-1181.24,y=4928.51,z=223.10},
			{x=-1180.33,y=4893.23,z=212.65},
			{x=-1167.69,y=4881.50,z=212.35},
			{x=-1102.37,y=4852.55,z=217.09},
			{x=-1088.89,y=4873.59,z=217.37},
			{x=-1039.45,y=4905.33,z=208.78},
		},
	},
	storageweight=100.0,
    name="Scavenger Settlement~s~",
	extraction={x=-1111.5900878906,y=4937.0,z=218.38917541504,r=3.0},
    friends=true,
	tradelistname="survivors",
    tradespace=5,
    trade={
        -- {"clothes_scavenger",1,"cash",750},
        -- {"clothes_loner",1,"cash",1200},
        -- {"clothes_breekiscavenger",1,"cash",1500},
        -- {"clothes_explorer",1,"cash",4000},
        -- {"cheekiheavyhelmet",1,"cash",1500},
        -- {"balaclava",1,"cash",100},
        -- {"gasmask",1,"weed",2},
        -- {"duffelbag",1,"cash",1000},
        -- {"flaregun",1,"cash",250},
        -- {"snspistol_mk2",1,"cash",650},
        -- {"pistolammo",50,"cash",200},
        -- {"canfood",1,"cash",35},
        -- {"water",1,"cash",35},
        -- {"carbinerifle",1,"bandits_records",1},
        -- {"marksmanrifle",1,"bandits_records",1},
        -- {"jerrycan",1,"cash",200},
        -- {"gasoline",1,"cash",110},
        
        -- {"cash",20,"water",1},
        -- {"cash",20,"canfood",1},
        -- {"cash",40,"scrapplastic",15},
        -- {"cash",30,"chemicals",1},
        -- {"cash",50,"scrapmetal",5},
        -- {"cash",35,"rags",25},
        -- {"cash",100,"gasoline",25},
		
        -- {"provisionkey",1,"cash",500},
        -- {"gunstorekey",1,"weed",7},
    },
    selltrade={},
    tradepos={x=-1146.1655273438,y=4940.0942382813,z=222.26867675781},
	sellpos={x=-1134.1072998047,y=4948.662109375,z=222.26872253418},
    clothes={
    {"a_m_y_hiker_01",
        {"cash",10},
    },
    {"a_f_y_hiker_01",
        {"cash",10},
    },
    -- {"a_m_y_motox_01",
        -- {"cash",150},
    -- },
    },
    --clothespos={x=-1146.4151611328,y=4940.9018554688,z=222.26872253418},
	--VVVVVV this one
    changingroompos=devmode and {x=-1137.6760253906,y=4940.2631835938,z=222.26852416992} or nil,
    provision={
        "water",3,
        "canfood",2,
    },
    --provisionpos={ x=-1098.6478271484,y=4893.4716796875,z=216.06663513184},
    --questpos={x=-1098.6478271484,y=4893.4716796875,z=216.06663513184},
    weapons={"pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    garages={
		{name="survivorsettlement",x=-1126.0074462891,y=4955.5366210938,z=220.08460998535,angle=195.63282775879},
	},
    vehpos={x=-1094.43,y=4946.27,z=217.82,angle=342.98559570313},
	chopshop={
	{"repair","cash",1},
	{"refill","cash",20},
	--{"rearm","cash",1}, --(Government, Mercenaries, Military)
	},
	upgrades={
		{vehicle="imperator",sprite="armorplating",name="Armor Plating",mods={[5]=0},resource="cash",amount=2100},
		{vehicle="imperator",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="imperator",sprite="decoration",name="Scavenger Regalia",mods={[6]=1,[35]=0},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="imperator",sprite="decoration",name="Marauder Regalia",mods={[6]=2,[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="imperator",sprite="supercharger",name="Supercharger",mods={[7]=6,[4]=5},resource="cash",amount=1500},
		{vehicle="imperator",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="imperator",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="impaler2",sprite="armorplating",name="Armor Plating",mods={[0]=1,[1]=2,[2]=0,[5]=2,[10]=0},resource="cash",amount=2100},
		{vehicle="impaler2",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="impaler2",sprite="decoration",name="Marauder Regalia",mods={[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="impaler2",sprite="decoration",name="Scavenger Regalia",mods={[35]=2},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="impaler2",sprite="supercharger",name="Supercharger",mods={[4]=0,[8]=2},resource="cash",amount=1500},
		{vehicle="impaler2",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="zr380",sprite="armorplating",name="Armor Plating",mods={[5]=2,[8]=0,[2]=0,[1]=0},resource="cash",amount=2100},
		{vehicle="zr380",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="zr380",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="zr380",sprite="supercharger",name="Supercharger",mods={[7]=4,[4]=1},resource="cash",amount=1500},
		{vehicle="zr380",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="zr380",sprite="aerospoiler",name="Aerodynamic Spoiler",mods={[0]=3},resource="cash",amount=250},
		{vehicle="zr380",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="deathbike",sprite="armorplating",name="Armor Plating",mods={[0]=2},resource="cash",amount=2100},
		{vehicle="deathbike",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="deathbike",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="deathbike",sprite="minigun",name="minigun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="scarab",sprite="armorplating",name="Armor Plating",mods={[1]=4,[3]=7,[5]=2,[10]=0,[28]=5},resource="cash",amount=2100},
		{vehicle="scarab",sprite="armoredplow",name="Armored Plow",mods={[42]=3},resource="cash",amount=1300},
		{vehicle="scarab",sprite="machinegun",name="Machine Gun",mods={[45]=1},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="scarab",sprite="decoration",name="Marauder Regalia",mods={[43]=2,[35]=0},resource="cash",amount=200}, -- (Marauders Only)
		
		{vehicle="dominator4",sprite="armorplating",name="Armor Plating",mods={[0]=0,[1]=0,[3]=0,[5]=2,[6]=2,[7]=1},resource="cash",amount=2100},
		{vehicle="dominator4",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="dominator4",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="dominator4",sprite="decoration",name="Scavenger Regalia",mods={[35]=5},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="dominator4",sprite="decoration",name="Marauder Regalia",mods={[35]=5,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="dominator4",sprite="supercharger",name="Supercharger",mods={[4]=3},resource="cash",amount=1500},
	},
    vehshop={
        -- {"towtruck","cash",800},
        -- {"rumpo3","cash",900},
        -- {"gargoyle","cash",800},
        -- {"dune5","cash",1500},
        -- {"imperator","cash",500,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
        -- {"impaler2","cash",800,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
		
        -- {"deathbike","cash",1300, --(Marauders, Mercenaries)
         -- mods={
         -- [48]=1,
         -- },
        -- },
        -- {"zr380","cash",2000, -- (Government, Marauders, Mercenaries, Military)
         -- mods={
         -- [48]=2,
         -- [28]=0,
         -- [7]=3,
         -- },
        -- },
        -- {"scarab","cash",3500, -- (Mercenaries, Military)
         -- mods={
         -- [48]=1,
         -- },
        -- },
        -- {"dominator4","cash",2500, -- (Government, Military)
         -- mods={
         -- [48]=1,
         -- },
        -- },
    },
	factionjoinpos={x=-1148.9517822266,y=4906.7607421875,z=220.96871948242},
	factionjoin={cost=1000},
	factionname="Scavengers",
	storagepos={x=-1103.6795654297,y=4888.798828125,z=216.07241821289},
	storagename="Survivors",
    craftpos={x=-1123.6444091797,y=4894.5190429688,z=218.47256469727},
    crafts={
    {"molotov",1,
        {"rags",1,
		"alcohol",1,
		"gasoline",1,
		},
    },
    {"clothes_loner",1,
        {"industrialfabrics",1,
		"scrapfabrics",4,
		"rags",6,
		},
    },
    {"duffelbag",1,
        {"industrialfabrics",1,
		"scrapfabrics",5,
		"rags",10,
		},
    },
    {"bandage",1,
        {"rags",2,
		"alcohol",1,
		},
    },
    {"medkit",1,
        {"bandage",3,
		"painkillers",2,
		},
    },
    {"flaregun",1,
        {"industrialscrapmetal",3,
		"industrialplastic",2,
		},
    },
    {"flaregunammo",2,
        {"gunpowder",2,
		"industrialplastic",1,
		"scrapmetal",1,
		},
    },
    {"pistolammo",50,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"heavyrifleammo",30,
        {"leadscrap",2,
		"gunpowder",3,
		"milspecmetal",2,
		},
    },
	},
    spawnpos={x=-1112.9624023438,y=4903.9765625,z=218.59544372559,angle=323.06338500977},
    --ransack={x=-1111.5389404297,y=4936.8647460938,z=218.38740539551,angle=151.02191162109},
    ransack_list={
        {"water",20,"gasoline",10},
        {"gasoline",10,"bandage",15},
        {"canfood",15,"cigarettes",10},
        {"gunpowder",10,"cash",650},
        {"soda",10,"juice",10},
        {"alcohol",5,"cash",100},
    },
    -- join_faction={x=-1146.4794921875,y=4940.9321289063,z=222.2685546875,
        -- rep_moreorless="more",rep_amount=50,

    -- },
    quests={
        textnoquest="I have nothing for you at the moment.",
        join_name="Admission to the Survivors",
        join_text="So, want to join us, huh? Well, you know, I can't just accept some random scavenger. You need to prove that you really worth it. ",
        novice="You're now one of us. Here's your task. ",
    
        {items_required={"bandits_records",2},
        items_reward={"cash",2000,"mre",3,"water",3},
        questname="Prison checkpoint records",
        text="Sneak to prison and steal bandits records with names who enter or exit prison.",
        rep_bonus=10,
        },
        
        {items_required={"cues",1},
        items_reward={"cash",1500,"mre",3,"water",3},
        questname="Named cues",
        text="Marauder bosses keep their named billiard cues somewhere in bar near prison, bring them to me.",
        rep_bonus=10,
        },
        
        {items_required={"mre",30,"water",30},
        items_reward={"cash",3000},
        questname="Provision for week",
        text="We need provision for a next week, bring us MREs and water. Almost every building has water cooler inside, check in there. We've looted most of the military base, but there still should be some provision crates.",
        rep_bonus=10,
        },
        
        {items_required={"engineparts",100},
        items_reward={"cash",2000,"mre",3,"water",3},
        questname="Tools and parts",
        text="We need tools are parts for our vehicles. Search at workshops, should be lots of things there.",
        rep_bonus=10,
        },
        
        {items_required={"ammo",300,"pistolammo",600,"shotgunammo",100,"heavyrifleammo",50},
        items_reward={"cash",3000,"mre",3,"water",3},
        questname="Ammunition",
        text="We need ammo now, here's list of what exactly we need.",
        rep_bonus=10,
        },
        
    },
    relationship="SURVIVOR"},--Altruists camp
    
    
    --LSPD station
    {x=449.93710327148,y=-986.46514892578,z=30.437593460083,r=85.0,blip=88,color=3,
    --models={-44746786,1330042375,1032073858,850468060}, --nothing
    models={1885233650},--
    name="Government Checkpoint~s~",
	border={
		{
			{x=415.65,y=-964.81,z=29.46},
			{x=415.41,y=-1032.34,z=29.22},
			{x=490.88,y=-1024.82,z=28.14},
			{x=489.85,y=-963.50,z=27.28},
			{x=448.16,y=-961.94,z=28.73},
		},
	},
	storageweight=300.0,
	extraction={x=459.5085144043,y=-991.00109863281,z=30.689584732056,r=3.0},
    friends=true,
	tradelistname="government",
    tradespace=4,
    trade={
        -- {"clothes_riot",1,"cash",2350},
        -- {"clothes_camouflage",1,"cash",1500},
        -- {"clothes_rookie",1,"cash",1500},
        -- {"clothes_police",1,"cash",1000},
        -- {"riothelmet",1,"cash",1000},
        -- {"stungun",1,"cash",500},
        -- {"pistol",1,"cash",700},
        -- {"pumpshotgun",1,"cash",1000},
        -- {"pumpshotgun_mk2",1,"bandits_records",1},
        -- {"autoshotgun",1,"bandits_records",3},
        -- {"shotgunammo",30,"cash",200},
        -- {"smgammo",100,"cash",250},
        -- {"bzgas",1,"cash",150},
		
        -- {"cash",150,"policedocs",1},
        -- {"cash",250,"bandits_records",1},
        -- {"cash",150,"dawntokens",1},
        -- {"cash",45,"mre",1},
        -- {"cash",20,"soda",1},
		
        -- {"barberkey",1,"cash",650},
    },
    selltrade={},
	factionjoinpos={x=447.4147644043,y=-975.54663085938,z=30.68959236145},
	factionjoin={cost=1500},
	factionname="Government",
	storagepos={x=449.82238769531,y=-991.33294677734,z=30.689582824707},
	storagename="Government",
    tradepos={x=452.37100219727,y=-980.07110595703,z=30.689582824707},
	sellpos={x=452.42147827148,y=-982.48474121094,z=30.689598083496},
    clothes={
    {"s_m_y_cop_01",
        {"cash",500},
    },
    {"s_f_y_cop_01",
        {"cash",500},
    },
    },
    --clothespos={x=460.62753295898,y=-990.84625244141,z=30.689601898193},
    --changingroompos={x=449.89859008789,y=-990.55810546875,z=30.689601898193},
    provision={
        "water",1,
        "pistolammo",20,
    },
    --provisionpos={x=447.22109985352,y=-975.54309082031,z=30.689596176147},
    --questpos={x=447.22109985352,y=-975.54309082031,z=30.689596176147},
    weapons={"pistol","pumpshotgun"},
    garages={
		{name="governmentcheckpoint",x=449.85470581055,y=-1013.0065917969,z=28.491781234741,angle=183.24914550781},
		{name="governmentcheckpoint2",x=434.23724365234,y=-1014.2998657227,z=28.755540847778,angle=178.62237548828},
	},
    vehpos={x=476.50698852539,y=-1022.0641479492,z=28.054815292358,angle=273.52792358398},
	chopshop={
	{"repair","cash",1},
	{"refill","cash",20},
	{"rearm","cash",1}, --(Government, Mercenaries, Military)
	},
	upgrades={
		{vehicle="imperator",sprite="armorplating",name="Armor Plating",mods={[5]=0},resource="cash",amount=2100},
		{vehicle="imperator",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="imperator",sprite="decoration",name="Scavenger Regalia",mods={[6]=1,[35]=0},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="imperator",sprite="decoration",name="Marauder Regalia",mods={[6]=2,[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="imperator",sprite="supercharger",name="Supercharger",mods={[7]=6,[4]=5},resource="cash",amount=1500},
		{vehicle="imperator",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="imperator",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="impaler2",sprite="armorplating",name="Armor Plating",mods={[0]=1,[1]=2,[2]=0,[5]=2,[10]=0},resource="cash",amount=2100},
		{vehicle="impaler2",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="impaler2",sprite="decoration",name="Marauder Regalia",mods={[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="impaler2",sprite="decoration",name="Scavenger Regalia",mods={[35]=2},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="impaler2",sprite="supercharger",name="Supercharger",mods={[4]=0,[8]=2},resource="cash",amount=1500},
		{vehicle="impaler2",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="zr380",sprite="armorplating",name="Armor Plating",mods={[5]=2,[8]=0,[2]=0,[1]=0},resource="cash",amount=2100},
		{vehicle="zr380",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="zr380",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="zr380",sprite="supercharger",name="Supercharger",mods={[7]=4,[4]=1},resource="cash",amount=1500},
		{vehicle="zr380",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="zr380",sprite="aerospoiler",name="Aerodynamic Spoiler",mods={[0]=3},resource="cash",amount=250},
		{vehicle="zr380",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="deathbike",sprite="armorplating",name="Armor Plating",mods={[0]=2},resource="cash",amount=2100},
		{vehicle="deathbike",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="deathbike",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="deathbike",sprite="minigun",name="minigun",mods={[45]=0},resource="cash",amount=200}, -- (Government, Military, Mercenaries)
		
		{vehicle="scarab",sprite="armorplating",name="Armor Plating",mods={[1]=4,[3]=7,[5]=2,[10]=0,[28]=5},resource="cash",amount=2100},
		{vehicle="scarab",sprite="armoredplow",name="Armored Plow",mods={[42]=3},resource="cash",amount=1300},
		{vehicle="scarab",sprite="machinegun",name="Machine Gun",mods={[45]=1},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="scarab",sprite="decoration",name="Marauder Regalia",mods={[43]=2,[35]=0},resource="cash",amount=200}, -- (Marauders Only)
		
		{vehicle="dominator4",sprite="armorplating",name="Armor Plating",mods={[0]=0,[1]=0,[3]=0,[5]=2,[6]=2,[7]=1},resource="cash",amount=2100},
		{vehicle="dominator4",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="dominator4",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="dominator4",sprite="decoration",name="Scavenger Regalia",mods={[35]=5},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="dominator4",sprite="decoration",name="Marauder Regalia",mods={[35]=5,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="dominator4",sprite="supercharger",name="Supercharger",mods={[4]=3},resource="cash",amount=1500},
	},
    vehshop={
        -- {"phantom","cash",800},
        -- {"riot2","cash",1800},
        -- {"policet","cash",1000},
        -- {"riot","cash",1500},
        -- {"police","cash",700},
		
        -- {"imperator","cash",500,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
        -- {"impaler2","cash",800,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
        -- {"deathbike","cash",1300, --(Marauders, Mercenaries)
         -- mods={
         -- [48]=1,
         -- },
        -- },
        -- {"zr380","cash",2000, -- (Government, Marauders, Mercenaries, Military)
         -- mods={
         -- [48]=2,
         -- [28]=0,
         -- [7]=3,
         -- },
        -- },
        -- {"scarab","cash",3500, -- (Mercenaries, Military)
         -- mods={
         -- [48]=1,
         -- },
        -- },
        {"dominator4","cash",2500, -- (Government, Military)
         mods={
         [48]=1,
         },
        },
    },
    craftpos={x=441.29440307617,y=-975.71667480469,z=30.689594268799},
    crafts={
    {"bandage",1,
        {"rags",2,
		"alcohol",1,
		},
    },
    {"medkit",1,
        {"bandage",3,
		"painkillers",2,
		},
    },
    {"bodyarmor",1,
        {"milspecfabrics",2,
		"level3asoftplate",2,
		},
    },
    {"level3plates",1,
        {"milspecmetal",2,
		"industrialplastic",1,
		},
    },
    {"bzgas",1,
        {"industrialscrapmetal",2,
		"chemicals",2,
		},
    },
    {"pistolammo",50,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"shotgunammo",25,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"smgammo",50,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
	},
    spawnpos={x=459.48818969727,y=-994.87622070313,z=24.914867401123,angle=92.499603271484},

    relationship="GOVERNMENT"},--LSPD station
    
    --[[
    -----------------------------------------------------
    {x=60.990127563477,y=3706.8579101563,z=39.750030517578,r=100.0,blip=495,color=1,
    --models={275618457},
    models={1885233650},--
    name="~r~Lost M.C. Sandy Shores~s~",
    tradespace=2,
    trade={
        {"gasoline",1,"cash",15},
        {"bandage",1,"cash",20},
        
        {"cash",20,"cigarettes",1},
        {"cash",50,"pistolammo",30},
        {"cash",35,"gunpowder",1},
        {"cash",10,"soda",1},
        {"cash",10,"juice",1},
        {"cash",20,"alcohol",1},
    },
    questpos={x=52.044746398926,y=3742.1376953125,z=40.253017425537},
    tradepos={x=75.858306884766,y=3701.2197265625,z=41.077205657959},
    craftpos={x=66.261268615723,y=3728.5979003906,z=39.927852630615},
    crafts=normal_crafts,
    weapons={"dagger","knife","machete","crowbar","hatchet","bat","pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},    
    garagepos={x=49.857131958008,y=3714.6203613281,z=39.752891540527,angle=326.10470581055},
    vehpos={x=61.290504455566,y=3687.7873535156,z=39.834293365479,angle=326.10470581055},
    vehshop={
        {"ratbike",
            {"cash",1000,
            "engineparts",5,
            "scrapmetal",500},
        },
    },
    relationship="BANDIT"},--Lost MC desert
    
    ----------------------------------------------------
    {x=2150.7006835938,y=4778.7612304688,z=41.016918182373,r=75.0,blip=577,color=36,
    models={1885233650},--{-12678997,1694362237,-1105135100},--,1939545845
    name="~y~Northern Hangar~s~",
    friends=true,
    trade={
        {"cash",30,"food",1},
        {"cash",45,"water",1},
        {"cash",30,"soda",1},
        {"cash",20,"juice",1},
        {"cash",25,"alcohol",1},
        {"cash",45,"aircraftfuel",1},
    },
    tradepos={x=2159.9953613281,y=4789.5576171875,z=41.900657653809},
    --clothespos={x=-1146.4151611328,y=4940.9018554688,z=222.26872253418},
    --changingroompos={x=-1137.6760253906,y=4940.2631835938,z=222.26852416992},
    provision={
        "water",3,
        "canfood",2,
    },
    --provisionpos={ x=-1098.6478271484,y=4893.4716796875,z=216.06663513184},
    questpos={x=2159.0524902344,y=4782.1181640625,z=41.961029052734},
    weapons={"pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    garagepos={x=2132.4584960938,y=4785.529296875,z=40.872440338135,angle=24.739751815796},
    vehpos={x=2138.4460449219,y=4815.662109375,z=41.194259643555,angle=115.94924163818},
    vehshop={
        {"microlight",
            {"scrapmetal",50,
            "cash",1500,
            "engineparts",3},
        },
    },
    craftpos={x=2138.8669433594,y=4791.0888671875,z=40.970325469971},
    crafts=normal_crafts,
    spawnpos={x=2146.0759277344,y=4781.9990234375,z=40.998649597168,angle=119.87452697754},
    relationship="SURVIVOR"},--Northern hangar
    
    ----------------------------------------------------
    {x=1894.6357421875,y=3922.03125,z=32.888240814209,r=50.0,blip=434,color=36,
    models={1885233650},--{-12678997,1694362237,-1105135100},--,1939545845
    name="~y~Pawn Shop~s~",
    friends=true,
    trade={
        {"cash",1,"rags",1},
        {"cash",1,"scrapplastic",1},
        {"cash",2,"scrapmetal",1},
        {"cash",20,"meat",1},
        {"cash",30,"chemicals",1},
        {"cash",250,"pistolammo",50},
        {"cash",50,"gasmask",1},
        {"cash",200,"bodyarmor",1},
        {"cash",200,"brasscatcher",1},
        {"cash",100,"radio",1},
    },
    tradepos={x=1887.5930175781,y=3913.580078125,z=33.016674041748},
    --clothespos={x=-1146.4151611328,y=4940.9018554688,z=222.26872253418},
    --changingroompos={x=-1137.6760253906,y=4940.2631835938,z=222.26852416992},
    provision={
        "water",3,
        "canfood",2,
    },
    --provisionpos={ x=-1098.6478271484,y=4893.4716796875,z=216.06663513184},
    questpos={x=1905.4584960938,y=3922.9091796875,z=32.743022918701},
    weapons={"pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    --garagepos={x=2155.5866699219,y=4780.2172851563,z=41.044399261475,angle=1.4582903385162},
    --vehpos={x=2138.4460449219,y=4815.662109375,z=41.194259643555,angle=115.94924163818},
    vehshop={
        {"microlight",
            {"scrapmetal",50,
            "cash",1500,
            "engineparts",3},
        },
    },
    --craftpos={x=2138.8669433594,y=4791.0888671875,z=40.970325469971},
    crafts=normal_crafts,
    spawnpos={x=1905.4584960938,y=3922.9091796875,z=32.743022918701},
    relationship="SURVIVOR"},--Pawn Shop
    
    ----------------------------------------------------
    {x=1710.7409667969,y=4751.3974609375,z=41.995300292969,r=75.0,blip=52,color=36,
    models={1885233650},--{-163714847,-1422914553},--,1939545845
    name="~y~North Trading Post~s~",
    friends=true,
    tradespace=9,
    trade={
        {"water",1,"cash",25},
        {"bandage",1,"cash",15},
        {"canfood",1,"cash",20},
        {"cigarettes",1,"cash",25},
        {"soda",1,"cash",10},
        {"juice",1,"cash",10},
        {"alcohol",1,"cash",20},
        {"chemicals",1,"cash",30},
        {"clothes_mercenary",1,"cash",5000},
        
        {"cash",100,"mre",1},
        {"cash",200,"armorplate",1},
        {"cash",300,"medkit",1},
        {"cash",275,"pistolammo",50},
        
    },
    tradepos={x=1712.7950439453,y=4790.521484375,z=41.990787506104},
    --clothespos={x=-1146.4151611328,y=4940.9018554688,z=222.26872253418},
    --changingroompos={x=-1137.6760253906,y=4940.2631835938,z=222.26852416992},
    provision={
        "water",3,
        "canfood",2,
    },
    --provisionpos={ x=-1098.6478271484,y=4893.4716796875,z=216.06663513184},
    questpos={x=1662.2485351563,y=4776.201171875,z=42.007522583008},
    weapons={"pistol","pumpshotgun","combatpistol","machinepistol"},
    garagepos={x=1709.0181884766,y=4746.4306640625,z=41.864681243896,angle=53.457618713379},
    vehpos={x=1708.8276367188,y=4803.8701171875,z=41.798683166504,angle=276.10998535156},
    vehshop={
        {"boxville5",
            {"scrapmetal",500,
            "cash",2500,
            "engineparts",3},
        },
    },
    --craftpos={x=2138.8669433594,y=4791.0888671875,z=40.970325469971},
    crafts=normal_crafts,
    spawnpos={x=1664.0472412109,y=4739.5366210938,z=42.010166168213,angle=288.13848876953},
    relationship="SURVIVOR"},--North Trading Post
    
    ]]
    
----------------------------------------------------
    {x=1697.1645507813,y=2611.8725585938,z=45.564865112305,r=250.0,blip=86,color=5,
    models={1885233650},--{1746653202,-44746786,1330042375,1032073858,850468060,275618457},
    name="Marauder Fortress~s~",
	border={
		{
			{x=1860.08,y=2625.98,z=44.96},
			{x=1852.30,y=2715.68,z=45.22},
			{x=1774.11,y=2771.39,z=45.17},
			{x=1650.52,y=2768.43,z=45.19},
			{x=1559.77,y=2684.49,z=45.19},
			{x=1522.21,y=2590.19,z=45.21},
			{x=1529.71,y=2467.99,z=45.18},
			{x=1647.71,y=2386.67,z=45.19},
			{x=1764.51,y=2399.31,z=45.17},
			{x=1847.21,y=2485.77,z=45.20},
			{x=1859.39,y=2594.68,z=44.96},
		},
	},
	storageweight=100.0,
	extraction={x=1690.7955322266,y=2646.1235351563,z=54.579902648926,r=3.0},
    tradespace=4,
	tradelistname="marauders",
    trade={
        -- {"clothes_banditgoon",1,"cash",750},
        -- {"clothes_marauder",1,"cash",1200},
        -- {"clothes_toughguy",1,"cash",4000},
        -- {"clothes_banditmercenary",1,"cash",4000},
        -- {"maraudercombathelmet",1,"cash",2000},
        -- {"tapemask",1,"cash",100},
        -- {"halfmask",1,"cash",100},
        -- {"duffelbag",1,"cash",1000},
        -- {"gasmask",1,"weed",2},
        -- {"compactrifle",1,"cash",1200},
        -- {"assaultrifle",1,"bandits_records",1},
        -- {"musket",1,"cash",500},
        -- {"sawnoffshotgun",1,"cash",700},
        -- {"vintagepistol",1,"cash",900},
        -- {"compactlauncher",1,"policedocs",2},
        -- {"launchergrenade",1,"weed",1},
        -- {"minismg",1,"cash",650},
        -- {"machinepistol",1,"policedocs",1},
        -- {"smgammo",100,"cigarettes",1},
        -- {"shotgunammo",30,"cash",350},
        -- {"jerrycan",1,"cash",200},
        -- {"molotov",1,"cash",100},
		
        -- {"cash",75,"weed",1},
        -- {"cash",40,"alcohol",1},
        -- {"cash",50,"gunpowder",1},
        -- {"cash",40,"scrapplastic",25},
        -- {"cash",35,"chemicals",1},
        -- {"cash",60,"scrapmetal",5},
        -- {"cash",35,"rags",25},
		
        -- {"gunstorekey",1,"dawntokens",5},
        -- {"tattookey",1,"cash",650},
    },
    selltrade={},
	factionjoinpos={x=1689.2509765625,y=2529.2553710938,z=45.56485748291},
	factionjoin={cost=1000},
	factionname="Marauders",
	storagepos={x=1661.3382568359,y=2566.8952636719,z=45.56485748291},
	storagename="Marauders",
    --questpos={x=1775.5057373047,y=2551.951171875,z=45.564979553223},
    tradepos={x=1682.52734375,y=2476.2099609375,z=45.823303222656},
	sellpos={x=1703.0198974609,y=2476.7287597656,z=45.777526855469},
    craftpos={x=1689.4483642578,y=2552.2507324219,z=45.56485748291},
    crafts={
    {"clothes_marauder",1,
        {"industrialscrapmetal",4,
		"fabrics",6,
		"industrialfabrics",4,
		"rags",8,
		},
    },
    {"molotov",1,
        {"rags",1,
		"alcohol",1,
		"gasoline",1,
		},
    },
    {"pipebomb",1,
        {"industrialplastic",1,
		"gunpowder",2,
		"industrialelectronicscrap",2,
		},
    },
    {"bandage",1,
        {"rags",2,
		"alcohol",1,
		},
    },
    {"medkit",1,
        {"bandage",3,
		"painkillers",2,
		},
    },
    {"shotgunammo",25,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"smgammo",50,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
	},
    weapons=weaponsarray.bandit,
    garages={
		{name="marauderfortress",x=1720.63671875,y=2599.8291015625,z=45.913063049316,angle=358.78060913086},
	},
    vehpos={x=1673.43,y=2604.79,z=45.03,angle=27.88},
	chopshop={
	{"repair","cash",1},
	{"refill","cash",20},
	--{"rearm","cash",1}, --(Government, Mercenaries, Military)
	},
	upgrades={
		{vehicle="imperator",sprite="armorplating",name="Armor Plating",mods={[5]=0},resource="cash",amount=2100},
		{vehicle="imperator",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="imperator",sprite="decoration",name="Scavenger Regalia",mods={[6]=1,[35]=0},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="imperator",sprite="decoration",name="Marauder Regalia",mods={[6]=2,[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="imperator",sprite="supercharger",name="Supercharger",mods={[7]=6,[4]=5},resource="cash",amount=1500},
		{vehicle="imperator",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="imperator",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="impaler2",sprite="armorplating",name="Armor Plating",mods={[0]=1,[1]=2,[2]=0,[5]=2,[10]=0},resource="cash",amount=2100},
		{vehicle="impaler2",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="impaler2",sprite="decoration",name="Marauder Regalia",mods={[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="impaler2",sprite="decoration",name="Scavenger Regalia",mods={[35]=2},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="impaler2",sprite="supercharger",name="Supercharger",mods={[4]=0,[8]=2},resource="cash",amount=1500},
		{vehicle="impaler2",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="zr380",sprite="armorplating",name="Armor Plating",mods={[5]=2,[8]=0,[2]=0,[1]=0},resource="cash",amount=2100},
		{vehicle="zr380",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="zr380",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="zr380",sprite="supercharger",name="Supercharger",mods={[7]=4,[4]=1},resource="cash",amount=1500},
		{vehicle="zr380",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="zr380",sprite="aerospoiler",name="Aerodynamic Spoiler",mods={[0]=3},resource="cash",amount=250},
		{vehicle="zr380",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="deathbike",sprite="armorplating",name="Armor Plating",mods={[0]=2},resource="cash",amount=2100},
		{vehicle="deathbike",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="deathbike",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="deathbike",sprite="minigun",name="minigun",mods={[45]=0},resource="cash",amount=200}, -- (Government, Military, Mercenaries)
		
		{vehicle="scarab",sprite="armorplating",name="Armor Plating",mods={[1]=4,[3]=7,[5]=2,[10]=0,[28]=5},resource="cash",amount=2100},
		{vehicle="scarab",sprite="armoredplow",name="Armored Plow",mods={[42]=3},resource="cash",amount=1300},
		{vehicle="scarab",sprite="machinegun",name="Machine Gun",mods={[45]=1},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="scarab",sprite="decoration",name="Marauder Regalia",mods={[43]=2,[35]=0},resource="cash",amount=200}, -- (Marauders Only)
		
		{vehicle="dominator4",sprite="armorplating",name="Armor Plating",mods={[0]=0,[1]=0,[3]=0,[5]=2,[6]=2,[7]=1},resource="cash",amount=2100},
		{vehicle="dominator4",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="dominator4",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="dominator4",sprite="decoration",name="Scavenger Regalia",mods={[35]=5},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="dominator4",sprite="decoration",name="Marauder Regalia",mods={[35]=5,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="dominator4",sprite="supercharger",name="Supercharger",mods={[4]=3},resource="cash",amount=1500},
	},
    vehshop={
        -- {"towtruck","cash",800},
        -- {"wastelander","cash",1000},
        -- --{"technical2","cash",2500},
        -- {"tornado6","cash",1000},
        -- -- {"imperator","cash",500,
         -- -- mods={
         -- -- [28]=1,
         -- -- [48]=range(0,3),
         -- -- },
        -- -- },
        -- {"impaler2","cash",800,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
        -- {"deathbike","cash",1300, --(Marauders, Mercenaries)
         -- mods={
         -- [48]=1,
         -- },
        -- },
		
        -- {"zr380","cash",2000, -- (Government, Marauders, Mercenaries, Military)
         -- mods={
         -- [48]=2,
         -- [28]=0,
         -- [7]=3,
         -- },
        -- },
        -- {"scarab","cash",3500, -- (Mercenaries, Military)
         -- mods={
         -- [48]=1,
         -- },
        -- },
        -- {"dominator4","cash",2500, -- (Government, Military)
         -- mods={
         -- [48]=1,
         -- },
        -- },  
    },
    --ransack={x=1661.6795654297,y=2566.5334472656,z=45.564865112305,angle=229.75936889648},
    ransack_list={
        {"cash",4000,"gasoline",80},
        {"bandage",10,"canfood",10},
        {"gunpowder",20,"cigarettes",30},
        {"soda",10,"juice",10},
        {"alcohol",15,"mre",5},
        {"armorplate",10,"medkit",3},
        {"ammo",300,"shotgunammo",30},
    },

    relationship="BANDIT"},--Prison
	
	--Smugglers base
----------------------------------------------------
    {x=2212.4770507813,y=5597.16015625,z=53.925220489502,r=100,blip=102,color=4,
    models={1885233650},
    name="Smugglers Camp",
	storageweight=300.0,
    extraction={x=2181.6948242188,y=5559.578125,z=53.782318115234},
	tradelistname="smugglers",
    tradepos={x=2221.4025878906,y=5614.6494140625,z=54.901615142822},
	sellpos={x=2194.3837890625,y=5589.5336914063,z=53.533321380615},
	trade={},
    selltrade={},
	factionname="Smugglers",
    factionjoinpos={x=2224.2741699219,y=5604.5356445313,z=54.927871704102},
    factionjoin={cost=1500},
    storagepos={x=2232.5539550781,y=5611.2514648438,z=54.913997650146},
    storagename="smugglers",
    craftpos={x=2214.2390136719,y=5585.4921875,z=53.851406097412},
    weapons=weaponsarray.mercenaries,
    garages={
		{name="smugglers",x=2203.1770019531,y=5561.4799804688,z=53.922260284424,angle=354.91766357422},
		{name="smugglers2",x=2259.6228027344,y=5613.9360351563,z=54.597011566162,angle=130.56204223633},
	},
    vehpos={x=2196.3247070313,y=5608.0581054688,z=53.495838165283}, --chopshop position
	vehshop={},
    relationship="SMUGGLERS",
	chopshop={
	{"repair","cash",1},
	{"refill","cash",20},
	{"rearm","cash",1}, --(Government, Mercenaries, Military)
	},
	upgrades={
		{vehicle="imperator",sprite="armorplating",name="Armor Plating",mods={[5]=0},resource="cash",amount=2100},
		{vehicle="imperator",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="imperator",sprite="decoration",name="Scavenger Regalia",mods={[6]=1,[35]=0},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="imperator",sprite="decoration",name="Marauder Regalia",mods={[6]=2,[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="imperator",sprite="supercharger",name="Supercharger",mods={[7]=6,[4]=5},resource="cash",amount=1500},
		{vehicle="imperator",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="imperator",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="impaler2",sprite="armorplating",name="Armor Plating",mods={[0]=1,[1]=2,[2]=0,[5]=2,[10]=0},resource="cash",amount=2100},
		{vehicle="impaler2",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="impaler2",sprite="decoration",name="Marauder Regalia",mods={[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="impaler2",sprite="decoration",name="Scavenger Regalia",mods={[35]=2},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="impaler2",sprite="supercharger",name="Supercharger",mods={[4]=0,[8]=2},resource="cash",amount=1500},
		{vehicle="impaler2",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="zr380",sprite="armorplating",name="Armor Plating",mods={[5]=2,[8]=0,[2]=0,[1]=0},resource="cash",amount=2100},
		{vehicle="zr380",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="zr380",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="zr380",sprite="supercharger",name="Supercharger",mods={[7]=4,[4]=1},resource="cash",amount=1500},
		{vehicle="zr380",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="zr380",sprite="aerospoiler",name="Aerodynamic Spoiler",mods={[0]=3},resource="cash",amount=250},
		{vehicle="zr380",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="deathbike",sprite="armorplating",name="Armor Plating",mods={[0]=2},resource="cash",amount=2100},
		{vehicle="deathbike",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="deathbike",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="deathbike",sprite="minigun",name="minigun",mods={[45]=0},resource="cash",amount=200}, -- (Government, Military, Mercenaries)
		
		{vehicle="scarab",sprite="armorplating",name="Armor Plating",mods={[1]=4,[3]=7,[5]=2,[10]=0,[28]=5},resource="cash",amount=2100},
		{vehicle="scarab",sprite="armoredplow",name="Armored Plow",mods={[42]=3},resource="cash",amount=1300},
		{vehicle="scarab",sprite="machinegun",name="Machine Gun",mods={[45]=1},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="scarab",sprite="decoration",name="Marauder Regalia",mods={[43]=2,[35]=0},resource="cash",amount=200}, -- (Marauders Only)
		
		{vehicle="dominator4",sprite="armorplating",name="Armor Plating",mods={[0]=0,[1]=0,[3]=0,[5]=2,[6]=2,[7]=1},resource="cash",amount=2100},
		{vehicle="dominator4",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="dominator4",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="dominator4",sprite="decoration",name="Scavenger Regalia",mods={[35]=5},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="dominator4",sprite="decoration",name="Marauder Regalia",mods={[35]=5,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="dominator4",sprite="supercharger",name="Supercharger",mods={[4]=3},resource="cash",amount=1500},
	},
    },
	
	---military base
----------------------------------------------------
    {x=-2079.6791992188,y=3112.3244628906,z=32.28897857666,r=500.0,blip=93,color=2,
    models={1657546978,-220552467,1702441027,-265970301,1490458366,1925237458},--{1746653202,-44746786,1330042375,1032073858,850468060,275618457},
    name="Military Outpost~s~",
	border={
		{
			{x=-2329.51,y=3402.43,z=29.70},
			{x=-2392.56,y=3433.23,z=30.11},
			{x=-2497.97,y=3381.45,z=36.83},
			{x=-2541.64,y=3046.34,z=59.00},
			{x=-2503.19,y=2918.58,z=48.60},
			{x=-2382.45,y=2928.02,z=44.55},
			{x=-2300.65,y=2922.06,z=44.84},
			{x=-2167.32,y=2836.86,z=42.64},
			{x=-2142.27,y=2801.56,z=43.56},
			{x=-2013.36,y=2798.84,z=41.82},
			{x=-1836.94,y=2756.23,z=44.79},
			{x=-1793.56,y=2802.57,z=44.19},
			{x=-1720.91,y=2805.63,z=40.55},
			{x=-1669.25,y=2866.86,z=39.71},
			{x=-1590.94,y=2772.09,z=24.69},
			{x=-1575.35,y=2810.30,z=34.07},
			{x=-1654.78,y=2941.14,z=39.42},
			{x=-1695.39,y=3142.63,z=37.50},
			{x=-1658.22,y=3231.50,z=40.74},
			{x=-1953.55,y=3413.54,z=52.24},
			{x=-2039.71,y=3353.92,z=57.83},
			{x=-2123.63,y=3380.01,z=47.92},
			{x=-2263.69,y=3393.88,z=47.76},
			{x=-2326.10,y=3408.03,z=31.84},
		}
	},
	storageweight=400.0,
	extraction={x=-2345.5778808594,y=3232.2980957031,z=34.742935180664,r=3.0},
    tradelistname="military",
	tradespace=4,
    trade={
        -- {"clothes_pmc",1,"cash",4000},
        -- {"gasmask",1,"cash",650},
        -- {"bodyarmor",1,"cash",500},
        -- {"armorplate",1,"cash",300},
        -- {"blackopstacticalhelmet",1,"cash",2000},
        -- {"specopscommsgear",1,"cash",500},
        -- {"tacticalglasses",1,"cash",100},
        -- {"pmccap",1,"cash",50},
        -- {"carbinerifle_mk2",1,"cash",1000},
        -- {"smg_mk2",1,"cash",750},
        -- {"heavypistol",1,"cash",600},
        -- {"sniperrifle",1,"cash",1500},
        -- {"combatmg",1,"dawntokens",3},
        -- {"grenadelauncher",1,"bandits_records",3},
        -- {"mgammo",100,"cash",350},
        -- {"launchergrenade",1,"cash",400},
        -- {"grenade",1,"cash",250},
        -- {"ammo",50,"cash",250},
        -- {"heavyrifleammo",50,"cash",400},
        -- {"heavybarrel",1,"cash",600},
        -- {"grip",1,"cash",500},
        -- {"scope_advanced",1,"cash",400},
		
        -- {"cash",40,"gunpowder",1},
        -- {"cash",200,"dawntokens",1},
        -- {"cash",30,"alcohol",1},
        -- {"cash",60,"chemicals",1},
		
        -- {"gunstorekey",1,"cash",1000},
    },
    selltrade={},
	factionjoinpos={x=-2348.80078125,y=3269.0895996094,z=32.81075668335},
	factionjoin={cost=2000},
	factionname="Military",
	storagepos={x=-2352.4301757813,y=3333.2145996094,z=32.97435760498},
	storagename="Military",
    --questpos={x=1775.5057373047,y=2551.951171875,z=45.564979553223},
    tradepos={x=-2309.3557128906,y=3313.4895019531,z=32.994052886963},
	sellpos={x=-2294.19140625,y=3318.2646484375,z=32.826801300049},
    craftpos={x=-2409.9697265625,y=3267.3103027344,z=32.977767944336},
        crafts={
    {"bodyarmor",1,
        {"milspecfabrics",2,
		"level3asoftplate",2,
		},
    },
    {"armorplate",1,
        {"milspecmetal",2,
		"industrialplastic",2,
		},
    },
    {"bandage",1,
        {"rags",2,
		"alcohol",1,
		},
    },
    {"medkit",1,
        {"bandage",3,
		"painkillers",2,
		},
    },
    {"pistolammo",50,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"shotgunammo",25,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"smgammo",50,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"ammo",50,
        {"leadscrap",2,
		"gunpowder",3,
		"scrapmetal",3,
		},
    },
    {"mgammo",100,
        {"leadscrap",2,
		"gunpowder",3,
		"scrapmetal",4,
		},
    },
    {"heavyrifleammo",20,
        {"leadscrap",2,
		"gunpowder",3,
		"scrapmetal",3,
		},
    },
    {"launchergrenade",1,
        {"gunpowder",1,
		"gunpowder",2,
		"milspecmetal",1,
		},
    },
    {"proxmine",1,
        {"gunpowder",1,
		"milspecelectronicscrap",1,
		"industrialscrapmetal",1,
		},
    },
    {"grenade",2,
        {"milspecmetal",1,
		"gunpowder",4,
		"industrialelectronicscrap",2,
		},
    },
	},
    weapons=weaponsarray.military,    
	garages={
		{name="militaryoutpost",x=-2015.5277099609,y=2944.7358398438,z=32.809864044189,angle=326.25524902344},
		{name="militaryoutpost2",x=-2144.2985839844,y=3019.703125,z=32.826580047607,angle=327.27267456055},
		{name="militaryoutpost3",x=-1828.6223144531,y=2975.2268066406,z=32.278957366943,angle=60.625129699707},
	},
    vehpos={x=-2137.9235839844,y=3256.8903808594,z=32.81029510498,angle=147.38447570801},
	chopshop={
	{"repair","cash",1},
	{"refill","cash",20},
	{"rearm","cash",1}, --(Government, Mercenaries, Military)
	},
	upgrades={
		{vehicle="imperator",sprite="armorplating",name="Armor Plating",mods={[5]=0},resource="cash",amount=2100},
		{vehicle="imperator",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="imperator",sprite="decoration",name="Scavenger Regalia",mods={[6]=1,[35]=0},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="imperator",sprite="decoration",name="Marauder Regalia",mods={[6]=2,[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="imperator",sprite="supercharger",name="Supercharger",mods={[7]=6,[4]=5},resource="cash",amount=1500},
		{vehicle="imperator",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="imperator",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="impaler2",sprite="armorplating",name="Armor Plating",mods={[0]=1,[1]=2,[2]=0,[5]=2,[10]=0},resource="cash",amount=2100},
		{vehicle="impaler2",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="impaler2",sprite="decoration",name="Marauder Regalia",mods={[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="impaler2",sprite="decoration",name="Scavenger Regalia",mods={[35]=2},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="impaler2",sprite="supercharger",name="Supercharger",mods={[4]=0,[8]=2},resource="cash",amount=1500},
		{vehicle="impaler2",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="zr380",sprite="armorplating",name="Armor Plating",mods={[5]=2,[8]=0,[2]=0,[1]=0},resource="cash",amount=2100},
		{vehicle="zr380",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="zr380",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="zr380",sprite="supercharger",name="Supercharger",mods={[7]=4,[4]=1},resource="cash",amount=1500},
		{vehicle="zr380",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="zr380",sprite="aerospoiler",name="Aerodynamic Spoiler",mods={[0]=3},resource="cash",amount=250},
		{vehicle="zr380",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="deathbike",sprite="armorplating",name="Armor Plating",mods={[0]=2},resource="cash",amount=2100},
		{vehicle="deathbike",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="deathbike",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=150}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="deathbike",sprite="minigun",name="minigun",mods={[45]=0},resource="cash",amount=200}, -- (Government, Military, Mercenaries)
		
		{vehicle="scarab",sprite="armorplating",name="Armor Plating",mods={[1]=4,[3]=7,[5]=2,[10]=0,[28]=5},resource="cash",amount=2100},
		{vehicle="scarab",sprite="armoredplow",name="Armored Plow",mods={[42]=3},resource="cash",amount=1300},
		{vehicle="scarab",sprite="machinegun",name="Machine Gun",mods={[45]=1},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="scarab",sprite="decoration",name="Marauder Regalia",mods={[43]=2,[35]=0},resource="cash",amount=200}, -- (Marauders Only)
		
		{vehicle="dominator4",sprite="armorplating",name="Armor Plating",mods={[0]=0,[1]=0,[3]=0,[5]=2,[6]=2,[7]=1},resource="cash",amount=2100},
		{vehicle="dominator4",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="dominator4",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="dominator4",sprite="decoration",name="Scavenger Regalia",mods={[35]=5},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="dominator4",sprite="decoration",name="Marauder Regalia",mods={[35]=5,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="dominator4",sprite="supercharger",name="Supercharger",mods={[4]=3},resource="cash",amount=1500},
	},
    vehshop={
		-- {"buzzard2","cash",15000},
		-- {"buzzard","cash",10000},
		-- {"barrage","cash",2400},
		-- {"dune3","cash",2000},
		
        -- {"imperator","cash",500,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
        -- {"impaler2","cash",800,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
        -- -- {"deathbike","cash",1300, --(Marauders, Mercenaries)
         -- -- mods={
         -- -- [48]=1,
         -- -- },
        -- -- },
        -- {"zr380","cash",2000, -- (Government, Marauders, Mercenaries, Military)
         -- mods={
         -- [48]=2,
         -- [28]=0,
         -- [7]=3,
         -- },
        -- },
        -- {"scarab","cash",3500, -- (Mercenaries, Military)
         -- mods={
         -- [48]=1,
         -- },
        -- },
        -- {"dominator4","cash",2500, -- (Government, Military)
         -- mods={
         -- [48]=1,
         -- },
        -- },
    },
    --ransack={x=1661.6795654297,y=2566.5334472656,z=45.564865112305,angle=229.75936889648},
    ransack_list={
        {"cash",4000,"gasoline",80},
        {"bandage",10,"canfood",10},
        {"gunpowder",20,"cigarettes",30},
        {"soda",10,"juice",10},
        {"alcohol",15,"mre",5},
        {"armorplate",10,"medkit",3},
        {"ammo",300,"shotgunammo",30},
    },

    relationship="MILITARY"},--Military base
	

	---merc base
----------------------------------------------------
    {x=512.15368652344,y=-3190.0910644531,z=6.0692586898804,r=250.0,blip=94,color=4,
    models={1885233650},
    name="Mercenary Base~s~",
	storageweight=400.0,
	extraction={x=468.52130126953,y=-3205.6555175781,z=9.7939548492432,r=3.0},
    tradespace=4,
	tradelistname="mercenary",
    trade={
        -- {"clothes_combat_desert",1,"cash",4500},
        -- {"clothes_combat_green",1,"cash",4500},
        -- {"clothes_mercexperimental",1,"cash",3500},
        -- {"clothes_merclight",1,"cash",1500},
        -- {"bodyarmor",1,"cash",500},
        -- {"armorplate",1,"cash",300},
        -- {"merctacticalhelmet",1,"cash",1800},
        -- {"gasmask",1,"cash",600},
        -- {"bullpuprifle_mk2",1,"cash",1800},
        -- {"specialcarbine",1,"dawntokens",10},
        -- {"heavyshotgun",1,"cigarettes",20},
        -- {"grenade",1,"cash",250},
        -- {"mg",1,"cash",2600},
        -- {"rpg",1,"dawntokens",7},
        -- {"assaultsmg",1,"cash",750},
        -- {"ammo",50,"cash",250},
        -- {"mgammo",100,"cash",350},
        -- {"rocket",1,"cash",650},
        -- {"suppressor_2",1,"cash",600},
        -- {"grip",1,"cash",500},
        -- {"scope_advanced",1,"cash",400},
		
        -- {"cash",40,"gunpowder",1},
        -- {"cash",35,"alcohol",1},
        -- {"cash",50,"chemicals",1},
		
        -- {"gunstorekey",1,"cash",1000},
    },
    selltrade={},
	factionjoinpos={x=484.42178344727,y=-3058.9604492188,z=6.2263550758362},
	factionjoin={cost=2000},
	factionname="Mercenaries",
	storagepos={x=503.66717529297,y=-3122.1413574219,z=6.0697917938232},
	storagename="Mercenaries",
    --questpos={x=1775.5057373047,y=2551.951171875,z=45.564979553223},
    tradepos={x=467.56372070313,y=-3220.5288085938,z=7.0569982528687},
	sellpos={x=473.43850708008,y=-3084.4770507813,z=6.0700540542603},
    craftpos={x=579.96868896484,y=-3113.1203613281,z=6.0692543983459},
    crafts={
    {"bodyarmor",1,
        {"milspecfabrics",2,
		"level3asoftplate",2,
		},
    },
    {"armorplate",1,
        {"milspecmetal",2,
		"industrialplastic",2,
		},
    },
    {"duffelbag",1,
        {"industrialfabrics",1,
		"scrapfabrics",5,
		"rags",10,
		},
    },
    {"bandage",1,
        {"rags",2,
		"alcohol",1,
		},
    },
    {"medkit",1,
        {"bandage",3,
		"painkillers",2,
		},
    },
    {"pistolammo",50,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"shotgunammo",25,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"smgammo",50,
        {"leadscrap",1,
		"gunpowder",2,
		"scrapmetal",2,
		},
    },
    {"ammo",50,
        {"leadscrap",2,
		"gunpowder",3,
		"milspecmetal",3,
		},
    },
    {"mgammo",60,
        {"leadscrap",3,
		"gunpowder",3,
		"milspecmetal",2,
		},
    },
    {"heavyrifleammo",20,
        {"leadscrap",2,
		"gunpowder",3,
		"milspecmetal",3,
		},
    },
    {"rocket",1,
        {"gunpowder",1,
		"milspecelectronicscrap",1,
		"industrialplastic",1,
		},
    },
    {"grenade",2,
        {"milspecmetal",1,
		"gunpowder",4,
		"industrialelectronicscrap",2,
		},
    },
	},
    weapons=weaponsarray.mercenaries,    
	garages={
		{name="mercenarybase",x=467.41119384766,y=-3191.4245605469,z=6.0695595741272,angle=266.50952148438},
		{name="mercenarybase2",x=466.86489868164,y=-3235.412109375,z=6.0695567131042,angle=267.56420898438},
		{name="mercenarybase3",x=478.34823608398,y=-3370.0886230469,z=6.0699133872986,angle=178.25700378418},
		{name="mercenarybase4",x=570.47326660156,y=-3160.8044433594,z=1.0691429376602,angle=179.04460144043},
	},
    vehpos={x=477.85247802734,y=-3300.9567871094,z=6.0692639350891,angle=268.39370727539},
	chopshop={
	{"repair","cash",1},
	{"refill","cash",20},
	{"rearm","cash",1}, --(Government, Mercenaries, Military)
	},
	upgrades={
		{vehicle="imperator",sprite="armorplating",name="Armor Plating",mods={[5]=0},resource="cash",amount=2100},
		{vehicle="imperator",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="imperator",sprite="decoration",name="Scavenger Regalia",mods={[6]=1,[35]=0},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="imperator",sprite="decoration",name="Marauder Regalia",mods={[6]=2,[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="imperator",sprite="supercharger",name="Supercharger",mods={[7]=6,[4]=5},resource="cash",amount=1500},
		{vehicle="imperator",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="imperator",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="impaler2",sprite="armorplating",name="Armor Plating",mods={[0]=1,[1]=2,[2]=0,[5]=2,[10]=0},resource="cash",amount=2100},
		{vehicle="impaler2",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="impaler2",sprite="decoration",name="Marauder Regalia",mods={[35]=1,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="impaler2",sprite="decoration",name="Scavenger Regalia",mods={[35]=2},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="impaler2",sprite="supercharger",name="Supercharger",mods={[4]=0,[8]=2},resource="cash",amount=1500},
		{vehicle="impaler2",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="zr380",sprite="armorplating",name="Armor Plating",mods={[5]=2,[8]=0,[2]=0,[1]=0},resource="cash",amount=2100},
		{vehicle="zr380",sprite="armoredplow",name="Armored Plow",mods={[42]=0},resource="cash",amount=1300},
		{vehicle="zr380",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="zr380",sprite="supercharger",name="Supercharger",mods={[7]=4,[4]=1},resource="cash",amount=1500},
		{vehicle="zr380",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="zr380",sprite="aerospoiler",name="Aerodynamic Spoiler",mods={[0]=3},resource="cash",amount=250},
		{vehicle="zr380",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		
		{vehicle="deathbike",sprite="armorplating",name="Armor Plating",mods={[0]=2},resource="cash",amount=2100},
		{vehicle="deathbike",sprite="decoration",name="Marauder Regalia",mods={[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="deathbike",sprite="sawblade",name="Motorized Sawblade",mods={[44]=0},resource="cash",amount=1500}, -- (Marauders, Scavengers, Smugglers, Mercenaries)
		{vehicle="deathbike",sprite="minigun",name="minigun",mods={[45]=0},resource="cash",amount=200}, -- (Government, Military, Mercenaries)
		
		{vehicle="scarab",sprite="armorplating",name="Armor Plating",mods={[1]=4,[3]=7,[5]=2,[10]=0,[28]=5},resource="cash",amount=2100},
		{vehicle="scarab",sprite="armoredplow",name="Armored Plow",mods={[42]=3},resource="cash",amount=1300},
		{vehicle="scarab",sprite="machinegun",name="Machine Gun",mods={[45]=1},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="scarab",sprite="decoration",name="Marauder Regalia",mods={[43]=2,[35]=0},resource="cash",amount=200}, -- (Marauders Only)
		
		{vehicle="dominator4",sprite="armorplating",name="Armor Plating",mods={[0]=0,[1]=0,[3]=0,[5]=2,[6]=2,[7]=1},resource="cash",amount=2100},
		{vehicle="dominator4",sprite="armoredplow",name="Armored Plow",mods={[42]=1},resource="cash",amount=1300},
		{vehicle="dominator4",sprite="machinegun",name="Machine Gun",mods={[45]=0},resource="cash",amount=3000}, -- (Government, Military, Mercenaries)
		{vehicle="dominator4",sprite="decoration",name="Scavenger Regalia",mods={[35]=5},resource="cash",amount=200}, -- (Scavengers Only)
		{vehicle="dominator4",sprite="decoration",name="Marauder Regalia",mods={[35]=5,[43]=0},resource="cash",amount=200}, -- (Marauders Only)
		{vehicle="dominator4",sprite="supercharger",name="Supercharger",mods={[4]=3},resource="cash",amount=1500},
	},
    vehshop={
        -- {"imperator","cash",500,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
        -- {"impaler2","cash",800,
         -- mods={
         -- [28]=1,
         -- [48]=range(0,3),
         -- },
        -- },
        -- {"deathbike","cash",1300, --(Marauders, Mercenaries)
         -- mods={
         -- [48]=1,
         -- },
        -- },
        -- {"zr380","cash",2000, -- (Government, Marauders, Mercenaries, Military)
         -- mods={
         -- [48]=2,
         -- [28]=0,
         -- [7]=3,
         -- },
        -- },
        {"seasparrow","cash",10000},
        {"phantom2","cash",2500},
        {"scarab","cash",3500, -- (Mercenaries, Military)
         mods={
         [48]=1,
         },
        },
        -- {"dominator4","cash",2500, -- (Government, Military)
         -- mods={
         -- [48]=1,
         -- },
        -- },
    },
    --ransack={x=1661.6795654297,y=2566.5334472656,z=45.564865112305,angle=229.75936889648},
    ransack_list={
        {"cash",4000,"gasoline",80},
        {"bandage",10,"canfood",10},
        {"gunpowder",20,"cigarettes",30},
        {"soda",10,"juice",10},
        {"alcohol",15,"mre",5},
        {"armorplate",10,"medkit",3},
        {"ammo",300,"shotgunammo",30},
    },

    relationship="MERC"},--Mercenary
    
--[[

    ----------------------------------------------------
    {x=941.28851318359,y=-1497.9661865234,z=35.3410987854,r=100.0,blip=119,color=51,
    models={1885233650},--{-163714847,-1422914553},--,1939545845
    name="~o~Dawn base~s~",
    friends=true,
    tradespace=4,
    trade={
        {"clothes_dawn",1,"dawntokens",30},
        {"ammo",50,"dawntokens",5},
        {"water",1,"dawntokens",1},
        {"mre",1,"dawntokens",2},
        
        
    },
    tradepos={x=933.16302490234,y=-1521.5325927734,z=31.080209732056},
    questpos={x=939.69671630859,y=-1490.0218505859,z=30.226753234863},
    weapons={"carbinerifle","assaultrifle","pumpshotgun_mk2","pistol_mk2"},
    garagepos={x=936.25720214844,y=-1493.1306152344,z=29.95133972168,angle=183.90135192871},
    vehpos={x=955.56359863281,y=-1510.4193115234,z=30.922256469727,angle=357.00952148438},
    vehshop={
        {"GBurrito2",
            {"scrapmetal",500,
            "dawntokens",40,
            "engineparts",3},
        },
    },
    craftpos={x=939.16851806641,y=-1503.8885498047,z=30.415607452393},
    crafts=dawn_crafts,
    spawnpos={x=939.69671630859,y=-1490.0218505859,z=30.226753234863,angle=288.13848876953},
    relationship="DAWN"},--Dawn base

]]

}

--local crafts_blueprints={}



for _,z in pairs(safezones) do
    if z.relationship and type(z.relationship)~="number" then
        z.relationship=GetHashKey(z.relationship)
    end
    if z.weapons then
        for i,w in pairs(z.weapons) do
            if type(w)~="number" then
                local h=GetHashKey(w)
                if IsWeaponValid(h) then
                    z.weapons[i]=h
                else
                    h=GetHashKey("weapon_"..w)
                    if IsWeaponValid(h) then
                        z.weapons[i]=h
                    else
                        z.weapons[i]=GetHashKey("gadget_"..w)
                    end
                end
            end
        end
    end
end
local function in_radius(p1,p2,r)
    local dx,dy,dz=p1.x-p2.x,p1.y-p2.y,p1.z-p2.z
    return dx*dx+dy*dy+dz*dz<r*r
end

local function is_in_polygons(x,y,areas)
	local c=false
	for _,array in pairs(areas) do
		local j=#array
		local b,d=false,(array[j].y>y)
		for i=1,#array do
		  b=(array[i].y>y)
		  if ((b~=d) and (x-array[i].x)<(array[j].x-array[i].x)*(y-array[i].y)/(array[j].y-array[i].y))
			 then c=not c end
		  j=i
		  d=b
		end
	end
    return c
end

local function is_in_safe_zone(x,y,z)
    local dx,dy
    for k,v in pairs(safezones) do
        if not v.raided then
			if v.border then
				if is_in_polygons(x,y,v.border) then
					return v
				end
			else
				dx=v.x-x
				if math.abs(dx)<v.r then
					dy=v.y-y
					if math.abs(dy)<v.r then
						if dx*dx+dy*dy<v.r*v.r then
							v.zonetype="safezone"
							return v
						end
					end
				end
			end
        end
    end
    for k,v in pairs(raids) do
        dx=v.x-x
        if math.abs(dx)<v.r then
            dy=v.y-y
            if math.abs(dy)<v.r then
                if (dx*dx+dy*dy<v.r*v.r) and v.t and v.t~=72 then
                    --WriteNotification("raid:"..v.."/r:"..v.r.."xyz:"..x..y..z)
                        v.zonetype="raid"
                        if not v.name then
                            v.name="Patrol"
                        end
                    return v
                end
            end
        end
    end
    for k,v in pairs(signals) do
        if v.r~=nil then
            dx=v.x-x
            if math.abs(dx)<v.r then
                dy=v.y-y
                if math.abs(dy)<v.r then
                    if dx*dx+dy*dy<v.r*v.r then
                        v.zonetype="signal"
                        if not v.name then
                            v.name="Raider Encampment"
                        end
                        return v
                    end
                end
            end
        end
    end
    return nil
end

local function is_in_patrol(x,y,z,rel)
    for k,v in pairs(raids) do
        if v.t and v.t~=72 and rel==v.relationship then
			local r=v.r*1.5
			local dx=v.x-x
			if math.abs(dx)<r then
				local dy=v.y-y
				if math.abs(dy)<r then
					if (dx*dx+dy*dy<r*r) then
						--WriteNotification("raid:"..v.."/r:"..v.r.."xyz:"..x..y..z)
							v.zonetype="raid"
							v.name="Patrol"
						return k,v
					end
				end
			end
        end
    end
	return nil
end

local function coords_to_dword(x,y,z)
    local t=(
    math.floor(x*20)+
    math.floor(y*20)*19+
    math.floor(z*20)*41)
    return (0xFFFFFFFF&t)
end

Citizen.CreateThread(function()
--for i=0,400 do
	while true do Wait(1000)
		SetHudComponentPosition(6,0.0,-0.15) --vehname
		SetHudComponentPosition(7,0.0,-0.18) --areaname
		SetHudComponentPosition(8,0.0,-0.21) --vehclass
		SetHudComponentPosition(9,0.0,-0.24) --strname
	end
--    local r,g,b,a=GetHudColour(i)
--   g=math.floor((r+g+g+b)/4)
--    SetHudColour(i,g,g,g,a)
--end
end)

local function two_dwords_to_string(a,b)
    local ret=""
    ret=string.char((a%255)+1)..ret
    a=a//255
    ret=string.char((a%255)+1)..ret
    a=a//255
    ret=string.char((a%255)+1)..ret
    a=a//255
    ret=string.char((a%255)+1)..ret
    a=a//255
    ret=string.char((b%255)+1)..ret
    b=b//255
    ret=string.char((b%255)+1)..ret
    b=b//255
    ret=string.char((b%255)+1)..ret
    b=b//255
    ret=string.char((b%255)+1)..ret
    b=b//255
    --now we have two small leftovers of a and b, what should we do with them?
    ret=string.char(a*16+b+1)..ret
end

-- local a=0x202020
-- local s=""
    -- s=string.char((a%255)+1)..s
    -- a=a//255
    -- s=string.char((a%255)+1)..s
    -- a=a//255
    -- s=string.char((a%255)+1)..s
    -- a=a//255
    -- s=string.char((a%255)+1)..s
    -- a=a//255
    -- s=string.char((a%255)+1)..s
    -- a=a//255
    -- s=string.char(a+1)..s
-- local b=0
    -- b=b+string.byte(s,1,1)-1
    -- b=b*255
    -- b=b+string.byte(s,2,2)-1
    -- b=b*255
    -- b=b+string.byte(s,3,3)-1
    -- b=b*255
    -- b=b+string.byte(s,4,4)-1
    -- b=b*255
    -- b=b+string.byte(s,5,5)-1
    -- b=b*255
    -- b=b+string.byte(s,6,6)-1
    -- print(string.format("%x",b))

local function two_dwords_from_string(s)
    -- local c=string.byte(s,9,9)
    -- local a=(string.byte(s,1,1)&0x7F)|((string.byte(s,2,2)&0x7F)<<8)|((string.byte(s,3,3)&0x7F)<<16)|((string.byte(s,4,4)&0x7F)<<24)
    -- |((c&)<<7)|((c&2)<<8)|((c&4)<<14)|((c&8)<<21)
    -- local b=(string.byte(s,5,5)&0x7F)|((string.byte(s,6,6)&0x7F)<<8)|((string.byte(s,7,7)&0x7F)<<16)|((string.byte(s,8,8)&0x7F)<<24)
    -- |((c&16)>>4)|((c&32)<<3)|((c&64)<<9)|((c&128)<<17)
--                         84218421
--                         8<-----1
--                 8<------------2
--         8<-------------------4
-- 8<--------------------------8
-- 84218421842184218421842184218421
--                         84
--                 8<--------2
-- 8<-------------------------1
-- 84218421842184218421842184218421
-- [======][======][======][======]
end

local function save_data()
    local data=""
    for k,v in pairs(looted_array) do
        local k8=(k>>8)
        local k16=(k>>16)
        local k24=(k>>24)
        local v8=(v>>8)
        local v16=(v>>16)
        local v24=(v>>24)
        
        data=data..(string.char(k&255)..string.char(k8&255)..string.char(k16&255)..string.char(k24&255)..string.char(v&255)..string.char(v8&255)..string.char(v16&255)..string.char(v24&255))
    end
    SetResourceKvp("looted_props",data)
end

local function load_data()
    local data=GetResourceKvpString("looted_props")
    local l=string.len(data)
    looted_array={}
    for i=1,l,8 do
        local v=string.byte(data,i+4,i+4)|(string.byte(data,i+5,i+5)<<8)|(string.byte(data,i+6,i+6)<<16)|(string.byte(data,i+7,i+7)<<24)
        if v-current_date<respawn_time then
            local k=string.byte(data,i,i)|(string.byte(data,i+1,i+1)<<8)|(string.byte(data,i+2,i+2)<<16)|(string.byte(data,i+3,i+3)<<24)
            looted_array[k]=v
        end
    end
end

local lsm_random_spawn
Citizen.CreateThread(function()
    while true do
        lsm_random_spawn=GetConvarInt("lsm_random_spawn",0) Wait(1000)
        devmode=(GetConvarInt("lsm_devmode",0)~=0) Wait(1000)
	end
end)


    


-- Citizen.CreateThread(function()
    -- while not NetworkIsPlayerActive(-1) do Wait(0) end
    -- local x=GetResourceKvpFloat("x")
    -- local y=GetResourceKvpFloat("y")
    -- local z=GetResourceKvpFloat("z")
    -- DeleteResourceKvp("x")
    -- DeleteResourceKvp("y")
    -- DeleteResourceKvp("z")
    -- if math.abs(x)>.1 and math.abs(y)>.1 and math.abs(z)>.1 then
        -- local ped=PlayerPedId()
        -- SetEntityCoords(ped,x,y,z)
        -- if z>999 then
            -- GiveWeaponToPed(ped,GetHashKey("gadget_parachute"),1,false,false)
        -- end
    -- end
    -- -- while true do
        -- -- Wait(10000)
        -- -- SetResourceKvpFloat("health",player.health)
        -- -- SetResourceKvpFloat("blood",player.blood)
        -- -- SetResourceKvpFloat("hydration",player.hydration)
        -- -- SetResourceKvpFloat("saturation",player.saturation)
        -- -- local pos=GetEntityCoords(PlayerPedId())
        -- -- SetResourceKvpFloat("x",pos.x)
        -- -- SetResourceKvpFloat("y",pos.y)
        -- -- SetResourceKvpFloat("z",pos.z)
    -- -- end
-- end)
local quest_description={
["quest_bag"]="My personal belongings are in that bag, and I could still have some use for them. There isn't anything valuable to sell, just my ID, driver license, my smartphone, all these things, you know. ",
["quest_pouch"]="There is some important information that I need, like phone numbers of people I knew before. ",
["quest_id"]="I've heard people getting shot by remains of police for looking similar to bandits they're searching for. I'd better have my ID with me now in that case. ",
["quest_usb"]="There is very important data for me. ",
["quest_harddrive"]="If it still works, I could get a lot of very useful info about surviving, medicine and all that stuff. ",
["quest_laptop"]="It's a laptop... of course you understand how important it is to me. ",
["quest_cellphone"]="I'm more interested in my SIM card, but you wont just leave phone there, right? . ",
["quest_docs"]="Just my work documents, I'd really like to continue my work. ",
["quest_disc"]="DVD disc. It's in transparent box. ",
["quest_gameconsole"]="Look, I understand how it sounds, but we're dying of boredom here. It's either guard patrol, maintenance work or raids to city. We need something to relax. ",
["quest_medicalrecords"]="I would never have thought that I would need my medical records in apocalypse... but local doctor says I need them to correctly diagnose my disease. ",
["quest_box"]="That's just a wrapped cardboard box. ",
["quest_keys"]="These are keys from my car, house and workplace. ",

["quest_ring"]="That ring is very important for me... ",
}
local quest_items_vehicles={
"quest_bag",
"quest_pouch",
"quest_id",
"quest_usb",
"quest_harddrive",
"quest_laptop",
"quest_cellphone",
"quest_docs",
"quest_disc",
"quest_gameconsole",
"quest_medicalrecords",
"quest_box",
"quest_keys",
}
local quest_items_corpses={
"quest_pouch",
"quest_ring",
"quest_id",
"quest_usb",
"quest_harddrive",
"quest_cellphone",
"quest_disc",
"quest_keys",
}
local vehicle_weapons_controls={
	13
,	18
,	24
,	69
,	92
,	106
,	122
,	135
,	142
,	144
,	176
,	223
,	229
,	237
,	239
,	240
,	257
,	329
,	346
,	402
,	403
,	404
,	405
,	406
,	407
,	408
,	409
,	410
,	411
,	412
,	413
,25
,68
,70
,91
,114
--,177 --backspace
,222
,225
,238
,240
,330
,331
,347
,402
,403
,404
,405
,406
,407
,408
,409
,410
,411
,412
,413
}

local vehicles_ammo_names={
	["Turret_hud"]="Turret",
	["Rocket_hud"]="Rockets",
	["Cannon_hud"]="Cannon",
	["Grenade_hud"]="Grenades",
	["Mine_hud"]="Mines",
}

local vehicles_ammo={
	["cost"]={
	["Turret_hud"]=1,
	["Rocket_hud"]=50,
	["Cannon_hud"]=50,
	["Grenade_hud"]=20,
	["Mine_hud"]=50,
	},
  [GetHashKey("buzzard")]={ --buzzard
	--multiseat=true,
	[1186503822]={pool="Turret_hud","zm_health",200},--mg
	[-123497569]={pool="Rocket_hud","zm_dying",16},--rockets
  },
  [782665360]={--rhino
	[1945616459]={pool="Rocket_hud","zm_health",50,{69}},--cannon
  },
  [GetHashKey("impaler2")]={--
	[1599495177]={pool="Turret_hud","zm_health",500,{24,69,92,257,114,68}},--minigun
  },
  [GetHashKey("dominator4")]={--
	[-133391601]={pool="Turret_hud","zm_health",500,{24,69,92,257,114,68}},--minigun
  },
  [GetHashKey("deathbike")]={--
	[490982948]={pool="Turret_hud","zm_health",500,{24,69,92,257,114,68}},--minigun
  },
  [GetHashKey("zr380")]={--
	[1790524546]={pool="Turret_hud","zm_health",500,{24,69,92,257,114,68}},--machinegun
  },
  [GetHashKey("scarab")]={--
	[562032424]={pool="Turret_hud","zm_health",500,{24,69,92,257,114,68}},--machinegun
  },
  [GetHashKey("imperator")]={--
	[-1235040645]={pool="Turret_hud","zm_health",500,{24,69,92,257,114,68}},--machinegun
  },
  [GetHashKey("barrage")]={--
	[1200179045]={pool="Turret_hud","zm_health",500},--machinegun
  },
  [GetHashKey("lazer")]={--
	[-494786007]={pool="Turret_hud","zm_health",500},
	[-821520672]={pool="Rocket_hud","zm_dying",20},
  },
  [GetHashKey("ANNIHL")]={
	[1186503822]={pool="Turret_hud","zm_health",3000},
  },
  [GetHashKey("SAVAGE")]={
	[1638077257]={pool="Turret_hud","zm_health",3000},
	[-123497569]={pool="Rocket_hud","zm_dying",60},
  },
  [GetHashKey("VALKYRIE")]={
	[-1538179531]={pool="Turret_hud","zm_health",2000},
	[1097917585]={pool="Grenade_hud","zm_dying",50},
  },
  [GetHashKey("TECHNICAL")]={
	[2144528907]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("HYDRA")]={
	[-494786007]={pool="Turret_hud","zm_health",200},
	[-123497569]={pool="Rocket_hud","zm_dying",30},
  },
  [GetHashKey("INSURGENT")]={
	[1155224728]={pool="Turret_hud","zm_health",1500},
  },
  [GetHashKey("LIMO2")]={
	[729375873]={pool="Turret_hud","zm_health",700},
  },
  [GetHashKey("RUINER2")]={
	[50118905]={pool="Turret_hud","zm_health",300},
	[84788907]={pool="Rocket_hud","zm_dying",10},
  },
  [GetHashKey("BLAZER5")]={
	[-335937730]={pool="Turret_hud","zm_health",300},
  },
  [GetHashKey("TECHNICAL2")]={
	[2144528907]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("BOXVILLE5")]={
	[-1253095144]={pool="Turret_hud","zm_health",5000},
  },
  [GetHashKey("TRSMALL2")]={
	[1192341548]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("APC")]={
	[190244068]={pool="Turret_hud","zm_health",1000},
	[328167896]={pool="Cannon_hud","zm_dying",30},
  },
  [GetHashKey("HALFTRACK")]={
	[1331922171]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("OPPRESSOR")]={
	[-651022627]={pool="Turret_hud","zm_health",100},
  },
  [GetHashKey("TAMPA3")]={
	[-624592211]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("DUNE3")]={
	[-787150897]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("NIGHTSHARK")]={
	[-1508194956]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("ARDENT")]={
	[-1001503935]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("HAVOK")]={
	[855547631]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("STARLING")]={
	[1595421922]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("ROGUE")]={
	[158495693]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
	[-416629822]={upgrade={10,1},pool="Turret_hud","zm_health",1000},
	[1820910717]={upgrade={5,0},pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("TULA")]={
	[1100844565]={pool="Turret_hud","zm_health",1000},
	[1217122433]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("microlight")]={
	[-991944340]={upgrade={10,0},pool="Turret_hud","zm_health",500},
  },
  [GetHashKey("MOLOTOK")]={
	[1595421922]={pool="Turret_hud","zm_health",500},
	[-901318531]={upgrade={10,0},pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("BOMBUSHKA")]={
	[-666617255]={pool="Turret_hud","zm_health",10000},
  },
  [GetHashKey("MOGUL")]={
	[-437014993]={pool="Turret_hud","zm_health",1000},
	[-166158518]={pool="Turret_hud","zm_health",1000},
	[-486730914]={pool="Turret_hud","zm_health",1000},
	[-1171817471]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("PYRO")]={
	[1595421922]={pool="Turret_hud","zm_health",1000},
	[-901318531]={upgrade={10,0},pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("VIGILANTE")]={
	[-200835353]={pool="Turret_hud","zm_health",1000},
	[-200835353]={upgrade={10,0},pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("SEABREEZE")]={
	[1371067624]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("NOKOTA")]={
	[1595421922]={pool="Turret_hud","zm_health",1000},
	[-901318531]={upgrade={10,0},pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("HUNTER")]={
	[153396725]={pool="Rocket_hud","zm_dying",50},
	[785467445]={pool="Rocket_hud","zm_dying",50},
	[1119518887]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("COMET4")]={
	[-358074893]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("AKULA")]={
	[431576697]={upgrade={5,0},pool="Rocket_hud","zm_dying",50},
	[2092838988]={upgrade={5,1},pool="Rocket_hud","zm_dying",50},
	[476907586]={pool="Turret_hud","zm_health",1000},
	[-1246512723]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("VOLATOL")]={
	[1150790720]={pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("BARRAGE")]={
	[-146175596]={pool="Turret_hud","zm_health",1000},
	[1000258817]={pool="Turret_hud","zm_health",1000},
	[1200179045]={pool="Turret_hud","zm_health",1000},
	[525623141]={pool="Turret_hud","zm_health",1000},
	[-1538514291]={upgrade={0,1},pool="Grenade_hud","zm_dying",100},
  },
  [GetHashKey("KHANJALI")]={
	[711953949]={pool="Turret_hud","zm_health",1000},
	[507170720]={pool="Cannon_hud","zm_dying",50},
	[-2088013459]={pool="Cannon_hud","zm_dying",50},
	[394659298]={upgrade={5,0},pool="Grenade_hud","zm_armor",100},
	[394659298]={upgrade={5,0},pool="Grenade_hud","zm_armor",100},
  },
  [GetHashKey("STROMBERG")]={
	[1176362416]={pool="Turret_hud","zm_health",1000},
	[-729187314]={pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("DELUXO")]={
	[-1694538890]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
	[-1258723020]={upgrade={10,0},pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("THRUSTER")]={
	[1697521053]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
	[1177935125]={upgrade={10,1},pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("AVENGER")]={
	[-1738072005]={upgrade={10,0},pool="Cannon_hud","zm_health",50},
	[-1738072005]={upgrade={10,1},pool="Cannon_hud","zm_health",50},
  },
  [GetHashKey("SAVESTRA")]={
	[-348002226]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("VISERIS")]={
	[-2019545594]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("REVOLTER")]={
	[-1117887894]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
  },
  [GetHashKey("CARACARA")]={
	[1338760315]={pool="Turret_hud","zm_health",1000},
	[1338760315]={pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("SPARROW")]={
	[855547631]={upgrade={10,0},pool="Turret_hud","zm_health",1000},
	[-123497569]={upgrade={10,1},pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("STRIKEFORCE")]={
	[955522731]={pool="Turret_hud","zm_health",1000},
	[519052682]={pool="Rocket_hud","zm_dying",50},
	[968648323]={pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("OPPRESSOR2")]={
	[-498786858]={pool="Turret_hud","zm_health",300},
	[-699583383]={upgrade={10,0},pool="Grenade_hud","zm_dying",20},
	[1966766321]={upgrade={10,1},pool="Rocket_hud","zm_armor",20},
  },
  [GetHashKey("SCRAMJET")]={
	[231629074]={pool="Turret_hud","zm_health",1000},
	[-1125578533]={pool="Rocket_hud","zm_dying",50},
  },
  [GetHashKey("MENACER")]={
	[-540346204]={pool="Turret_hud","zm_health",1000},
	[1155224728]={pool="Turret_hud","zm_health",1000},
	[-1433899528]={pool="Turret_hud","zm_health",1000},
  },
}

local item_weight={
blueprint=0.1,
milspecplastic=0.35,
industrialplastic=0.15,
milspecmetal=1.4,
industrialscrapmetal=1.2,
packofheroin=1.0,
packofcocaine=1.0,
leadscrap=1.0,
milspecfabrics=0.5,
industrialfabrics=0.3,
scrapfabrics=0.4,
milspecelectronicscrap=0.3,
electronicscrap=0.2,
industrialelectronicscrap=0.1,
level3plates=0.5,
level3asoftplate=0.3,
riothelmet=0.6,
machinegun=6.0,
hatchet=0.56,
golfclub=0.43,
switchblade=0.15,
knife=0.3,
dagger=0.4,
bat=1.5,
battleaxe=1.2,
crowbar=1.8,
flashlight=0.3,
knuckle=0.15,
machete=0.7,
wrench=1.3,
poolcue=0.59,
molotov=1.1,
pipebomb=1.4,
flaregun=0.5,
ball=0.1,
snspistol=0.8,
vintagepistol=1.15,
pistol=0.9,
combatpistol=0.8,
doubleaction=1.3,
revolver=1.4,
appistol=1.1,
heavypistol=1.25,
marksmanpistol=1.9,
pistol50=1.8,
pistol_mk2=1.05,
revolver_mk2=1.3,
pistol_mk2=1.05,
dbshotgun=2.5,
musket=4.5,
assaultshotgun=4.9,
bullpupshotgun=4.1,
heavyshotgun=3.1,
pumpshotgun=2.4,
pumpshotgun_mk2=2.6,
snspistol_mk2=0.8,
sawnoffshotgun=1.9,
autoshotgun=3.2,
assaultsmg=2.2,
combatmg=6.4,
combatmg_mk2=5.7,
combatpdw=2.7,
gusenberg=3.7,
machinepistol=1.1,
mg=5.4,
microsmg=2.0,
minismg=1.75,
smg=2.85,
smg_mk2=2.35,
advancedrifle=2.75,
assaultrifle=3.0,
assaultrifle_mk2=3.2,
bullpuprifle=3.5,
bullpuprifle_mk2=3.6,
carbinerifle=3.1,
carbinerifle_mk2=3.15,
compactrifle=2.65,
specialcarbine=3.2,
specialcarbine_mk2=3.45,
heavysniper=5.0,
sniperrifle=3.6,
marksmanrifle=3.8,
marksmanrifle_mk2=4.0,
heavysniper_mk2=5.2,
compactlauncher=1.3,
grenadelauncher=4.6,
assaultshotgun=5.4,
petrolcan=5.0,
bottle=0.25,
rpg=6.4,
flare=1.1,
minigun=25.0,
extinguisher=1.3,
nightstick=0.35,
proxmine=0.8,
hammer=0.65,
grenade=0.3,
bzgas=0.4,


water=1.0,
canfood=0.6,
fish=0.7,
gasoline=0.75,
mre=1.2,
meat=1.3,
chemicals=2.8,
ammo=0.012,
engineparts=5.0,
soda=0.5,
juice=1.0,
bandage=0.3,
medkit=1.5,
alcohol=0.8,
weed=0.1,
pistolammo=0.007,
heavyrifleammo=0.025,
shotgunammo=0.1,
food=0.65,
cash=0.001,
cigarettes=0.1,
scrapmetal=0.5,
scrapplastic=0.1,
rags=0.3,
gasmask=1.0,
tattookey=0.05,
barberkey=0.05,
provisionkey=0.05,
gunstorekey=0.05,
flaregunammo=0.15,
bodyarmor=4.5,
brasscatcher=0.4,
casings=0.01,
gunpowder=0.25,
riflecasings=0.02,
radio=0.7,
aircraftfuel=0.5,
sheriffkey=0.05,
policedocs=0.2,
painkillers=0.1,
quest_bag=4.0,
quest_pouch=0.3,
quest_ring=0.05,
quest_id=0.1,
quest_usb=0.05,
quest_harddrive=0.4,
quest_laptop=1.3,
quest_cellphone=0.4,
quest_docs=0.5,
quest_disc=0.15,
quest_gameconsole=2.0,
quest_medicalrecords=0.5,
quest_box=6.5,
quest_keys=0.2,
smgammo=0.008,
mgammo=0.05,
launchergrenade=0.7,
clothes_marauder=5.5,
clothes_camouflage=7.8,
clothes_trucker=3.0,
clothes_ordinary=3.0,
clothes_trash=3.0,
clothes_gang=3.0,
clothes_business=2.0,
armorplate=2.0,
clothes_offdutysheriff=9.2,
cowboyhat=0.7,
pmccap=0.3,
tacticalglasses=0.05,
halfmask=0.2,
roninmask=0.5,
tapemask=0.1,
blackopstacticalhelmet=1.1,
maraudercombathelmet=2.2,
specopscommsgear=0.7,
smugglersgarb=0.4,
smugglersshemagh=0.4,
cheekiheavyhelmet=4.5,
balaclava=0.3,
tshirtmask=0.5,
camocap=0.3,
clothes_explorer=11.2,
clothes_mercenary=26.2,
clothes_banditgoon=6.8,
clothes_police=8.7,
clothes_pmc=7.0,
clothes_combat_green=13.0,
clothes_combat_desert=13.0,
clothes_loner=5.0,
lowcap=0.3,
clothes_banditmercenary=18.0,
clothes_riot=6.0,
clothes_smugglerslight=4.0,
clothes_toughguy=6.0,
clothes_rookie=4.0,
clothes_breekiscavenger=5.5,
clothes_combatmarauder=6.5,
clothes_mercexperimental=7.5,
clothes_merclight=5.5,
clothes_gunrunner=14.0,
clothes_smugglers=8.0,
clothes_scavenger=4.3,
clothes_banditauthority=6.5,
clothes_dawn=8.5,
dawntokens=0.1,
grip=0.1,
flashlight_small=0.3,
flashlight_large=0.5,
suppressor_1=0.8,
suppressor_2=0.9,
suppressor_3=1.0,
suppressor_4=1.4,
suppressor_5=1.6,
scope_1=0.1,
scope_2=0.2,
scope_3=0.3,
scope_advanced=0.4,
bandits_records=0.15,
cues=3.5,
scope_compactholo=0.1,
muzzlebrake_1=0.1,
heavybarrel=1.4,
scope_nightvision=1.8,
scope_thermal=2.2,
backpack=1.3,
duffelbag=2.0,
tirerepair=1.0,
fruits=0.4,
trashfood=0.6,
}
local function get_item_weight(itemname)
	local itemweight=0.0
	if string.find(itemname,"+") then
		local parts={}
		local itemname=itemname
		parts=split_text(itemname,"+")
		for k,v in pairs(parts) do
			itemweight=itemweight+(item_weight[v] or 0.0)
		end
	else
		itemweight=item_weight[itemname] or 0.0
	end
	return itemweight
end
local item_names={
jerrycan="Jerry Can",
hatchet="Hatchet",
golfclub="Golfclub",
switchblade="Switchblade",
knife="Knife",
dagger="Dagger",
bat="Bat",
battleaxe="Battleaxe",
crowbar="Crowbar",
flashlight="Flashlight",
knuckle="Brass Knuckles",
machete="Machete",
wrench="Wrench",
poolcue="Pool Cue",
molotov="Molotov",
pipebomb="Homemade Pipe Bomb",
flaregun="Flare Gun",
ball="Ball",
snspistol="Shrewsbury Compact Pistol",
vintagepistol="Shrewsbury Semi-Automatic Pistol",
pistol="Hawk & Little Semi-Automatic Pistol",
combatpistol="Hawk & Little Combat Pistol",
doubleaction="Antique Double-Action Revolver",
revolver="Hawk & Little Heavy Revolver",
appistol="Vom Feuer Armor-Piercing Pistol",
heavypistol="Hawk & Little Heavy Pistol",
marksmanpistol="Antique Marksman Pistol",
pistol50="Hawk & Little Desert Eagle",
pistol_mk2="Hawk & Little Tactical Semi-Automatic Pistol",
revolver_mk2="Hawk & Little Tactical Heavy Revolver",
dbshotgun="Shrewsbury Double Barrel Shotgun",
musket="Antique Musket",
assaultshotgun="Vom Feuer Automatic Assault Shotgun",
bullpupshotgun="Hawk & Little Automatic Bullpup Shotgun",
heavyshotgun="Shrewsbury Heavy Shotgun",
pumpshotgun="Shrewsbury Pump Shotgun",
pumpshotgun_mk2="Shrewsbury Tactical Pump Shotgun",
snspistol_mk2="Shrewsbury Tactical Compact Pistol",
sawnoffshotgun="Hawk & Little Short Shotgun",
autoshotgun="Vom Feuer Automatic Assault Shotgun",
assaultsmg="Vom Feuer Assault Submachine Gun",
combatmg="Shrewsbury Heavy Machine Gun",
combatmg_mk2="Vom Feuer Tactical Compact Machine Gun",
combatpdw="Coil Combat Personal Defense Weapon",
gusenberg="Antique Submachine Gun",
machinepistol="Vom Feuer Submachine Pistol",
mg="Vom Feuer Compact Machine Gun",
microsmg="Hawk & Little Micro Submachine Gun",
minismg="Hawk & Little Scorpion Submachine Gun",
smg="Hawk & Little Submachine Gun",
smg_mk2="Hawk & Little Tactical Submachine Gun",
advancedrifle="Vom Feuer Advanced Assault Rifle",
rocket="Rocket",
assaultrifle="Shrewsbury Assault Rifle",
assaultrifle_mk2="Shrewsbury Tactical Assault Rifle",
bullpuprifle="Hawk & Little Bullpup Assault Rifle",
bullpuprifle_mk2="Hawk & Little Tactical Bullpup Assault Rifle",
carbinerifle="Vom Feuer Carbine Assault Rifle",
carbinerifle_mk2="Vom Feuer Tactical Carbine Assault Rifle",
compactrifle="Shrewsbury Compact Assault Rifle",
specialcarbine="Vom Feuer Special Carbine",
specialcarbine_mk2="Vom Feuer Tactical Special Carbine",
heavysniper="Vom Feuer Heavy Sniper Rifle",
sniperrifle="Shrewsbury Bolt-Action Sniper Rifle",
marksmanrifle="Vom Feuer Marksman Rifle",
marksmanrifle_mk2="Vom Feuer Tactical Marksman Rifle",
heavysniper_mk2="Vom Feuer Tactical Heavy Sniper Rifle",
compactlauncher="Shrewsbury Compact Grenade Launcher",
grenadelauncher="Shrewsbury Cyclic Grenade Launcher",
petrolcan="Petrol Can",
bottle="Bottle",
rpg="Shrewsbury Rocket Launcher",
flare="Emergency Flare",
minigun="Minigun",
extinguisher="Fire extinguisher",
nightstick="Nightstick",
proxmine="Proximity Mine",
stickybomb="Sticky Bomb",
hammer="Hammer",
grenade="Fragmentation Grenade",
bzgas="Tear Gas Grenade",

water="Water",
canfood="Canned food",
fish="Cooked Fish",
gasoline="Gasoline",
mre="Military Ration",
meat="Cooked Meat",
chemicals="Chemicals",
ammo="Rifle Ammunition",
engineparts="Engine Rebuild Kit",
soda="Soda",
juice="Juice",
bandage="Bandage",
medkit="Medkit",
alcohol="Alcohol",
weed="Weed",
pistolammo="Pistol Ammunition",
heavyrifleammo="Sniper Ammunition",
shotgunammo="Shotgun Ammunition",
food="Food",
cash="Cash",
cigarettes="Cigarettes",
scrapmetal="Scrap Metal",
level3asoftplate="Level llla Soft Plates",
level3plates="Level lll Plates",
electronicscrap="Electronic Scrap",
industrialelectronicscrap="Industrial Electronic Scrap",
milspecelectronicscrap="Milspec Electronic Scrap",
industrialfabrics="Industrial Fabrics",
milspecfabrics="Milspec Fabrics",
leadscrap="Lead Scrap",
industrialscrapmetal="Industrial Metal Scrap",
milspecmetal="Milspec Metal Scrap",
industrialplastic="Industrial Plastic Scrap",
milspecplastic="Milspec Plastic Scrap",
scrapplastic="Scrap Plastic",
rags="Rags",
gasmask="Gasmask",
tattookey="Tattoo Parlor Key",
barberkey="Barbershop Key",
provisionkey="Grocery Store Key",
gunstorekey="Firearms Store Key",
flaregunammo="Flaregun Cartridges",
bodyarmor="Body Armor",
brasscatcher="Brass Catcher",
casings="Small Caliber Brass Casings",
gunpowder="Case of Gun Powder",
riflecasings="Standard Caliber Brass Casings",
radio="Radio",
aircraftfuel="Naphtha Kerosene",
sheriffkey="Sheriff Office Key",
policedocs="Police Documents",
painkillers="Painkillers",
quest_bag="Bag",
quest_pouch="Pouch",
quest_ring="Ring",
quest_id="ID Card",
quest_usb="USB Flash Drive",
quest_harddrive="Hard Drive",
quest_laptop="Laptop",
quest_cellphone="Cellphone",
quest_docs="Documents",
quest_disc="DVD disc",
quest_gameconsole="Game Console",
quest_medicalrecords="Medical Records",
quest_box="Box",
quest_keys="Keys",
smgammo="Submachine Gun Ammunition",
mgammo="Machinegun Ammunition",
launchergrenade="40mm Grenade",
clothes_marauder="Light Combat Clothes",
clothes_camouflage="Light Camouflaged Clothes",
armorplate="Level lV Plates",
clothes_offdutysheriff="Camouflaged Raincoat",
cowboyhat="Cowboy Hat",
pmccap="Private Military Cap",
tacticalglasses="Ballistic Glasses",
halfmask="Bandana Mask",
roninmask="Ronin Tactical Helmet",
tapemask="Raider Tape Mask",
blackopstacticalhelmet="Black Ops Tactical Helmet",
maraudercombathelmet="Marauder Combat Helmet",
specopscommsgear="Spec Ops Comms Gear",
smugglersgarb="Smugglers Garb",
smugglersshemagh="Smugglers Shemagh",
cheekiheavyhelmet="Cheeki Heavy Helmet",
balaclava="Balaclava",
tshirtmask="T-shirt Mask",
camocap="Camouflaged Cap",
clothes_explorer="Explorer Gear",
clothes_pmc="PMC Operator Outfit",
clothes_trash="Dirty Clothes",
clothes_combat_green="Green Advanced Combat Gear",
clothes_combat_desert="Desert Advanced Combat Gear",
clothes_loner="Survival Gear",
clothes_mercenary="Mercenary Armor",
clothes_banditgoon="Bandit Clothes",
clothes_police="Police Uniform",
lowcap="Beanie",
clothes_banditmercenary="Marauder Armor",
clothes_riot="Police Riot Gear",
clothes_smugglerslight="Light Smugglers Outfit",
clothes_toughguy="Tough Guy Outfit",
clothes_rookie="The “Rookie” Outfit",
clothes_breekiscavenger="Breeki Scavenger Outfit",
clothes_combatmarauder="Marauder Light Combat Outfit",
clothes_mercexperimental="Merc Experimental Outfit",
clothes_merclight="Merc Light Outfit",
clothes_gunrunner="Gunrunner Outfit",
clothes_smugglers="Smugglers Outfit",
clothes_scavenger="Scavenger Jacket",
clothes_banditauthority="Bandit Jacket",
clothes_dawn="Dawn Uniform",
dawntokens="Dawn Token",
grip="Angular Grip",
flashlight_small="Compact Flashlight",
flashlight_large="Large Flashlight",
suppressor_1="Small Suppressor",
suppressor_2="Medium Suppressor",
suppressor_3="Standard Suppressor",
suppressor_4="Shotgun Suppressor",
suppressor_5="Large Suppressor",
scope_1="Small Holographic Sight",
scope_2="Standard Holographic Sight",
scope_3="Tactical Holographic Sight",
scope_advanced="Advanced Scope",
bandits_records="Bandit Records",
cues="Cues",
scope_compactholo="Compact Holographic Sight",
muzzlebrake_1="Tactical Muzzle Brake",
heavybarrel="Reinforced Rifle Barrel",
scope_nightvision="Night Vision Scope",
scope_thermal="Thermal Vision Scope",
backpack="Backpack",
duffelbag="Bag",
tirerepair="Tire Repair Kit",
clothes_trucker="Trucker Clothes",
clothes_business="Business Clothes",
clothes_ordinary="Ordinary Clothes",
clothes_gang="Gang Clothes",
fruits="Fruits",
trashfood="Leftover food",
vulcanammo="Vulcan Ammunition",
rocketammo="Explosive Rocket",
guidedammo="Guided Rocket",
scrapfabrics="Fabrics",
}
local item_descriptions={
scrapfabrics="A collection of assorted fabric scraps. Useful for crafting items. Can also stop bleeding.",
vulcanammo="Large caliber belt fed ammunition, typically used in military grade weapons (such as miniguns.)",
guidedammo="A guided explosive rocket, used in advanced launcher weapons",
rocketammo="An explosive rocket, used in launcher weapons.",
hatchet="A typical household hammer. Useful for causing blunt trauma.",
golfclub="A fancy golf club. Useful for inflicting blunt trauma.",
switchblade="A small retracting knife.",
knife="A serrated combat knife.",
dagger="A small dagger.",
bat="A typical American baseball bat. Useful for inflicting blunt trauma.",
battleaxe="A large melee weapon.",
crowbar="A standard steel crowbar.",
flashlight="A small handheld flashlight.",
knuckle="A set of metal knuckles.",
machete="A sharp machete.",
wrench="A typical utility wrench.",
poolcue="A broken wooden pool cue.",
molotov="A crudely fashioned flammable grenade.",
pipebomb="A crude high explosive.",
flaregun="A standard utility flare launcher.",
ball="A typical American baseball.",
snspistol="A compact semi-automatic pistol.",
vintagepistol="A crude semi-automatic pistol.",
pistol="A standard semi-automatic pistol.",
combatpistol="A compact semi-automatic pistol.",
doubleaction="An antique semi automatic revolver.",
revolver="A powerful semi automatic handgun.",
appistol="An advanced automatic armor-piercing pistol.",
heavypistol="A semi-automatic pistol integrated with holographic optics.",
marksmanpistol="A powerful single shot handgun.",
pistol50="A large caliber semi-automatic pistol.",
pistol_mk2="A tactical variant of the semi-automatic pistol, with expanded attachment capacity.",
revolver_mk2="A tactical variant of the large caliber semi-automatic handgun, with expanded attachment capacity.",
dbshotgun="A semi-automatic double barrel shotgun.",
musket="A powerful single shot rifle.",
assaultshotgun="An advanced automatic variant of the standard shotgun.",
bullpupshotgun="An advanced shotgun with bullpup magazine configuration.",
heavyshotgun="An advanced semi-automatic shotgun, loaded with slug shotgun shells.",
pumpshotgun="A standard pump-action shotgun.",
pumpshotgun_mk2="A tactical variant of the pump-action shotgun, with expanded attachment capacity.",
snspistol_mk2="A tactical variant of the compact semi-automatic pistol, with expanded attachment capacity.",
sawnoffshotgun="A compact semi-automatic shotgun.",
autoshotgun="An advanced automatic variant of the standard shotgun.",
assaultsmg="An advanced ergonomic variant of the submachine gun.",
combatmg="A heavy automatic machine gun.",
combatmg_mk2="A tactical variant of the compact machine gun, with expanded attachment capacity.",
combatpdw="An advanced integrally suppressed submachine gun.",
gusenberg="An antique automatic submachine gun.",
machinepistol="A compact automatic submachine gun.",
mg="A lightweight variant of the heavy machine gun.",
microsmg="A compact variant of the submachine gun.",
minismg="A compact automatic submachine gun.",
smg="A standard submachine gun.",
smg_mk2="A tactical variant of the submachine gun, with expanded attachment capacity.",
advancedrifle="An advanced ergonomic variant of the standard assault rifle.",
assaultrifle="A crude automatic assault rifle.",
assaultrifle_mk2="A tactical variant of the assault rifle, with expanded attachment capacity.",
bullpuprifle="An advanced assault rifle with bullpup magazine configuration.",
bullpuprifle_mk2="A tactical variant of the automatic bullpup assault rifle, with expanded attachment capacity.",
carbinerifle="A standard automatic assault rifle.",
carbinerifle_mk2="A tactical variant of the carbine assault rifle, with expanded attachment capacity.",
compactrifle="A crude compact assault rifle.",
specialcarbine="An advanced carbine assault rifle.",
specialcarbine_mk2="A tactical variant of the special carbine assault rifle, with expanded attachment capacity.",
heavysniper="A semi-automatic large caliber sniper rifle capable of penetrating heavy armor.",
sniperrifle="A bolt-action long range sniper rifle.",
marksmanrifle="A semi-automatic standard caliber sniper rifle.",
marksmanrifle_mk2="A tactical variant of the standard marksman rifle, with expanded attachment capacity.",
heavysniper_mk2="A tactical variant of the standard heavy sniper rifle, with expanded attachment capacity.",
compactlauncher="A compact single shot grenade launcher.",
grenadelauncher="A semi-automatic high explosive grenade launcher.",
petrolcan="Petrol Can",
bottle="A sharp broken bottle.",
rpg="A crude high explosive rocket launcher.",
rocket="Rocket for vehicle cannons.",
flare="A small red smoke flare that emits a bright red light.",
minigun="Minigun",
extinguisher="Fire extinguisher",
nightstick="A standard police nightstick.",
proxmine="An advanced proximity explosive.",
stickybomb="An advanced remote explosive.",
hammer="A typical household hammer. Useful for causing blunt trauma.",
grenade="A high explosive fragmentation grenade.",
bzgas="A non-lethal tear gas grenade.",

water="A plastic bottle filled with fresh water.",
canfood="A canned ration of hearty yet well preserved food.",
fish="A piece of well cooked fresh fish.",
gasoline="A liter of pure unleaded gasoline. Used in standard combustion engines.",
mre="A military ration containing filtered water and a variety of well preserved food.",
meat="A piece of well cooked fresh meat.",
chemicals="A liter of purified liquid chemical compounds. Useful when crafting items.",
ammo="A box of standard caliber ammunition, commonly used in assault rifles.",
engineparts="A box of spare parts, tools, and motor oil. Can be used to repair engines.",
soda="A sealed can of carbonated sugary water.",
juice="A sealed pack of natural fruit juice.",
bandage="A sterilized piece of mesh cloth. Useful when healing common injuries.",
medkit="A box of bandages, antibiotics, and medical ointments. Useful when healing more serious wounds.",
alcohol="A bottle of flavored alcohol. Not particularly hydrating.",
weed="A small bag of recreational marijuana.",
pistolammo="A box of small caliber ammunition, commonly used in smaller handguns.",
heavyrifleammo="A box of large caliber ammunition, commonly used in larger sniper rifles.",
shotgunammo="A box of medium caliber shells, commonly used in standard shotgun rifles.",
food="A package of assorted foods.",
cash="Traditional paper currency. Still valuable among some factions.",
cigarettes="A pack of cigarettes. A rare and valuable commodity among survivors.",
scrapmetal="A collection of assorted metalic pieces. Useful when crafting items.",
scrapplastic="Some crumpled chunks of common plastic. Useful when crafting items.",
rags="A few strips of torn cloth. Not useful for much... but can be used to stop bleeding.",
gasmask="An industrial grade gas mask. Protects against radioactive and toxic pollutants.",
tattookey="Manager's key to a small tattoo parlor.",
barberkey="Manager's key to a small barber shop.",
provisionkey="Manager's key to a local grocery store.",
gunstorekey="Manager's key to a local firearms store.",
flaregunammo="A box of flare cartridges, used in flare pistols.",
bodyarmor="A plate carrier vest. Allows the wearer to equip armor plates.",
brasscatcher="A specialized weapon attachment that allows the user to reclaim spent bullet casings.",
casings="Spent small caliber bullet casings. Useful when crafting items.",
gunpowder="A sealed case of smokeless gun powder. Useful when crafting items.",
riflecasings="Spent standard caliber bullet casings. Useful when crafting items.",
radio="A simple compact dual band radio.",
aircraftfuel="A liter of pure unleaded naphtha kerosene. Used in high performance aircraft engines.",
sheriffkey="Master key to a local sheriff department.",
policedocs="A folder containing detailed records of local convicts.",
painkillers="A bottle of prescription medication tablets. Provides temporary relief to serious injuries.",
quest_bag="A bag containing assorted personal items.",
quest_pouch="A pouch containing a variety of small personal items.",
quest_ring="A small embroidered ring.",
quest_id="An identification card.",
quest_usb="A small USB flash drive.",
quest_harddrive="A large computer hard drive.",
quest_laptop="A computer laptop. The battery seems to be dead.",
quest_cellphone="A personal cellphone. The battery seems to be dead.",
quest_docs="A collection of personal documents.",
quest_disc="A compact disc inside a jewel case.",
quest_gameconsole="An old game console. The battery seems to be dead.",
quest_medicalrecords="A collection of medical documents.",
quest_box="A box containing assorted personal items.",
quest_keys="A ring of unidentified keys.",
smgammo="A box of medium caliber ammunition, commonly used in submachine guns.",
mgammo="A belt of large caliber ammunition, commonly used in heavy machine guns.",
launchergrenade="A large caliber explosive cartridge, used in grenade launchers.",
clothes_marauder="Light weight well fitted tactical clothing.",
clothes_camouflage="Light weight well fitted camouflaged clothing.",
armorplate="A bullet proof trauma pad. Used with plate carrier vests to provide ballistic protection.",
clothes_offdutysheriff="A large camouflaged raincoat.",
cowboyhat="A stylish cowboy hat.",
pmccap="A typical baseball cap, branded with the insignia of a notorious private military company.",
tacticalglasses="A set of highly durable tactical glasses with ballistic grade protection.",
halfmask="A bandana fashioned into a crude mask. Useful for disguising identity.",
roninmask="An advanced combat helmet. Exceptionally rare.",
tapemask="Used by raiders and marauders to hide their ugly drug ridden faces. Also helps keep the dust out. Kinda.",
blackopstacticalhelmet="Top of the line Ops-Core helmet fitted with L-3 GPNVG Nightvision and a ballistic face guard. Highest speed lowest of drag.",
maraudercombathelmet="A modified mask and helmet combo made at the Marauder base. This helmet provides ballistic protection as well as functioning as a gas mask.",
specopscommsgear="Tactical headset and balaclava used for operational missions and security",
smugglersgarb="A shady shemagh use to hide the face of smugglers",
smugglersshemagh="A standard shemagh that covers the head and face. Popular among smugglers.",
cheekiheavyhelmet="A heavy russian Atlyn helmet with a very Cheeki Breeki fask mask. Used mainly in heavy combat zones for its good ballistic resistance.",
balaclava="A full balaclava face mask. Useful for disguising identity.",
tshirtmask="A crude mask fashioned from a ragged t-shirt.",
camocap="A camouflaged military cap.",
clothes_explorer="A heavy set of expedition hardwear. Slowly regenerates health when injured.",
clothes_pmc="A popular choice for Heros in the wasteland of Los Santos.Tactical Rig, Scarf and flannel. What's more operator than a flannel? Nothing really.",
clothes_trash="A set of unclean clothes. Hopefully you won't need to wear these long.",
clothes_combat_desert="A set of high quality combat gear.",
clothes_combat_green="A set of high quality combat gear.",
clothes_loner="A set of high quality survivor gear. Useful for staying alive.",
clothes_mercenary="A set of mercenary combat armor. Provides ballistic damage resistance at the cost of mobility.",
clothes_banditgoon="A thick set of clothes typically worn by bandits. Provides light melee damage resistance.",
clothes_police="A traditional police uniform.",
lowcap="A standard polyester knitted beanie.",
clothes_banditmercenary="A set of marauder combat armor. Provides ballistic damage resistance at the cost of mobility.",
clothes_riot="A set of police riot armor. Provides great melee damage resistance.",
clothes_smugglerslight="Light Smugglers Outfit. Great for getting away when your smuggling drugs.",
clothes_toughguy="The guy who goes into a club with this jacket fucks. He doesn’t just pick up girls, he just fucks right then and there. Made from quality leather.",
clothes_rookie="Hot shot rookie straight from the academy. Rocking a badge, a second badge because fuck you and a gun. Too cool for a uniform.",
clothes_breekiscavenger="Similar to the Scavengers outfit, just way mo’ Cheeki Breeki. Sick track-suit Jacket in Black, Combat Gorka Pants and Combat Boots.",
clothes_combatmarauder="Typical marauder combat outfit. Badass leather vest with sick patches. Fitted with Heavy riders boots perfect for the Death Bike.",
clothes_mercexperimental="An experimental armored combat uniform used by the Mercenary’s in Los Santos. Equipped with a special armored vest. Quite Heavy.",
clothes_merclight="A light outfit with combat pants and an armored vest. Cool Mercs don’t need a shirt. They just wear a plate carrier for extra badassness.",
clothes_gunrunner="Outfit worn by gunrunners during firearm smuggling operations.",
clothes_smugglers="A smugglers uniform. Wear only if you plan on doing some shady business.",
clothes_scavenger="A heavy set of warm clothes.",
clothes_banditauthority="A sleek leather jacket, typically worn by elite bandits.",
clothes_dawn="A standard uniform of the Dawn faction. Protects against melee attacks.",
dawntokens="A small metal token, with a unique number inscribed on the front.",
grip="An angled rail mounted foregrip.",
flashlight_small="A small compact rail mounted flashlight. Compatible with small pistols and submachine guns.",
flashlight_large="A large rail mounted flashlight. Compatible with large rifles and shotguns.",
suppressor_1="A suppressor compatible with small caliber handguns.",
suppressor_2="A suppressor compatible with medium caliber submachine guns.",
suppressor_3="A suppressor compatible with standard caliber assault rifles.",
suppressor_4="A suppressor compatible with large caliber shotguns.",
suppressor_5="A suppressor compatible with large caliber sniper rifles.",
scope_1="A small rail mounted holographic sight.",
scope_2="A standard rail mounted holographic sight.",
scope_3="A tactical rail mounted holographic sight.",
scope_advanced="An advanced high powered rail mounted rifle scope with variable magnification.",
bandits_records="A collection of documents containing detailed plans for heists and building schematics.",
cues="Cues that are named.",
scope_compactholo="An advanced rail mounted compact holographic sight.",
muzzlebrake_1="A tactical muzzle brake compatible with most advanced weapons.",
heavybarrel="A reinforced rifled barrel compatible with most advanced weapons.",
scope_nightvision="An advanced night vision scope compatible with heavy sniper rifles.",
scope_thermal="An advanced thermal optic compatible with heavy sniper rifles.",
backpack="A standard backpack which increases a wearer's carrying capacity.",
duffelbag="A large bag which drastically increases a wearer's carry capacity.",
tirerepair="A generic repair kit containing all needed supplies to repair or replace damaged car tires.",
clothes_trucker="A heavy set of trucker clothes.",
clothes_business="A professional set of high quality business clothes.",
clothes_ordinary="A set of ordinary clothes.",
clothes_gang="A set of clothes branded with generic gang insignia.",
fruits="An assortment of whole fresh fruit.",
trashfood="A box of leftover food, that doesn't seem rotten.",
electronicscrap="An assorted bunch of broken electronics. Useful for crafting items.",
petrolcan="A metal can typically used for holding combustible liquids.",
level3asoftplate="A set of civilian grade armor plates. These offer limited protection.",
level3plates="A set of high grade armor plates. These offer expanded protection.",
armorplate="A set of military grade armor plates. These offer maximum protection.",
extinguisher="A standard fire extinguisher. Can be used to put out fires.",
milspecfabrics="An assortment of military grade fabrics. Useful for crafting items. Can also stop bleeding.",
industrialfabrics="An assortment of high grade fabrics. Useful for crafting items. Can also stop bleeding.",
leadscrap="An assortment of lead based metal scrap. Useful for crafting items.",
industrialplastic="An assortment of high grade plastics. Useful for crafting items.",
milspecmetal="An assortment of military grade metals. Useful for crafting items.",
milspecplastic="An assortment of military grade plastics. Useful for crafting items.",
industrialelectronicscrap="An assorted bunch of military grade broken electronics. Useful for crafting items.",
milspecelectronicscrap="An assorted bunch of high grade broken electronics. Useful for crafting items.",
industrialscrapmetal="An assortment of high grade metals. Useful for crafting items.",
minigun="A large caliber rotary machine gun. Kills things fairly quickly.",
}

for k,v in pairs(normal_crafts) do
	local bn="blueprint_"..v[1]
	item_names[bn]="Blueprint ("..(item_names[v[1]] or v[1])..")"
	item_descriptions[bn]="Blueprint to craft "..(item_names[v[1]] or v[1]).."."
	item_weight[bn]=0.05
end

local weapon_upgrades_types={
    flashlight_small="hud_flashlight",
    flashlight_large="hud_flashlight",
    grip="hud_grip",
    suppressor_1="hud_suppressor",
    suppressor_2="hud_suppressor",
    suppressor_3="hud_suppressor",
    suppressor_4="hud_suppressor",
    suppressor_5="hud_suppressor",
    scope_1="hud_scope",
    scope_2="hud_scope",
    scope_3="hud_scope",
    scope_advanced="hud_scope",
    scope_compactholo="hud_scope",
    muzzlebrake_1="hud_gear",
    heavybarrel="hud_gear",
    scope_nightvision="hud_scope",
    scope_thermal="hud_scope",
    livery_digicamo="hud_paint",
}

local weapon_upgrades_all={
    [1]="flashlight_small",
    [2]="flashlight_large",
    [3]="grip",
    [4]="suppressor_1",
    [5]="suppressor_2",
    [6]="suppressor_3",
    [7]="suppressor_4",
    [8]="suppressor_5",
    [9]="scope_1",
    [10]="scope_2",
    [11]="scope_3",
    [12]="scope_advanced",
    [13]="scope_compactholo",
    [14]="muzzlebrake_1",
    [15]="heavybarrel",
    [16]="scope_nightvision",
    [17]="scope_thermal",
    [18]="livery_digicamo",
}

local weapon_upgrades={
    flashlight_small={   
        [GetHashKey("weapon_pistol")]=0x359B7AAE,
        [GetHashKey("weapon_combatpistol")]=0x359B7AAE,
        [GetHashKey("weapon_appistol")]=0x359B7AAE,
        [GetHashKey("weapon_heavypistol")]=0x359B7AAE,
        [GetHashKey("weapon_pistol50")]=0x359B7AAE,
        [GetHashKey("weapon_microsmg")]=0x359B7AAE,
        [GetHashKey("weapon_smg")]=0x7BC4CDDC,
        [GetHashKey("weapon_assaultsmg")]=0x7BC4CDDC,
        [GetHashKey("weapon_combatpdw")]=0x7BC4CDDC,
        [GetHashKey("weapon_heavyrevolver_mk2")]=0x359B7AAE,
        [GetHashKey("weapon_snspistol_mk2")]=0x4A4965F3,
        [GetHashKey("weapon_pistol_mk2")]=0x43FD595B,
        [GetHashKey("weapon_smg_mk2")]=0x7BC4CDDC,
    },
    flashlight_large={   
        [GetHashKey("weapon_assaultrifle")]=0x7BC4CDDC,
        [GetHashKey("weapon_carbinerifle")]=0x7BC4CDDC,
        [GetHashKey("weapon_advancedrifle")]=0x7BC4CDDC,
        [GetHashKey("weapon_specialcarbine")]=0x7BC4CDDC,
        [GetHashKey("weapon_bullpuprifle")]=0x7BC4CDDC,
        [GetHashKey("weapon_pumpshotgun")]=0x7BC4CDDC,
        [GetHashKey("weapon_assaultshotgun")]=0x7BC4CDDC,
        [GetHashKey("weapon_bullpupshotgun")]=0x7BC4CDDC,
        [GetHashKey("weapon_heavyshotgun")]=0x7BC4CDDC,
        [GetHashKey("weapon_marksmanrifle")]=0x7BC4CDDC,
        [GetHashKey("weapon_grenadelauncher")]=0x7BC4CDDC,
        [GetHashKey("weapon_pumpshotgun_mk2")]=0x7BC4CDDC,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0x7BC4CDDC,
        [GetHashKey("weapon_specialcarbine_mk2")]=0x7BC4CDDC,
        [GetHashKey("weapon_assaultrifle_mk2")]=0x7BC4CDDC,
        [GetHashKey("weapon_carbinerifle_mk2")]=0x7BC4CDDC,
        [GetHashKey("weapon_marksmanrifle_mk2")]=0x7BC4CDDC,
    },
    grip={
        [GetHashKey("weapon_combatpdw")]=0xC164F53,
        [GetHashKey("weapon_assaultrifle")]=0xC164F53,
        [GetHashKey("weapon_carbinerifle")]=0xC164F53,
        [GetHashKey("weapon_specialcarbine")]=0xC164F53,
        [GetHashKey("weapon_bullpuprifle")]=0xC164F53,
        [GetHashKey("weapon_combatmg")]=0xC164F53,
        [GetHashKey("weapon_assaultshotgun")]=0xC164F53,
        [GetHashKey("weapon_bullpupshotgun")]=0xC164F53,
        [GetHashKey("weapon_heavyshotgun")]=0xC164F53,
        [GetHashKey("weapon_marksmanrifle")]=0xC164F53,
        [GetHashKey("weapon_grenadelauncher")]=0xC164F53,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0xFFFFFFFF9D65907A,
        [GetHashKey("weapon_specialcarbine_mk2")]=0xFFFFFFFF9D65907A,
        [GetHashKey("weapon_assaultrifle_mk2")]=0xFFFFFFFF9D65907A,
        [GetHashKey("weapon_carbinerifle_mk2")]=0xFFFFFFFF9D65907A,
        [GetHashKey("weapon_combatmg_mk2")]=0xFFFFFFFF9D65907A,
        [GetHashKey("weapon_marksmanrifle_mk2")]=0xFFFFFFFF9D65907A,
    },
    suppressor_1={
        [GetHashKey("weapon_pistol")]=0x65EA7EBB,
        [GetHashKey("weapon_vintagepistol")]=0xFFFFFFFFC304849A,
        [GetHashKey("weapon_combatpistol")]=0xFFFFFFFFC304849A,
        [GetHashKey("weapon_appistol")]=0xFFFFFFFFC304849A,
        [GetHashKey("weapon_heavypistol")]=0xFFFFFFFFC304849A,
        [GetHashKey("weapon_pistol50")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_snspistol_mk2")]=0x65EA7EBB,
        [GetHashKey("weapon_pistol_mk2")]=0x65EA7EBB,
    },
    suppressor_2={
        [GetHashKey("weapon_smg")]=0xFFFFFFFFC304849A,
        [GetHashKey("weapon_microsmg")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_assaultsmg")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_machinepistol")]=0xFFFFFFFFC304849A,
        [GetHashKey("weapon_smg_mk2")]=0xFFFFFFFFC304849A,
    },
    suppressor_3={
        [GetHashKey("weapon_assaultrifle")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_specialcarbine")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_carbinerifle")]=0xFFFFFFFF837445AA,
        [GetHashKey("weapon_advancedrifle")]=0xFFFFFFFF837445AA,
        [GetHashKey("weapon_bullpuprifle")]=0xFFFFFFFF837445AA,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0xFFFFFFFF837445AA,
        [GetHashKey("weapon_specialcarbine_mk2")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_assaultrifle_mk2")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_carbinerifle_mk2")]=0x837445AA,
    },
    suppressor_4={
        [GetHashKey("weapon_pumpshotgun")]=0xFFFFFFFFE608B35E,
        [GetHashKey("weapon_assaultshotgun")]=0xFFFFFFFF837445AA,
        [GetHashKey("weapon_heavyshotgun")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_pumpshotgun_mk2")]=0xFFFFFFFFAC42DF71,
    },
    suppressor_5={
        [GetHashKey("weapon_heavysniper_mk2")]=0xFFFFFFFFAC42DF71,
        [GetHashKey("weapon_marksmanriflerifle")]=0xFFFFFFFF837445AA,
        [GetHashKey("weapon_sniperrifle")]=0xFFFFFFFFA73D4664,
        [GetHashKey("weapon_marksmanrifle_mk2")]=0xFFFFFFFF837445AA,
    },
    scope_1={
        [GetHashKey("weapon_microsmg")]=0xFFFFFFFF9D2FBF29,
        [GetHashKey("weapon_assaultsmg")]=0xFFFFFFFF9D2FBF29,
        [GetHashKey("weapon_assaultrifle")]=0xFFFFFFFF9D2FBF29,
        [GetHashKey("weapon_heavyrevolver_mk2")]=0x49B2945,
        [GetHashKey("weapon_smg_mk2")]=0xFFFFFFFFE502AB6B,
        [GetHashKey("weapon_pumpshotgun_mk2")]=0x49B2945,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0xFFFFFFFFC7ADD105,
        [GetHashKey("weapon_specialcarbine_mk2")]=0x49B2945,
        [GetHashKey("weapon_assaultrifle_mk2")]=0x49B2945,
        [GetHashKey("weapon_carbinerifle_mk2")]=0x49B2945,
        [GetHashKey("weapon_smg")]=0x3CC6BA57,
    },
    scope_2={   
        [GetHashKey("weapon_combatpdw")]=0xFFFFFFFFAA2C45B4,
        [GetHashKey("weapon_advancedrifle")]=0xFFFFFFFFAA2C45B4,
        [GetHashKey("weapon_bullpuprifle")]=0xFFFFFFFFAA2C45B4,
        [GetHashKey("weapon_grenadelauncher")]=0xFFFFFFFFAA2C45B4,
        [GetHashKey("weapon_smg_mk2")]=0x3DECC7DA,
        [GetHashKey("weapon_pumpshotgun_mk2")]=0x3F3C8181,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0x3F3C8181,
        [GetHashKey("weapon_combatmg_mk2")]=0x3F3C8181,
    },
    scope_3={   
        [GetHashKey("weapon_carbinerifle")]=0xFFFFFFFFA0D89C42,
        [GetHashKey("weapon_specialcarbine")]=0xFFFFFFFFA0D89C42,
        [GetHashKey("weapon_combatmg")]=0xFFFFFFFFA0D89C42,
        [GetHashKey("weapon_mg")]=0x3C00AFED,
        [GetHashKey("weapon_specialcarbine_mk2")]=0xFFFFFFFFC66B6542,
        [GetHashKey("weapon_assaultrifle_mk2")]=0xFFFFFFFFC66B6542,
        [GetHashKey("weapon_carbinerifle_mk2")]=0xFFFFFFFFC66B6542,
        [GetHashKey("weapon_combatmg_mk2")]=0xFFFFFFFFC66B6542,
        [GetHashKey("weapon_marksmanrifle_mk2")]=0xFFFFFFFFC66B6542,
    },
    scope_advanced={   
        --[GetHashKey("weapon_heavysniper")]=0xFFFFFFFFBC54DA77,
        [GetHashKey("weapon_sniperrifle")]=0xFFFFFFFFBC54DA77,
        --[GetHashKey("weapon_heavysniper_mk2")]=0xFFFFFFFFBC54DA77,
    },
    scope_compactholo={
        [GetHashKey("weapon_heavyrevolver_mk2")]=0x420FD713,
        [GetHashKey("weapon_snspistol_mk2")]=0x47DE9258,
        [GetHashKey("weapon_pistol_mk2")]=0xFFFFFFFF8ED4BB70,
        [GetHashKey("weapon_smg_mk2")]=0xFFFFFFFF9FDB5652,
        [GetHashKey("weapon_pumpshotgun_mk2")]=0x420FD713,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0x420FD713,
        [GetHashKey("weapon_specialcarbine_mk2")]=0x420FD713,
        [GetHashKey("weapon_assaultrifle_mk2")]=0x420FD713,
        [GetHashKey("weapon_carbinerifle_mk2")]=0x420FD713,
        [GetHashKey("weapon_combatmg_mk2")]=0x420FD713,
        [GetHashKey("weapon_marksmanrifle_mk2")]=0x420FD713,
    },
    muzzlebrake_1={
        [GetHashKey("weapon_heavyrevolver_mk2")]=0x27077CCB,
        [GetHashKey("weapon_snspistol_mk2")]=0xFFFFFFFFAA8283BF,
        [GetHashKey("weapon_pistol_mk2")]=0x21E34793,
        [GetHashKey("weapon_smg_mk2")]=0xFFFFFFFFC867A07B,
        [GetHashKey("weapon_pumpshotgun_mk2")]=0x5F7DCE4D,
        [GetHashKey("weapon_heavysniper_mk2")]=0x5F7DCE4D,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0xFFFFFFFFC867A07B,
        [GetHashKey("weapon_specialcarbine_mk2")]=0xFFFFFFFFC867A07B,
        [GetHashKey("weapon_assaultrifle_mk2")]=0xFFFFFFFFC867A07B,
        [GetHashKey("weapon_carbinerifle_mk2")]=0xFFFFFFFFC867A07B,
        [GetHashKey("weapon_combatmg_mk2")]=0xFFFFFFFFC867A07B,
        [GetHashKey("weapon_marksmanrifle_mk2")]=0xFFFFFFFFC867A07B,
    },
    heavybarrel={
        [GetHashKey("weapon_heavysniper_mk2")]=0x108AB09E,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0x3BF26DC7,
        [GetHashKey("weapon_specialcarbine_mk2")]=0xFFFFFFFFF97F783B,
        [GetHashKey("weapon_assaultrifle_mk2")]=0x5646C26A,
        [GetHashKey("weapon_carbinerifle_mk2")]=0xFFFFFFFF8B3C480B,
        [GetHashKey("weapon_combatmg_mk2")]=0xFFFFFFFFB5E2575B,
        [GetHashKey("weapon_marksmanrifle_mk2")]=0x68373DDC,
    },
    scope_nightvision={
        [GetHashKey("weapon_heavysniper_mk2")]=0xFFFFFFFFB68010B0,
    },
    scope_thermal={
        [GetHashKey("weapon_heavysniper_mk2")]=0x2E43DA41,
    },
    livery_digicamo={
        [GetHashKey("weapon_heavyrevolver_mk2")]=0xFFFFFFFFC03FED9F,
        [GetHashKey("weapon_snspistol_mk2")]=0xFFFFFFFFE7EE68EA,
        [GetHashKey("weapon_pistol_mk2")]=0x5C6C749C,
        [GetHashKey("weapon_smg_mk2")]=0xFFFFFFFFC4979067,
        [GetHashKey("weapon_pumpshotgun_mk2")]=0xFFFFFFFFE3BD9E44,
        [GetHashKey("weapon_specialcarbine_mk2")]=0xFFFFFFFFD40BB53B,
        [GetHashKey("weapon_assaultrifle_mk2")]=0xFFFFFFFF911B24AF,
        [GetHashKey("weapon_carbinerifle_mk2")]=0x4BDD6F16,
        [GetHashKey("weapon_combatmg_mk2")]=0x4A768CB5,
        [GetHashKey("weapon_marksmanrifle_mk2")]=0xFFFFFFFF9094FBA0,
        [GetHashKey("weapon_heavysniper_mk2")]=0xFFFFFFFFF8337D02,
        [GetHashKey("weapon_bullpuprifle_mk2")]=0xFFFFFFFFAE4055B7,
    },
}



local item_index_to_name={}
local item_name_to_index={}
for k,v in pairs(item_names) do
    local hash=GetHashKey(k) hash=hash&0x7FFFFFFF
    item_index_to_name[hash]=k
    item_name_to_index[k]=hash
end
for k,v in pairs(weapons) do
    local hash=GetHashKey(k)
    if IsWeaponValid(hash) then
		weapons[k]=hash
	end
	hash=hash&0x7FFFFFFF
    item_index_to_name[hash]=k
    item_name_to_index[k]=hash
    hash=GetHashKey("weapon_"..k)
    if IsWeaponValid(hash) then
		item_index_to_name[hash]=k
		weapons[k]=hash
	end
    hash=GetHashKey("gadget_"..k)
    if IsWeaponValid(hash) then
		item_index_to_name[hash]=k
		weapons[k]=hash
	end
end

if true then
local weapons_inverted={}
local WEAPON_inverted={}
for k,v in pairs(weapons) do
	weapons_inverted[v]=k
end
for k,v in pairs(WEAPON) do
	WEAPON_inverted[v]=k
end
for k,v in pairs(weapons) do
	local l=string.lower(k)
	local u=string.upper(k)
	if WEAPON[u]==nil then
		if WEAPON_inverted[v]==nil then
			print("weapons."..l.." exists but WEAPON."..u.." do not")
		else
			print("weapons."..l.." is WEAPON."..WEAPON_inverted[v])
		end
	elseif WEAPON[u]~=v then
		print("WEAPON."..u.."("..WEAPON[u]..")~=weapons."..l.."("..v..")")
	end
end
for k,v in pairs(WEAPON) do
	local l=string.lower(k)
	local u=string.upper(k)
	if weapons[l]==nil then
		if weapons_inverted[v]==nil then
			print("WEAPON."..u.." exists but weapons."..l.." do not")
		else
			print("WEAPON."..u.." is weapons."..weapons_inverted[v])
		end
	elseif weapons[l]~=v then
		print("WEAPON."..u.."("..v..")~=weapons."..l.."("..weapons[l]..")")
	end
end
end

local inventory={}
inventory.rows=4
inventory.lines=5
inventory.max=256 --15
inventory.total=GetResourceKvpInt("inventory_total")
inventory.current=GetResourceKvpInt("inventory_current")
inventory.highlight=500
inventory.scroll=0

for i=1,inventory.total do
    inventory[i]={item=GetResourceKvpString("inventory_item_"..i),amount=GetResourceKvpInt("inventory_amount_"..i)}
	if inventory[i].item==nil or inventory[i].amount==nil or inventory[i].item==0 or inventory[i].amount==0 then
		inventory[i].item="rags"
		inventory[i].amount=1
	end
end
if inventory.current>inventory.total then
    inventory.current=inventory.total
elseif inventory.current<1 then
    inventory.current=((inventory.total>0) and 1 or 0)
end

for _,z in pairs(safezones) do
	-- if zone.crafts then
		-- for k,v in pairs(zone.crafts) do
			-- normal_crafts[v[1]]={amount=v[2],requirements=v[3]}
			-- item_names["blueprint_"..v[1]]="Blueprint ("..item_names[v[1]]..")"
			-- item_descriptions[v[1]]="Blueprint to craft "..item_names[v[1]]
			-- item_weight[v[1]]=0.05
		-- end
	-- end
	if z.storagepos and z.storagename then
		local inventory=z.storage
		if inventory==nil then
			inventory={}
			z.storage=inventory
		end
		local name="st_"..z.storagename
		--SetResourceKvpInt(name.."_total",0)
		inventory.total=GetResourceKvpInt(name.."_total")
		inventory.current=GetResourceKvpInt(name.."_current")
		inventory.highlight=500
		inventory.scroll=0

		for i=1,inventory.total do
			inventory[i]={item=GetResourceKvpString(name.."_item_"..i),amount=GetResourceKvpInt(name.."_amount_"..i)}
			if inventory[i].item==nil or inventory[i].amount==nil or inventory[i].item==0 or inventory[i].amount==0 then
				inventory[i].item="rags"
				inventory[i].amount=1
			end
		end
	end
end
-- inventory[1]={item="water",amount=5}
-- inventory[2]={item="fish",amount=5}
-- inventory[3]={item="gasoline",amount=35}
-- inventory[4]={item="canfood",amount=5}
-- inventory[5]={item="canfood",amount=5}
-- inventory[6]={item="canfood",amount=5}
-- inventory[7]={item="canfood",amount=5}
-- inventory[8]={item="canfood",amount=5}
-- inventory[9]={item="canfood",amount=5}
-- inventory[10]={item="canfood",amount=5}
-- inventory[11]={item="canfood",amount=5}
-- inventory[12]={item="canfood",amount=5}
-- inventory[13]={item="canfood",amount=5}

local birds={
[0xFFFFFFFF&-745300483]=true,--seagull
[111281960]=true,--pigeon
[402729631]=true,--crow
[1457690978]=true,--cormorant
[0xFFFFFFFF&-1430839454]=true,--chicken hawk
}

--- table with models and weapons
-- local deadbodiesrewards_random={
-- {"SWITCHBLADE",1},
-- {"cigarettes",1},
-- {"weed",1},
-- {"soda",1},
-- }

local rewards={}
rewards.deadbodies={
tier1={
{"scrapplastic",1},
{"rags",-2},
{"electronicscrap",-2},
{"scrapfabrics",-2},
{"cash",-20},
{"scrapfabrics",1},
},
tier2={
{"leadscrap",1},
{"industrialplastic",-2},
{"industrialscrapmetal",-2},
{"industrialelectronicscrap",-2},
{"industrialfabrics",1},
{"cigarettes",1},
{"bandage",-2},
{"flaregunammo",-5},
{"gunpowder",1},
{"cash",-20},
{"trashfood",1},
},
tier3={
{"blueprint",1},
{"milspecfabrics",-2},
{"milspecmetal",-2},
{"milspecplastic",-2},
{"milspecfabrics",-2},
{"food",1},
{"canfood",1},
{"soda",1},
{"juice",1},
{"switchblade",1},
{"knife",1},
{"dagger",1},
{"flashlight",1},
{"knuckle",1},
{"molotov",1},
{"pipebomb",1},
{"flaregun",1},
{"ball",1},
{"flaregunammo",-5},
{"painkillers",1},
{"fruits",-2},
},
tier4={
{"pistolammo",-10},
{"smgammo",-20},
{"mgammo",-10},
{"shotgunammo",-10},
{"ammo",-10},
{"heavyrifleammo",-10},
{"weed",-2},
{"provisionkey",1},
{"barberkey",1},
{"tattookey",1},
{"gunstorekey",1},
{"sheriffkey",1},
{"radio",1},
{"halfmask",1},
{"balaclava",1},
{"camocap",1},
{"clothes_banditgoon",1},
{"clothes_scavenger",1},
{"lowcap",1},
{"mre",1},
{"dawntokens",1},
},
tier5={
{"clothes_marauder",1},
{"clothes_camouflage",1},
{"snspistol",1},
{"vintagepistol",1},
{"pistol",1},
{"combatpistol",1},
{"doubleaction",1},
{"revolver",1},
{"marksmanpistol",1},
{"dbshotgun",1},
{"grenade",1},
{"launchergrenade",1},
},
tier6={
{"medkit",1},
{"bodyarmor",1},
{"armorplate",-2},
{"gasmask",1},
{"brasscatcher",1},
{"grip",1},
{"flashlight_small",1},
{"flashlight_large",1},
{"suppressor_1",1},
{"suppressor_2",1},
{"suppressor_3",1},
{"suppressor_4",1},
{"suppressor_5",1},
{"scope_1",1},
{"scope_2",1},
{"scope_3",1},
{"scope_advanced",1},
{"scope_compactholo",1},
{"muzzlebrake_1",1},
{"heavybarrel",1},
{"scope_nightvision",1},
{"scope_thermal",1},
{"duffelbag",1},
},
}

rewards.trunkrewards={
tier1={
{"scrapplastic",-5},
{"scrapmetal",-5},
{"electronicscrap",-2},
{"rags",-3},
{"scrapfabrics",-2},
},
tier2={
{"leadscrap",1},
{"industrialplastic",-2},
{"industrialscrapmetal",-2},
{"industrialelectronicscrap",-2},
{"industrialfabrics",-2},
{"cigarettes",-3},
{"alcohol",-2},
{"chemicals",-3},
{"bandage",-2},
{"engineparts",-1},
{"tirerepair",1},
{"switchblade",1},
{"knife",1},
{"dagger",1},
{"bat",1},
{"battleaxe",1},
{"crowbar",1},
{"flashlight",1},
{"knuckle",1},
{"machete",1},
{"wrench",1},
{"poolcue",1},
{"molotov",1},
{"pipebomb",1},
{"flaregun",1},
{"ball",1},
{"flaregunammo",-10},
-- {"casings",-20},
-- {"riflecasing",-20},
{"gunpowder",-3},
{"trashfood",1},
{"hatchet",1},
{"golfclub",1},
{"flare",1},
{"nightstick",1},
{"hammer",1},
{"bottle",1},
},
tier3={
{"blueprint",1},
{"milspecfabrics",-2},
{"milspecmetal",-2},
{"milspecplastic",-2},
{"milspecfabrics",-2},
{"food",-3},
{"canfood",-2},
{"soda",-2},
{"juice",1},
{"gasoline",-7},
{"painkillers",-2},
{"clothes_ordinary",1},
{"clothes_gang",1},
{"clothes_trucker",1},
{"fruits",-2},
},
tier4={
{"pistolammo",-30},
{"smgammo",-40},
{"shotgunammo",-8},
{"ammo",-15},
{"heavyrifleammo",-10},
{"mgammo",-10},
{"weed",-3},
{"gasmask",1},
{"water",-3},
{"radio",1},
{"aircraftfuel",-3},
{"cash",-110},
{"halfmask",1},
{"balaclava",1},
{"camocap",1},
{"clothes_banditgoon",1},
{"clothes_scavenger",1},
{"lowcap",1},
{"mre",-2},
{"dawntokens",1},
{"clothes_business",1},
},
tier5={
{"clothes_marauder",1},
{"clothes_camouflage",1},
{"snspistol",1},
{"vintagepistol",1},
{"pistol",1},
{"combatpistol",1},
{"doubleaction",1},
{"revolver",1},
--{"appistol",1},
--{"heavypistol",1},
{"marksmanpistol",1},
--{"pistol50",1},
--{"pistol_mk2",1},
--{"revolver_mk2",1},
--{"pistol_mk2",1},
{"dbshotgun",1},
{"musket",1},
{"provisionkey",1},
{"barberkey",1},
{"tattookey",1},
{"gunstorekey",1},
{"sheriffkey",1},
{"grenade",-3},
{"launchergrenade",-4},
},
tier6={
{"clothes_loner",1},
{"medkit",-2},
--{"assaultshotgun",1},
--{"bullpupshotgun",1},
{"heavyshotgun",1},
{"pumpshotgun",1},
--{"pumpshotgun_mk2",1},
{"sawnoffshotgun",1},
--{"autoshotgun",1},
--{"assaultsmg",1},
--{"combatmg",1},
--{"combatmg_mk2",1},
--{"combatpdw",1},
--{"gusenberg",1},
{"machinepistol",1},
--{"mg",1},
{"microsmg",1},
{"minismg",1},
{"smg",1},
--{"smg_mk2",1},
--{"advancedrifle",1},
{"assaultrifle",1},
--{"assaultrifle_mk2",1},
{"bullpuprifle",1},
--{"bullpuprifle_mk2",1},
{"carbinerifle",1},
--{"carbinerifle_mk2",1},
{"compactrifle",1},
{"specialcarbine",1},
--{"specialcarbine_mk2",1},
{"heavysniper",1},
{"sniperrifle",1},
{"marksmanrifle",1},
--{"marksmanrifle_mk2",1},
--{"heavysniper_mk2",1},
--{"compactlauncher",1},
--{"grenadelauncher",1},
--{"assaultshotgun",1},
{"bodyarmor",1},
{"armorplate",-5},
{"gasmask",1},
{"brasscatcher",1},
{"grip",1},
{"flashlight_small",1},
{"flashlight_large",1},
{"suppressor_1",1},
{"suppressor_2",1},
{"suppressor_3",1},
{"suppressor_4",1},
{"suppressor_5",1},
{"scope_1",1},
{"scope_2",1},
{"scope_3",1},
{"scope_advanced",1},
{"scope_compactholo",1},
{"muzzlebrake_1",1},
{"heavybarrel",1},
{"scope_nightvision",1},
{"scope_thermal",1},
{"duffelbag",1},
},
}

local deadbodiesrewards={
--[-681004504]={"NIGHTSTICK",1}, --security
--[1581098148]={"pistolammo",15}, --cop male
--[368603149]={"pistolammo",15}, --cop female
--[-673538407]={"HAMMER",1}, --construct
--[-277793362]={"REVOLVER",12}, --ranger m
--[-1614285257]={"REVOLVER",12}, --ranger f

[307287994]={"meat",6}, --mountain lion
[-1788665315]={"meat",4}, --rottweiler
[-832573324]={"meat",8}, --boar
[1462895032]={"meat",1}, --cat
[-1430839454]={"meat",1}, --chikenhawk
[1457690978]={"meat",2}, --cormorant
[-50684386]={"meat",15}, --cow
[1682622302]={"meat",4}, --coyote
[402729631]={"meat",1}, --crow
[-664053099]={"meat",10}, --deer
[-1950698411]={"meat",18}, --dolphin
[802685111]={"fish",1}, --fish
[1015224100]={"meat",18}, --HammerShark
[1794449327]={"meat",2}, --chiken
[1193010354]={"meat",50}, --humpback
[1318032802]={"meat",4}, --husky
[-1920284487]={"meat",20}, --killer whale
[-1323586730]={"meat",10}, --pig
[111281960]={"meat",1}, --pigeon
[1125994524]={"meat",2}, --poodle
[1832265812]={"meat",3}, --pug
[-541762431]={"meat",2}, --rabbit
[-1011537562]={"meat",1}, --rat
[882848737]={"meat",4}, --rottweiler
[-745300483]={"meat",1}, --seagull
[1126154828]={"meat",4}, --shepard
[-1589092019]={"meat",10}, --stingrey
[113504370]={"meat",15}, --tigershark
[-1384627013]={"meat",3}, --westy
}

local inventory_items_chances={
water={chance=80,text="This water is ~r~spoiled~s~."},
juice={chance=15,text="This juice is ~r~spoiled~s~."},
soda={chance=25,text="This soda is ~r~spoiled~s~."},
alcohol={chance=45,text="This alcohol is ~r~spoiled~s~."},
canfood={chance=35,text="This canned food is ~r~spoiled~s~."},
food={chance=10,text="This food is ~r~spoiled~s~."},
fruits={chance=50,text="This food is ~r~rotten~s~."},
trashfood={chance=90,text="This food is ~r~rotten~s~."},
pistolammo={chance=30,text="This box is ~r~empty~s~."},
shotgunammo={chance=25,text="This box is ~r~empty~s~."},
ammo={chance=20,text="This box is ~r~empty~s~."},
heavyrifleammo={chance=60,text="This box is ~r~empty~s~."},
cash={chance=30,text="These dollar bills are ~r~ruined~s~."},
gasmask={chance=20,text="This gasmask is ~r~broken~s~."},
grenade={chance=20,text="This box is ~r~empty~s~."},
weed={chance=50,text="This weed is ~r~spoiled~s~."},
bodyarmor={chance=20,text="This bodyarmor is ~r~damaged beyond repair~s~."},
armorplate={chance=20,text="This armor plate is ~r~damaged beyond repair~s~."},
flashlight_small={chance=15,text="This flashlight is ~r~broken~s~."},
flashlight_large={chance=15,text="This flashlight is ~r~broken~s~."},
fish={chance=10,text="This food is ~r~rotten~s~."},
}


local randomloot={
street_box={
    {"lowcap",1},
    {"clothes_trash",1},
    {"tshirtmask",1},
    {"tapemask",1},
    {"scrapplastic",-5},
    {"rags",-5},
    {"scrapmetal",-5},
    {"bandage",-3},
    {"cash",-25},
    {"trashfood",-2},
    {"wrench",1},
    {"bottle",1},
    {"bat",1},
    {"alcohol",1},
    {"water",-2},
    {"canfood",1},
    {"electronicscrap",-5},
    {"leadscrap",-5},
    {"engineparts",1},
    {"juice",-3},
    {"soda",-3},
    {"vintagepistol",1},
    {"pistolammo",-30},
    {"flashlight",1},
    {"clothes_loner",1},
    {"crowbar",1},
    {"tirerepair",1},
    {"lowcap",1},
    {"painkillers",-3},
    {"flaregun",1},
    {"flaregunammo",-20},
    {"cigarettes",-6},
},
street_garbage={
    {"scrapplastic",-3},
    {"scrapmetal",-2},
    {"rags",-3},
    {"trashfood",1},
	{"bottle",1},
	{"clothes_trash",1},
},
weapon_box={
    {"scope_thermal",1},
    {"scope_nightvision",1},
    {"heavybarrel",1},
    {"muzzlebrake_1",1},
    {"scope_compactholo",1},
    {"scope_advanced",1},
    {"scope_3",1},
    {"scope_2",1},
    {"scope_1",1},
    {"suppressor_5",1},
    {"suppressor_4",1},
    {"suppressor_3",1},
    {"suppressor_2",1},
    {"suppressor_1",1},
    {"flashlight_large",1},
    {"flashlight_small",1},
    {"grip",1},
    {"snspistol",1},
    {"vintagepistol",1},
    {"pistol",1},
    {"combatpistol",1},
    {"doubleaction",1},
    {"revolver",1},
    {"heavypistol",1},
    {"pistol50",1},
    {"microsmg",1},
    {"minismg",1},
},
body_armor={
    {"level3asoftplate",-2},
    {"level3plates",-2},
    {"armorplate",-2},
    {"bodyarmor",1},
},
repair_box={
    {"scrapmetal",-10},
    {"industrialscrapmetal",-5},
    {"leadscrap",-5},
    {"tirerepair",-1},
    {"engineparts",1},
},
explosives_box={
    {"leadscrap",-10},
    {"industrialscrapmetal",-10},
    {"industrialelectronicscrap",-10},
    {"milspecelectronicscrap",-10},
    {"milspecfabrics",-10},
    {"milspecmetal",-10},
    {"milspecplastic",-10},
    {"gunpowder",-10},
},
}

local pickups_objects={
--Medical Pickups
[-509973344]={"medkit",1,"bandage",2,solid=true},--wall medkit
[-2140074399]={"medkit",1}, --barber medkit

--Food Pickups
[-742198632]={"water",5,solid=true}, --water cooler
[1541274880]={"soda",1}, -- cola 2 liters
[-1982036471]={"soda",4}, --soda 4 in pack
[-942878619]={"alcohol",4}, --shop thing red 4 in pack
[-1914723336]={"alcohol",4}, --shop thing yellow pride 4 in pack
[1793329478]={"alcohol",4}, --shop thing brown  in pack
[-53650680]={"alcohol",4}, --chinese alcohol pack
[2085005315]={"alcohol",3}, --piswasser 12 bottles dull white
[1661171057]={"alcohol",3}, --piswasser 12 bottles dull white 2
[-259124142]={"alcohol",3}, --biarn... black green 12
[898161667]={"alcohol",3}, --jackey's box dark blue 12 
[-1902841705]={"alcohol",3}, --logger 12
[-1699929937]={"alcohol",3}, --benedict
[-1551002089]={"alcohol",4}, --16 alcohol bottles
[-715967502]={"alcohol",4}, --17 alcohol bottles
[-1574447115]={"alcohol",5}, --22 alcohol bottles
[1350970027]={"alcohol",1}, --1 alcohol bottl
[674110876]={"alcohol",3}, --14 alcohol bottl
[-1720513558]={"alcohol",3}, --12 alcohol bottl
[1550641188]={"alcohol",3}, --12 patriot
[2009246193]={"alcohol",5}, --5 in container
[-2081577774]={"food",1}, -- ego chaser gum
[-319761937]={"food",1}, -- sweet nothings
[-1575601093]={"food",1}, -- candybox
[-619729363]={"food",1}, -- release blue
[-920516014]={"food",1}, -- release pink
[-21793420]={"food",1}, -- release green
[633750425]={"food",1}, -- earth quakes
[927393434]={"food",1}, -- zebraba
[-1875208060]={"food",1}, -- captains log
[-807039024]={"food",1}, -- sticky ribs
[-1730534982]={"food",1}, -- twinky chips
[-1418934561]={"food",1}, -- supersalt
[-1839065906]={"food",1}, -- big cheese
[-1816283392]={"food",1}, -- 14 in glass candies
[1228376703]={"food",1}, -- meteorite
[-54719154]={"food",10,"canfood",7,exp=0.02}, -- shop 30 canned and fod on low
[-220235377]={"soda",7,exp=0.02}, -- shop 40 soda
[643522702]={"alcohol",7,exp=0.02}, -- shop 40 alcohol
[1437777724]={"food",7,exp=0.02}, -- shop bread 
[-532065181]={"food",6,"chemicals",6,exp=0.02}, -- food and chem
[756199591]={"food",3}, -- shop gums
[2067313593]={"food",4}, -- shop long gums
[1404018125]={"alcohol",1}, -- green liquor
[-1461673141]={"alcohol",1}, -- orange blocky
[-169049173]={"alcohol",1}, -- black big alcohol
[1421582485]={"food",3,exp=0.02}, -- shop ponchiks
[-802238381]={"fruits",5}, -- fruits
[663958207]={"food",3}, -- shop guns shop type 3
[1238061242]={"alcohol",4,exp=0.03}, -- spoiled alcohol
[511490507]={"alcohol",15,exp=0.03}, -- spoiled alcohol
[-1766954369]={"alcohol",10,exp=0.03}, -- spoiled shelf
[-1243177429]={"alcohol",1}, -- 1 alcohol green
[-1317590321]={"food",4}, -- shop long gums meth shop
[2085590335]={"alcohol",3}, -- 6 triangle yellow bottles
[1925761914]={"alcohol",2}, -- big grey vodka
[1295017223]={"alcohol",1}, -- 1 big green bottle
[-23214081]={"alcohol",1}, -- 1 orange red rum bottle
[95220379]={"alcohol",1}, -- green high bottle
[1451528099]={"alcohol",1}, -- 1 liter pisswasser
[-535527755]={"alcohol",1}, -- 1 liter patriot
[-154609122]={"alcohol",1}, -- 1 raggar rum
[218661250]={"alcohol",1}, -- 1 cherenkov purple
[-77406713]={"alcohol",1}, -- 1 cherenkov red
[516891919]={"alcohol",1}, -- 1 cherenkov greyish
[-1922399062]={"food",3}, --burger shot packet
[2127253708]={"juice",1}, --burger shot can
[1165008631]={"mre",-5,solid=true}, --military crate blue eagle mre
--[704797648]={"water",1}, -- small cactus
[-1069975900]={"water",-3,solid=true}, --blue big barrel
[1298403575]={"water",-4,solid=true}, --blue bigger barrel 2

--Cash Pickups
[759654580]={"cash",-100,solid=true}, -- cash register
[303280717]={"cash",-200,solid=true}, -- cash register
[-449200111]={"cash",-100}, --100$ bill

--Ammo Pickups
[1093460780]={"ammo",-10}, --green open rifle thing
[27391672]={"shotgunammo",-20}, -- box
[-278834633]={"heavyrifleammo",-30}, -- box
[1580014892]={"ammo",-40}, --green closed rifle thing
[-1522670383]={"ammo",-200}, --found on carrier
[1936480843]={"pistolammo",-50}, --green closed rifle thing
[-1422265815]={randomloot.explosives_box,1}, --15green closed rifle thing
[1824078756]={randomloot.explosives_box,1}, --10white closed rifle thing

--Weapon Pickups
[-1920611843]={randomloot.weapon_box,1}, --blue case
[1430410579]={randomloot.weapon_box,1}, --white case
[-868490170]={"gasmask",1}, --green closed rifle thing
-- [2084498973]={"machete",1}, -- camo machete
-- [1179681321]={"machete",1}, -- black machete

--Barber Pickups
[-1023683840]={"chemicals",1}, --barber 3 green small things
[-1515174995]={"chemicals",3}, --barber 3 cyan
[-1133354853]={"chemicals",1}, --barber 1 red
[795984016]={"chemicals",1}, --barber 1 cyan white shampoo
[202070568]={"chemicals",1}, --barber 1 cyan

--Tattoo Pickups
[1331928335]={"chemicals",20}, --tatoo dno uppershelf
[990852227]={"cigarettes",1}, --tatoo dno red cigs
[-511987637]={"chemicals",2}, --tatoo dno green bottle
[-1188601953]={"chemicals",2}, --tatoo dno blue bottle
[-742386476]={"chemicals",2}, --tatoo dno red bottle
[1151436679]={"chemicals",20}, --tatoo dno lots of chems
[848225122]={"food",3,"medkit",1}, --tatoo dno medkit+food
[1806194072]={"chemicals",20}, --tatoo dno lots of chems
[1494593651]={"chemicals",10}, --tatoo dno lots of chems
[367798813]={"chemicals",20}, --tatoo dno 2 floor shelf
[-918651145]={"chemicals",5}, --tatoo norm big chlorox
[-1326130575]={"chemicals",10}, --tatoo norm table
[-1977709371]={"chemicals",30}, --tatoo norm 3 floor
[-1020100884]={"chemicals",20}, --tatoo norm 3 floor corner

--Tradeable PIckups
[-305885281]={"weed",-3}, --weed small 
[452618762]={"weed",-6}, --weed high
[-445408901]={"policedocs",1}, --sheriff PAPERS docs
[-1130190827]={"bandits_records",1}, --plastic thing with lists
[-1406045366]={"cigarettes",-10}, -- 3 lines of cigs

--Clothes Pickups
[-1929385697]={"clothes_offdutysheriff",1,"cowboyhat",1}, --sheriff hat and clothes

--Misc Pickups
[1299967108]={"cues",1}, --wall cues
[-66965919]={"flashlight",1}, --firefighters
[-1964402432]={"radio",1},--carrier control room
[-2011860718]={"tacticalglasses",1},--carrier control room

--Armor Pickups
[701173564]={randomloot.body_armor,1}, --light cool black
[1111175276]={randomloot.body_armor,1}, --forest armor
[-1779214373]={randomloot.body_armor,1}, --right up armor
[-1497794201]={randomloot.body_armor,1}, --green armor
[2022153476]={randomloot.body_armor,1}, --sand armor

--Vehicle Pickups
[-1326111298]={randomloot.repair_box,1}, --red big open tools
[-1674314660]={randomloot.repair_box,1}, --red closed tools
[1871266393]={randomloot.repair_box,1}, --black closed tools
[-738161850]={randomloot.repair_box,1}, --dark red closed
[-276344022]={"aircraftfuel",-5}, --red xero
[786272259]={"gasoline",-10}, --red metal canister
[309108893]={"gasoline",-8}, --white ron
[544881832]={"chemicals",-8}, --terroil
[-239954748]={"aircraftfuel",-2}, --motoroil but ok
[1158698200]={"engineparts",-10}, --car battery
[-2124552702]={"engineparts",-2}, --car black fix box
[-1532806025]={"gasoline",-5}, --beige diesel
[-1738103333]={"gasoline",-4,solid=true}, -- metal barrel

--Box Pickups
[-52732303]={randomloot.street_box,1}, --5 cardboard boxes
[-1515940233]={randomloot.street_box,1}, --white line red fragile text
[-1438964996]={randomloot.street_box,1}, --green FAN
[258835349]={randomloot.street_box,1}, --5 GPostal
[-1415300092]={randomloot.street_box,1}, --2 FRAGILE boxes
[143291855]={randomloot.street_box,1}, --2 FRAGILE boxes
[1513590521]={randomloot.street_box,1}, --a lot 045 boxes
[-939897404]={randomloot.street_box,1}, --few boxes + white thing
[1280771616]={randomloot.street_box,1}, --a lot of boxes fragile on blue thing
[1387151245]={randomloot.street_box,1,solid=true}, --boxes on metal thing
[-2031321722]={randomloot.weapon_box,1}, --sheriff station box handle with care

--Trash Pickups
[1813879595]={randomloot.street_garbage,1}, --"small black trash bag",
[1388308576]={randomloot.street_garbage,1},--"white trash bag",
[1948359883]={randomloot.street_garbage,1},--"black trash bag",
[897494494]={randomloot.street_garbage,1},--"white trash bag",
[600967813]={randomloot.street_garbage,1},--"black trash bag",
[-1681329307]={randomloot.street_garbage,1},--"triple black trash bag",
[1098827230]={randomloot.street_garbage,1},--"black trash bag",
}


--local zombie={
--skins={GetHashKey("a_f_y_genhot_01"),307287994},
--}

local movementclipsets={ --0 walk, 1 -halfrun, 2 -run
--fast={anim="move_characters@orleans@core@",speed=1.9},
--bomber={anim="ANIM_GROUP_MOVE_BALLISTIC",speed=1.9},
--limper={anim="move_heist_lester",speed=1.9},
--injured={anim="move_injured_generic",speed=3.9},
--slow={anim="MOVE_M@BAIL_BOND_TAZERED",speed=0.9},
--slower={anim="move_m@drunk@moderatedrunk",speed=0.9},
--slower2={anim="MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP",speed=0.9},
veryslow={anim="MOVE_M@DRUNK@VERYDRUNK",speed=0.9},
--human={anim="move_characters@orleans@core@",speed=1.9},
--crouch={anim="move_ped_crouched",speed=0.9},
--handsstraight={anim="move_characters@amanda@bag",speed=1.9}
}

local randomclipsets={}
for k,v in pairs(movementclipsets) do
    table.insert(randomclipsets,v)
    RequestAnimSet(v.anim)
end

DecorRegister("headshotted",2)
DecorRegister("zm_health",3)
DecorRegister("zm_dying",3)
DecorRegister("zm_armor",3)
DecorRegister("zm_lastbone",3)

DecorRegister("zombie_random",3)
DecorRegister("zm_looted",2)
DecorRegister("zm_dword",3)
--DecorRegister("post_apoc_car",2)
DecorRegister("zombie_type",3)
DecorRegister("zm_fuel",1)
DecorRegister("raider",2)
DecorRegister("questnpc",3)
DecorRegister("item",3)
DecorRegister("count",3)
DecorRegister("gasoline",3) --fuel truck tank
--DecorRegister("scorched",2)
DecorRegister("dontdelete",3)
DecorRegister("quest_entity",3) --non zero means is quest and contains item, 0 means is quest but doesn't contain quest item

-- DecorRegister("jetammo1",3)
-- DecorRegister("jetammo2",3)
-- DecorRegister("jetammo3",3)
-- DecorRegister("jetammo4",3)
DecorRegisterLock()

local function get_storage_item_slot(storage,item_name)
	local i=storage[item_name]
	if i then
		if i<=storage.total and storage[i]~=nil and storage[i].item==item_name then
			return i
		else
			storage[item_name]=nil
		end
	end
    for i=1,storage.total do
        if storage[i].item==item_name then
			storage[item_name]=i
            return i
        end
    end
    return nil
end

local function get_inventory_item_slot(item_name)
	local i=inventory[item_name]
	if i then
		if i<=inventory.total and inventory[i]~=nil and inventory[i].item==item_name then
			return i
		else
			inventory[item_name]=nil
		end
	end
    for i=1,inventory.total do
        if inventory[i].item==item_name then
			inventory[item_name]=i
            return i
        end
    end
    return nil
end

local function get_inventroy_item_amount(item_name)
    local i=get_inventory_item_slot(item_name)
    if i then
		return inventory[i].amount
    end
    -- local ped=PlayerPedId()
    -- if HasPedGotWeapon(ped,GetHashKey("weapon_"..item_name)) then return 1 end
    -- if HasPedGotWeapon(ped,GetHashKey("gadget_"..item_name)) then return 1 end
    -- if HasPedGotWeapon(ped,GetHashKey(item_name)) then return 1 end
    return 0
end

local function do_we_have_all_that(array)
    local item,have,need
    for i=1,#array,2 do
        item=array[i]
        have=get_inventroy_item_amount(item)
        need=array[i+1]
        if need>have then
            return false
        end
    end
    return true
end

local function check_inv_slot_for_zero_amount(slot)
	slot=slot or inventory.current
    if inventory[slot].amount<1 then
		inventory[inventory[slot].item]=nil
        TriggerServerEvent("updateplayeritem",inventory[slot].item,nil)
        for i=slot,inventory.total do
            inventory[i]=inventory[i+1]
            if inventory[i]==nil then
                DeleteResourceKvp("inventory_item_"..i)
                DeleteResourceKvp("inventory_amount_"..i)
            else
                SetResourceKvp("inventory_item_"..i,inventory[i].item)
                SetResourceKvpInt("inventory_amount_"..i,inventory[i].amount)
            end
        end
        inventory.total=inventory.total-1
        if inventory.current>inventory.total then
            inventory.current=inventory.total
			SetResourceKvpInt("inventory_current",inventory.current)
        end
        SetResourceKvpInt("inventory_total",inventory.total)
		-- print("invscroll="..inventory.scroll)
		-- print("suka="..((inventory.scroll+inventory.lines)*inventory.rows))
		-- print("blyad="..inventory.total+inventory.rows)
        if inventory.total<=inventory.rows then
            inventory.scroll=0
        elseif (inventory.scroll+inventory.lines)*inventory.rows>=inventory.total+inventory.rows and inventory.lines*inventory.rows<inventory.total then
            inventory.scroll=inventory.scroll-1
        end
    else
        SetResourceKvpInt("inventory_amount_"..slot,inventory[slot].amount)
        TriggerServerEvent("updateplayeritem",inventory[slot].item,inventory[slot].amount)
    end
    --print(inventory.current.."- current / "..inventory.total.."- total")
end

local function remove_all_that(array)
    local slot
    for i=1,#array,2 do
        slot=get_inventory_item_slot(array[i])
        inventory[slot].amount=inventory[slot].amount-array[i+1]
        inventory.current=slot
        check_inv_slot_for_zero_amount()
    end
end

local function give_item_to_storage(storage,storagename,add_name,add_amount,anyway)
    if add_name==nil then
        SimpleNotification("~r~ERROR! ~s~Tried to give item to storage but name is nil")
    end
    if add_amount==nil then
        SimpleNotification("~r~ERROR! ~s~Tried to give item to storage but amount is nil")
    end
    local add_to_slot=get_storage_item_slot(storage,add_name)
    --print("add_to_slot is")
    --print(add_to_slot)
    if add_to_slot then
        --print("add_to_slot _ true")
        storage[add_to_slot].amount=storage[add_to_slot].amount+add_amount
        saving_kvp_mode.SetResourceKvpInt("st_"..storagename.."_amount_"..add_to_slot,storage[add_to_slot].amount)
		print("saved to kvp: updated slot["..add_to_slot.."]="..storage[add_to_slot].amount.." "..(storage[add_to_slot].item or "nil"))
        -- TriggerServerEvent("updateplayeritem",add_name,storage[add_to_slot].amount)
        --print("set kvp int")
    else
		if storage.max==nil or storage.total<storage.max or (anyway and anyway=="anyway") then
            storage.total=storage.total+1
            storage[storage.total]={item=add_name,amount=add_amount}
            saving_kvp_mode.SetResourceKvp("st_"..storagename.."_item_"..storage.total,add_name)
            saving_kvp_mode.SetResourceKvpInt("st_"..storagename.."_amount_"..storage.total,add_amount)
            saving_kvp_mode.SetResourceKvpInt("st_"..storagename.."_total",storage.total)
            saving_kvp_mode.SetResourceKvpInt("st_"..storagename.."_current",storage.current)
			print("storage="..tostring(storage).."("..storagename..")")
			print("storage.total="..(tostring(storage.total) or "nil"))
			print("saved to kvp: created slot["..(storage.total or "nil")..
			"]="..(storage[storage.total].amount or "nil")..
			" "..(storage[storage.total].item or "nil"))
            -- TriggerServerEvent("updateplayeritem",add_name,add_amount)
        else
            SimpleNotification(messages.you_dont_have_storage_slots_for_that_item)
            return false
        end
    end
    --SimpleNotification("You stored ~g~~1~ ~a~~s~.",add_amount,(item_names[add_name] or add_name))
    --inventory.highlight=500
    return true
end

local function give_item_to_inventory(add_name,add_amount,anyway)
    if add_name==nil then
        SimpleNotification("~r~ERROR! ~s~Tried to give item to inventory but name is nil")
		return false
	elseif add_name=="blueprint" then
		local randomchosenitem=math.random(1,#normal_crafts)
		add_name="blueprint_"..normal_crafts[randomchosenitem][1]
    end
    if add_amount==nil then
        SimpleNotification("~r~ERROR! ~s~Tried to give item to inventory but amount is nil")
		return false
    end
    local add_to_slot=get_inventory_item_slot(add_name)
    --print("add_to_slot is")
    --print(add_to_slot)
    if add_to_slot then
        --print("add_to_slot _ true")
        inventory[add_to_slot].amount=inventory[add_to_slot].amount+add_amount
        SetResourceKvpInt("inventory_amount_"..add_to_slot,inventory[add_to_slot].amount)
        TriggerServerEvent("updateplayeritem",add_name,inventory[add_to_slot].amount)
        --print("set kvp int")
    else
        -- --print("add_to_slot _ false")
        -- local hash=GetHashKey("weapon_"..add_name)
        -- local valid_weapon=IsWeaponValid(hash)
        -- if not valid_weapon then
            -- hash=GetHashKey("gadget_"..add_name)
            -- valid_weapon=IsWeaponValid(hash)
            -- if not valid_weapon then
                -- hash=GetHashKey(add_name)
                -- valid_weapon=IsWeaponValid(hash)
            -- end
        -- end
        -- if valid_weapon then
            -- --groups GetWeapontypeGroup
            -- -- melee      -728555052
            -- -- throwable  1548507267
            -- local wtg=GetWeapontypeGroup(hash)
            -- local ped=PlayerPedId()
            -- if wtg==1548507267 then
                -- local oldammo
                -- local has_weapon
                -- if not HasPedGotWeapon(ped,hash) then
                    -- has_weapon=false
                    -- oldammo=0
                -- else
                    -- has_weapon=true
                    -- oldammo=GetAmmoInPedWeapon(ped,hash)
                -- end
                -- GiveWeaponToPed(ped, hash, add_amount, false, false)
                -- if HasPedGotWeapon(ped,hash) and GetAmmoInPedWeapon(ped,hash)==oldammo+add_amount then
                    -- SimpleNotification("You got ~g~~a~~s~.",(item_names[add_name] or localization[add_name] or add_name))
                    -- return true
                -- else
                    -- SetPedAmmo(ped,hash,oldammo)
                    -- if not has_weapon then
                        -- RemoveWeaponFromPed(ped,hash)
                    -- end
                    -- return false
                -- end
            -- else
                -- if add_amount<=1 and not HasPedGotWeapon(ped,hash) then
                    -- GiveWeaponToPed(ped, hash, 0, false, false)
                    -- SimpleNotification("You got ~g~~a~~s~.",(item_names[add_name] or localization[add_name] or add_name))
                    -- return true
                -- else
                    -- return false
                -- end
            -- end
                    -- -- if HasPedGotWeapon(ped,hash) then
                        -- -- print("you now have weapon")
                        
                        -- -- return true
                    -- -- else print("failed to give weapon")
                        -- -- GiveWeaponToPed(ped, hash, 1, false, true)
                        -- -- if HasPedGotWeapon(ped,hash) then
                            -- -- SimpleNotification("You got ~g~"..(item_names[add_name] or localization[add_name] or add_name).."~s~.")
                            -- -- return true
                        -- -- else
                            -- -- return false
                        -- -- end
                    -- -- end
                -- -- else
                    -- -- local oldammo=GetAmmoInPedWeapon(ped, hash)
                    -- -- GiveWeaponToPed(ped, hash, 1, false, true)
                    -- -- return (GetAmmoInPedWeapon(ped, hash)>oldammo)
                -- -- end
        -- elseif inventory.total<inventory.max then
		if inventory.total<inventory.max or (anyway and anyway=="anyway") then
            inventory.total=inventory.total+1
            inventory[inventory.total]={item=add_name,amount=add_amount}
            SetResourceKvp("inventory_item_"..inventory.total,inventory[inventory.total].item)
            SetResourceKvpInt("inventory_amount_"..inventory.total,inventory[inventory.total].amount)
            SetResourceKvpInt("inventory_total",inventory.total)
            SetResourceKvpInt("inventory_current",inventory.current)
            TriggerServerEvent("updateplayeritem",add_name,add_amount)
        else
            SimpleNotification("You ~r~don't have ~s~inventory slots for that item!")
            return false
        end
    end
    SimpleNotification("You got ~g~~1~ ~a~~s~.",add_amount,(item_names[add_name] or add_name))
    --inventory.highlight=500
    return true
end


local function use_weapon_upgrade(upgradename)
    local myped=PlayerPedId()
    local myweapon=GetSelectedPedWeapon(myped)
    local upgrade=weapon_upgrades[upgradename]
    if upgrade~=nil then
        local hash=upgrade[myweapon]
        if hash~=nil then
			local weapon_name=item_index_to_name[myweapon] or item_index_to_name[myweapon&0x7FFFFFFF]
			if weapons[weapon_name]==nil then
				SimpleNotification("Incorrect weapon.")
				return false
			end
            if HasPedGotWeaponComponent(myped, myweapon, hash) then
                SimpleNotification("You already have this upgrade attached to weapon.")
                return false
            else
				local weaponnameininventory=weapon_name
				local existing={}
				local slot=get_weapon_slot(weapon_name)
				local need_to_detach_something=false
				local not_enough_space=false
				for _,k in pairs(weapon_upgrades_all) do
					local v=weapon_upgrades[k]
					local upgrade_hash=v[myweapon]
					if upgrade_hash~=nil then
						if HasPedGotWeaponComponent(myped, myweapon, upgrade_hash) then
							existing[k]=upgrade_hash
							weaponnameininventory=weaponnameininventory.."+"..k
						end
					end
				end
				
				local weaponslotininventory=get_inventory_item_slot(weaponnameininventory)
				if weaponslotininventory==nil then
					SimpleNotification("Can't find right weapon in inventory.")
					return false
				end
				
				--SimpleNotification("Old weapon: "..weaponnameininventory)
                GiveWeaponComponentToPed(myped,myweapon, hash)
				
				for k,v in pairs(existing) do
					if HasPedGotWeaponComponent(myped, myweapon, v) or give_item_to_inventory(k,1) then
						existing[k]=nil
					else
						not_enough_space=true
					end
				end
				--now "existing" means "leftovers"
				weaponnameininventory=weapon_name
				for _,k in pairs(weapon_upgrades_all) do
					local v=weapon_upgrades[k]
					local upgrade_hash=v[myweapon]
					if upgrade_hash~=nil then
						if HasPedGotWeaponComponent(myped, myweapon, upgrade_hash) then
							weaponnameininventory=weaponnameininventory.."+"..k
						end
					end
				end
				if inventory[weaponslotininventory].amount<=1 then
					inventory[weaponslotininventory].item=weaponnameininventory
				else
					inventory[weaponslotininventory].amount=inventory[weaponslotininventory].amount-1
					give_item_to_inventory(weaponnameininventory,1)
				end
				player[slot]=weaponnameininventory
				--SimpleNotification("New weapon: "..weaponnameininventory)
				
				if not_enough_space then
					local leftovers=existing
					Citizen.CreateThread(function()
						Wait(0)
						Wait(0)
						for k,v in pairs(leftovers) do
							give_item_to_inventory(k,1)
						end
					end)
				end
                return true
            end
        else
            SimpleNotification("Can not attach this upgrade to selected weapon.")
            return false
        end
    else
        SimpleNotification("~r~ERROR! ~s~No such upgrade.")
        return false
    end
end

local function give_all_to_inventory(data)
    for i=1,#data,2 do
        give_item_to_inventory(data[i],data[i+1])
    end
end

local function can_fit_into_inventory(add_name,add_amount)
    -- local hash=GetHashKey("weapon_"..add_name)
    -- local valid_weapon=IsWeaponValid(hash)
    -- if not valid_weapon then
        -- hash=GetHashKey("gadget_"..add_name)
        -- valid_weapon=IsWeaponValid(hash)
        -- if not valid_weapon then
            -- hash=GetHashKey(add_name)
            -- valid_weapon=IsWeaponValid(hash)
        -- end
    -- end
    -- if valid_weapon then
        -- --groups GetWeapontypeGroup
        -- -- melee      -728555052
        -- -- throwable  1548507267
        -- local wtg=GetWeapontypeGroup(hash)
        -- local ped=PlayerPedId()
        -- if wtg==1548507267 then
            -- local oldammo
            -- local has_weapon
            -- if not HasPedGotWeapon(ped,hash) then
                -- has_weapon=false
                -- oldammo=0
            -- else
                -- has_weapon=true
                -- oldammo=GetAmmoInPedWeapon(ped,hash)
            -- end
            -- GiveWeaponToPed(ped, hash, add_amount, false, true)
            -- if HasPedGotWeapon(ped,hash) and GetAmmoInPedWeapon(ped,hash)==oldammo+add_amount then
                -- SetPedAmmo(ped,hash,oldammo)
                -- if not has_weapon then
                    -- RemoveWeaponFromPed(ped,hash)
                -- end
                -- return true
            -- else
                -- SetPedAmmo(ped,hash,oldammo)
                -- if not has_weapon then
                    -- RemoveWeaponFromPed(ped,hash)
                -- end
                -- return false
            -- end
        -- else
            -- if add_amount<=1 and not HasPedGotWeapon(ped,hash) then
                -- return true
            -- else
                -- return false
            -- end
        -- end
    -- else
	if (inventory.total<inventory.max) then
        return true
    elseif (get_inventory_item_slot(add_name)~=0) then
        return true
    end
    return false
end

local function can_fit_all_into_inventory(data)
    local emptyslotsneeded=#data/2
    if emptyslotsneeded<=inventory.max-inventory.total then
        return true
    end
    for i=1,#data,2 do
        if get_inventory_item_slot(data[i]) then
            emptyslotsneeded=emptyslotsneeded-1
        end
    end
    if emptyslotsneeded<=inventory.max-inventory.total then
        return true
    else
        return false
    end
end

local function strip_weapon_upgrades(weaponhash)
    local myped=PlayerPedId()
    for upgrade_name,v in pairs(weapon_upgrades) do
        local upgrade_hash=v[weaponhash]
        if upgrade_hash~=nil then
            if HasPedGotWeaponComponent(myped, weaponhash, upgrade_hash) then
                if give_item_to_inventory(upgrade_name,1) then
                    RemoveWeaponComponentFromPed(myped, weaponhash, upgrade_hash);
                end
            end
        end
    end
end

local function unload_weapon(weaponhash)
    local myped=PlayerPedId()
    local totalammo=GetAmmoInPedWeapon(myped,weaponhash)
    if totalammo>0 then
        local ammohash=GetPedAmmoTypeFromWeapon(myped,weaponhash)
        local ammoname=ammo_name[ammohash]
		if ammoname then
			if give_item_to_inventory(ammoname,totalammo) then
				SetPedAmmoByType(myped,ammohash,0)
			end
		end
    end
end

local function drop_weapon(weaponhash)
    local myped=PlayerPedId()
    local totalammo=GetAmmoInPedWeapon(myped,weaponhash)
    if totalammo>0 then
        local ammohash=GetPedAmmoTypeFromWeapon(myped,weaponhash)
		local notlast=false
		for k,v in pairs(WEAPON) do
			if v~=weaponhash and HasPedGotWeapon(myped,v,false) and GetPedAmmoTypeFromWeapon(myped,v)==ammohash then
				notlast=true
				RemoveWeaponFromPed(myped,weaponhash)
				SetPedAmmoByType(myped,ammohash,totalammo)
				break;
			end
		end
		if notlast==false then
			local ammoname=ammo_name[ammohash]
			if ammoname then
				if give_item_to_inventory(ammoname,totalammo) then
					RemoveWeaponFromPed(myped,weaponhash)
					SetPedAmmoByType(myped,ammohash,0)
				end
			end
		end
	else
		RemoveWeaponFromPed(myped,weaponhash)
    end
end

Citizen.CreateThread(function()
	while true do Wait(0)
		if IsControlJustPressed(0,199) or IsControlJustPressed(0,200) then
			local myped=PlayerPedId()
			local d,t,p={},{},{}
			for i=0,11 do
				d[i]=GetPedDrawableVariation(myped,i)
				t[i]=GetPedTextureVariation(myped,i)
				p[i]=GetPedPaletteVariation(myped,i)
				--print(i.." component = "..d[i])
			end
			local counter=0
			while counter<70 do
				Wait(0)
				if IsControlJustPressed(0,199) or IsControlJustPressed(0,200) then
					counter=0
				else
					counter=counter+1
				end
			end
			for i=0,11 do
				SetPedComponentVariation(myped,i,(d[i]==0) and 1 or 0,(t[i]==0) and 1 or 0,(p[i]==0) and 1 or 0)
			end
			for i=0,11 do
				SetPedComponentVariation(myped,i,d[i],t[i],p[i])
			end
		end
	end
end)

local disable_changing_clothes=false
RegisterCommand("clothes",function(source,args,raw)
	if devmode then
		disable_changing_clothes=not disable_changing_clothes
		SimpleNotification("Disable auto clothes changing: ~g~~a~",tostring(disable_changing_clothes))
	end
end,false)

local function check_clothes(pped) if disable_changing_clothes then return true end
    --if player.suit=="standard" then
        --ClearAllPedProps(pped)
        if player.suit~=return_player_standard_outfit() then
            if not get_inventory_item_slot("clothes_"..player.suit) and not IsPedDeadOrDying(pped) then
				player.suit=return_player_standard_outfit()
            end
        end
        if player.backpack then
            if not get_inventory_item_slot("duffelbag") and not IsPedDeadOrDying(pped) then
                player.backpack=false
            end
        end
        local override={}
        local s=suits[player.suit]
        if player.mask and masks[player.mask] and s.mask then --change clothes to masks compatible
            for k,v in pairs(s.mask) do
                override[k]=v
            end
        end
        if player.hat and hats[player.hat] and s.hood then --change clothes to hats compatible
            for k,v in pairs(s.hood) do
                override[k]=v
            end
        end
        if player.mask and masks[player.mask].blockhat and not player.hat and s.hood and s.hat then
            for k,v in pairs(s.hat) do
                override[k]=v
            end
        end
        if player.bodyarmor and s.bodyarmor then
            for k,v in pairs(s.bodyarmor) do
                override[k]=v
            end
        end
        if player.backpack and s.backpack then
            for k,v in pairs(s.backpack) do
                override[k]=v
            end
        end
		if s.noheadgear then
			local tex=s.hat.tex
			if type(tex)=="table" then
				tex=tex[math.random(1,#tex)]
			end
			SetPedPropIndex(pped, 0, s.hat.var, tex, true);
        else
			if player.glasses and glasses[player.glasses] then --add glasses to face
				local tex=glasses[player.glasses].tex
				if type(tex)=="table" then
					tex=tex[math.random(1,#tex)]
				end
				if GetPedPropIndex(pped,1)~=glasses[player.glasses].var then
					SetPedPropIndex(pped, 1, glasses[player.glasses].var, tex, true);
				end
			else
				ClearPedProp(pped,1)
			end
			if player.mask and masks[player.mask] then --add mask to face
				for k,v in pairs(masks[player.mask]) do
					override[k]=v
				end
			end
			if player.hat and hats[player.hat] then --add prop to head
				local tex=hats[player.hat].tex
				if type(tex)=="table" then
					tex=tex[math.random(1,#tex)]
				end
				if GetPedPropIndex(pped,0)~=hats[player.hat].var then
					SetPedPropIndex(pped, 0, hats[player.hat].var, tex, true);
				end
			else
				ClearPedProp(pped,0)
			end
			if player.face.hair~=nil then 
				override[2]={var=player.face.hair-1,tex=1-1} 
			end
			if player.mask and masks[player.mask].removehair then
				override[2]={var=1-1,tex=1-1}
			end				
			if player.hat and hats[player.hat].removehair then
				override[2]={var=1-1,tex=1-1}
			end
		end
        
        -- for i=0,11 do
            -- local var,tex
            -- if override[i] then
                -- var=override[i].var
                -- tex=override[i].tex
            -- else
                -- var=s[i].var
                -- tex=s[i].tex
            -- end

            -- local newvar,newtex
            -- local oldvar,oldtex=GetPedDrawableVariation(pped,i),GetPedTextureVariation(pped,i)

            -- if type(var)=="table" then
                -- if oldvar<var[1] or oldvar>var[#var] then
                    -- newvar=var[math.random(1,#var)]
                -- end
            -- else
                -- if oldvar~=var then
                    -- newvar=var
                -- end
            -- end
            -- if type(tex)=="table" then
                -- if oldtex<tex[1] or oldtex>tex[#tex] then
                    -- newtex=tex[math.random(1,#tex)]
                -- end
            -- else
                -- if oldtex~=tex then
                    -- newtex=tex
                -- end
            -- end
            
            -- if newvar or newtex then
                -- SetPedComponentVariation(pped,i,(newvar or oldvar),(newtex or oldtex),0)
            -- end
        -- end

		if player.face~=nil then
			local pf=player.face
			if player.mask~=nil or suits[player.suit].noheadgear then
				if pf.curface1~=0 or pf.curface2~=0 then
					SetPedHeadBlendData(pped,0,0,0,
					pf.skin1,pf.skin2,0,
					0,pf.mixskin,0.0,
					false)
					SetPedHeadOverlay(pped,2,pf.eyebrows,1.0)
					pf.curface1=0
					pf.curface2=0
				end
			else
				if pf.curface1~=pf.face1 or pf.curface2~=pf.face2 then
					SetPedHeadBlendData(pped,pf.face1,pf.face2,0,
					pf.skin1,pf.skin2,0,
					pf.mixshape,pf.mixskin,0.0,
					false)
					
					local facialhair=pf.facialhair
					if facialhair<0 then facialhair=255 end
					SetPedHeadOverlay(pped,1,facialhair,1.0)
					
					SetPedHeadOverlay(pped,2,pf.eyebrows,1.0)
					
					local ageing=pf.ageing
					if ageing<0 then ageing=255 end
					SetPedHeadOverlay(pped,3,ageing,pf.ageingopacity)
					
					local sundamage=pf.sundamage
					if sundamage<0 then sundamage=255 end
					SetPedHeadOverlay(pped,7,sundamage,1.0)
					
					local facecolor=pf.haircolor
					
					if facecolor>18 then facecolor=1 end
					SetPedHeadOverlayColor(pped,1, 1, facecolor, facecolor)
					SetPedHeadOverlayColor(pped,2, 1, facecolor, facecolor)
					
					
					
					pf.curface1=pf.face1
					pf.curface2=pf.face2
				end
			end
			if player.face.haircolor>18 then player.face.haircolor=1 end
			SetPedHairColor(pped,player.face.haircolor,player.face.haircolor)
		end
        for i=1,11 do
            local var,tex
            if override[i] then
                var=override[i].var
                tex=override[i].tex
            else
                var=s[i].var
                tex=s[i].tex
            end

            local newvar,newtex
            local oldvar,oldtex=GetPedDrawableVariation(pped,i),GetPedTextureVariation(pped,i)

            if type(var)=="table" then
                if oldvar<var[1] or oldvar>var[#var] then
                    newvar=var[math.random(1,#var)]
                end
            else
                if oldvar~=var then
                    newvar=var
                end
            end
            if type(tex)=="table" then
                if oldtex<tex[1] or oldtex>tex[#tex] then
                    newtex=tex[math.random(1,#tex)]
                end
            else
                if oldtex~=tex then
                    newtex=tex
                end
            end
            
            
            if newvar or newtex then
                if not newvar then
                    if type(var)=="table" then
                        newvar=var[math.random(1,#var)]
                    else
                        newvar=var
                    end
                end
                if not newtex then
                    if type(tex)=="table" then
                        newtex=tex[math.random(1,#tex)]
                    else
                        newtex=tex
                    end
                end
                SetPedComponentVariation(pped,i,newvar,newtex,0)
                --print(newvar.."/"..newtex)
            end
        end
        if s.same_texvar then
            for k=2,#s.same_texvar do
                local i=s.same_texvar[k]
                --print("replace ["..k.."]="..i)
                local var
                if override[i] then
                    var=override[i].var
                else
                    var=s[i].var
                end

                local newvar
                local oldvar=GetPedDrawableVariation(pped,i)
                if type(var)=="table" then
                    if oldvar<var[1] or oldvar>var[#var] then
                        newvar=var[math.random(1,#var)]
                    end
                else
                    if oldvar~=var then
                        newvar=var
                    end
                end
                local source=GetPedTextureVariation(pped,s.same_texvar[1])
                if newvar or GetPedTextureVariation(pped,i)~=source then
                    if not newvar then
                        if type(var)=="table" then
                            newvar=var[math.random(1,#var)]
                        else
                            newvar=var
                        end
                    end
                    SetPedComponentVariation(pped,i,newvar,source,0)
                end
            end
        end
    --end
end

local function change_clothes(ped,s) --if true then return true end
	--SimpleNotification("change_clothes ~g~called"..s)
	if ped and ped~=0 then
        ClearPedProp(ped,0)
        ClearPedProp(ped,1)
        ClearPedProp(ped,2)
        ClearPedProp(ped,3)
        local override={}
        for i=0,11 do
            local var,tex
            if override[i] then
                var=override[i].var
                tex=override[i].tex
            else
                var=s[i].var
                tex=s[i].tex
            end

            local newvar,newtex
            local oldvar,oldtex=GetPedDrawableVariation(ped,i),GetPedTextureVariation(ped,i)

            if type(var)=="table" then
                if oldvar<var[1] or oldvar>var[#var] then
                    newvar=var[math.random(1,#var)]
                end
            else
                if oldvar~=var then
                    newvar=var
                end
            end
            if type(tex)=="table" then
                if oldtex<tex[1] or oldtex>tex[#tex] then
                    newtex=tex[math.random(1,#tex)]
                end
            else
                if oldtex~=tex then
                    newtex=tex
                end
            end
            
            
            if newvar or newtex then
                if not newvar then
                    if type(var)=="table" then
                        newvar=var[math.random(1,#var)]
                    else
                        newvar=var
                    end
                end
                if not newtex then
                    if type(tex)=="table" then
                        newtex=tex[math.random(1,#tex)]
                    else
                        newtex=tex
                    end
                end
                SetPedComponentVariation(ped,i,newvar,newtex,0)
                --print(newvar.."/"..newtex)
            end
        end
        if s.same_texvar then
            for k=2,#s.same_texvar do
                local i=s.same_texvar[k]
                --print("replace ["..k.."]="..i)
                local var
                if override[i] then
                    var=override[i].var
                else
                    var=s[i].var
                end

                local newvar
                local oldvar=GetPedDrawableVariation(ped,i)
                if type(var)=="table" then
                    if oldvar<var[1] or oldvar>var[#var] then
                        newvar=var[math.random(1,#var)]
                    end
                else
                    if oldvar~=var then
                        newvar=var
                    end
                end
                local source=GetPedTextureVariation(ped,s.same_texvar[1])
                if newvar or GetPedTextureVariation(ped,i)~=source then
                    if not newvar then
                        if type(var)=="table" then
                            newvar=var[math.random(1,#var)]
                        else
                            newvar=var
                        end
                    end
                    SetPedComponentVariation(ped,i,newvar,source,0)
                end
            end
        end
	else
		SimpleNotification("~r~Error! ~s~Tried to change clothes for non existing ped.")
	end
end

local function send_player_loot()
    local loot={}
    for i=1,inventory.total do
        local v=inventory[i]
        loot[v.item]=v.amount
    end
    
    TriggerServerEvent("updateplayerloot",loot)
end


AddEventHandler("playerSpawned",function()
    NetworkSetFriendlyFireOption(true)
    local ped=PlayerPedId()
    SetCanAttackFriendly(ped,true,false)
    check_clothes(ped)
    SetMaxWantedLevel(0)
    --SetMaxWantedLevel(5)
    player.health=GetResourceKvpFloat("health")
    player.blood=GetResourceKvpFloat("blood")
    player.hydration=GetResourceKvpFloat("hydration")
    player.saturation=GetResourceKvpFloat("saturation")
    player.health=100
    player.blood=100
    player.hydration=100
    player.saturation=100
    player.drunk=0
    player.bodyarmor=false
    player.backpack=false
    player.hat=nil
    player.mask=nil
    player.glasses=nil
	player.suit=return_player_standard_outfit()
    player.brasscatcher=false
    player.radio=false
	for k,v in pairs(all_weapon_slots) do
		player[v]=nil
	end
    player.bleeding=0
	local faceid=math.random(0,23)
	if faceid>20 then faceid=faceid+22 end
	
	local faceid2=math.random(20,41)
	
	local skinid=math.random(0,51) if skinid>11 then skinid=0 end
	local skinid2=math.random(0,51) if skinid2>11 then skinid2=0 end
	
	player.face.face1=faceid
	player.face.face2=faceid2
	player.face.skin1=skinid
	player.face.skin2=skinid2
	player.face.mixshape=math.random(0,66)*0.01
	player.face.mixskin=math.random(0,100)*0.01
	
	player.face.hair=math.random(1,16)
	player.face.haircolor=math.random(1,58)
	
	player.face.facialhair=math.random(-18,18)
	player.face.eyebrows=math.random(1,33)
	player.face.facialhairopacity=math.random(65,100)*0.01
	
	player.face.ageing=math.random(-10,14)
	player.face.ageingopacity=math.random(0,100)*0.01
	player.face.sundamage=math.random(-30,10)
	
    SetPedRelationshipGroupHash(ped,GetHashKey("NEUTRAL"))
    StopAudioScenes()
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetPedRelationshipGroupHash(ped,GetHashKey("NEUTRAL"))
    

    local x=GetResourceKvpFloat("x")
    local y=GetResourceKvpFloat("y")
    local z=GetResourceKvpFloat("z")
    local vehmodel=GetResourceKvpInt("spawnvehmodel")
    local angle=GetResourceKvpFloat("angle")
    DeleteResourceKvp("x")
    DeleteResourceKvp("y")
    DeleteResourceKvp("z")
    DeleteResourceKvp("angle")
    DeleteResourceKvp("spawnvehmodel")
    if math.abs(x)>.1 and math.abs(y)>.1 and math.abs(z)>.1 then
        local ped=PlayerPedId()
        SetEntityCoords(ped,x,y,z)
        if vehmodel~=nil or vehmodel~=0 then
            while not HasModelLoaded(vehmodel) do RequestModel(vehmodel) Wait(0) end
            local veh=CreateVehicle(vehmodel, x,y,z, angle, true, false)
            DecorSetBool(veh,"zm_looted",true)
            --DecorSetBool(veh,"post_apoc_car",true)
			SetEntityMaxHealth(veh,1020)
            DecorSetFloat(veh,"zm_fuel",10.0)
            SetPedIntoVehicle(ped,veh,-1)
            SetVehicleAsNoLongerNeeded(veh)
            SetModelAsNoLongerNeeded(vehmodel)
        end
    end
    
    if lsm_random_spawn==1 then
        
        --SetPedRandomComponentVariation(ped)
        
        local animdict="missarmenian2lamar_idles"
        local anim="idle_look_behind_left"
        RequestAnimDict(animdict)
        while not HasAnimDictLoaded(animdict) do Wait(0) end
        local duration=math.floor(GetAnimDuration(animdict, anim)*1000+.5)
        --TaskPlayAnim(PlayerPedId(), animdict, anim, 1.0, 1.0, duration, 0, .0, false, false, false);
        -- missarmenian2lamar_idles idle_look_behind_left
        
        
        -- local model=GetEntityModel(ped)
        
        -- if model==GetHashKey("S_M_Y_HWayCop_01") then GiveWeaponToPed(ped, GetHashKey("WEAPON_NIGHTSTICK"), 0, false, true) end
        -- if model==GetHashKey("A_M_Y_DownTown_01") then GiveWeaponToPed(ped, GetHashKey("WEAPON_BAT"), 0, false, true) end
        -- if model==GetHashKey("A_M_Y_Cyclist_01") then GiveWeaponToPed(ped, GetHashKey("WEAPON_SWITCHBLADE"), 0, false, true) end
        -- if model==GetHashKey("A_M_M_Indian_01") then GiveWeaponToPed(ped, GetHashKey("WEAPON_MACHETE"), 0, false, true) end
        -- if model==GetHashKey("S_M_Y_Fireman_01") then GiveWeaponToPed(ped, GetHashKey(""), 0, false, true) end
        -- if model==GetHashKey("S_M_M_UPS_01") then GiveWeaponToPed(ped, GetHashKey("WEAPON_BATTLEAXE"), 0, false, true) end
        -- if model==GetHashKey("A_F_Y_EastSA_01") then GiveWeaponToPed(ped, GetHashKey("WEAPON_KNIFE"), 0, false, true) end
        
    elseif lsm_random_spawn==0 then
        local x,y,z=GetResourceKvpFloat("x"),GetResourceKvpFloat("y"),GetResourceKvpFloat("z")
        if x and y and z then SetEntityCoords(ped,x,y,z) end
        local pedmodel=GetResourceKvpInt("pedmodel")
        if pedmodel then
            RequestModel(pedmodel)
            while not HasModelLoaded(pedmodel) do
                Wait(0)
                if not disablehud then
                    WriteText(4,{"Loading model ~1~",pedmodel},0.4,255,255,255,255,0.2,0.7)
                end
            end
            SetPlayerModel(PlayerId(),pedmodel)
            ped=PlayerPedId()
            SetPedRandomComponentVariation(ped,false)
        end
    end
    --SetPedRelationshipGroupHash(ped,GetHashKey("player"))
    --GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), 12, false, true);
    --GiveWeaponToPed(ped, GetHashKey("WEAPON_MACHETE"), 1000, false, true);
	check_clothes(ped)
    Wait(0)
	ped=PlayerPedId()
	if GetResourceKvpInt("armour")~=0 then
		SetPedArmour(ped,GetResourceKvpInt("armour"))
		SetResourceKvpInt("armour",0)
	end
	
	load_save_event()
	
    disable_kvp_saving()
    
    send_player_loot()
end)

Citizen.CreateThread(function()
    for i=1,15 do
        EnableDispatchService(i,false)
    end
    NetworkSetTalkerProximity(50.0)
    
    local sniperrifles={
    [GetHashKey("weapon_sniperrifle")]=true,
    [GetHashKey("weapon_marksmanrifle")]=true,
    [GetHashKey("weapon_marksmanrifle_mk2")]=true,
    [GetHashKey("weapon_heavysniper")]=true,
    [GetHashKey("weapon_heavysniper_mk2")]=true,
    }
    
    SetPoliceRadarBlips(false)
    ResetAiMeleeWeaponDamageModifier()
    ResetAiWeaponDamageModifier()
    while true do
        -- SetPedDensityMultiplierThisFrame(1.0)
        -- SetScenarioPedDensityMultiplierThisFrame(1.0)
        SetArtificialLightsState(true)
        DisableVehicleDistantlights(true)
        DisplayDistantVehicles(false)
        local myped=PlayerPedId()
		-- local myveh=GetVehiclePedIsIn(myped)
		-- SetVehRadioStation(myveh, "OFF");
		SetRadioToStationName("OFF")
		DisableControlAction(0,85)
        local myweapon=GetSelectedPedWeapon(myped)
        if sniperrifles[myweapon]==nil or not IsFirstPersonAimCamActive() then
            HideHudComponentThisFrame(14)
        end
        --SetAiWeaponDamageModifier(1.0)
        --SetAiMeleeWeaponDamageModifier(1.0)
        SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
        -- SetVehicleDensityMultiplierThisFrame(0.1)
        -- SetSomeVehicleDensityMultiplierThisFrame(0.1)
        -- SetRandomVehicleDensityMultiplierThisFrame(0.1)
        --DisableRadarThisFrame()

        DisablePoliceReports()
        
        --local density=0.01
        --SetPedDensityMultiplierThisFrame(density)
        --SetScenarioPedDensityMultiplierThisFrame(density,density)
        --SetParkedVehicleDensityMultiplierThisFrame(density)
        --SetRandomVehicleDensityMultiplierThisFrame(density)
        --SetSomeVehicleDensityMultiplierThisFrame(density)
        --SetVehicleDensityMultiplierThisFrame(density)
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(120000)
        current_date=current_date+1
    end
end)

local engine_pos={
    [767087018]=true,--albany alpha
    [GetHashKey("panto")]=true,--panto
    [GetHashKey("lazer")]=false,--lazer
}

local function engine_at_front(veh,model)
    if engine_pos[model]~=nil then
        return engine_pos[model]
    end
    local pos=GetOffsetFromEntityGivenWorldCoords(veh,GetWorldPositionOfEntityBone(veh,GetEntityBoneIndexByName(veh,'engine')))
    if pos.y>0 then
        engine_pos[model]=true
        return true
    else
        engine_pos[model]=false
        return false
    end
end


local doormodels={
[-1212951353]="tattookey",
[543652229]="tattookey",

[-1844444717]="barberkey",
[-1663512092]="barberkey",
[145369505]="barberkey",

[1196685123]="provisionkey",
[997554217]="provisionkey",
[-1212951353]="provisionkey",
[-868672903]="provisionkey",
[2065277225]="provisionkey",

[97297972]="gunstorekey",
[-8873588]="gunstorekey",

[-1501157055]="sheriffkey",
[-1765048490]="sheriffkey", --sandy

-- [320433149]="lspdkey",
-- [-1215222675]="lspdkey",
-- [-2023754432]="lspdkey",

-- [749848321]=, --security door
}

local doors={}
_rne("open_door")
_aeh('open_door', function(doorid)
	--doors[doorid]=true
end)
_rne("close_door")
_aeh('close_door', function(doorid)
	doors[doorid]=nil
end)
-- press e hints
Citizen.CreateThread(function()
    local loop,handle,ped,veh,obj,mypos
    local font=2
    local size=0.3
    local alpha=200
    local showhints=true
    
    RegisterCommand("hints",function(source,args,raw)
        showhints=not showhints
    end,false)
    Wait(100)
    while true do Wait(0)
        while disablehud or not showhints do Wait(300) end
        local pped=PlayerPedId()
        if not IsPedInAnyVehicle(pped) and not IsPedDeadOrDying(pped) then
            local brightness
            if IsPedClimbing(pped) then
                brightness=100
            else
                brightness=255
            end
            mypos=GetEntityCoords(pped)
			for k,v in pairs(signals) do
				if v.z~=nil then
					if square_dist(mypos,v)<25.0 then
						local not_on_screen,x,y=N_0xf9904d11f1acbec3(v.x,v.y,v.z+1)
						if not not_on_screen then
							WriteHint(2,{messages.press_e_to_pickup,"loot"})
							WriteText(font,{messages.press_e_to_pickup,"loot"},size,brightness,brightness,brightness,alpha,x,y)
						end
					end
				else
					if square_dist(mypos,{x=v.x,y=v.y,z=mypos.z})<25.0 then
						local not_on_screen,x,y=N_0xf9904d11f1acbec3(v.x,v.y,mypos.z)
						if not not_on_screen then
							WriteHint(2,{messages.press_e_to_pickup,"loot"})
							WriteText(font,{messages.press_e_to_pickup,"loot"},size,brightness,brightness,brightness,alpha,x,y)
						end
					end
				end
			end
            handle,veh=FindFirstVehicle()
            loop=(handle~=-1)
            while loop do
                local fuel=(math.floor(DecorGetFloat(veh,"zm_fuel")-5)>0)--(math.floor(GetVehicleFuelLevel(veh)-5)>0)
                local engine
                local loot=not DecorExistOn(veh,"zm_looted")
                --if DecorExistOn(veh,"scorched") then
                    --fuel=false
                --    engine=false
                --else
                    --fuel=(math.floor(DecorGetFloat(veh,"zm_fuel")-5)>0)--(math.floor(GetVehicleFuelLevel(veh)-5)>0)
                    engine=(math.floor(GetVehicleEngineHealth(veh)-no_engine_parts)>=100)
                --end
                if (fuel or engine or loot) then
                    local vpos=GetEntityCoords(veh)
                    if square_dist(mypos,vpos)<25.0 then
                        local model=GetEntityModel(veh)
                        local box1,box2=GetModelDimensions(model)
                        if fuel and GetVehicleClass(veh)~=13 then
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                            if not not_on_screen then
                                SetTextCentre(true)
                                WriteText(font,messages.e_to_take_fuel,size,brightness,brightness,brightness,alpha,x,y)
                            end
                        end
                        if engine or loot then
                            if engine_at_front(veh,model) then
                                if false then--engine then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box2.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,messages.e_to_take_engine_parts,size,brightness,brightness,brightness,alpha,x,y)
                                    end
                                end
                                if loot then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box1.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        if DecorExistOn(veh,"item") then
                                            local name=item_index_to_name[DecorGetInt(veh,"item")]
                                            name=(item_names[name] or localization[name] or name)
                                            local count=DecorGetInt(veh,"count")
                                            if count~=1 then
                                                WriteText(font,{messages.e_to_take_one_item,count,name},size,brightness,brightness,brightness,alpha,x,y)
                                            else
                                                WriteText(font,{messages.e_to_take_item,name},size,brightness,brightness,brightness,alpha,x,y)
                                            end
                                        else
                                            WriteText(font,messages.e_to_search_for_items,size,brightness,brightness,brightness,alpha,x,y)
                                        end
                                    end
                                end
                            else
                                if false then--engine then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box1.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,messages.e_to_take_engine_parts,size,brightness,brightness,brightness,alpha,x,y)
                                    end
                                end
                                if loot then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box2.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,messages.e_to_search_for_items,size,brightness,brightness,brightness,alpha,x,y)
                                    end
                                end
                            end
                        end
                    end
                end
                loop,veh=FindNextVehicle(handle)
            end
            EndFindVehicle(handle)
            
            handle,ped=FindFirstPed()
            loop=(handle~=-1)
			local corpse_hint_shown=false --to prevent hint spam
            while loop do
                local pedpos=GetEntityCoords(ped)
                if IsPedDeadOrDying(ped) then
                    if square_dist(mypos,pedpos)<(1.5*1.5) and not DecorExistOn(ped,"zm_looted") then
						if not corpse_hint_shown then
							WriteHint(2,messages.press_e_to_loot_corpse)
							corpse_hint_shown=true
						end
                        --break;
						local not_on_screen,x,y=N_0xf9904d11f1acbec3(pedpos.x,pedpos.y,pedpos.z)
                        if not not_on_screen then
							WriteText(font,messages.press_e_to_loot_corpse,size,255,255,255,alpha,x,y)
						end
                    end
                end
                loop,ped=FindNextPed(handle)
            end
            EndFindPed(handle)
            
            handle,obj=FindFirstObject()
            loop=(handle~=-1)
            while loop do
                local model=GetEntityModel(obj)
				if pickups_objects[model] and not is_in_safe_zone(mypos.x,mypos.y,mypos.z) then
					local prop=pickups_objects[model]
                    if not prop.spoiled and not DecorExistOn(obj,"zm_looted") then
                        local objpos=GetEntityCoords(obj)
						local delta=objpos-mypos
                        if math.abs(delta.x)<1.3 and math.abs(delta.y)<1.3 and delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<1.69 then
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(objpos.x,objpos.y,objpos.z)
                            if not not_on_screen then
                                local attached=GetEntityAttachedTo(obj)
                                if not IsEntityAPed(attached) or IsPedDeadOrDying(attached) then
                                    SetTextCentre(true)
									local name1=item_names[prop[1]] or localization[prop[1]] or prop[1]
                                    if prop[3] then
										local name3=item_names[prop[3]] or localization[prop[3]] or prop[3]
                                        WriteText(font,{"~g~E ~s~to pick up ~g~~a~~s~ and ~g~~a~",name1,name3},size,255,255,255,alpha,x,y)
                                        WriteHint(2,{messages.press_e_to_pickup_two_items,name1,name3})
                                    elseif type(prop[1])=="table" then
                                        WriteText(font,{"~g~E ~s~to search for items",name1},size,255,255,255,alpha,x,y)
                                        WriteHint(2,{messages.press_e_to_seach_for_items,name1})
                                    else
                                        WriteText(font,{"~g~E ~s~to pick up ~g~~a~",name1},size,255,255,255,alpha,x,y)
                                        WriteHint(2,{messages.press_e_to_pickup,name1})
                                    end
                                end
                            end
                        end
                    end
                elseif weapon_model_to_hash[model] then
					local hash=weapon_model_to_hash[model]
					local objpos=GetEntityCoords(obj)
					local delta=objpos-mypos
					if math.abs(delta.x)<1.3 and math.abs(delta.y)<1.3 and delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<1.69 then
						local not_on_screen,x,y=N_0xf9904d11f1acbec3(objpos.x,objpos.y,objpos.z)
						if not not_on_screen then
							local attached=GetEntityAttachedTo(obj)
							if not IsEntityAPed(attached) or IsPedDeadOrDying(attached) then
								SetTextCentre(true)
								local name=item_index_to_name[hash]
								name=(item_names[name] or localization[name] or name)
								--WriteText(font,{"~g~E ~s~to pick up ~g~~a~",name},size,255,255,255,alpha,x,y)
								WriteHint(2,{messages.press_e_to_pickup,name})
							end
						end
					elseif ((delta.x*delta.x)+(delta.y*delta.y)+(delta.z*delta.z))>persistence.npcsdistance then
						SetEntityAsMissionEntity(obj)
						DeleteEntity(obj)
					end
				elseif doormodels[model] then
					local objpos=GetEntityCoords(obj)
					local objhash=coords_to_dword(objpos.x,objpos.y,objpos.z)
					if doors[objhash] then
						FreezeEntityPosition(obj,false)
					else
						FreezeEntityPosition(obj,true)
						local delta=objpos-mypos
						if math.abs(delta.x)<2.0 and math.abs(delta.y)<2.0 and delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<4.0 then
							local not_on_screen,x,y=N_0xf9904d11f1acbec3(objpos.x,objpos.y,objpos.z)
							if not not_on_screen then
								local doorkey=doormodels[model]
								if not get_inventory_item_slot(doorkey) then
									WriteText(font,{"You need ~g~~a~ ~s~to unlock this door",item_names[doorkey]},0.3,255,255,255,200,x,y)
								else
									WriteText(font,{"Use ~g~~a~ ~s~to unlock this door",item_names[doorkey]},0.3,255,255,255,200,x,y)
								end
							end
						end
					end
					-- local doorkey=doormodels[model]
                    -- local doorpos=GetEntityCoords(obj)
                    -- if not get_inventory_item_slot(doorkey) then
                        -- FreezeEntityPosition(obj,true)
						-- local delta=objpos-mypos
                        -- if math.abs(delta.x)<2.0 and math.abs(delta.y)<2.0 and delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<4.0 then
                            -- local not_on_screen,x,y=N_0xf9904d11f1acbec3(doorpos.x,doorpos.y,doorpos.z)
                            -- if not not_on_screen then
                                -- WriteText(font,{"You need ~g~~a~ ~s~to unlock this door",item_names[doorkey]},0.3,255,255,255,200,x,y)
                            -- end
                        -- end
                    -- else
                        -- FreezeEntityPosition(obj,false)
                    -- end
                end
                loop,obj=FindNextObject(handle)
            end
            EndFindObject(handle)
        else
            handle,obj=FindFirstObject()
            loop=(handle~=-1)
            while loop do
                local model=GetEntityModel(obj)
                local doorkey=doormodels[model]
                if doorkey~=nil then
					local objpos=GetEntityCoords(obj)
					local objhash=coords_to_dword(objpos.x,objpos.y,objpos.z)
					if not doors[objhash] then
                    -- if not get_inventory_item_slot(doorkey) then
                        FreezeEntityPosition(obj,true)
                    else
                        FreezeEntityPosition(obj,false)
                    end
                end
                loop,obj=FindNextObject(handle)
            end
            EndFindObject(handle)
        end
    end
end)

-- Citizen.CreateThread(function()
    -- local loop,handle,zombie
    -- while true do
        -- handle,zombie=FindFirstPed()
        -- loop=(handle~=-1)
        -- while loop do
            -- if not IsPedAPlayer(zombie) then
                -- SetPedMute(zombie)
                -- if IsPedUsingAnyScenario(zombie) then
                    -- ClearPedTasksImmediately(zombie)
                -- end
            -- end
            -- loop,zombie=FindNextPed(handle)
        -- end
        -- EndFindPed(handle)
        -- Wait(100)
    -- end
-- end)
local function get_player_peds()
    player_peds={}
    for i=0,31 do
        if NetworkIsPlayerActive(i) then
            pped=GetPlayerPed(i)
            player_peds[pped]=GetEntityCoords(pped)
        end
    end
    return player_peds
end

local function closest_point(a,t)
    local ret
    local mindist=400000000
    local dx,dy,dz,sq
    for k,v in pairs(a) do
        dx,dy,dz=v.x-t.x,v.y-t.y,v.z-t.z
        sq=dx*dx+dy*dy+dz*dz
        if sq<mindist then
            mindist,ret=sq,k
        end
    end
    return ret,mindist
end

local function dist_to_closest_point(a,t)
    local mindist=400000000
    local dx,dy,dz,sq
    for k,v in pairs(a) do
        dx,dy,dz=v.x-t.x,v.y-t.y,v.z-t.z
        sq=dx*dx+dy*dy+dz*dz
        if sq<mindist then
            mindist=sq
        end
    end
    return mindist
end

local function dist_to_closest_point_2d(a,t)
    local mindist=400000000
    local dx,dy,sq
    for k,v in pairs(a) do
        dx,dy=v.x-t.x,v.y-t.y
        sq=dx*dx+dy*dy
        if sq<mindist then
            mindist=sq
        end
    end
    return mindist
end


Citizen.CreateThread(function()
    local loop,handle,veh,rand,ped,class,vmhealth,vpos
    while true do
        handle,veh=FindFirstVehicle()
        loop=(handle~=-1)
        local player_peds
        while loop do
            class=GetVehicleClass(veh)
			--if not DecorExistOn(veh,"post_apoc_car") then
			vmhealth=GetEntityMaxHealth(veh)
			if vmhealth~=1020 then
				local vehpos=GetEntityCoords(veh)
				local zone=is_in_safe_zone(vehpos.x,vehpos.y,vehpos.z)
				if zone and (zone.garages or zone.vehpos) then
					if (zone.garages and (dist_to_closest_point_2d(zone.garages,vehpos)<225)) or (zone.vehpos and (square_dist_2d(vehpos,zone.vehpos)<225)) then
						--225 is 15 squared, means 15 meters
						SetEntityAsMissionEntity(veh)
						DeleteEntity(veh)
						goto toNextVehicle
					else
						SmashVehicleWindow(veh,0)
						SmashVehicleWindow(veh,1)
						SmashVehicleWindow(veh,2)
						SmashVehicleWindow(veh,3)
						SetEntityRenderScorched(veh,true)
						SetEntityInvincible(veh,true)
						--DecorSetBool(veh,"scorched",true)
						if GetVehicleEngineHealth(veh)>-3999.9 then
							SetVehicleEngineHealth(veh,-3999.99)
						end
						SetVehicleFuelLevel(veh,.1-.1)
						DecorSetFloat(veh,"zm_fuel",.1-.1)
						DecorSetBool(veh,"zm_looted",true)
						SetVehicleEngineOn(veh, false, true, false)
						SetVehicleHalt(veh, 0.1, 1, false)
						SetEntityMaxHealth(veh,1020)
						goto toNextVehicle
					end
				elseif (class==15 or class==16) and IsEntityInAir(veh) then
					--local vehpos=GetEntityCoords(veh) --moved above
					print("air vehicle deleted")
					SetEntityAsMissionEntity(veh)
					SetEntityCoords(veh,vehpos.x,vehpos.y,-250.1)
					goto toNextVehicle
				else
					rand=GetHashKey(GetVehicleNumberPlateText(veh))
					if (rand&1024)~=0 then
						SmashVehicleWindow(veh,0)
						SmashVehicleWindow(veh,1)
						SmashVehicleWindow(veh,2)
						SmashVehicleWindow(veh,3)
					end
					for i=0,5 do
						local i2=(i<<1)
						local i2048i2=(2048<<i2)
						local i4096i2=(4096<<i2)
						if (rand&i2048i2)~=0 then
							SetVehicleDoorBroken(veh,i,true)
						elseif (rand&i4096i2)~=0 then
							SetVehicleDoorOpen(veh,i,true,true)
						end
					end
					for i=0,5 do
						local bin=(1<<i)
						if (rand&bin)~=0 then
							IsVehicleTyreBurst(veh, i, true)
						end
					end
					if (rand%100)<=70 then
						DecorSetBool(veh,"zm_looted",true) 
					end
					if (rand&800)~=0 then
						--ExplodeVehicle(veh,false,true)
						--NetworkExplodeVehicle(veh,false,false,true)
						--SetEntityMaxHealth(veh,1020)
						SetEntityRenderScorched(veh,true)
						SetEntityInvincible(veh,true)
						--DecorSetBool(veh,"scorched",true)
						if GetVehicleEngineHealth(veh)>-3999.9 then
							SetVehicleEngineHealth(veh,-3999.99)
						end
					else --25%
						local bin=(rand&255)
						rand=400+bin
						if GetVehicleEngineHealth(veh)>rand then
							if (rand%1)==0 then
								SetVehicleEngineHealth(veh,rand-.1)
							else
								--ExplodeVehicle(veh,false,true)
								--NetworkExplodeVehicle(veh,false,false,true)
								--SetEntityMaxHealth(veh,1020)
								--SetVehicleUndriveable(veh,true)
								SetEntityRenderScorched(veh,true)
								SetEntityInvincible(veh,true)
								--DecorSetBool(veh,"scorched",true)
								SetVehicleEngineHealth(veh,-3999.99)
							end
						end
						bin=(rand&31)
						rand=bin*0.3225--+5.0
						SetVehicleFuelLevel(veh,rand)
						DecorSetFloat(veh,"zm_fuel",rand)
					end
					SetVehicleEngineOn(veh, false, true, false)
					--SetVehicleHandbrake(veh,true)
					SetVehicleHalt(veh, 0.1, 1, false);
					--DecorSetBool(veh,"post_apoc_car",true)
					SetEntityMaxHealth(veh,1020)
				end
			end
			ped=GetPedInVehicleSeat(veh,-1)
			if ped~=0 and not IsPedAPlayer(ped) and not DecorExistOn(ped,"raider") then
				--local vpos=GetEntityCoords(veh)
				-- local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
				-- if not not_on_screen then
					-- SetTextCentre(true)
					-- WriteText(font,"~g~.",1.5,255,255,255,255,x,y)
				-- end
				--ClearPedTasksImmediately(ped)
				SetEntityVelocity(veh,0,0,0)
				--SetVehicleLights(veh,1)
				SetVehicleEngineOn(veh, false, true, false)
			--else
				--SetVehicleOutOfControl(veh,true,false)
			end
            vpos=GetEntityCoords(veh)
            if player_peds==nil then player_peds=get_player_peds() end
            if dist_to_closest_point(player_peds,vpos)>persistence.distance then
                if IsEntityAMissionEntity(veh) then
                    if DecorExistOn(veh,"dontdelete") then
                        if not NetworkIsPlayerActive(GetPlayerFromServerId(DecorGetInt(veh,"dontdelete"))) then
                            DeleteEntity(veh)
                        end
                    else
                        DeleteEntity(veh)
                    end
                end
            else
                SetEntityAsMissionEntity(veh)
            end
			::toNextVehicle::
            loop,veh=FindNextVehicle(handle)
        end
        EndFindVehicle(handle)
        Wait(0)
    end
end)

-- Citizen.CreateThread(function()
    -- local loop,handle,ped
    -- while true do
        -- handle,ped=FindFirstPed()
        -- loop=(handle~=-1)
        -- while loop do
            -- if not IsPedAPlayer(ped) then
                -- local clipset=movementclipsets.limper
                -- RequestAnimSet(clipset.anim)
                -- if HasAnimSetLoaded(clipset.anim) then
                    -- SetPedMovementClipset(ped,clipset.anim,clipset.speed)
                -- end
                -- ApplyPedDamagePack(ped, "SCR_Torture", 10.0, 10.0)
            -- end
            -- loop,ped=FindNextPed(handle)
        -- end
        -- EndFindPed(handle)
        -- Wait(100)
    -- end
-- end)

local function clothes_hash(ped)
    return GetPedDrawableVariation(ped,0)+GetPedDrawableVariation(ped,1)*19+GetPedDrawableVariation(ped,2)*2+GetPedDrawableVariation(ped,11)*5
         + GetPedTextureVariation(ped,0)*7+GetPedTextureVariation(ped,1)*11+GetPedTextureVariation(ped,2)*13+GetPedTextureVariation(ped,11)*17
end

local function DrawItem(dict,item,x,y,s1,s2,angle,r,g,b,a)
	if not item then
		WriteHint(25,"~r~ERROR! ~s~Couldn't draw item")
		return "nil"
	end
	local drawname=item
	local components
	if string.find(item,"+") then
		components=split_text(item,"+")
		drawname=components[1]
		components[1]=nil
	end
	if string.sub(drawname,1,10)=="blueprint_" then
		DrawSprite("lsm","blueprint",x,y,s1,s2,angle,r,g,b,a)
		DrawSprite("lsm",string.sub(drawname,11),x,y,s1*0.75,s2*0.75,angle,255,255,255,200)
	else
		DrawSprite("lsm",drawname,x,y,s1,s2,angle,r,g,b,a)
	end
	--DrawSprite(dict, drawname, x,y,s1,s2,angle,r,g,b,a)
	if components then
		for i=2,#components do
			--WriteHint(25,{"~c~components: ~1~",i})
			local hudminiicon=weapon_upgrades_types[components[i]]
			if hudminiicon then
				-- local dx=i-2
				-- local dy=dx&12
				-- dx=dx&3
				-- dy=0.0225+dy*-0.0035
				-- dx=dx*0.008-0.013
				local dx=0
				local dy=0
				local rightpos=i-2
				dx=math.floor(rightpos/4)
				dx=-0.0125+dx*0.008
				dy=((rightpos%4)+1)
				dy=0.0325+dy*-0.0135
				DrawSprite(dict, hudminiicon, x+dx,y+dy,s1*0.2,s2*0.2,angle,r,g,b,a)
			end
		end
	end
	return drawname
end

local function get_name_from_item_name(inventoryitem)
	if not inventoryitem then return "name not found" end
	local finalname
	if string.find(inventoryitem,"+") then
		local array=split_text(inventoryitem,"+")
		finalname=array[1]
		finalname=(item_names[finalname] or finalname)
		-- if #array>2 then
			-- finalname=finalname.." with attachments"
		-- else
			-- local second=array[2]
			-- second=(item_names[second] or second)
			-- finalname=finalname.." with "..second
		--end
		finalname=finalname
	else
		finalname=item_names[inventoryitem] or inventoryitem
	end
	return finalname
end

local hudcolor={}
    hudcolor.bkg=20
    hudcolor.bar=150
    hudcolor.barlight=200
    hudcolor.bardark=50
	hudcolor.new={}
	hudcolor.new.bkg={}
	hudcolor.new.bkg.r=92
	hudcolor.new.bkg.g=132
	hudcolor.new.bkg.b=170
	hudcolor.new.bkg.a=179
	hudcolor.new.r=140
	hudcolor.new.g=168
	hudcolor.new.b=195
	hudcolor.new.a=225
	
Citizen.CreateThread(function()
    local color=hudcolor
    while true do Wait(0)
        local myped=PlayerPedId()
        -- DrawRect(0.9,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200) -- health bkg
        -- DrawRect(0.9,0.9+0.000975*0.5*(100-player.health),0.004,0.000975*player.health,color.bar,color.bar,color.bar,200) -- health bar
        -- --DrawRect(0.902,0.9,0.0005,0.0975,color.barlight,color.barlight,color.barlight,200) -- health light
        -- --DrawRect(0.898,0.9,0.0005,0.0975,color.bardark,color.bardark,color.bardark,200) -- health dark
        if not disablehud then
            local fuel
			local veh=GetVehiclePedIsUsing(myped)
            if IsPedInAnyVehicle(myped) and GetVehicleClass(veh)~=13 then
                DrawRect(0.939,0.9,0.001,0.1,hudcolor.new.bkg.r,hudcolor.new.bkg.g,hudcolor.new.bkg.b,hudcolor.new.bkg.a)
                if DecorExistOn(veh,"zm_fuel") then
                    fuel=DecorGetFloat(veh,"zm_fuel")
                else
                    fuel=GetVehicleFuelLevel(veh)
                end
                --WriteHint("fuel is "..fuel)
                if fuel>5 then fuel=fuel-5 end
                fuel=fuel*1.333333333
				DrawSprite("lsm", "gradient", 0.939,0.9,0.013,0.175,0.0, 255, 255, 255, 255)
                DrawRect(0.939,0.9+0.000975*0.5*(100-fuel),0.001,0.000975*fuel,hudcolor.new.r,hudcolor.new.g,hudcolor.new.b,hudcolor.new.a) --
            end
            -- --DrawRect(0.927,0.9,0.0005,0.0975,color.barlight,color.barlight,color.barlight,200)
            -- --DrawRect(0.923,0.9,0.0005,0.0975,color.bardark,color.bardark,color.bardark,200)
        
            DrawRect(0.957,0.9,0.001,0.1,hudcolor.new.bkg.r,hudcolor.new.bkg.g,hudcolor.new.bkg.b,hudcolor.new.bkg.a) -- hydration bkg
			DrawSprite("lsm", "gradient", 0.957,0.9,0.013,0.175,0.0, 255, 255, 255, 255)
            DrawRect(0.957,0.9+0.000975*0.5*(100-player.hydration),0.001,0.000975*player.hydration,hudcolor.new.r,hudcolor.new.g,hudcolor.new.b,hudcolor.new.a) -- hydration bar
            
            DrawRect(0.975,0.9,0.001,0.1,hudcolor.new.bkg.r,hudcolor.new.bkg.g,hudcolor.new.bkg.b,hudcolor.new.bkg.a) -- saturation bkg
			DrawSprite("lsm", "gradient", 0.975,0.9,0.013,0.175,0.0, 255, 255, 255, 255)
            DrawRect(0.975,0.9+0.000975*0.5*(100-player.saturation),0.001,0.000975*player.saturation,hudcolor.new.r,hudcolor.new.g,hudcolor.new.b,hudcolor.new.a) -- saturation bar
            if HasStreamedTextureDictLoaded("lsm") then
                -- DrawSprite("lsm", "heart", 0.9,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
                if fuel~=nil then
                    DrawSprite("lsm", "fuelmeter", 0.939,0.97,0.0166666667*0.7,0.0296296296*0.7,0.0, 255, 255, 255, 255)
                end
                DrawSprite("lsm", "hydration", 0.957,0.97,0.0166666667*0.7,0.0296296296*0.7,0.0, 255, 255, 255, 255)
                DrawSprite("lsm", "saturation", 0.975,0.97,0.0166666667*0.7,0.0296296296*0.7,0.0, 255, 255, 255, 255)
						-- DrawSprite("lsm", "unarmed", 
						-- 0.2,
						-- 0.95,
						-- inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
				local x=0.235
				-- for k,v in pairs(all_weapon_slots) do
					-- if player[v] then
						-- local english_name=get_name_from_item_name(player[v]) or "Unnamed"
						-- local weapon_hash=string.find(player[v],"+")
						-- if weapon_hash then
							-- weapon_hash=weapons[string.sub(player[v],1,weapon_hash-1)]
						-- else
							-- weapon_hash=weapons[player[v]]
						-- end
						-- if GetSelectedPedWeapon(myped)==weapon_hash then
							-- DrawSprite("lsm", "selected_item", 
							-- x,
							-- 0.95,
							-- inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
						-- else
							-- -- DrawSprite("lsm", "item", 
							-- -- x,
							-- -- 0.95,
							-- -- inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
						-- end
						-- DrawItem("lsm", player[v], 
						-- x,
						-- 0.95,
						-- inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
						-- SetTextCentre(true)
						-- WriteText(2,english_name,0.225,255,255,255,255,x,0.9)
						-- x=x+inv_new.item_scl_x+(inv_new.item_scl_x*0.4)
					-- end
				-- end
            else
                RequestStreamedTextureDict("lsm")
            end
        end
        if inventory.mode then
            local highlight=inventory.highlight
            if highlight>255 then highlight=255 end
            if highlight<0 then highlight=0 end
            if not HasStreamedTextureDictLoaded("lsm") then
                RequestStreamedTextureDict("lsm", true)
            else
                local inv_hud={}
                local name
                
                
                -- DrawSprite("lsm", "pc_mouse_middle", 0.875,0.925,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
                -- DrawSprite("lsm", "inventory", 0.875,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
                
                --local x=0.90-i*0.05
                
                if inventory.total~=0 then
                    local temp_scale=1
                    if (inventory.total>=15) then
                        temp_scale=(14/inventory.total)
                    end
                    for i=1,inventory.total do
                        if inventory.current~=i then
                            local r_color=255
                            local g_color=255
                            if masks[inventory[i].item] then
                                if player.mask==inventory[i].item then 
                                    r_color=50 g_color=150 
                                end
                            end
                            if hats[inventory[i].item] then
                                if player.hat==inventory[i].item then 
                                    r_color=50 g_color=150 
                                end
                            end
                            if player.backpack and inventory[i].item=="backpack" then 
                                r_color=50 g_color=150 
                            end
                            if inventory[i].item=="brasscatcher" and player.brasscatcher then r_color=50 g_color=150 end
                            if inventory[i].item=="radio" and player.radio then r_color=50 g_color=150 end
                            if inventory[i].item=="bodyarmor" and player.bodyarmor then r_color=50 g_color=150 end
                            local s=player.suit
                            if s then
                            if inventory[i].item=="clothes_"..s and player.suit==s then r_color=50 g_color=150 end
                            end
                            local x=(inventory.total+1-i-i)*.025*temp_scale+.5
							
							DrawItem("lsm", inventory[i].item, x,0.90+0.02,
                            inv_sml_x*temp_scale,
                            inv_sml_y*temp_scale,
                            0.0, r_color,g_color, 255, highlight)
                            
                            SetTextCentre(true)
                            if inventory[i].amount~=nil then
                                WriteText(7,{"~1~",inventory[i].amount},0.5*temp_scale,160,160,160,highlight,x,0.93+0.02)
                            end
                            
                            name=inventory[i].item
                            if name~=nil then
                                SetTextCentre(true)
                                WriteText(7,(get_name_from_item_name(name)),0.2*temp_scale,160,160,160,highlight,x,0.85+0.02)
                            end
                        end
                    end
                    if inventory.current~=0 then
                        --print("current="..inventory.current)
                        local i=inventory.current
                            local r_color=255
                            local g_color=255
                            if masks[inventory[i].item] then
                                if player.mask==inventory[i].item then 
                                    r_color=50 g_color=150 
                                end
                            end
                            if hats[inventory[i].item] then
                                if player.hat==inventory[i].item then 
                                    r_color=50 g_color=150 
                                end
                            end
                            if player.backpack and inventory[i].item=="backpack" then 
                                r_color=50 g_color=150 
                            end
                            if inventory[i].item=="brasscatcher" and player.brasscatcher then r_color=50 g_color=150 end
                            if inventory[i].item=="radio" and player.radio then r_color=50 g_color=150 end
                            if inventory[i].item=="bodyarmor" and player.bodyarmor then r_color=50 g_color=150 end
                            local s=player.suit
                            if s then
                            if inventory[i].item=="clothes_"..s and player.suit==s then r_color=50 g_color=150 end
                            end
                            local x=(inventory.total+1-i-i)*.025*temp_scale+.5
                            DrawSprite("lsm", 
                            inventory[i].item, 
                            x,0.90,
                            inv_big_x*temp_scale,
                            inv_big_y*temp_scale,
                            0.0, r_color,g_color, 255, highlight)
                            
                            SetTextCentre(true)
                            if inventory[i].amount~=nil then
                                WriteText(7,{"~1~",inventory[i].amount},0.75*temp_scale,255,255,255,highlight,x,0.945)
                            end
                            
                            name=inventory[i].item
                            if name~=nil then
                                SetTextCentre(true)
                                WriteText(7,(get_name_from_item_name(name)),0.35*temp_scale,255,255,255,highlight,x,0.825)
                            end
                    end
                end
            end
        elseif inventory.highlight>0 then
            --DrawRect(0.5,0.5,0.5,0.6,0,0,0,255) -- black header
            
            --new inv block
                local inventory_up_y=0.28
                local inventory_up_x_left=0.57
                local inventory_up_x_right=0.731
                local inventory_font_size=0.3
                
                local inventory_down_y_name=0.69
                local inventory_down_y_desc=0.715
                local inventory_down_x_left=0.57
                local inventory_down_x_right=0.69
                
                local inventory_grid_left=inventory_up_x_left
                local inventory_grid_right=inventory_up_x_right
                local inventory_grid_up=0.35
                local inventory_grid_down=0.7
                local inventory_grid_dist_x=0.042
                local inventory_grid_dist_y=0.070
                
                
                local inventory_grid_desc_pos_x=0.715
                local inventory_grid_desc_pos_y=0.745
                
                local inventory_scroll_bkg_x=0.5627
                local inventory_scroll_bkg_y=0.49
                local inventory_scroll_bkg_size_x=0.004
                local inventory_scroll_bkg_size_y=0.342
                local inventory_scroll_y=inventory_scroll_bkg_y
                local inventory_scrollsize_x=0.003
                
            -----
            if not HasStreamedTextureDictLoaded("lsm") then
                RequestStreamedTextureDict("lsm")
            else
                DrawSprite("lsm","inventory_background",.65,.5,0.25,0.7,0.0, 255, 255, 255, 255)
            
                --WriteHint("invscrl: "..inventory.scroll)
                local totalscrolls=math.max(0,math.ceil((inventory.total-(inventory.rows*inventory.lines))/inventory.rows))
                --WriteHint("invscrlmax: "..totalscrolls)
                if totalscrolls>0 then
                    DrawRect(inventory_scroll_bkg_x,inventory_scroll_bkg_y,inventory_scroll_bkg_size_x,inventory_scroll_bkg_size_y,0,0,0,255)
                    
                    local newscrollsizey=inventory_scroll_bkg_size_y/(totalscrolls+1)
                    local uppos=inventory_scroll_bkg_y-inventory_scroll_bkg_size_y/2+newscrollsizey/2
                    local lowpos=inventory_scroll_bkg_y+inventory_scroll_bkg_size_y/2-newscrollsizey/2
                    local step=(lowpos-uppos)/totalscrolls
                    local newscrollposy=uppos+(step*inventory.scroll)
                    if inventory.scroll==0 then
                        newscrollposy=uppos
                    elseif inventory.scroll==totalscrolls then
                        newscrollposy=lowpos
                    end
                    DrawRect(inventory_scroll_bkg_x,newscrollposy,inventory_scrollsize_x,newscrollsizey,255,255,255,255)
                end
                if relationship_name[GetPedRelationshipGroupHash(myped)] then
					local myrelname
					local result=nil
					local maximum=-9999
					for k,v in pairs(faction_reputation_requirements) do
						if player.reputation>v and v>maximum then
							result=k
							maximum=v
						end
					end
                    WriteText(2,{"~c~Alignment ~s~~a~",relationship_name[result]},inventory_font_size,255,255,255,255,inventory_up_x_left,inventory_up_y)
                end
				if player.faction and player.faction~=0 then
					WriteText(2,{"~c~Faction ~s~~a~",relationship_name[player.faction]},inventory_font_size,255,255,255,255,inventory_up_x_left,inventory_up_y-0.02)
				else
					WriteText(2,{"~c~Faction ~s~None",},inventory_font_size,255,255,255,255,inventory_up_x_left,inventory_up_y-0.02)
				end				
				SetTextRightJustify(true)
                SetTextWrap(inventory_up_x_left,inventory_up_x_right)
				WriteText(4,{"~c~REPUTATION ~s~~1~",player.reputation},inventory_font_size,255,255,255,255,inventory_up_x_right,inventory_up_y-0.02)
				SetTextRightJustify(true)
                SetTextWrap(inventory_up_x_left,inventory_up_x_right)
                local g_b=255
                if (player.weight>player.maxweight) then g_b=100 end
                WriteText(4,{"~c~WEIGHT ~s~~1~~c~/~1~ KG",player.weight,player.maxweight},inventory_font_size,255,g_b,g_b,255,inventory_up_x_right,inventory_up_y)
                
                local curitem=inventory.current
                
                DrawSprite("lsm", "selected_item", inventory_grid_desc_pos_x,inventory_grid_desc_pos_y,inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
                if inventory[curitem] then
                    local main_item_name=DrawItem("lsm", inventory[curitem].item, inventory_grid_desc_pos_x,inventory_grid_desc_pos_y,inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
					local english_name=get_name_from_item_name(inventory[curitem].item)
                    if droppingitem then
                        if item_names[main_item_name]~=nil then
                            WriteText(2,{"drop ~1~ ~a~",amounttodrop,english_name},inventory_font_size,255,255,255,255,inventory_down_x_left,inventory_down_y_name)
                        else 
                            WriteText(2,{"drop ~1~ ~r~ERROR ~s~Wrong item name",amounttodrop},inventory_font_size,255,255,255,255,inventory_down_x_left,inventory_down_y_name)
                        end
                    else
                        WriteText(4,english_name,inventory_font_size,255,255,255,255,inventory_down_x_left,inventory_down_y_name)
                    end
                    SetTextWrap(inventory_down_x_left,inventory_down_x_right)
                    if droppingitem then
                        WriteText(4,droppingtext,inventory_font_size,155,155,155,155,inventory_down_x_left,inventory_down_y_desc)
                    else
                        WriteText(4,item_descriptions[main_item_name],inventory_font_size,155,155,155,155,inventory_down_x_left,inventory_down_y_desc)
                    end
					local weight=get_item_weight(main_item_name)
                    if weight then WriteText(4,{"~1~ KG (~1~ KG)",weight,weight*inventory[curitem].amount},inventory_font_size,155,155,155,155,inventory_down_x_left,inventory_down_y_desc+0.07) end
                else
                    WriteText(2,messages.empty,inventory_font_size,255,255,255,255,inventory_down_x_left,inventory_down_y_name)
                    SetTextWrap(inventory_down_x_left,inventory_down_x_right)
                    WriteText(2,messages.nothing_selected,inventory_font_size,155,155,155,155,inventory_down_x_left,inventory_down_y_desc)
                end
                
                local number
                local total=(inventory.lines*inventory.rows)-1
                if inventory.scroll>0 then
                    number=(inventory.scroll*inventory.rows)+1
                else
                    number=1
                end
                -- number=math.floor(number)
                -- if number>inventory.total then
                    -- number=inventory.total
                -- end
                -- if number<1 then
                    -- number=1
                -- end
                for i=math.max(1,number),math.min(number+total,inventory.total) do
                    local sprite
                    if i==inventory.current then 
                        sprite="selected_item" 
                        if player.hat==inventory[i].item 
                        or player.mask==inventory[i].item 
                        or player.glasses==inventory[i].item 
                        or inventory[i].item=="brasscatcher" and player.brasscatcher
                        or inventory[i].item=="radio" and player.radio
                        or inventory[i].item=="bodyarmor" and player.bodyarmor
                        or inventory[i].item=="duffelbag" and player.backpack
						or player.suit and inventory[i].item=="clothes_"..player.suit
						then
                            sprite="selected_equipped_item"
						else
							local slot=get_weapon_slot(inventory[i].item)
							if slot and inventory[i].item==player[slot]
							then
								sprite="selected_equipped_item"
							end
                        end
                    else 
                        sprite="item" 
                        if player.hat==inventory[i].item 
                        or player.mask==inventory[i].item 
                        or player.glasses==inventory[i].item 
                        or inventory[i].item=="brasscatcher" and player.brasscatcher
                        or inventory[i].item=="radio" and player.radio
                        or inventory[i].item=="bodyarmor" and player.bodyarmor
                        or inventory[i].item=="duffelbag" and player.backpack
						or player.suit and inventory[i].item=="clothes_"..player.suit
                        then
                            sprite="equipped_item"
						else
							local slot=get_weapon_slot(inventory[i].item)
							if slot and inventory[i].item==player[slot]
							then
								sprite="equipped_item"
							end
                        end
                    end
                    local inv_i=i-(inventory.scroll*inventory.rows)
                    local x=(inventory_grid_left+(inv_new.item_scl_x/2))+(((inv_i-1)%inventory.rows)*inventory_grid_dist_x)
                    local y=inventory_grid_up+(math.floor((inv_i-1)/inventory.rows)*inventory_grid_dist_y)
                    DrawSprite("lsm", sprite, 
                    x,
                    y,
                    inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
					
                    DrawItem("lsm", inventory[i].item, 
                    x,
                    y,
                    inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
                    
                    SetTextRightJustify(true)
                    SetTextWrap(
                    x-(inv_new.item_scl_x/2),
                    x+(inv_new.item_scl_x/2)-0.001)
                    if inventory[i].amount~=nil then
                        WriteText(2,{"~1~",inventory[i].amount},inventory_font_size,255,255,255,255,
                        (inventory_grid_left+(inv_new.item_scl_x/2))+(((inv_i-1)%inventory.rows)*inventory_grid_dist_x),
                        inventory_grid_up+(math.floor((inv_i-1)/inventory.rows)*inventory_grid_dist_y)+0.01
                        )
                    end
                end
            end
            if oldinventory then
                local scale_x=0.2
                local scale_y=0.6
                local pos_x=0.875
                local pos_y=0.5
                local h_line_width=.001 --horisontal line width
                local v_line_width=.001 --vertical line width
                DrawRect(pos_x,pos_y-0.04-(scale_y*.5),scale_x,0.08,0,0,0,255) -- up header
                local myped=PlayerPedId()
                if player.headshot==nil then
                    player.headshotped=myped
                    player.headshotclothes=clothes_hash(myped)
                    player.headshot=RegisterPedheadshot(player.headshotped)
                    --print("headshut is nil, registering")
                elseif myped~=player.headshotped or clothes_hash(myped)~=player.headshotclothes then
                    --print("ped updated")
                    if player.headshot~=nil then
                        if IsPedheadshotValid(player.headshot) then
                            UnregisterPedheadshot(player.headshot)
                            --print("unregistering")
                        end
                        player.headshot=nil
                    end
                    player.headshotped=myped
                    player.headshotclothes=clothes_hash(myped)
                    player.headshot=RegisterPedheadshot(player.headshotped)
                    --print("registering")
                elseif not IsPedheadshotValid(player.headshot) then
                    UnregisterPedheadshot(player.headshot)
                    player.headshot=nil
                    --print("headshot invalid, unregistered")
                elseif IsPedheadshotReady(player.headshot) then
                    local txd=GetPedheadshotTxdString(player.headshot)
                    DrawSprite(txd,txd,
                        pos_x-((scale_x/2)-0.0225),pos_y-0.04-(scale_y*.5),0.04,0.065,
                        0.0, 255, 255, 255, 255)
                end
                --DrawRect(pos_x-((scale_x/2)-0.0225),pos_y-0.04-(scale_y*.5),0.04,0.07,0,255,255,255) -- headshot
                WriteText(4,GetPlayerName(PlayerId()),0.7,255,255,255,255,pos_x-((scale_x/2)-0.045),pos_y-0.08-(scale_y*.5))
                if GetPedRelationshipGroupHash(myped)==GetHashKey("NEUTRAL") then
                    WriteText(4,"Survivor",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
                elseif GetPedRelationshipGroupHash(myped)==GetHashKey("MARAUDER") then
                    WriteText(4,"Marauder",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
                elseif GetPedRelationshipGroupHash(myped)==GetHashKey("SURVIVOR") then
                    WriteText(4,"Scavenger",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
                elseif GetPedRelationshipGroupHash(myped)==GetHashKey("BANDIT") then
                    WriteText(4,"Bandit",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
                elseif GetPedRelationshipGroupHash(myped)==GetHashKey("GOVERNMENT") then
                    WriteText(4,"Government",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
                end
                WriteText(4,tostring(player.reputation),0.5,155,155,155,255,pos_x-((scale_x/2)-0.125),pos_y-0.04-(scale_y*.5))
                
                
                DrawRect(pos_x,pos_y,scale_x,scale_y,0,0,0,175) -- transparent inv background
                
                if inventory.total>inventory.rows*inventory.lines or inventory.scroll~=0 then
                    local scroll_scale_x=(scale_x/40.0)
                    local scroll_pos_x=pos_x+(scale_x/2.0)+(scroll_scale_x/2)
                    DrawRect(scroll_pos_x,pos_y,scroll_scale_x,scale_y,0,0,0,175) -- inv scroll bkg
                    
                    
                    local scroll_bar_scale_x=scroll_scale_x*0.5 --inventory.scroll inventory.total
                    local scroll_bar_scale_y=scale_y*0.99
                    
                    
                    local used_lines=math.max(math.ceil(inventory.total/inventory.rows),inventory.scroll+inventory.lines)
                    local viewable_percentage=inventory.lines/used_lines
                    --local free_space=1-viewable_percentage
                    
                    local scroll_pos_y=pos_y-(scroll_bar_scale_y*(inventory.scroll/used_lines+(viewable_percentage-1)*.5))
                    scroll_bar_scale_y=scroll_bar_scale_y*viewable_percentage
                    
                    
                    -- inventory.total
                    -- inventory.scroll*inventory.rows
                    -- inventory.lines*inventory.rows
                    
                    DrawRect(scroll_pos_x,scroll_pos_y,scroll_bar_scale_x,scroll_bar_scale_y,75,75,75,255) -- inv scroll bar
                    
                end
                for i=0,inventory.rows do
                    DrawRect(pos_x-(scale_x*.5)+i*(scale_x/inventory.rows),pos_y,v_line_width,scale_y,75,75,75,255)
                end
                for i=0,inventory.lines do
                    DrawRect(pos_x,pos_y-(scale_y*.5)+i*(scale_y/inventory.lines),scale_x,h_line_width,75,75,75,255)
                end
                if HasStreamedTextureDictLoaded("lsm") and inventory.total~=0 then
                    DrawSprite("lsm","inventory_background",.65,.5,0.25,0.7,0.0, 255, 255, 255, 255)
                    for i=inventory.scroll*inventory.rows+1,math.min(inventory.total,(inventory.scroll+inventory.lines)*inventory.rows) do
                        if inventory.current~=i and inventory[i] then
                            name=inventory[i].item
                            if name~=nil then
                                local r_color=255
                                local g_color=255
                                
                                if masks[inventory[i].item] then
                                    if player.mask==inventory[i].item then 
                                        r_color=50 g_color=150 
                                    end
                                end
                                if hats[inventory[i].item] then
                                    if player.hat==inventory[i].item then 
                                        r_color=50 g_color=150 
                                    end
                                end
                                if inventory[i].item=="brasscatcher" and player.brasscatcher then r_color=50 g_color=150 end
                                if inventory[i].item=="radio" and player.radio then r_color=50 g_color=150 end
                                if inventory[i].item=="bodyarmor" and player.bodyarmor then r_color=50 g_color=150 end
                                local s=player.suit
                                if s then
                                if inventory[i].item=="clothes_"..s and player.suit==s then r_color=50 g_color=150 end
                                end
                                
                                local x=pos_x+scale_x*.5-((math.floor((i-1)%inventory.rows)+.5)*(scale_x/inventory.rows))
                                local y=pos_y+scale_y*.5-((math.floor((i-1)/inventory.rows)-inventory.scroll+.5)*(scale_y/inventory.lines))
                                DrawItem("lsm", inventory[i].item, x,y,
                                inv_sml_x,
                                inv_sml_y,
                                0.0, 
                                r_color, 
                                g_color, 
                                255, 
                                255)
                                
                                SetTextCentre(true)
                                if inventory[i].amount~=nil then
                                    WriteText(4,{"~1~",inventory[i].amount},0.5,100,100,100,255,x,y+0.025)
                                end
                            
                                SetTextCentre(true)
                                WriteText(4,(get_name_from_item_name(name)),0.4,100,100,100,255,x,y-0.06)
                            end
                        end
                    end
                    if inventory.current~=0 then
                        --print("current="..inventory.current)
                        local i=inventory.current
                        if inventory[i] then
                            name=inventory[i].item
                            if name~=nil then
                                local r_color=255
                                local g_color=255
                                if masks[inventory[i].item] then
                                    if player.mask==inventory[i].item then 
                                        r_color=50 g_color=150 
                                    end
                                end
                                if hats[inventory[i].item] then
                                    if player.hat==inventory[i].item then 
                                        r_color=50 g_color=150 
                                    end
                                end
                                if inventory[i].item=="brasscatcher" and player.brasscatcher then r_color=50 g_color=150 end
                                if inventory[i].item=="radio" and player.radio then r_color=50 g_color=150 end
                                if inventory[i].item=="bodyarmor" and player.bodyarmor then r_color=50 g_color=150 end
                                local s=player.suit
                                if s then
                                if inventory[i].item=="clothes_"..s and player.suit==s then r_color=50 g_color=150 end
                                end
                                local x=pos_x+scale_x*.5-((math.floor((i-1)%inventory.rows)+.5)*(scale_x/inventory.rows))
                                local y=pos_y+scale_y*.5-((math.floor((i-1)/inventory.rows)-inventory.scroll+.5)*(scale_y/inventory.lines))
                                DrawItem("lsm", inventory[i].item, x,y,
                                inv_big_x,
                                inv_big_y,
                                0.0, 
                                r_color,
                                g_color, 
                                255, 
                                255)
                                if item_descriptions[inventory[i].item] then
                                    local desc_tex_x=0.73
                                    local desc_tex_y=0.185
                                    DrawItem("lsm", inventory[i].item, desc_tex_x,desc_tex_y,
                                    inv_big_x,
                                    inv_big_y,
                                    0.0, 
                                    r_color,
                                    g_color, 
                                    255, 
                                    255)
                                    SetTextRightJustify(true)
                                    SetTextWrap(desc_tex_x-inv_big_x/2,desc_tex_x+inv_big_x/2)
                                    WriteText(4,item_descriptions[inventory[i].item],0.4,150,150,150,255,desc_tex_x,desc_tex_y+0.075)
                                end
                                
                                SetTextCentre(true)
                                if inventory[i].amount~=nil then
                                    WriteText(4,{"~1~",inventory[i].amount},0.5,255,255,255,255,x,y+0.025)
                                end
                            
                                SetTextCentre(true)
                                WriteText(4,(get_name_from_item_name(name)),0.4,255,255,255,255,x,y-0.06)
                            end
                        end
                    end
                end
            end
        end
	end
end)

local suitsmodifiers={
	["DEFAULT"]={
	speed=1.0, 				--SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	modifier_melee=1.0,		--SetPlayerMeleeWeaponDefenseModifier(PlayerId(),1.2+0.1)
	modifier_firearms=1.0,	--SetPlayerWeaponDefenseModifier(PlayerId(),0.7+0.1)
	sprint=true,			--SetPlayerSprint(PlayerId(),false)
	},
	["mercenary"]={
	modifier_melee=1.3,
	modifier_firearms=0.8,
	sprint=false,
	},
	["banditmercenary"]={modifier_firearms=0.6},
	["mercenary"]={sprint=false},
	["pmc"]={
	modifier_firearms=0.7,
	platecarrier=true,
	speed=1.105,
	},
	["loner"]={
	modifier_melee=0.9,
	modifier_firearms=0.9,
	},
	["combat_desert"]={
	modifier_melee=0.8,
	modifier_firearms=0.45,
	},
	["banditgoon"]={modifier_melee=0.85},
	["riot"]={modifier_melee=0.5},
	["dawn"]={modifier_melee=0.5},
	["smugglerslight"]={speed=1.105},
	["smugglers"]={speed=1.125},
	["gunrunner"]={speed=1.075},
	["toughguy"]={
	modifier_melee=0.7,
	bonus_damage_melee=1.5,
	},
	["rookie"]={sprinttime=5.0},
	["breekiscavenger"]={sprinttime=5.0},
	["marauder"]={sprinttime=5.0},
	["mercexperimental"]={
	platecarrier=true,
	modifier_firearms=0.75,
	},
	["merclight"]={
	platecarrier=true,
	sprinttime=5.0,
	},
}
for name,smod in pairs(suitsmodifiers) do
	if name~="DEFAULT" then
		for k,v in pairs(suitsmodifiers["DEFAULT"]) do
			if smod[k]==nil then
				smod[k]=v
			end
		end
	end
end

--suits managment
Citizen.CreateThread(function()
	local function apply_outfit_modifiers(smod,myped,myplayer)
		SetRunSprintMultiplierForPlayer(myplayer,		smod.speed)
		SetPlayerMeleeWeaponDefenseModifier(myplayer,	smod.modifier_melee)
		SetPlayerWeaponDefenseModifier(myplayer,		smod.modifier_firearms)
		SetPlayerSprint(myplayer,						smod.sprint)
	end
    while true do Wait(0)
        local myped=PlayerPedId()
		local myplayer=PlayerId()
        if player.suit~=nil then
            if player.suit=="explorer" then
                local myhealth=GetEntityHealth(myped)
                if myhealth<150 then
                    SetEntityHealth(myped,myhealth+1)
                    Wait(6000)
                end
            end
			local ps=player.suit or "DEFAULT"
			local smod=suitsmodifiers[ps] or suitsmodifiers["DEFAULT"]
			apply_outfit_modifiers(smod,myped,myplayer)
        end
    end
end)

--relationship management
-- Citizen.CreateThread(function()
    -- while true do Wait(0)
        -- local myped=PlayerPedId()
        -- local myfaction=GetPedRelationshipGroupHash(myped)
        -- if player.suit~=nil then
            -- if player.suit=="banditgoon" or player.suit=="banditmercenary" then
                -- if myfaction~=GetHashKey("BANDIT") then
                    -- SetPedRelationshipGroupHash(myped,GetHashKey("BANDIT"))
                -- end
            -- elseif player.suit=="police" then
                -- if myfaction~=GetHashKey("GOVERNMENT") then
                    -- SetPedRelationshipGroupHash(myped,GetHashKey("GOVERNMENT"))
                -- end
            -- else
                -- SetPedRelationshipGroupHash(myped,GetHashKey("SURVIVOR"))
            -- end
        -- end
    -- end
-- end)

--weight management
Citizen.CreateThread(function()
    while true do Wait(0)
        local additional_weight={
        backpack=30.0,
        
        banditauthority=15.0,
        banditgoon=10.0,
        banditmercenary=20.0,
        business=5.0,
        camouflage=15.0,
        riot=20.0,
        smugglerslight=25.0,
        toughguy=25.0,
        rookie=20.0,
        breekiscavenger=25.0,
        combatmarauder=20.0,
        mercexperimental=10.0,
        merclight=25.0,
        gunrunner=45.0,
        smugglers=35.0,
        dawn=20.0,
        explorer=30.0,
        pmc=30.0,
        combat_green=20.0,
        combat_desert=20.0,
        loner=15.0,
        gang=5.0,
		trash=5.0,
        marauder=15.0,
        mercenary=20.0,
        offdutysheriff=10.0,
        ordinary=5.0,
        police=15.0,
        scavenger=10.0,
        trucker=5.0,
        }
        
        local additionalweight=0.0
        
        if player.backpack then
            additionalweight=additionalweight+additional_weight.backpack
        end
        if player.suit and additional_weight[player.suit] then
            additionalweight=additionalweight+additional_weight[player.suit]
        end
        player.maxweight=player.standardweight+additionalweight
        
        local sumweight=0.0
        if inventory.total>0 then
            local itemweight
            for i=1,inventory.total do
                itemweight=get_item_weight(inventory[i].item)
                if itemweight then
                    sumweight=sumweight+(itemweight*(inventory[i].amount))
                end
            end
            if player.hat then
                itemweight=get_item_weight(player.hat)
                if itemweight then
                    sumweight=sumweight-itemweight
                end
            end
            if player.mask then
                itemweight=get_item_weight(player.mask)
                if itemweight then
                    sumweight=sumweight-itemweight
                end
            end
            if player.suit then
                itemweight=get_item_weight("clothes_"..player.suit)
                if itemweight then
                    sumweight=sumweight-itemweight
                end
            end
            if player.backpack then
                itemweight=get_item_weight("duffelbag")
                if itemweight then
                    sumweight=sumweight-itemweight
                end
            end
            if player.bodyarmor then
                itemweight=get_item_weight("bodyarmor")
                if itemweight then
                    sumweight=sumweight-itemweight
                end
            end
            player.weight=sumweight

                    -- if inventory[i].item=="clothes_"..player.suit or inventory[i].item==player.hat or inventory[i].item==player.mask then 
                        -- sumweight=sumweight+(itemweight*(inventory[i].amount-1))
                    -- elseif inventory[i].item=="bodyarmor" and player.bodyarmor then 
                        -- sumweight=sumweight+(itemweight*(inventory[i].amount-1))
                    -- elseif player.backpack and inventory[i].item=="duffelbag" then
                        -- sumweight=sumweight+(itemweight*(inventory[i].amount-1))
                    -- else
                        -- sumweight=sumweight+(itemweight*inventory[i].amount)
                    -- end
        else
            player.weight=0.0
        end
    end
end)

Citizen.CreateThread(function()
    local oldhealth=0
    while true do Wait(500)
        local pped=PlayerPedId()
        local health=GetEntityHealth(pped)-100
        if health<=0 then player.health=0 else player.health=health end
        if oldhealth-health>5 then
            player.bleeding=player.bleeding+1
        end
        oldhealth=health
	end
end)


Citizen.CreateThread(function()
    while true do Wait(2500)
        local myped=PlayerPedId()
        check_clothes(myped)
	end
end)
--stats management
Citizen.CreateThread(function()
    while true do Wait(9000)
        if player.reputation<-100 then 
			player.reputation=-100
		elseif player.reputation>100 then 
			player.reputation=100 
		end
		
        local pped=PlayerPedId()
        if player.hydration>=0.01 then
            player.hydration=player.hydration-0.63
            if (player.weight>player.maxweight) then
                player.hydration=player.hydration-9.0
            end
        else
            SetEntityHealth(pped,GetEntityHealth(pped)-1)
        end
        if player.saturation>=0.01 then
            player.saturation=player.saturation-0.36
            if (player.weight>player.maxweight) then
                player.saturation=player.saturation-7.2
            end
        else
            SetEntityHealth(pped,GetEntityHealth(pped)-1)
        end
		if player.hydration>75.0 and player.saturation>75.0 then
			SetEntityHealth(pped,GetEntityHealth(pped)+1)
		end
        
        if player.drunk>0 then
            player.drunk=player.drunk-0.18
            SetGameplayCamShakeAmplitude(player.drunk)
        end
        if player.bleeding>0 then
            SetEntityHealth(pped,GetEntityHealth(pped)-player.bleeding*2)
            --RequestClipSet("move_injured_generic")
            --SetPedMovementClipset(pped,"move_injured_generic" ,1.0)
        --else
            --ResetPedMovementClipset(pped,1.0)
        end
    end
end)

--fuel managment
Citizen.CreateThread(function()
    while true do Wait(150)
        local pped=PlayerPedId()
        if IsPedInAnyVehicle(pped) then
            local pveh=GetVehiclePedIsIn(pped)
			-- WriteHint(10,{"RPM: ~1~",GetVehicleCurrentRpm(pveh)})
            -- WriteText(7,"RPM: "..GetVehicleCurrentRpm(pveh),0.4,255,255,255,255,0.7,0.500) 
            -- WriteText(7,"Fuel: "..GetVehicleFuelLevel(pveh),0.4,255,255,255,255,0.7,0.525) 
            -- WriteText(7,"Oil: "..GetVehicleOilLevel(pveh),0.4,255,255,255,255,0.7,0.550)
            if --[[DecorExistOn(pveh,"scorched") or]] not DecorExistOn(pveh,"zm_fuel") then
                SetVehicleFuelLevel(pveh,0.0)
                --DecorSetFloat(pveh,"zm_fuel",0.0)
            elseif DecorGetFloat(pveh,"zm_fuel")>5.0 then
				local vehclass=GetVehicleClass(pveh)
				local fuel=DecorGetFloat(pveh,"zm_fuel")
				if vehclass==15 or vehclass==16 or kerosine_vehicles[pvehmodel] then
					fuel=fuel-(0.007) --
				else
					fuel=fuel-(0.004*GetVehicleCurrentRpm(pveh)) --0.005
				end
				SetVehicleFuelLevel(pveh,fuel)
				DecorSetFloat(pveh,"zm_fuel",fuel)
            else
                SetVehicleFuelLevel(pveh,0.0)
                DecorSetFloat(pveh,"zm_fuel",0.0)
            end
        end
    end
end)

--each frame items manager
Citizen.CreateThread(function()
    local weaponblacklist={
    [GetHashKey("weapon_flaregun")]=true,
    }
    local weapongroups={
    [416676503]="casings",--pistol
    [-957766203]="casings",--smg
    [970310034]="riflecasings",--assaultrifle
    [-1212426201]="riflecasings",--sniperrifle
    }
	local function is_other_ped_in_radius(mypos,otherped,radius)
		local otherpos=GetEntityCoords(otherped)
		local dx,dy,dz=mypos.x-otherpos.x,mypos.y-otherpos.y,mypos.z-otherpos.z
		return (dx*dx+dy*dy+dz*dz)<(radius*radius)
	end
    while true do Wait(0)
        local myped=PlayerPedId()
        if player.brasscatcher then
            if get_inventory_item_slot("brasscatcher") then
                if IsPedShooting(myped) then
                    local myweapon=GetSelectedPedWeapon(myped)
                    if not weaponblacklist[myweapon] then
                        local casing=weapongroups[GetWeapontypeGroup(myweapon)]
                        if casing then
                            give_item_to_inventory(casing,1)
                        end
                    end
                end
            else
                player.brasscatcher=false
            end
        end
        if player.radio and not IsPedDeadOrDying(myped) and get_inventory_item_slot("radio") then
			local my_talk_see_dist=math.random(7000,12000)+0.1
			NetworkSetTalkerProximity(my_talk_see_dist)
			DecorSetFloat(myped,"zm_fuel",my_talk_see_dist)
			local mypos=GetEntityCoords(myped)
			local myrel=GetPedRelationshipGroupHash(myped)
			for i=0,31 do
				local otherplayer=GetPlayerPed(i)
				if otherplayer~=myped and DecorExistOn(otherplayer,"zm_fuel") and is_other_ped_in_radius(mypos,otherped,math.min(DecorGetFloat(otherplayer,"zm_fuel"),my_talk_see_dist)) then
					local blip=GetBlipFromEntity(otherplayer)
					if blip==0 then
						blip=AddBlipForEntity(otherplayer)
					end
					local rel=GetPedRelationshipGroupHash(otherplayer)
					local icon=GetBlipFromFaction(rel)
					if icon then
						SetBlipSprite(blip,icon)
						SetBlipScale(blip,0.7)
					else
						SetBlipScale(blip,0.5)
					end
					local rel_betweengroups=GetRelationshipBetweenGroups(rel,myrel)
					if rel_betweengroups==0 then
						SetBlipColour(blip,2)
						SetBlipDisplay(blip,2) --both minimap and map
					elseif rel_betweengroups==5 then
						SetBlipColour(blip,1)
						SetBlipDisplay(blip,5) --minimap
					else
						SetBlipColour(blip,5)
						SetBlipDisplay(blip,5) --minimap
					end
				else
					local blip=GetBlipFromEntity(otherplayer)
					if blip~=0 then
						RemoveBlip(blip)
					end
				end
				
			end
		else
			NetworkSetTalkerProximity(50.0)
			player.radio=false
			if DecorExistOn(myped,"zm_fuel") then
				DecorRemove(myped,"zm_fuel")
			end
			for i=0,31 do
				local otherplayer=GetPlayerPed(i)
				local blip=GetBlipFromEntity(otherplayer)
				if blip~=0 then
					RemoveBlip(blip)
				end
			end
        end
        if player.mask and not IsPedDeadOrDying(myped) then
            local mask=player.mask
            if get_inventory_item_slot(mask) then
                --
            else
                player.mask=false
            end
        end
        if player.hat and not IsPedDeadOrDying(myped) then
            local hat=player.hat
            if get_inventory_item_slot(hat) then
                --
            else
                player.hat=false
            end
        end
        if player.bodyarmor and not IsPedDeadOrDying(myped) then
            if get_inventory_item_slot("bodyarmor") then
                --
            else
                player.bodyarmor=false
            end
        end
    end
end)

local quests={}
local talking_state="Main"
local npc_lines={}
local my_lines={}
local curline=1
local custom_ramdom_number
local quest_type=-1
local quest_item="quest_bag"
local quest_zone
local function get_closest_friendly_zone_with_questpos(rx,ry,my_relationship)
    local zone=nil
    local d,dx,dy
    local mindist=81000000
    for k,v in pairs(safezones) do
        if v.relationship~=nil and v.relationship==my_relationship and v.questpos~=nil then
            dx=v.x-rx
            dy=v.y-ry
            d=dx*dx+dy*dy
            if d<mindist then
                mindist=d
                zone=v
            end
        end
    end
    return zone,mindist
end
local function pick_random(t)
    local ret=t[1+custom_ramdom_number%#t]
    custom_ramdom_number=math.floor(custom_ramdom_number/#t)
    return ret
end
local function change_lines(talkingstate,npc)
    local decorrand=DecorGetInt(npc,"questnpc") print("decorrand="..decorrand)
    if talking_state=="Main" then --main dialogue
        if decorrand==0 then
            npc_lines={"Need something?",}
        
            my_lines={"Where can I buy...",
            "Where can I sell...",
            "Where can I get...",
            "[Exit]",}
        else
            npc_lines={"Hey, stranger, could you help me?",}
        
            my_lines={"What do you need?",
            "Where can I buy...",
            "Where can I sell...",
            "Where can I get...",
            "[Exit]",}
        end
    elseif talking_state=="What do you need?" then 
        quest_type=decorrand%3
        custom_ramdom_number=math.floor(decorrand/3)
        quest_type=0 --debug
        if quest_type==0 then --bring item from vehicle
            quest_item=pick_random(quest_items_vehicles)
                npc_lines={"I've "..pick_random({"left","hidden"})..pick_random({" my "," a "})..item_names[quest_item].." in "..pick_random({"a","my","that"}).." car"..
                pick_random({" when all this happened"," the other day when I was searching for supplies"," when I met these bandits"})..
                pick_random({" and now I'm afraid to return. ",". I'm not a fighter to go there again. ",". I think bandits might be scouting the area now. "})..
                
                (quest_description[quest_item] or "")..
                
                pick_random({"I need "..pick_random({"someone","you"}).." to go there are bring "..pick_random({"me ","my ","that ","the "})..item_names[quest_item].." back.",
                "Could you bring "..pick_random({"me ","my ","that ","the "})..item_names[quest_item].." back?",
                "I'd be "..pick_random({"nice","great","awesome"}).." if "..pick_random({"someone","you"}).." could bring "..pick_random({"me ","my ","that ","the "})..item_names[quest_item].." back"})..
                
                pick_random({" Don't worry, I'll pay good. We're talking about $"..npc_items_pricelist[quest_item]..".",
                " I'll pay"..pick_random({" you "," "}).."$"..npc_items_pricelist[quest_item]..".",
                " $"..npc_items_pricelist[quest_item].." is all I can suggest."})..
                
                pick_random({" So, what do you say?",
                " Please, I really need"..pick_random({"my ","that ","the "})..item_names[quest_item]..".",
                " Deal?",})
                }
        elseif quest_type==1 then
            quest_item="alcohol"
            npc_lines={"owo 1"}
        elseif quest_type==2 then
            quest_item="alcohol"
            npc_lines={"owo 2"}
        end
        
        my_lines={"Sure","No"}
    elseif talking_state=="Sure" or talking_state=="Deal" then
        print("quest_type="..quest_type)
        if quest_type==0 then
            if not NetworkHasControlOfEntity(npc) then
                NetworkRequestControlOfEntity(npc)
                Wait(0)
                while not NetworkHasControlOfEntity(npc) do
                    Wait(0)
                end
            end
            DecorRemove(npc,"questnpc")
            local blip=GetBlipFromEntity(npc)
            if blip~=nil and blip~=0 then
                RemoveBlip(blip)
            end
            npc_lines={"Thank you!",}
            my_lines={"[Exit]",}
            local quest_x
            local quest_y
            while true do
                quest_x=math.random(-3300,3800)+.5-.5
                quest_y=math.random(-3500,7000)+.5-.5
                --print("success is",tostring(success),"and node is at",nodepos)
                local success,nodepos=GetClosestMajorVehicleNode(quest_x, quest_y, 0.0, 3.0, 0)
                print("success is",tostring(success),"and node is at",nodepos)
                if success and nodepos.y>-3550 then -- avoid north yankton road
                    quest_x=nodepos.x
                    quest_y=nodepos.y
                    break
                end
                Wait(0)
            end
            local pos=GetEntityCoords(PlayerPedId())
            table.insert(quests,{x=quest_x,y=quest_y,r=300.0,id=decorrand,t=quest_type,i=quest_item,rx=pos.x,ry=pos.y,zone=quest_zone})
            SetResourceKvpInt("quests",#quests)
            SetResourceKvpInt("quest_"..#quests.."_type",quest_type)
            SetResourceKvpInt("quest_"..#quests.."_id",decorrand)
            SetResourceKvpFloat("quest_"..#quests.."_x",quest_x)
            SetResourceKvpFloat("quest_"..#quests.."_y",quest_y)
            SetResourceKvp("quest_"..#quests.."_item",quest_item)
            SetResourceKvpFloat("quest_"..#quests.."_return_x",pos.x)
            SetResourceKvpFloat("quest_"..#quests.."_return_y",pos.y)
            quest_type=-1
        else
            npc_lines={"Thank you! But this quest is not implemented yet!",}
            my_lines={"Main",}
            quest_type=-1
        end
    elseif talking_state=="Sorry, but no" or talking_state=="No" then
        npc_lines={"Fuck you then. Say Main if you are gay.",}
        my_lines={"Main",}
        quest_type=-1
    elseif talking_state=="Where can I buy..." then
        npc_lines={"I know some traders here and there, what is it you're looking for?",}
        my_lines={
        "Where I can buy ammo?",
        "Where I can buy medicine?",
        "Where I can buy gasoline?",
        "Where I can buy firearms?",
        "Where I can buy armor and gear?",
        "Where I can buy vehicle?",
        "Where I can buy food?",
        "[Back]",}
    elseif talking_state=="Where I can buy ammo?" then 
        npc_lines={"I've heard that police at LSPD station sells ammunition.",}
        my_lines={"Thanks",
        "[Back]"}
    elseif talking_state=="Where I can buy medicine?" then 
        npc_lines={"Don't know any outposts where anybody sells that stuff.",}
        my_lines={"Thanks",
        "[Back]"}
    elseif talking_state=="Where I can buy gasoline?" then 
        npc_lines={"There are few gas stations with people barricaded themselves inside, the may still have some, but I've heard they have",
        "problems with fuel too."}
        my_lines={"Thanks",
        "[Back]"}
    elseif talking_state=="Where I can buy firearms?" then 
        npc_lines={"Government at LSPD station sells remains of arsenal, hoping someone will fight bandits.",}
        my_lines={"Thanks",
        "[Back]"}
    elseif talking_state=="Where I can buy armor and gear?" then 
        npc_lines={"Don't know any outposts where anybody sells that stuff.",}
        my_lines={"Thanks",
        "[Back]"}
    elseif talking_state=="Where I can buy vehicle?" then 
        npc_lines={"Old Cult Camp have some people who might help you with vehicle, as long as you bring them all resources.",}
        my_lines={"Thanks",
        "[Back]"}
    elseif talking_state=="Where I can buy food?" then 
        npc_lines={"If it's more or less big outpost - I'm sure you can find food there.",}
        my_lines={"Thanks",
        "[Back]"}
    
    end
end

--missionsfavkis
Citizen.CreateThread(function()
    --SetResourceKvpInt("quests",0)--debug
    if false then --load quests
        local n=GetResourceKvpInt("quests")
        if n~=nil and n>0 then
            for i=1,n do
                local x=GetResourceKvpFloat("quest_"..i.."_x")
                local y=GetResourceKvpFloat("quest_"..i.."_y")
                local t=GetResourceKvpInt("quest_"..i.."_type")
                local id=GetResourceKvpInt("quest_"..i.."_id")
                local item=GetResourceKvpString("quest_"..i.."_item")
                local rx=GetResourceKvpFloat("quest_"..i.."_return_x")
                local ry=GetResourceKvpFloat("quest_"..i.."_return_y")
                if t==0 then --get item from car
                    table.insert(quests,{
                        x=x,y=y,t=t,id=id,i=item,rx=rx,ry=ry,
                        r=300.0,
                        --zone=zone,
                    })
                else
                    table.insert(quests,{
                        x=x,y=y,t=t,id=id,i=item,rx=rx,ry=ry,
                        --zone=zone,
                    })
                    print("ERROR! Quest type "..t.." is not implemented!")
                end
            end
            print("loaded "..n.." quests")
        end
        Wait(10000)
        local my_relationship=GetPedRelationshipGroupHash(PlayerPedId())
        for k,v in pairs(quests) do
            if v.zone==nil and v.rx~=nil and v.ry~=nil then
                v.zone=get_closest_friendly_zone_with_questpos(v.rx,v.ry,my_relationship)
                print("found quest return zone")
            end
        end
    end
        --local npcblips={}
            
            
    while false do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        local myfaction=GetPedRelationshipGroupHash(myped)
        if zone~=nil and zone.relationship~=nil and GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4 then
            --WriteHint(zone.relationship)
            local handle,npc=FindFirstPed()
            local loop=(handle~=-1)
            while loop do
                if (not IsPedAPlayer(npc)) 
                and GetPedType(npc)~=28 --animal
                and DecorExistOn(npc,"questnpc")
                then
                    if GetBlipFromEntity(npc)==0
                    then
                        if GetIsTaskActive(npc,15) --donothing
                        and (not GetIsTaskActive(npc,35)) --complexmovement
                        then
                            --print("Adding blip to "..npc)
                            npcblips[npc]=AddBlipForEntity(npc)
                            SetBlipSprite(npcblips[npc],133)
                        end
                    else
                        local npcpos=GetEntityCoords(npc)
                        if square_dist(mypos,npcpos)<9 then
                            local talking=false
                            local headshot
                            if not disablehud then
                                WriteHint(3,messages.press_e_to_talk)
                                local not_on_screen,x,y=N_0xf9904d11f1acbec3(npcpos.x,npcpos.y,npcpos.z+1.0)
                                if not not_on_screen then
                                    SetTextCentre(true)
                                    WriteText(2,messages.e_to_talk,0.3,255,255,255,200,x,y)
                                end
                            end
                            if IsControlJustPressed(0,86) then
                                talking=true
                                talking_state="Main"
                                change_lines(talkingstate,npc)
                                curline=1
                                quest_zone=zone
                                headshot=RegisterPedheadshot(npc)
                            end
                            while talking do Wait(0) --dialogue
                                myped=PlayerPedId()
                                mypos=GetEntityCoords(myped)
                                npcpos=GetEntityCoords(npc)
                                if square_dist(mypos,npcpos)>9 then
                                    talking=false
                                end
                                inventory.highlight=0
                                DrawRect(0.5,0.3,0.45,0.4,0,0,0,200)
                                if headshot==nil then
                                    headshot=RegisterPedheadshot(npc)
                                    DrawRect(0.305,0.155,0.035,0.065,0,0,255,255)
                                elseif not IsPedheadshotValid(headshot) then
                                    UnregisterPedheadshot(headshot)
                                    headshot=nil
                                    DrawRect(0.305,0.155,0.035,0.065,255,0,0,255)
                                elseif IsPedheadshotReady(headshot) then
                                    local txd=GetPedheadshotTxdString(headshot)
                                    DrawSprite(txd,txd,
                                        0.305,0.155,0.035,0.065,
                                        0.0, 255, 255, 255, 255)
                                end
                                local npc_rel_hash=GetPedRelationshipGroupHash(npc)
                                WriteText(4,relationship_name[npc_rel_hash],0.7,255,255,255,255,0.33,0.145)
                                
                                if #npc_lines>0 then
                                    for i=1,#npc_lines do
                                        SetTextWrap(0.5-(0.45/2)+0.015,0.5+(0.45/2)-0.015)
                                        WriteText(4,npc_lines[i],0.4,255,255,255,255,0.29,0.18+i*0.025)
                                    end
                                end
                                if #my_lines>0 then
                                    for i=1,#my_lines do
                                        pos=pos+1
                                        WriteText(4,my_lines[i],0.4,255,255,255,255,0.28,0.47+i*0.025)
                                        local col=0
                                        local alpha=200
                                        if curline==i then col=255 alpha=255 end
                                        DrawRect(0.5,0.485+i*0.025,0.45,0.025,col,col,col,alpha)
                                    end
                                end
                                if IsControlJustPressed(0,172) then if curline==1 then curline=#my_lines else curline=curline-1 end end
                                if IsControlJustPressed(0,173) then if curline>=#my_lines then curline=1 else curline=curline+1 end end
                                if IsControlJustPressed(0,86) then
                                    talking_state=my_lines[curline]
                                    change_lines(talkingstate,npc)
                                    curline=1
                                end
                                if talking_state=="[Back]" then 
                                    talking_state="Main"
                                    change_lines(talkingstate,npc)
                                    curline=1
                                elseif talking_state=="Thanks" then 
                                    talking_state="Main"
                                    change_lines(talkingstate,npc)
                                    curline=1
                                elseif talking_state=="Sorry, but no" then 
                                    talking_state="Main"
                                    change_lines(talkingstate,npc)
                                    curline=1
                                elseif talking_state=="No" then 
                                    talking_state="Main"
                                    change_lines(talkingstate,npc)
                                    curline=1
                                elseif talking_state=="[Exit]" then 
                                    talking=false
                                    curline=1
                                end
                            end
                            if headshot~=nil then
                                if IsPedheadshotValid(headshot) then
                                    UnregisterPedheadshot(headshot)
                                end
                                headshot=nil
                            end
                        end
                    end
                end
                loop,npc=FindNextPed(handle)
            end
            EndFindPed(handle)
        end
    end
end)


-- missions thread
Citizen.CreateThread(function()
    local function remove_quest(k)
        table.remove(quests,k)
        SetResourceKvpInt("quests",#quests)
        if k<=#quests then
            for i=k,#quests do
                local q=quests[i]
                SetResourceKvpInt("quest_"..i.."_type",q.t)
                SetResourceKvpInt("quest_"..i.."_id",q.id)
                SetResourceKvpFloat("quest_"..i.."_x",q.x)
                SetResourceKvpFloat("quest_"..i.."_y",q.y)
                SetResourceKvp("quest_"..i.."_item",q.i)
                SetResourceKvpFloat("quest_"..i.."_return_x",q.rx)
                SetResourceKvpFloat("quest_"..i.."_return_y",q.ry)
            end
        end
    end
    while true do Wait(0)
        if #quests>0 then
            local myped=PlayerPedId()
            local mypos=GetEntityCoords(myped)
            local d,dx,dy
            for k,v in ipairs(quests) do
                if v.t==0 then --find item in car
                    if v.done and v.rx and v.ry then
                        --WriteHint("Quest "..k.." done")
                        if v.zone and v.zone.questpos then
                            v.rx=v.zone.questpos.x
                            v.ry=v.zone.questpos.y
                            v.rz=v.zone.questpos.z
                        end
                        dx=mypos.x-v.rx
                        dy=mypos.y-v.ry
                        d=dx*dx+dy*dy
                        if d<2500 then
                            if v.rz~=nil then
                                DrawMarker(20, v.rx, v.ry, v.rz, 
                                0.0, 0.0, 0.0, --dir
                                0.0, 0.0, 0.0, --rot
                                1.0, 1.0, -1.0, --scl
                                100, 255, 150, 200, 
                                true, false, 2, true, 0, 0, false)
                            end
                            if d<1 and IsControlJustPressed(0,86) then
                                if v.errors~=nil and v.errors>6000 then
                                    if give_item_to_inventory("cash",npc_items_pricelist[v.i]) then
                                        if v.blip~=nil then
                                            RemoveBlip(v.blip)
                                        end
                                        remove_quest(k)
                                    end
                                else
                                    local slot=get_inventory_item_slot(v.i)
                                    if slot then
                                        if give_item_to_inventory("cash",npc_items_pricelist[v.i]) then --quest finished
                                            inventory.current=slot
                                            inventory[slot].amount=inventory[slot].amount-1
                                            check_inv_slot_for_zero_amount()
                                            if v.blip~=nil then
                                                RemoveBlip(v.blip)
                                            end
                                            remove_quest(k)
                                        end
                                    end
                                end
                            end
                        end
                    elseif v.x and v.y and v.r then
                        --WriteHint("Quest "..k.." in progress")
                        if not v.blip then
                            v.blip=AddBlipForRadius(v.x,v.y,0,v.r)
                            SetBlipAlpha(v.blip,100)
                            SetBlipColour(v.blip,3)
                        end
                        dy=mypos.y-v.y
                        if math.abs(dy)<v.r then
                            dx=mypos.x-v.x
                            if math.abs(dx)<v.r and dx*dx+dy*dy<v.r*v.r then
                                if v.marked then --target is found and marked
                                    local found=false
                                    local handle,veh=FindFirstVehicle()
                                    local loop=(handle~=-1)
                                    while loop do
                                        if DecorExistOn(veh,"quest_entity") then
                                            if DecorGetInt(veh,"quest_entity")==v.id then
                                                if GetBlipFromEntity(veh)==0 then
                                                    SimpleNotification("Retrieve ~y~~a~",(item_names[v.i] or v.i))
                                                    SetBlipColour(AddBlipForEntity(veh),5)
                                                end
                                                found=true
                                                local vehpos=GetEntityCoords(veh)
                                                dy=vehpos.y-mypos.y
                                                dx=vehpos.x-mypos.x
                                                d=dx*dx+dy*dy
                                                if d<100 then
                                                    if not disablehud then
                                                        local not_on_screen,x,y=N_0xf9904d11f1acbec3(vehpos.x,vehpos.y,vehpos.z+0.5)
                                                        if not not_on_screen then
                                                            SetTextCentre(true)
                                                            WriteText(2,{"~g~E ~s~to search for ~b~~a~",item_names[v.i] or v.i},0.3,255,255,255,200,x,y)
                                                        end
                                                    end
                                                    if IsControlJustPressed(0,86) then
                                                        if d<16 then 
                                                            if give_item_to_inventory(v.i,1) then
                                                                DecorRemove(veh,"quest_entity")
                                                                if GetBlipFromEntity(veh)~=0 then
                                                                    RemoveBlip(GetBlipFromEntity(veh))
                                                                end
                                                                if v.blip~=nil then
                                                                    RemoveBlip(v.blip)
                                                                end
                                                                if v.zone and v.zone.questpos then
                                                                    if not disablehud then
                                                                        SimpleNotification("Return ~y~~a~ ~s~to ~g~~a~",(item_names[v.i] or v.i),(v.zone and v.zone.name or "base"))
                                                                    end
                                                                    if v.blip then RemoveBlip(v.blip) v.blip=nil end
                                                                    v.blip=AddBlipForCoord(
                                                                    v.zone.questpos.x,
                                                                    v.zone.questpos.y,
                                                                    v.zone.questpos.z)
                                                                else
                                                                    if v.blip then RemoveBlip(v.blip) v.blip=nil end
                                                                    v.blip=AddBlipForCoord(
                                                                    v.rx,
                                                                    v.ry,
                                                                    0)
                                                                end
                                                                SetBlipColour(v.blip,2)
                                                                v.done=true
                                                                break
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                        
                                        loop,veh=FindNextVehicle(handle)
                                    end
                                    EndFindVehicle(handle)
                                    if not found then
                                        v.marked=nil
                                    end
                                else
                                    local handle,veh=FindFirstVehicle()
                                    local loop=(handle~=-1)
                                    while loop do
                                        if DecorExistOn(veh,"quest_entity") then
                                            if DecorGetInt(veh,"quest_entity")==v.id then
                                                if GetBlipFromEntity(veh)==0 then
                                                    SimpleNotification("Retrieve ~y~~a~",(item_names[v.i] or v.i))
                                                    SetBlipColour(AddBlipForEntity(veh),5)
                                                end
                                                v.marked=true
                                                break
                                            end
                                        else
                                            local vehpos=GetEntityCoords(veh)
                                            dy=vehpos.y-v.y
                                            if math.abs(dy)<v.r then
                                                dx=vehpos.x-v.x
                                                if math.abs(dx)<v.r and dx*dx+dy*dy<v.r*v.r then
                                                    if not GetIsVehicleEngineRunning(veh) then
                                                        --SetBlipSprite(
                                                        SimpleNotification("Retrieve ~y~~a~",(item_names[v.i] or v.i))
                                                        SetBlipColour(AddBlipForEntity(veh),5)
                                                        --,47)
                                                        NetworkRequestControlOfEntity(veh)
                                                        while not NetworkHasControlOfEntity(veh) do
                                                            WriteHint(4,"debug: trying to mark target")
                                                            Wait(0)
                                                        end
                                                        DecorSetInt(veh,"quest_entity",v.id)
                                                        DecorSetBool(veh,"zm_looted",true) 
                                                        DecorSetInt(veh,"dontdelete",GetPlayerServerId(PlayerId()))
                                                        SetEntityAsMissionEntity(veh)
                                                        v.marked=true
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                        loop,veh=FindNextVehicle(handle)
                                    end
                                    EndFindVehicle(handle)
                                end
                                if not v.marked then
                                    v.errors=(v.errors or 0)+1
                                    v.r=v.r+0.1
                                    if v.errors>6000 then
                                        v.done=true
                                        -- v.errors=nil
                                        SimpleNotification("There is no car, I should return to ~g~~a~ ~s~and report about it",(v.zone and v.zone.name or "base"))
                                        if v.blip then RemoveBlip(v.blip) v.blip=nil end
                                        if v.zone and v.zone.questpos then
                                            v.blip=AddBlipForCoord(
                                            v.zone.questpos.x,
                                            v.zone.questpos.y,
                                            v.zone.questpos.z)
                                        else
                                            v.blip=AddBlipForCoord(
                                            v.rx,
                                            v.ry,
                                            0)
                                        end
                                        SetBlipColour(v.blip,2)
                                    end
                                    WriteHint(4,messages.search_the_area_for_car)
                                end
                            end
                        end
                    end
                else
                    WriteHint(4,{"~r~ERROR! ~s~Quest type ~a~ is ~r~not implemented!",tostring(v.t)})
                end
            end
        end
    end
end)

--missions
-- Citizen.CreateThread(function()
    -- local blip_mission_start
    -- local icon=133
    -- while true do Wait(0)
        -- local myped=PlayerPedId()
        -- local mypos=GetEntityCoords(myped)
        -- local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        -- if zone then
            -- blip_mission_start=GetFirstBlipInfoId(icon)
            -- if DoesBlipExist(blip_mission_start) then
                -- if IsControlJustPressed(0,86) then
                    -- local npc=GetBlipInfoIdEntityIndex(blip_mission_start)
                    -- local delta=mypos-GetEntityCoords(npc)
                    -- if math.abs(delta.x)+math.abs(delta.y)<2 and math.abs(delta.z)<2 and #delta<2 then
                        -- for i=1,180 do
                            -- WriteHint("You got new quest(not really, it's just debug output)")
                            -- Wait(0)
                        -- end
                    -- end
                -- end
            -- else
                -- local myrel=GetPedRelationshipGroupHash(myped)
                -- while true do
                    -- local handle,npc=FindFirstPed()
                    -- local loop=(handle~=-1)
                    -- while loop do
                        -- if not IsPedAPlayer(npc) and GetPedRelationshipGroupHash(npc)==myrel then
                            -- local blip=AddBlipForEntity(npc)
                            -- SetBlipSprite(npc,icon)
                            -- break
                        -- end
                        -- Wait(0)
                        -- loop,npc=FindNextPed(handle)
                    -- end
                    -- EndFindPed(handle)
                -- end
            -- end
            -- --GetNextBlipInfoId(icon)
        -- end
    -- end
-- end)

function player_extraction(v)
	local myped=PlayerPedId()
	local mypos
	local d,dx,dy,dz
	--local myweapon=GetSelectedPedWeapon(myped)
	--strip_weapon_upgrades(myweapon)
	--unload_weapon(myweapon)
	-- for k,v in pairs(weapons) do
		-- local weapon_hash=GetHashKey("weapon_"..k)
		-- if not IsWeaponValid(weapon_hash) then
			-- weapon_hash=GetHashKey("gadget_"..k)
			-- if not IsWeaponValid(weapon_hash) then
				-- weapon_hash=GetHashKey(k)
				-- if not IsWeaponValid(weapon_hash) then
					-- weapon_hash=nil
				-- end
			-- end
		-- end
		-- if weapon_hash~=nil and HasPedGotWeapon(myped,weapon_hash) then
			-- strip_weapon_upgrades(weapon_hash)
		-- end
	-- end
	TriggerServerEvent("updateplayerloot",nil)
	local rnd=math.random(1,#extraction_spawns)
	enable_kvp_saving()
	
	SetResourceKvpFloat("x",extraction_spawns[rnd].x)
	SetResourceKvpFloat("y",extraction_spawns[rnd].y)
	SetResourceKvpFloat("z",extraction_spawns[rnd].z)
	SetResourceKvpFloat("angle",extraction_spawns[rnd].angle)
	SetResourceKvpInt("spawnvehmodel",276773164)
	
	-- for weapon_name,weapon_hash in pairs(weapons) do
		-- if weapon_hash~=nil and HasPedGotWeapon(myped,weapon_hash) then
			-- for upgrade_name,v in pairs(weapon_upgrades) do
				-- local upgrade_hash=v[weapon_hash]
				-- if upgrade_hash~=nil then
					-- local concname=string.format('_%x%x',weapon_hash&0xFFFFFFFF,upgrade_hash&0xFFFFFFFF)
					-- if HasPedGotWeaponComponent(myped, weapon_hash, upgrade_hash) then
						-- SetResourceKvpInt(concname,1)
						-- print("save weapon with component:"..concname)
					-- else
						-- DeleteResourceKvp(concname)
					-- end
				-- end
			-- end
			-- SetResourceKvpInt(weapon_name,1)
		-- else
			-- DeleteResourceKvp(weapon_name)
		-- end
	-- end
	-- for k,v in pairs(ammo_types) do
		-- local ammo=GetPedAmmoByType(myped,v)
		-- if ammo>0 then
			-- SetResourceKvpInt(k,ammo)
		-- else
			-- DeleteResourceKvp(k)
		-- end
	-- end
	SetResourceKvpInt("inventory_total",inventory.total)
	SetResourceKvpInt("inventory_current",inventory.current)
	for i=1,inventory.max do
		if not inventory[i] then
			DeleteResourceKvp("inventory_item_"..i)
		else
			SetResourceKvp("inventory_item_"..i,inventory[i].item)
			SetResourceKvpInt("inventory_amount_"..i,inventory[i].amount)
		end
	end
	if player.suit then
		if get_inventory_item_slot("clothes_"..player.suit) then
			SetResourceKvp("suit",player.suit)
		else
			DeleteResourceKvp("suit")
		end
	else
		DeleteResourceKvp("suit")
	end
	if player.hat then
		if get_inventory_item_slot(player.hat) then
			SetResourceKvp("hat",player.hat)
		end
	else
		DeleteResourceKvp("hat")
	end
	if player.mask then
		if get_inventory_item_slot(player.mask) then
			SetResourceKvp("mask",player.mask)
		end
	else
		DeleteResourceKvp("mask")
	end
	if player.backpack then
		if get_inventory_item_slot("duffelbag") then
			SetResourceKvp("backpack",tostring(player.backpack))
		end
	else
		DeleteResourceKvp("backpack")
	end
	if player.bodyarmor then
		if get_inventory_item_slot("bodyarmor") then
			SetResourceKvp("bodyarmor",tostring(player.bodyarmor))
		end
	else
		DeleteResourceKvp("bodyarmor")
	end
	local armour=GetPedArmour(myped)
	SetResourceKvpInt("armour",armour)
	
	
	for _,zone in pairs(safezones) do
		if zone.storagepos and zone.storagename then
			local name="st_"..zone.storagename
			local inventory=zone.storage
			SetResourceKvpInt(name.."_total",inventory.total)
			SetResourceKvpInt(name.."_current",inventory.current)
			local imax=0
			for k,v in pairs(item_names) do
				imax=imax+1
			end
			for i=1,imax do
				if not inventory[i] then
					DeleteResourceKvp(name.."_item_"..i)
				else
					SetResourceKvp(name.."_item_"..i,inventory[i].item)
					SetResourceKvpInt(name.."_amount_"..i,inventory[i].amount)
				end
			end
		end
	end
	
	Wait(500)
	TriggerServerEvent("extracted")
	
	repeat Wait(0)
		WriteHint(9,messages.you_can_leave_server_now)
		mypos=GetEntityCoords(myped)
		dx,dy,dz=mypos.x-v.x,mypos.y-v.y,mypos.z-v.z
	until dx*dx+dy*dy+dz*dz>v.r*3
	Wait(20000)
	disable_kvp_saving()
	send_player_loot()
	SimpleNotification("Saving aborted.")
end


local prop_mb_crate_01a=GetHashKey("prop_mb_crate_01a")
Citizen.CreateThread(function()
    local function give_ammo(pped,ammo_type)
        local old_ammo=GetPedAmmoByType(pped,ammo_type)
        SetPedAmmoByType(pped,ammo_type,old_ammo+inventory[inventory.current].amount)
        local new_ammo=GetPedAmmoByType(pped,ammo_type)
        if new_ammo>old_ammo then
            inventory[inventory.current].amount=inventory[inventory.current].amount-(new_ammo-old_ammo)
            check_inv_slot_for_zero_amount()
        end
    end
    local function is_other_player_playing_anim_nearby(mypos,myplayerid,dict,anim)
        for i=myplayerid-1,0,-1 do
            if NetworkIsPlayerActive(i) then
                local otherped=GetPlayerPed(i)
                local delta=(GetEntityCoords(otherped)-mypos)
                if delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<9 and IsEntityPlayingAnim(otherped,dict,anim,3) then
                    conflict=true
                    return true
                end
            end
        end
        for i=myplayerid+1,31 do
            if NetworkIsPlayerActive(i) then
                local otherped=GetPlayerPed(i)
                local delta=(GetEntityCoords(otherped)-mypos)
                if delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<9 and IsEntityPlayingAnim(otherped,dict,anim,3) then
                    conflict=true
                    return true
                end
            end
        end
    end
    local function place_thing_on_ground_or_water(v)
        local water,height=GetWaterHeight(v.x,v.y,999.5)
        if not water then
            _,height=GetGroundZFor_3dCoord(v.x,v.y,999.5,false)
        end
        if v.z==nil or math.abs(height-v.z)>.01 then
            if v.object==nil then
                if HasModelLoaded(v.m) then
                    v.object=CreateObject(v.m, v.x, v.y, height, false, false, false)
                    if not water then PlaceObjectOnGroundProperly(v.object) end
                    FreezeEntityPosition(v.object,true)
                    v.z=height
                else
                    RequestModel(v.m)
                end
            else
                SetEntityCoords(v.object, v.x, v.y, height)
                if not water then PlaceObjectOnGroundProperly(v.object) end
                FreezeEntityPosition(v.object,true)
                v.z=height
            end
        end
    end
    Citizen.CreateThread(function()
        local color={}
        color.bkg=20
        color.bar=150
        color.barlight=200
        color.bardark=50
                    -- local t0=(GetGameTimer()&-1024)
                    -- local t=t0
        local pped
        local mypos
        local dx,dy
        local quad
        local not_on_screen,x,y
        local t,mult
        while true do
            pped=PlayerPedId()
            mypos=GetEntityCoords(pped)
            t=(GetGameTimer()&-1024)
            for k,v in pairs(signals) do
                dx,dy=mypos.x-v.x,mypos.y-v.y
                quad=dx*dx+dy*dy
                if quad<2500 then
                    if v.auto_z then
                        place_thing_on_ground_or_water(v)
                    else
                        dx=mypos.z-v.z
                        quad=quad+dx*dx
                    end
                    if v.health~=nil and quad<25 then
                        if v.z~=nil then
                            not_on_screen,x,y=N_0xf9904d11f1acbec3(v.x,v.y,v.z+1)
                        else
                            not_on_screen,x,y=N_0xf9904d11f1acbec3(v.x,v.y,mypos.z)
                        end
                        if v.t==nil or v.t~=t then
                            v.t=t
                            TriggerServerEvent("signalfound",k)
                        end
                        if v.maxhealth~=nil and not not_on_screen then
                            mult=0.0975/v.maxhealth
                            DrawRect(x,y,0.09875,0.008,color.bkg,color.bkg,color.bkg,200) -- health light
                            DrawRect(x-0.5*(v.maxhealth-v.health)*mult,y,v.health*mult,0.006,color.bar,color.bar,color.bar,200) -- health bar
                        end
                    end
                end
            end
            Wait(0)
        end
    end)
    local waiting_for_server_resonse=false
    RegisterNetEvent("loot_crate_give")
    AddEventHandler("loot_crate_give",function(...)
        if waiting_for_server_resonse then
            give_item_to_inventory(...)
        end
        waiting_for_server_resonse=false
    end)
    RegisterNetEvent("loot_crate_fail")
    AddEventHandler("loot_crate_fail",function(id,loot)
        if waiting_for_server_resonse and signals[id]~=nil then
            signals[id].loot=loot
        end
        waiting_for_server_resonse=false
    end)
    local function try_to_load_garage(garage)
        if garage.vehiclesave==nil or garage.vehiclesave.model==nil then
            local kvp_car_model=GetResourceKvpInt("garage_"..garage.name.."_model")
            if kvp_car_model~=nil and kvp_car_model~=0 then
                garage.vehiclesave={}
                garage.vehiclesave.model=kvp_car_model
                garage.vehiclesave.enginehp=GetResourceKvpFloat("garage_"..garage.name.."_enginehp")
                garage.vehiclesave.fuellevel=GetResourceKvpFloat("garage_"..garage.name.."_fuel")
                garage.vehiclesave.doors=GetResourceKvpInt("garage_"..garage.name.."_doors")
                garage.vehiclesave.tyres=GetResourceKvpInt("garage_"..garage.name.."_tyres")
                local colors=GetResourceKvpInt("garage_"..garage.name.."_colors")
                local colors8=(colors>>8)
                local colors16=(colors>>16)
                local colors24=(colors>>24)
                
                garage.vehiclesave.colors={colors&0xFF,colors8&0xFF,colors16&0xFF,colors24&0xFF}
                garage.vehiclesave.total_mods=GetResourceKvpInt("garage_"..garage.name.."_total_mods")
                garage.vehiclesave.mods={}
                local modstring=GetResourceKvpString("garage_"..garage.name.."_modstring")
                if modstring~=nil then
                    --SimpleNotification("loading "..#modstring)
                    for i=1,#modstring,2 do
                        local k,v=string.byte(modstring,i,i+1)
                        k,v=k-1,v-1
                        garage.vehiclesave.mods[k]=v
                    end
                end
            end
        end
    end
    while true do Wait(0)
        droppingitem=false
        local pped=PlayerPedId()
        local mypos=GetEntityCoords(pped)
        local myfaction=GetPedRelationshipGroupHash(pped)
        collectgarbage("step")
        if inventory.highlight>0 then
            inventory.highlight=inventory.highlight-1
        end
        
        if inventory.scroll<=0 or inventory.total==0 then 
            inventory.scroll=0 
        elseif inventory.scroll*inventory.rows>=inventory.total then
            inventory.scroll=inventory.scroll-1
        end
    
        --dialogs start
        if false then
        --if zone~=nil and zone.relationship~=nil and zone.relationship==myfaction then
            --WriteHint(zone.relationship)
            local handle,npc=FindFirstPed()
            local loop=(handle~=-1)
            while loop do
                if (not IsPedAPlayer(npc)) 
                and GetPedType(npc)~=28 --animal
                and DecorExistOn(npc,"raider")
                and not IsPedDeadOrDying(npc)
                and GetRelationshipBetweenGroups(GetPedRelationshipGroupHash(PlayerPedId()),GetPedRelationshipGroupHash(npc))~=5
                then
                    local can_talk_now=GetIsTaskActive(npc,15) --donothing
                          and (not GetIsTaskActive(npc,35)) --complexmovement
                          --and GetPedRelationshipGroupHash(npc)==myfaction
                    local npcpos=GetEntityCoords(npc)
                    if square_dist(mypos,npcpos)<9 then
                        local talking=false
                        local headshot
                        if not disablehud then
                            WriteHint(5,messages.press_e_to_talk)
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(npcpos.x,npcpos.y,npcpos.z+1.0)
                            if not not_on_screen then
                                SetTextCentre(true)
                                WriteText(2,messages.e_to_talk,0.3,255,255,255,200,x,y)
                            end
                        end
                        if IsControlJustPressed(0,86) then
                            talking=true
                            talking_state="Main"
                            change_lines(talkingstate,npc)
                            curline=1
                            quest_zone=get_closest_friendly_zone_with_questpos(mypos.x,mypos.y,myfaction)
                            headshot=RegisterPedheadshot(npc)
                        end
                        while talking do Wait(0) --dialogue
                            pped=PlayerPedId()
                            mypos=GetEntityCoords(pped)
                            npcpos=GetEntityCoords(npc)
                            if square_dist(mypos,npcpos)>9 then
                                talking=false
                            end
                            inventory.highlight=0
                            DrawRect(0.5,0.3,0.45,0.4,0,0,0,200)
                            if headshot==nil then
                                headshot=RegisterPedheadshot(npc)
                                DrawRect(0.305,0.155,0.035,0.065,0,0,255,255)
                            elseif not IsPedheadshotValid(headshot) then
                                UnregisterPedheadshot(headshot)
                                headshot=nil
                                DrawRect(0.305,0.155,0.035,0.065,255,0,0,255)
                            elseif IsPedheadshotReady(headshot) then
                                local txd=GetPedheadshotTxdString(headshot)
                                DrawSprite(txd,txd,
                                    0.305,0.155,0.035,0.065,
                                    0.0, 255, 255, 255, 255)
                            end
                            local npc_rel_hash=GetPedRelationshipGroupHash(npc)
                            WriteText(4,relationship_name[npc_rel_hash],0.7,255,255,255,255,0.33,0.145)
                            
                            if #npc_lines>0 then
                                for i=1,#npc_lines do
                                    SetTextWrap(0.5-(0.45/2)+0.015,0.5+(0.45/2)-0.015)
                                    WriteText(4,npc_lines[i],0.4,255,255,255,255,0.29,0.18+i*0.025)
                                end
                            end
                            if #my_lines>0 then
                                for i=1,#my_lines do
                                    pos=pos+1
                                    WriteText(4,my_lines[i],0.4,255,255,255,255,0.28,0.47+i*0.025)
                                    local col=0
                                    local alpha=200
                                    if curline==i then col=255 alpha=255 end
                                    DrawRect(0.5,0.485+i*0.025,0.45,0.025,col,col,col,alpha)
                                end
                            end
                            if IsControlJustPressed(0,172) then if curline==1 then curline=#my_lines else curline=curline-1 end end
                            if IsControlJustPressed(0,173) then if curline>=#my_lines then curline=1 else curline=curline+1 end end
                            if IsControlJustPressed(0,191) then
                                talking_state=my_lines[curline]
                                change_lines(talkingstate,npc)
                                curline=1
                            end
                            if talking_state=="[Back]" then 
                                talking_state="Main"
                                change_lines(talkingstate,npc)
                                curline=1
                            elseif talking_state=="Thanks" then 
                                talking_state="Main"
                                change_lines(talkingstate,npc)
                                curline=1
                            elseif talking_state=="Sorry, but no" then 
                                talking_state="Main"
                                change_lines(talkingstate,npc)
                                curline=1
                            elseif talking_state=="No" then 
                                talking_state="Main"
                                change_lines(talkingstate,npc)
                                curline=1
                            elseif talking_state=="[Exit]" then 
                                talking=false
                                curline=1
                            end
                        end
                        if headshot~=nil then
                            if IsPedheadshotValid(headshot) then
                                UnregisterPedheadshot(headshot)
                            end
                            headshot=nil
                        end
                    end
                    if DecorExistOn(npc,"questnpc") and not IsPedDeadOrDying(npc) then
                        if GetBlipFromEntity(npc)==0
                        then
                            if GetIsTaskActive(npc,15) --donothing
                            and (not GetIsTaskActive(npc,35)) --complexmovement
                            then
                                --print("Adding blip to "..npc)
                                --npcblips[npc]=
                                SetBlipSprite(AddBlipForEntity(npc),133)
                            end
                        end
                    else
                        local blip=GetBlipFromEntity(npc)
                        if blip~=0 and GetBlipSprite(blip)==133 then
                            RemoveBlip(blip)
                        end
                    end
                end
                loop,npc=FindNextPed(handle)
            end
            EndFindPed(handle)
        end
        --dialogs end
        
        
        
        if IsControlJustPressed(0,86) and not IsPedDeadOrDying(pped) then
            --print("e pressed")
			if (not IsPedInAnyVehicle(pped)) or IsPedOnAnyBike(pped) then
				for k,v in pairs(signals) do
					local dx,dy=mypos.x-v.x,mypos.y-v.y
					local quad=dx*dx+dy*dy
					if not v.auto_z then
						dx=mypos.z-v.z
						quad=quad+dx*dx
					end
					if quad<3 then
						-- local t0=(GetGameTimer()&-1024)
						-- local t=t0
						local menu_index=1
						local selected_thing,selected_amount
						inventory.highlight=0
						if v.loot==nil and (v.health==nil or v.maxhealth==nil) then
								--SetTextCentre(true)
								--WriteText(7,"You're close to checkpoint thing",1.0,255,255,255,255,x,y)
								--if IsControlJustPressed(0,86) then
									TriggerServerEvent("signalfound",k)
								--end
						end
						Wait(0)
						pped=PlayerPedId()
						mypos=GetEntityCoords(pped)
						dx,dy=mypos.x-v.x,mypos.y-v.y
						quad=dx*dx+dy*dy
						if not v.auto_z then
							dx=mypos.z-v.z
							quad=quad+dx*dx
						end
						--place_thing_on_ground_or_water(v)
						while quad<4 do
							local not_on_screen,x,y
							if v.z~=nil then
								not_on_screen,x,y=N_0xf9904d11f1acbec3(v.x,v.y,v.z+1)
							else
								not_on_screen,x,y=N_0xf9904d11f1acbec3(v.x,v.y,mypos.z)
							end
							if v.health then
								--WriteText(7,{"~1~ seconds to open",v.health},.2,255,255,255,255,x,y)
								--if IsControlJustPressed(0,86) then
									break
								--end
								-- t=(GetGameTimer()&-1024)
								-- if t0~=t then
									-- t0=t
									-- TriggerServerEvent("signalfound",k)
								-- end
							elseif v.loot~=nil then
								local i=0
								for thing,amount in pairs(v.loot) do
									i=i+1
									local name=item_names[thing] or thing
									if menu_index==i then
										selected_thing=thing
										selected_amount=amount
										WriteText(7,{"~a~ x ~1~",name,amount},.2,255,255,255,255,x,y)
									else
										WriteText(7,{"~a~ x ~1~",name,amount},.2,128,128,128,255,x,y)
									end
									y=y+.013
								end
								if i>0 then
									if IsControlJustPressed(0,173) then --up
										menu_index=menu_index+1
									elseif IsControlJustPressed(0,172) then --down
										menu_index=menu_index-1
									elseif (not waiting_for_server_resonse) and IsControlJustPressed(0,86) then
										if can_fit_into_inventory(selected_thing,selected_amount) then
											inventory.highlight=0
											waiting_for_server_resonse=true
											TriggerServerEvent("loot",k,selected_thing)
										end
									end
									if menu_index<1 then
										menu_index=i
									elseif menu_index>i then
										menu_index=1
									end
								end
							end
							Wait(0)
							pped=PlayerPedId()
							mypos=GetEntityCoords(pped)
							dx,dy=mypos.x-v.x,mypos.y-v.y
							quad=dx*dx+dy*dy
							if not v.auto_z then
								dx=mypos.z-v.z
								quad=quad+dx*dx
							end
							--place_thing_on_ground_or_water(v)
						end
					end
				end
			end
            local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
            if IsPedInAnyVehicle(pped) then
				if zone~=nil and not zone.raided and zone.vehpos~=nil and in_radius(mypos,zone.vehpos,5) and  false then--devmode then
                    --sell car
                    local myveh=GetVehiclePedIsIn(pped)
                    local current_menu=0
                    SetVehicleModKit(myveh,0)
                    local menu_start=0
                    local menu_end=250
                    local component_name={
                    
                    }
                    for i=0,250 do
                        local num=GetNumVehicleMods(myveh,i)
                        local name=GetModSlotName(myveh,i)
                        if name==nil then
                            name="nil"
                        elseif name=="" then
                            name="empty_string"
                        elseif name==0 then
                            name="zero"
                        elseif name==-1 then
                            name="minus_one"
                        end
                        component_name[i]=i.." "..name
                        local mod=GetVehicleMod(myveh,i)
                        local text=GetModTextLabel(myveh,i,mod)
                        if text==nil then
                            text="nil"
                        elseif text=="" then
                            text="empty_string"
                        elseif text==0 then
                            text="zero"
                        elseif text==-1 then
                            text="minus_one"
                        end
                        print(i.." "..name.." "..mod.."/"..num.." ("..text..")")
                        --SetVehicleMod(myveh,i,math.tointeger(mod),false)
                    end
                    local current_menu=menu_start
                    SetEntityVelocity(myveh,0,0,0)                    
					local current_trade=1
                    local scroll=1
                    while true do Wait(0)
                        inventory.highlight=0
                        pped=PlayerPedId()
                        mypos=GetEntityCoords(pped)
                        if IsControlJustPressed(0,177) or not in_radius(mypos,zone.vehpos,5) or GetVehiclePedIsIn(pped)~=myveh then
                            break
                        elseif IsControlJustPressed(0,173) then --down
                            if current_menu<menu_end then
                                repeat
                                    current_menu=current_menu+1
                                until GetNumVehicleMods(myveh,current_menu)~=0 or current_menu==menu_end
                            else
                                current_menu=menu_start
                            end
                        elseif IsControlJustPressed(0,172) then --up
                            if current_menu>menu_start then
                                repeat
                                    current_menu=current_menu-1
                                until GetNumVehicleMods(myveh,current_menu)~=0 or current_menu==menu_start
                            else
                                current_menu=menu_end
                            end
                        elseif IsControlJustPressed(0,175) then --right
                            -- if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
                            -- if current_menu<12 then
                                local current=GetVehicleMod(myveh,current_menu)
                                local total=GetNumVehicleMods(myveh,current_menu)
                                if current<total then
                                    current=current+1
                                else
                                    current=-1
                                end
                                --print("set "..current)
                                --local texture=GetPedTextureVariation(pped,current_menu,current)
                                --local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
                                --if textures>0 then textures=math.random(0,textures-1) end
                                --SetPedComponentVariation(pped,current_menu,current,textures,0)
                                SetVehicleMod(myveh,current_menu,current,false)
                            -- else
                                -- local current=GetPedPropIndex(pped,current_menu-12)
                                -- --print("current "..current)
                                -- local total=GetNumberOfPedPropDrawableVariations(pped,current_menu-12)-1
                                -- if current<total then
                                    -- current=current+1
                                -- else
                                    -- current=-1
                                -- end
                                -- --print("set "..current)
                                -- --local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
                                -- local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
                                -- if textures>0 then textures=math.random(0,textures-1) end
                                -- ClearPedProp(pped,current_menu-12)
                                -- SetPedPropIndex(pped,current_menu-12,current,textures,true)
                            -- end
                        elseif IsControlJustPressed(0,174) then --left
                            --if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
                            -- if current_menu<12 then
                                local current=GetVehicleMod(myveh,current_menu)
                                local total=GetNumVehicleMods(myveh,current_menu)
                                if current>-1 then
                                    current=current-1
                                else
                                    current=total
                                end
                                --print("set "..current)
                                --local texture=GetPedTextureVariation(pped,current_menu,current)
                                --local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
                                --if textures>0 then textures=math.random(0,textures-1) end
                                --SetPedComponentVariation(pped,current_menu,current,textures,0)
                                SetVehicleMod(myveh,current_menu,current,false)
                            -- else
                                -- local current=GetPedPropIndex(pped,current_menu-12)
                                -- --print("current "..current)
                                -- local total=GetNumberOfPedPropDrawableVariations(pped,current_menu-12)-1
                                -- if current>-1 then
                                    -- current=current-1
                                -- else
                                    -- current=total
                                -- end
                                -- --print("set "..current)
                                -- --local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
                                -- local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
                                -- if textures>0 then textures=math.random(0,textures-1) end
                                -- ClearPedProp(pped,current_menu-12)
                                -- SetPedPropIndex(pped,current_menu-12,current,textures,true)
                            -- end
                        elseif IsControlJustPressed(0,86) then --e veh horn
                            -- if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
                            -- if current_menu<12 then
                                -- local current=GetPedDrawableVariation(pped,current_menu)
                                -- local texture=GetPedTextureVariation(pped,current_menu,current)
                                -- local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
                                -- if textures>0 then
                                    -- if texture<textures-1 then
                                        -- texture=texture+1
                                    -- else
                                        -- texture=0
                                    -- end
                                -- end
                                -- SetPedComponentVariation(pped,current_menu,current,texture,0)
                            -- else
                                -- local current=GetPedPropIndex(pped,current_menu-12)
                                -- local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
                                -- local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
                                -- if textures>0 then
                                    -- if texture<textures-1 then
                                        -- texture=texture+1
                                    -- else
                                        -- texture=0
                                    -- end
                                -- end
                                -- ClearPedProp(pped,current_menu-12)
                                -- SetPedPropIndex(pped,current_menu-12,current,texture,true)
                            -- end
                        end
                        
                        local txt_pos=0.08+0.025
                        for i=menu_start,menu_end do
                            local variations=GetNumVehicleMods(myveh,i)
                            if variations~=0 then
                                local current=GetVehicleMod(myveh,i)
                                local alpha=(variations>0) and 255 or 100
                                if i==current_menu then
                                    DrawRect(0.25,0.012+txt_pos,0.2,0.025,255,255,255,255) --chosenline
                                    --local textures=GetNumberOfPedTextureVariations(pped,i,current)
                                    --local texture=GetPedTextureVariation(pped,i,current)
                                    WriteTextNoOutline(2,component_name[i],0.35,0,0,0,alpha,0.16,txt_pos) --chosen line text
                                    --if (variations~=0) then current=current+1 end
                                    --if (textures~=0) then texture=texture+1 end
                                    WriteTextNoOutline(4,"<",0.35,0,0,0,alpha,0.280,txt_pos) --chosen line text
                                    WriteTextNoOutline(4,{"~1~ / ~1~ >",current,variations},0.35,0,0,0,alpha,0.285,txt_pos) --chosen line text
                                    --WriteTextNoOutline(4,"E "..texture.." / "..textures,0.35,0,0,0,alpha,0.315,0.428+.025+i*.025) --chosen line text
                                else
                                    WriteTextNoOutline(2,component_name[i],0.35,255,255,255,alpha,0.16,txt_pos) --not chosen line text
                                    --if (variations~=0) then current=current+1 end
                                    WriteTextNoOutline(4,{"~1~ / ~1~",current,variations},0.35,255,255,255,alpha,0.285,txt_pos) --not chosen line text
                                end
                                txt_pos=txt_pos+0.025
                            end
                        end
                        
                    end
                end
                if zone~=nil and not zone.raided and zone.vehpos~=nil and in_radius(mypos,zone.vehpos,5) and zone.chopshop then
					if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
						--sell car
						local myped=PlayerPedId()
						local myveh=GetVehiclePedIsIn(myped)
						local myvehmodel=GetEntityModel(myveh)
						local function chopshop_getcost(myveh,option)
							local name=option.name
							local price=option.amount
							
							local model=GetEntityModel(myveh)
							local using_vehicle_weapon,weapon=GetCurrentPedVehicleWeapon(myped)
							if vehicles_ammo[model] and vehicles_ammo[model][weapon] then
								local pool=vehicles_ammo[model][weapon].pool
								if pool then
									price=vehicles_ammo.cost[pool]*option.amount
									--WriteNotification(vehicles_ammo[model][weapon].pool)
								end
							end
							
							local cost=0
							if name=="repair" then
								local enginehp=GetVehicleEngineHealth(myveh)
								cost=math.ceil((1000-enginehp)*price)
							elseif name=="refill" then
								local fuel=0
								if DecorExistOn(myveh,"zm_fuel") then
									fuel=DecorGetFloat(myveh,"zm_fuel")
								end
								if fuel>5.0 then
									cost=math.ceil((80-fuel)*price)
								else
									cost=math.ceil(75*price)
								end
							elseif name=="rearm" then
								local model=GetEntityModel(myveh)
								local myped=PlayerPedId()
								local using_vehicle_weapon,weapon=GetCurrentPedVehicleWeapon(myped)
								if vehicles_ammo[model] and vehicles_ammo[model][weapon] then
									local decor=vehicles_ammo[model][weapon][1]
									local maxammo=vehicles_ammo[model][weapon][2]
									if DecorExistOn(myveh,decor) then
										cost=math.ceil((maxammo-DecorGetInt(myveh,decor))*price)
										--WriteHint(315,{"part price=~a~ maxammo=~a~ decor=~a~ cost=~a~",tostring(price),tostring(maxammo),tostring(DecorGetInt(myveh,decor)),tostring(cost)})
									else
										cost=maxammo*price
										--WriteHint(315,"full")
									end
								else
									--WriteHint(315,"0000")
									cost=0
								end
							else
								cost=option.amount
							end
							if cost<0 then cost=0 end
							return cost
						end
						local current_menu=0
						--SetVehicleModKit(myveh,0)
						--local menu_start=0
						--local menu_end=250
						--local component_name={
						
						--}
						-- for i=0,250 do
							-- local num=GetNumVehicleMods(myveh,i)
							-- local name=GetModSlotName(myveh,i)
							-- if name==nil then
								-- name="nil"
							-- elseif name=="" then
								-- name="empty_string"
							-- elseif name==0 then
								-- name="zero"
							-- elseif name==-1 then
								-- name="minus_one"
							-- end
							-- component_name[i]=i.." "..name
							-- local mod=GetVehicleMod(myveh,i)
							-- local text=GetModTextLabel(myveh,i,mod)
							-- if text==nil then
								-- text="nil"
							-- elseif text=="" then
								-- text="empty_string"
							-- elseif text==0 then
								-- text="zero"
							-- elseif text==-1 then
								-- text="minus_one"
							-- end
							-- print(i.." "..name.." "..mod.."/"..num.." ("..text..")")
							-- --SetVehicleMod(myveh,i,math.tointeger(mod),false)
						-- end
						-- local current_menu=menu_start
						SetEntityVelocity(myveh,0,0,0)
						local current_trade=1
						local scroll=1
						local maxtradesinmenu=7
						
						
						local chopshopwithupgrades={}
						for k,v in pairs(zone.chopshop) do
							v.sprite=v[1]
							v.resource=v[2]
							v.amount=v[3]
							v.name=v[1]
							table.insert(chopshopwithupgrades,v)
						end
						for k,v in pairs(zone.upgrades) do
							if GetHashKey(v.vehicle)==myvehmodel then
								table.insert(chopshopwithupgrades,v)
							end
						end
						while true do Wait(0)
							inventory.highlight=0
							pped=PlayerPedId()
							mypos=GetEntityCoords(pped)
							if IsControlJustPressed(0,177) or not in_radius(mypos,zone.vehpos,5) or GetVehiclePedIsIn(pped)~=myveh then
								break
							elseif IsControlJustPressed(0,173) then --down
								if current_trade<#chopshopwithupgrades then
									current_trade=current_trade+1
									if (current_trade-scroll)>=maxtradesinmenu then
										scroll=scroll+1
									end
								else
									current_trade=1
									scroll=1
								end
							elseif IsControlJustPressed(0,172) then --up
								if current_trade>1 then
									current_trade=current_trade-1
									if (current_trade<scroll) then
										scroll=scroll-1
									end
								else
									current_trade=#chopshopwithupgrades
									scroll=current_trade-maxtradesinmenu+1
									if scroll<1 then scroll=1 end
								end
							elseif IsControlJustPressed(0,175) then --right
								-- if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
								-- if current_menu<12 then
									-- local current=GetVehicleMod(myveh,current_menu)
									-- local total=GetNumVehicleMods(myveh,current_menu)
									-- if current<total then
										-- current=current+1
									-- else
										-- current=-1
									-- end
									--print("set "..current)
									--local texture=GetPedTextureVariation(pped,current_menu,current)
									--local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
									--if textures>0 then textures=math.random(0,textures-1) end
									--SetPedComponentVariation(pped,current_menu,current,textures,0)
									-- SetVehicleMod(myveh,current_menu,current,false)
								-- else
									-- local current=GetPedPropIndex(pped,current_menu-12)
									-- --print("current "..current)
									-- local total=GetNumberOfPedPropDrawableVariations(pped,current_menu-12)-1
									-- if current<total then
										-- current=current+1
									-- else
										-- current=-1
									-- end
									-- --print("set "..current)
									-- --local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
									-- local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
									-- if textures>0 then textures=math.random(0,textures-1) end
									-- ClearPedProp(pped,current_menu-12)
									-- SetPedPropIndex(pped,current_menu-12,current,textures,true)
								-- end
							elseif IsControlJustPressed(0,174) then --left
								--if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
								-- if current_menu<12 then
									-- local current=GetVehicleMod(myveh,current_menu)
									-- local total=GetNumVehicleMods(myveh,current_menu)
									-- if current>-1 then
										-- current=current-1
									-- else
										-- current=total
									-- end
									--print("set "..current)
									--local texture=GetPedTextureVariation(pped,current_menu,current)
									--local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
									--if textures>0 then textures=math.random(0,textures-1) end
									--SetPedComponentVariation(pped,current_menu,current,textures,0)
									-- SetVehicleMod(myveh,current_menu,current,false)
								-- else
									-- local current=GetPedPropIndex(pped,current_menu-12)
									-- --print("current "..current)
									-- local total=GetNumberOfPedPropDrawableVariations(pped,current_menu-12)-1
									-- if current>-1 then
										-- current=current-1
									-- else
										-- current=total
									-- end
									-- --print("set "..current)
									-- --local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
									-- local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
									-- if textures>0 then textures=math.random(0,textures-1) end
									-- ClearPedProp(pped,current_menu-12)
									-- SetPedPropIndex(pped,current_menu-12,current,textures,true)
								-- end
							elseif IsControlJustPressed(0,86) then --e veh horn
								local function chopshop_pay(slot,cost)
									if slot and inventory[slot] and inventory[slot].amount>=cost then
										inventory[slot].amount=inventory[slot].amount-cost
										inventory.current=slot
										check_inv_slot_for_zero_amount()
										return true
									end
									return false
								end
								local function checkifmodneeded(myveh,modstable)
									for k,v in pairs(modstable) do
										if GetVehicleMod(myveh,k)==v then
											return false
										end
									end
									return true
								end
								local cost=chopshop_getcost(myveh,chopshopwithupgrades[current_trade])
								local slot=get_inventory_item_slot(chopshopwithupgrades[current_trade].resource)
								if cost==0 or slot and cost<=inventory[slot].amount then
									if chopshopwithupgrades[current_trade].name=="repair" and (cost==0 or chopshop_pay(slot,cost)) then
										SetVehicleFixed(myveh)
									elseif chopshopwithupgrades[current_trade].name=="refill" and (cost==0 or chopshop_pay(slot,cost)) then
										DecorSetFloat(myveh,"zm_fuel",80.5-.5)
										SetVehicleFuelLevel(myveh,80.5-.5)
									elseif chopshopwithupgrades[current_trade].name=="rearm" and (cost==0 or chopshop_pay(slot,cost)) then
										local model=GetEntityModel(myveh)
										local myped=PlayerPedId()
										local using_vehicle_weapon,weapon=GetCurrentPedVehicleWeapon(myped)
										if using_vehicle_weapon and vehicles_ammo[model] and vehicles_ammo[model][weapon] then
											DecorSetInt(myveh,vehicles_ammo[model][weapon][1],vehicles_ammo[model][weapon][2])
										end
									else
										if chopshopwithupgrades[current_trade].mods and checkifmodneeded(myveh,chopshopwithupgrades[current_trade].mods) and (cost==0 or chopshop_pay(slot,cost)) then
											for k,v in pairs(chopshopwithupgrades[current_trade].mods) do
												SetVehicleMod(myveh,k,v,false)
											end
										end
									end
								end
								-- if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
								-- if current_menu<12 then
									-- local current=GetPedDrawableVariation(pped,current_menu)
									-- local texture=GetPedTextureVariation(pped,current_menu,current)
									-- local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
									-- if textures>0 then
										-- if texture<textures-1 then
											-- texture=texture+1
										-- else
											-- texture=0
										-- end
									-- end
									-- SetPedComponentVariation(pped,current_menu,current,texture,0)
								-- else
									-- local current=GetPedPropIndex(pped,current_menu-12)
									-- local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
									-- local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
									-- if textures>0 then
										-- if texture<textures-1 then
											-- texture=texture+1
										-- else
											-- texture=0
										-- end
									-- end
									-- ClearPedProp(pped,current_menu-12)
									-- SetPedPropIndex(pped,current_menu-12,current,texture,true)
								-- end
							end
							DrawSprite("lsm","Notebook",.35,.5,0.25,0.7,0.0, 255, 255, 255, 255)
							DrawSprite("lsm","trading_icon",0.296,0.1945,0.017,0.03,0.0, 255, 255, 255, 255)
							WriteTextNoOutline(2,"Chopshop",0.4,0,0,0,255,0.307,0.18)
							WriteTextNoOutline(2,"Service",0.3,0,0,0,255,0.290,0.24)
							WriteTextNoOutline(2,"Price",0.3,0,0,0,255,0.40,0.24)
							
							local inv_index_price=0
							local inv_index_goods=0
							local youhaveamount_price=0
							local youhaveamount_goods=0
							
							local trade_scroll_bkg_x=0.277
							local trade_scroll_bkg_y=0.54
							local trade_scroll_bkg_size_x=0.004
							local trade_scroll_bkg_size_y=0.55
							local trade_scroll_y=trade_scroll_bkg_y
							local trade_scrollsize_x=0.003
							local price_items_x=0.410
							local trade_button_x=0.445
							local trade_arrow_x=trade_button_x-0.06
							local maxtradesinmenu=7
							
							DrawRect(trade_scroll_bkg_x,trade_scroll_bkg_y,trade_scroll_bkg_size_x,trade_scroll_bkg_size_y,0,0,0,175)
							
							local totalscrolls=#chopshopwithupgrades-maxtradesinmenu
							if totalscrolls>0 then
								local newscrollsizey=trade_scroll_bkg_size_y/(totalscrolls+1)
								local uppos=trade_scroll_bkg_y-trade_scroll_bkg_size_y/2+newscrollsizey/2
								local lowpos=trade_scroll_bkg_y+trade_scroll_bkg_size_y/2-newscrollsizey/2
								local step=(lowpos-uppos)/totalscrolls
								local newscrollposy=uppos+(step*(scroll-1))
								-- if scroll==1 then
									-- newscrollposy=uppos
								-- elseif scroll==totalscrolls+1 then
									-- newscrollposy=lowpos
								-- end
								DrawRect(trade_scroll_bkg_x,newscrollposy,trade_scrollsize_x,newscrollsizey,255,255,255,255)
							end
							
							-- WriteHint("tradescroll="..scroll)
							-- WriteHint("totalscroll="..totalscrolls)
							
							for i=scroll,math.min(scroll+(maxtradesinmenu-1),#chopshopwithupgrades) do
								local y=(i-scroll)*.08+.3
									local hud_type
									local myped=PlayerPedId()
									local myveh=GetVehiclePedIsIn(myped)
									local myvehmodel
									local using_vehicle_weapon,weapon=GetCurrentPedVehicleWeapon(myped)
									if myveh then
										myvehmodel=GetEntityModel(myveh)
									end
									if using_vehicle_weapon and myvehmodel and weapon and vehicles_ammo[myvehmodel][weapon] then
										hud_type=vehicles_ammo[myvehmodel][weapon].pool
									end
									
									DrawSprite("lsm", chopshopwithupgrades[i].sprite or "bottle",0.305,y,(inv_new.item_scl_x)*0.875,(inv_new.item_scl_y)*0.875,0.0, 255, 255, 255, 255)
									-- if hud_type and chopshopwithupgrades[i].sprite=="rearm" then
										-- DrawSprite("lsm", "selected_item",0.305,y,(inv_new.item_scl_x)*0.875*0.5,(inv_new.item_scl_y)*0.875*0.5,0.0, 255, 255, 255, 255)
										-- DrawSprite("lsm", hud_type or "bottle",0.305,y,(inv_new.item_scl_x)*0.875*0.5,(inv_new.item_scl_y)*0.875*0.5,0.0, 255, 255, 255, 255)
									-- end
									SetTextWrap(0.325,trade_arrow_x-0.005)
									local name=chopshopwithupgrades[i].name
									if using_vehicle_weapon then
										name=name.." "..vehicles_ammo_names[vehicles_ammo[myvehmodel][weapon].pool]
									end
									WriteTextNoOutline(2,item_names[name] or localization[name] or name,0.3,0,0,0,255,0.325,y-0.01)
									SetTextCentre(true)
									--WriteTextNoOutline(2,{"x ~1~",chopshopwithupgrades[i][3]},0.25,0,0,0,255,0.305,y+0.02)
									
									DrawSprite("lsm", chopshopwithupgrades[i].resource or "bottle",price_items_x,y,(inv_new.item_scl_x)*0.875,(inv_new.item_scl_y)*0.875,0.0, 255, 255, 255, 255)
									SetTextCentre(true)
									local cost=chopshop_getcost(myveh,chopshopwithupgrades[i])
									WriteTextNoOutline(2,{"x ~1~",cost},0.25,0,0,0,255,price_items_x,y+0.02)
									DrawSprite("lsm", "Trade Button",trade_button_x,y,0.0255,0.0205,0.0, 255, 255, 255, 255)
									SetTextCentre(true)
									local color=255
									if current_trade==i then
										color=0
										DrawSprite("lsm", "Trade Selected",trade_button_x,y,0.0255,0.0205,0.0, 255, 255, 255, 255)
										DrawSprite("lsm", "arrow_left",trade_arrow_x,y,0.0075,0.015,0.0, 255, 255, 255, 255)
									end
									WriteTextNoOutline(2,messages.trade,0.25,color,color,color,255,trade_button_x,y-0.009)
							end
							
							-- local txt_pos=0.428+0.025
							-- for i=menu_start,menu_end do
								-- local variations=GetNumVehicleMods(myveh,i)
								-- if variations~=0 then
									-- local current=GetVehicleMod(myveh,i)
									-- local alpha=(variations>0) and 255 or 100
									-- if i==current_menu then
										-- DrawRect(0.25,0.012+txt_pos,0.2,0.025,255,255,255,255) --chosenline
										-- --local textures=GetNumberOfPedTextureVariations(pped,i,current)
										-- --local texture=GetPedTextureVariation(pped,i,current)
										-- WriteTextNoOutline(2,component_name[i],0.35,0,0,0,alpha,0.16,txt_pos) --chosen line text
										-- --if (variations~=0) then current=current+1 end
										-- --if (textures~=0) then texture=texture+1 end
										-- WriteTextNoOutline(4,"<",0.35,0,0,0,alpha,0.280,txt_pos) --chosen line text
										-- WriteTextNoOutline(4,{"~1~ / ~1~ >",current,variations},0.35,0,0,0,alpha,0.285,txt_pos) --chosen line text
										-- --WriteTextNoOutline(4,"E "..texture.." / "..textures,0.35,0,0,0,alpha,0.315,0.428+.025+i*.025) --chosen line text
									-- else
										-- WriteTextNoOutline(2,component_name[i],0.35,255,255,255,alpha,0.16,txt_pos) --not chosen line text
										-- --if (variations~=0) then current=current+1 end
										-- WriteTextNoOutline(4,{"~1~ / ~1~",current,variations},0.35,255,255,255,alpha,0.285,txt_pos) --not chosen line text
									-- end
									-- txt_pos=txt_pos+0.025
								-- end
							-- end
							
						end
					end
                end
                if zone~=nil and not zone.raided and zone.garages~=nil and (dist_to_closest_point(zone.garages,mypos)<25) then --25 is 5 squared, that's 5 meters
                    if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
						if player.faction==zone.relationship then
							local current_garage=zone.garages[closest_point(zone.garages,mypos)]
							try_to_load_garage(current_garage)
							if current_garage.vehiclesave~=nil and current_garage.vehiclesave.model~=nil then
								SimpleNotification("You already have ~g~~a~ ~s~in garage.",GetDisplayNameFromVehicleModel(current_garage.vehiclesave.model))
							else
								-- place in garage
								local flags=0
								local myped=PlayerPedId()
								local myveh=GetVehiclePedIsIn(myped)
								current_garage.vehiclesave={
								model=GetEntityModel(myveh),
								enginehp=GetVehicleEngineHealth(myveh),
								fuellevel=GetVehicleFuelLevel(myveh),
								}
								flags=0
								for i=0,7 do
									if IsVehicleDoorDamaged(myveh,i) then flags=flags|(1<<i) end
								end
								current_garage.vehiclesave.doors=flags
								current_garage.vehiclesave.colors={}
								current_garage.vehiclesave.colors[1],current_garage.vehiclesave.colors[2]=GetVehicleColours(myveh)
								current_garage.vehiclesave.colors[3],current_garage.vehiclesave.colors[4]=GetVehicleExtraColours(myveh)
								current_garage.vehiclesave.modkit=GetVehicleModKit(myveh)
								local mod
								current_garage.vehiclesave.mods={}
								current_garage.vehiclesave.total_mods=0
								for i=0,200 do
									mod=GetVehicleMod(myveh,i)
									if mod~=-1 then
										current_garage.vehiclesave.total_mods=current_garage.vehiclesave.total_mods+1
										current_garage.vehiclesave.mods[i]=mod
									else
										current_garage.vehiclesave.mods[i]=nil
									end
								end
								flags=0
								if IsVehicleTyreBurst(myveh, 0, false) then flags=flags|1 end
								if IsVehicleTyreBurst(myveh, 1, false) then flags=flags|2 end
								if IsVehicleTyreBurst(myveh, 2, false) then flags=flags|4 end
								if IsVehicleTyreBurst(myveh, 3, false) then flags=flags|8 end
								if IsVehicleTyreBurst(myveh, 4, false) then flags=flags|16 end
								if IsVehicleTyreBurst(myveh, 5, false) then flags=flags|32 end
								if IsVehicleTyreBurst(myveh, 6, false) then flags=flags|64 end
								if IsVehicleTyreBurst(myveh, 7, false) then flags=flags|128 end
								if IsVehicleTyreBurst(myveh, 45, false) then flags=flags|256 end
								if IsVehicleTyreBurst(myveh, 47, false) then flags=flags|512 end
								current_garage.vehiclesave.tyres=flags
								
								SimpleNotification(messages.vehiclename_saved_in_garage,GetDisplayNameFromVehicleModel(current_garage.vehiclesave.model))
								
								if DecorExistOn(myveh,"zm_health") then
									saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_ammo_1",DecorGetInt(myveh,"zm_health"))
								else
									saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_ammo_1")
								end
								if DecorExistOn(myveh,"zm_dying") then
									saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_ammo_2",DecorGetInt(myveh,"zm_dying"))
								else
									saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_ammo_2")
								end
								if DecorExistOn(myveh,"zm_armor") then
									saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_ammo_3",DecorGetInt(myveh,"zm_armor"))
								else
									saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_ammo_3")
								end
								if DecorExistOn(myveh,"zm_lastbone") then
									saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_ammo_4",DecorGetInt(myveh,"zm_lastbone"))
								else
									saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_ammo_4")
								end
								SetEntityAsMissionEntity(myveh)
								DeleteEntity(myveh)
								saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_model",current_garage.vehiclesave.model)
								saving_kvp_mode.SetResourceKvpFloat("garage_"..current_garage.name.."_enginehp",current_garage.vehiclesave.enginehp)
								saving_kvp_mode.SetResourceKvpFloat("garage_"..current_garage.name.."_fuel",current_garage.vehiclesave.fuellevel)
								saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_doors",current_garage.vehiclesave.doors)
								saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_tyres",current_garage.vehiclesave.tyres)
								local colors=current_garage.vehiclesave.colors[1]|(current_garage.vehiclesave.colors[2]<<8)|(current_garage.vehiclesave.colors[3]<<16)|(current_garage.vehiclesave.colors[4]<<24)
								saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_colors",colors)
								saving_kvp_mode.SetResourceKvpInt("garage_"..current_garage.name.."_total_mods",current_garage.vehiclesave.total_mods)
								-- local mod_index=0
								-- for k,v in pairs(zone.vehiclesave.mods) then
									-- mod_index=mod_index+1
									-- SetResourceKvpInt("garage_1_mod_"..mod_index,(v|(v<<16)))
								-- end
								
								local modstring=""
								for k,v in pairs(current_garage.vehiclesave.mods) do
									modstring=modstring..string.char(k+1,v+1)
								end
								--SimpleNotification("saving "..#modstring)
								saving_kvp_mode.SetResourceKvp("garage_"..current_garage.name.."_modstring",modstring)
							end
						else
							SimpleNotification(messages.you_have_to_be_in_this_faction_to_use_garage)
						end
                    else
                        SimpleNotification(messages.you_cannot_use_enemy_garages)
                    end
                end
            elseif zone~=nil and not zone.raided and zone.garages~=nil and (dist_to_closest_point(zone.garages,mypos)<25) then --25 is 5 squared. means 5 meters
                -- load car from garage
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
					if player.faction==zone.relationship then
						local current_garage=zone.garages[closest_point(zone.garages,mypos)]
						try_to_load_garage(current_garage)
						if current_garage.vehiclesave~=nil and current_garage.vehiclesave.model~=nil then
							local vs=current_garage.vehiclesave
							local flags=0
							local myped=PlayerPedId()
							local mypos=GetEntityCoords(myped)
							local myheading=GetEntityHeading(myped)
							if vs.model then
								RequestModel(vs.model)
								while not HasModelLoaded(vs.model) do
									Wait(0)
									if not disablehud then
										WriteText(2,"Loading vehicle",1.0,255,255,255,255,0.5,0.5)
									end
								end
								local myveh=CreateVehicle(vs.model, mypos.x, mypos.y, mypos.z, current_garage.angle, true, false)
								if myveh~=0 then
									DecorSetBool(myveh,"zm_looted",true)                
									--DecorSetBool(myveh,"post_apoc_car",true)
									SetEntityMaxHealth(myveh,1020)
									DecorSetFloat(myveh,"zm_fuel",vs.fuellevel)
									SetPedIntoVehicle(myped,myveh,-1)
									
									SetVehicleEngineHealth(myveh,vs.enginehp)
									SetVehicleFuelLevel(myveh,vs.fuellevel)
									
									flags=vs.doors
									for i=0,7 do
										local bin=(1<<i)
										if (flags&bin)~=0 then SetVehicleDoorBroken(myveh,i,true) end
									end
									
									SetVehicleColours(myveh,vs.colors[1],vs.colors[2])
									SetVehicleExtraColours(myveh,vs.colors[3],vs.colors[4])
									SetVehicleModKit(myveh,0)--vs.modkit)
									local mod
									for i=0,200 do
										mod=vs.mods[i]
										if mod~=nil then
											SetVehicleMod(myveh,i,math.tointeger(mod),false)
										else
											SetVehicleMod(myveh,i,-1,false)
										end
									end
									flags=vs.tyres
									if (flags&1)~=0 then SetVehicleTyreBurst(myveh, 0, false, 1000.1-.1) end
									if (flags&2)~=0 then SetVehicleTyreBurst(myveh, 1, false, 1000.1-.1) end
									if (flags&4)~=0 then SetVehicleTyreBurst(myveh, 2, false, 1000.1-.1) end
									if (flags&8)~=0 then SetVehicleTyreBurst(myveh, 3, false, 1000.1-.1) end
									if (flags&16)~=0 then SetVehicleTyreBurst(myveh, 4, false, 1000.1-.1) end
									if (flags&32)~=0 then SetVehicleTyreBurst(myveh, 5, false, 1000.1-.1) end
									if (flags&64)~=0 then SetVehicleTyreBurst(myveh, 6, false, 1000.1-.1) end
									if (flags&128)~=0 then SetVehicleTyreBurst(myveh, 7, false, 1000.1-.1) end
									if (flags&256)~=0 then SetVehicleTyreBurst(myveh, 45, false, 1000.1-.1) end
									if (flags&512)~=0 then SetVehicleTyreBurst(myveh, 47, false, 1000.1-.1) end
									local ammo_1=GetResourceKvpInt("garage_"..current_garage.name.."_ammo_1")
									local ammo_2=GetResourceKvpInt("garage_"..current_garage.name.."_ammo_2")
									local ammo_3=GetResourceKvpInt("garage_"..current_garage.name.."_ammo_3")
									local ammo_4=GetResourceKvpInt("garage_"..current_garage.name.."_ammo_4")
									if ammo_1~=nil and ammo_1~=0 then
										DecorSetInt(myveh,"zm_health",ammo_1)
										saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_ammo_1")
									end
									if ammo_2~=nil and ammo_2~=0 then
										DecorSetInt(myveh,"zm_dying",ammo_2)
										saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_ammo_2")
									end
									if ammo_3~=nil and ammo_3~=0 then
										DecorSetInt(myveh,"zm_armor",ammo_3)
										saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_ammo_3")
									end
									if ammo_4~=nil and ammo_4~=0 then
										DecorSetInt(myveh,"zm_lastbone",ammo_4)
										saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_ammo_4")
									end
									SimpleNotification(messages.you_took_vehiclename_from_garage,GetDisplayNameFromVehicleModel(vs.model))
									current_garage.vehiclesave=nil
									saving_kvp_mode.DeleteResourceKvp("garage_"..current_garage.name.."_model")
								else
									SimpleNotification("Can't spawn vehicle, try again.")
								end
							else
								SimpleNotification(messages.dont_have_anything_in_your_garage)
							end
						else
							SimpleNotification(messages.dont_have_anything_in_your_garage)
						end
					else
						SimpleNotification(messages.you_have_to_be_in_this_faction_to_use_garage)
					end
                else
                    SimpleNotification(messages.you_cannot_use_enemy_garages)
                end
            elseif zone~=nil and not zone.raided and zone.vehpos~=nil and in_radius(mypos,zone.vehpos,5) and zone.vehshop then
				if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
                    --buy car
                    local current_menu=0
					local current_trade=1
                    local scroll=1
					TriggerServerEvent("request_vehshop_table",zone.tradelistname)
                    while true do Wait(0)
                        inventory.highlight=0
                        pped=PlayerPedId()
                        mypos=GetEntityCoords(pped)
                        if IsControlJustPressed(0,177) or not in_radius(mypos,zone.vehpos,5) or IsPedInAnyVehicle(pped) then
                            break
                        elseif IsControlJustPressed(0,173) then --down
                            if current_trade<#zone.vehshop then
                                current_trade=current_trade+1
                            else
                                current_trade=1
                            end
                        elseif IsControlJustPressed(0,172) then --up
                            if current_trade>1 then
                                current_trade=current_trade-1
                            else
                                current_trade=#zone.vehshop
                            end
                        elseif IsControlJustPressed(0,175) then --right
                        elseif IsControlJustPressed(0,174) then --left
                        elseif IsControlJustPressed(0,86) then --e veh horn
							local function vehshop_chechprice(slot,cost)
								if cost==0 then return true end
								if slot and inventory[slot] and inventory[slot].amount>=cost then
									return true
								end
								return false
							end
							local function vehshop_pay(slot,cost)
								if cost==0 then return true end
								if slot and inventory[slot] and inventory[slot].amount>=cost then
									inventory[slot].amount=inventory[slot].amount-cost
									inventory.current=slot
									check_inv_slot_for_zero_amount()
									return true
								end
								return false
							end
							if zone.vehshop and zone.vehshop[current_trade] then
								local cost=zone.vehshop[current_trade][3]
								local slot=get_inventory_item_slot(zone.vehshop[current_trade][2])
								if vehshop_chechprice(slot,cost) then
									local model=GetHashKey(zone.vehshop[current_trade][1])
									if (not IsModelValid(model)) or (not IsModelAVehicle(model)) then --or not IsVehicleModel(model) then
										SimpleNotification("invalid vehicle ~a~",zone.vehshop[current_trade][1])
									end
									RequestModel(model)
									if not HasModelLoaded(model) then
										SimpleNotification("Loading model, try again.")
									elseif vehshop_chechprice(slot,cost) then
										local veh=CreateVehicle(model,zone.vehpos.x,zone.vehpos.y,zone.vehpos.z,zone.vehpos.angle,true,false)
										if veh~=nil and veh~=0 then
											vehshop_pay(slot,cost)
											DecorSetBool(veh,"zm_looted",true)
											--DecorSetBool(veh,"post_apoc_car",true)
											SetEntityMaxHealth(veh,1020)
											DecorSetFloat(veh,"zm_fuel",20.0)
											SetPedIntoVehicle(pped,veh,-1)
											SetVehicleAsNoLongerNeeded(veh)
											SetModelAsNoLongerNeeded(model)
											if zone.vehshop[current_trade].mods then
												--print("max="..#(zone.vehshop[current_trade].mods))
												for k,v in pairs(zone.vehshop[current_trade].mods) do
													if type(v)=="table" then
														local rnd=math.random(1,#v)
														SetVehicleMod(veh,k,v[rnd])
													else
														SetVehicleMod(veh,k,v)
													end
												end
											end
											Wait(0)
											break
										end
									else
										SetModelAsNoLongerNeeded(model)
									end
								end
							end
                        end
                        DrawSprite("lsm","Notebook",.35,.5,0.25,0.7,0.0, 255, 255, 255, 255)
                        DrawSprite("lsm","trading_icon",0.296,0.1945,0.017,0.03,0.0, 255, 255, 255, 255)
                        WriteTextNoOutline(2,"Chopshop",0.4,0,0,0,255,0.307,0.18)
						local hours=math.floor(time_to_update_shops/120)
						local minutes=math.floor((time_to_update_shops-hours*120)/2)
						if hours<10 then hours="0"..hours end
						if minutes<10 then minutes="0"..minutes end
                        WriteTextNoOutline(4,{messages.new_shipment_in_strH_strM,tostring(hours),tostring(minutes)},0.3,0,0,0,255,0.307,0.20)
                        WriteTextNoOutline(2,"Service",0.3,0,0,0,255,0.290,0.24)
                        WriteTextNoOutline(2,"Price",0.3,0,0,0,255,0.40,0.24)
						
						local inv_index_price=0
						local inv_index_goods=0
						local youhaveamount_price=0
						local youhaveamount_goods=0
						local maxtradesinmenu=7
						
						local trade_scroll_bkg_x=0.277
						local trade_scroll_bkg_y=0.54
						local trade_scroll_bkg_size_x=0.004
						local trade_scroll_bkg_size_y=0.55
						local trade_scroll_y=trade_scroll_bkg_y
						local trade_scrollsize_x=0.003
						local price_items_x=0.410
						local trade_button_x=0.445
						local trade_arrow_x=trade_button_x-0.06
						local maxtradesinmenu=7
						
						DrawRect(trade_scroll_bkg_x,trade_scroll_bkg_y,trade_scroll_bkg_size_x,trade_scroll_bkg_size_y,0,0,0,175)
						
						local totalscrolls=#zone.vehshop-maxtradesinmenu
						if totalscrolls>0 then
							local newscrollsizey=trade_scroll_bkg_size_y/(totalscrolls+1)
							local uppos=trade_scroll_bkg_y-trade_scroll_bkg_size_y/2+newscrollsizey/2
							local lowpos=trade_scroll_bkg_y+trade_scroll_bkg_size_y/2-newscrollsizey/2
							local step=(lowpos-uppos)/totalscrolls
							local newscrollposy=uppos+(step*(scroll-1))
							DrawRect(trade_scroll_bkg_x,newscrollposy,trade_scrollsize_x,newscrollsizey,255,255,255,255)
						end
						
						for i=scroll,math.min(scroll+(maxtradesinmenu-1),#zone.vehshop) do
							local y=(i-scroll)*.08+.3
								DrawSprite("lsm", zone.vehshop[i][1] or "bottle",0.305,y,(inv_new.item_scl_x)*0.875,(inv_new.item_scl_y)*0.875,0.0, 255, 255, 255, 255)
								SetTextWrap(0.325,trade_arrow_x-0.005)
								local name=zone.vehshop[i][1]
								WriteTextNoOutline(2,item_names[name] or localization[name] or name,0.3,0,0,0,255,0.325,y-0.01)
								SetTextCentre(true)
								
								DrawSprite("lsm", zone.vehshop[i][2] or "bottle",price_items_x,y,(inv_new.item_scl_x)*0.875,(inv_new.item_scl_y)*0.875,0.0, 255, 255, 255, 255)
								SetTextCentre(true)
								local cost=zone.vehshop[i][3]
								WriteTextNoOutline(2,{"x ~1~",cost},0.25,0,0,0,255,price_items_x,y+0.02)
								DrawSprite("lsm", "Trade Button",trade_button_x,y,0.0255,0.0205,0.0, 255, 255, 255, 255)
								SetTextCentre(true)
								local color=255
								if current_trade==i then
									color=0
									DrawSprite("lsm", "Trade Selected",trade_button_x,y,0.0255,0.0205,0.0, 255, 255, 255, 255)
									DrawSprite("lsm", "arrow_left",trade_arrow_x,y,0.0075,0.015,0.0, 255, 255, 255, 255)
								end
								WriteTextNoOutline(2,"Trade",0.25,color,color,color,255,trade_button_x,y-0.009)
						end
                    end
                -- --buy car
                -- local current_trade=1
                -- while true do Wait(0)
                    -- inventory.highlight=0
                    -- pped=PlayerPedId()
                    -- mypos=GetEntityCoords(pped)
                    -- if IsControlJustPressed(0,177) or not in_radius(mypos,zone.vehpos,5) then
                        -- break
                    -- elseif IsControlJustPressed(0,173) then --right
                        -- if current_trade<#zone.vehshop then
                            -- current_trade=current_trade+1
                        -- else
                            -- current_trade=1
                        -- end
                    -- elseif IsControlJustPressed(0,172) then --left
                        -- if current_trade>1 then
                            -- current_trade=current_trade-1
                        -- else
                            -- current_trade=#zone.vehshop
                        -- end
                    -- elseif IsControlJustPressed(0,86) then --e veh horn
                        -- local enough=do_we_have_all_that(zone.vehshop[current_trade].requirements)
                        -- if enough then
                            -- local model=GetHashKey(zone.vehshop[current_trade].vehname)
                            -- if not HasModelLoaded(model) then
                                -- RequestModel(model)
                                -- Wait(0)
                                -- while not HasModelLoaded(model) do Wait(0) end
                                -- enough=do_we_have_all_that(zone.vehshop[current_trade].requirements)
                            -- end
                            -- if enough then
                                -- remove_all_that(zone.vehshop[current_trade].requirements)
                                -- local veh=CreateVehicle(model,zone.vehpos.x,zone.vehpos.y,zone.vehpos.z,zone.vehpos.angle,true,false)
                                -- DecorSetBool(veh,"zm_looted",true)
                                -- --DecorSetBool(veh,"post_apoc_car",true)
								-- SetEntityMaxHealth(veh,1020)
                                -- DecorSetFloat(veh,"zm_fuel",20.0)
                                -- SetPedIntoVehicle(pped,veh,-1)
                                -- SetVehicleAsNoLongerNeeded(veh)
                                -- SetModelAsNoLongerNeeded(model)
                                -- if zone.vehshop[current_trade].mods then
                                    -- print("max="..#(zone.vehshop[current_trade].mods))
                                    -- for k,v in pairs(zone.vehshop[current_trade].mods) do
                                        -- SetVehicleMod(veh,k,v)
                                    -- end
                                -- end
                                -- Wait(0)
                                -- break
                            -- else
                                -- SetModelAsNoLongerNeeded(model)
                            -- end
                        -- end
                    -- end
                    -- DrawRect(0.25,0.65,0.2,0.6,0,0,0,175)
                    -- DrawRect(0.25,0.40,0.2,0.1,0,150,200,255) --blue header
                    -- SetTextCentre(true)
                    -- WriteText(7,"Vehicle shop",1.0,255,255,255,255,0.25,0.375)
                    -- DrawRect(0.25,0.44+current_trade*.025,0.2,0.025,255,255,255,255) --chosenline
                    -- for i=1,#zone.vehshop do
                        -- if i==current_trade then
                            -- WriteTextNoOutline(2,zone.vehshop[i].vehname,0.35,0,0,0,255,0.16,0.428+i*.025) --chosen line text
                        -- else
                            -- WriteTextNoOutline(2,zone.vehshop[i].vehname,0.35,255,255,255,255,0.16,0.428+i*.025) --not chosen line text
                        -- end
                    -- end
                    -- local item,have,need
                    -- for i=1,#zone.vehshop[current_trade].requirements,2 do
                        -- item=zone.vehshop[current_trade].requirements[i]
                        -- have=get_inventroy_item_amount(item)
                        -- need=zone.vehshop[current_trade].requirements[i+1]
                        -- DrawSprite("lsm",item,.39,.435+i*.05,inv_big_x,inv_big_y,0.0, 255, 255, 255, 255)
                        -- if have<need then
                            -- WriteText(2,{"~a~\n~1~ of ~1~",item,have,need},0.35,255,0,0,255,.42,.428+i*.05)
                        -- else
                            -- WriteText(2,{"~a~\n~1~ of ~1~",item,have,need},0.35,0,255,0,255,.42,.428+i*.05)
                        -- end
                    -- end
                -- end
				end
            elseif zone~=nil and not zone.raided and zone.provisionpos~=nil and in_radius(mypos,zone.provisionpos,1) then
                --provision
                local one_day
                if current_date-lastprovisiontime>720 then
                    local can_fit_all=can_fit_all_into_inventory(zone.provision)
                    if can_fit_all then
                        for i=1,#zone.provision do
                            give_item_to_inventory(zone.provision[i],zone.provision[i+1])
                        end
                        lastprovisiontime=current_date
                        SetResourceKvpInt("provisiontaken",lastprovisiontime)
                    else
                        local can_fit_something=false
                        for i=1,#zone.provision do
                            if can_fit_into_inventory(zone.provision[i],zone.provision[i+1]) then
                                can_fit_something=true
                                break
                            end
                        end
                        if can_fit_something then
                            while true do Wait(0)
                                SetTextCentre(true)
                                WriteText(7,"You can't take everything, would you like to take what you can?",0.4,255,255,255,255,.5,0.5)
                                WriteText(7,"~g~E ~c~yes\n~g~backspace ~c~or ~g~esc ~c~no",0.4,255,255,255,255,.35,0.55)
                                if IsControlJustPressed(0,86) then
                                    for i=1,#zone.provision do
                                        give_item_to_inventory(zone.provision[i],zone.provision[i+1])
                                    end
                                    lastprovisiontime=current_date
                                    SetResourceKvpInt("provisiontaken",lastprovisiontime)
                                    break;
                                elseif IsControlJustPressed(0,177) then
                                    break;
                                end
                            end
                        else
                            SimpleNotification(messages.inventory_full_cant_take_anything)
                        end
                    end
                else
                    SimpleNotification("You can not receive new free provision yet.")
                end
            elseif zone~=nil and not zone.raided
			    and ((zone.tradepos~=nil and in_radius(mypos,zone.tradepos,3)) or (zone.sellpos~=nil and in_radius(mypos,zone.sellpos,3)))
			then
                --trade
				local current_trading
				local selling_or_buying
				local relationship_req=4
				
				TriggerServerEvent("request_trade_table",zone.tradelistname)
				
				if zone.tradepos~=nil and zone.sellpos~=nil then
					local dxs,dys=mypos.x-zone.sellpos.x,mypos.y-zone.sellpos.y
					local dxt,dyt=mypos.x-zone.tradepos.x,mypos.y-zone.tradepos.y
					if dxt*dxt+dyt*dyt<dxs*dxs+dys*dys then 
						current_trading=zone.trade or {}
						relationship_req=0
						sellingorbuying="buying"
						--SimpleNotification("BUY POS #index ~1~"..#current_trading)
						
					else
						current_trading=zone.selltrade or {} 
						relationship_req=4
						sellingorbuying="selling"
						--SimpleNotification("SELL POS #index ~1~"..#current_trading)
					end
				elseif zone.tradepos~=nil then
						current_trading=zone.trade or {}
						sellingorbuying="buying"
						relationship_req=0
				else
						current_trading=zone.selltrade or {} 
						sellingorbuying="selling"
						relationship_req=4
				end
				
				
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=relationship_req) then
                    --print("trade open")
                    inventory.highlight=255
                    local current_trade=1
                    local scroll=1
                    while true do Wait(0)
                        local inv_index_price=0
                        local inv_index_goods=0
                        local youhaveamount_price=0
                        local youhaveamount_goods=0
                        local maxtradesinmenu=7
                        
                        local trade_scroll_bkg_x=0.277
                        local trade_scroll_bkg_y=0.54
                        local trade_scroll_bkg_size_x=0.004
                        local trade_scroll_bkg_size_y=0.55
                        local trade_scroll_y=trade_scroll_bkg_y
                        local trade_scrollsize_x=0.003
                        if current_trading and current_trading[current_trade] then
							for j=1,inventory.total do
								if inventory[j].item==current_trading[current_trade][3] then
									youhaveamount_price=inventory[j].amount
									inv_index_price=j
								elseif inventory[j].item==current_trading[current_trade][1] then
									youhaveamount_goods=inventory[j].amount
									inv_index_goods=j
								end
							end
						else
							current_trade=#current_trading
						end
                        mypos=GetEntityCoords(PlayerPedId())
                        if IsControlJustPressed(0,177) or (not in_radius(mypos,zone.tradepos,3) and (not in_radius(mypos,zone.sellpos,3))) then
                            break
                        elseif IsControlJustPressed(0,173) then --down
                            if current_trade<#current_trading then
                                current_trade=current_trade+1
                                if (current_trade-scroll)>=maxtradesinmenu then
                                    scroll=scroll+1
                                end
                            else
                                current_trade=1
                                scroll=1
                            end
                        elseif IsControlJustPressed(0,172) then --up
                            if current_trade>1 then
                                current_trade=current_trade-1
                                if (current_trade<scroll) then
                                    scroll=scroll-1
                                end
                            else
                                current_trade=#current_trading
                                scroll=current_trade-maxtradesinmenu+1
								if scroll<1 then scroll=1 end
                            end
                        elseif IsControlJustPressed(0,86) and current_trading and current_trading[current_trade] then --e veh horn
                            --print(current_trading[current_trade][4].." you have:"..youhaveamount_price)
                            if current_trading[current_trade][4]<youhaveamount_price then
                                if give_item_to_inventory(current_trading[current_trade][1],current_trading[current_trade][2]) then
                                    inventory[inv_index_price].amount=youhaveamount_price-current_trading[current_trade][4]
                                    inventory.current=inv_index_price --important for check_inv_slot_for_zero_amount()
                                    check_inv_slot_for_zero_amount() --to save
                                    inventory.highlight=255
                                    --SimpleNotification("Bought ~g~"..current_trading[current_trade][1].."~s~.")
                                end
                            elseif current_trading[current_trade][4]==youhaveamount_price then
                                inventory[inv_index_price].amount=0
                                inventory.current=inv_index_price --important for check_inv_slot_for_zero_amount()
                                check_inv_slot_for_zero_amount()
                                give_item_to_inventory(current_trading[current_trade][1],current_trading[current_trade][2])
                                inventory.highlight=255
                            else
                                SimpleNotification(messages.not_enough_itemname,item_names[current_trading[current_trade][3]] or current_trading[current_trade][3])
                            end
                        end
                        DrawSprite("lsm","Notebook",.35,.5,0.25,0.7,0.0, 255, 255, 255, 255)
                        DrawSprite("lsm","trading_icon",0.296,0.1945,0.017,0.03,0.0, 255, 255, 255, 255)
                        WriteTextNoOutline(2,"Trading post",0.4,0,0,0,255,0.307,0.18)
						local hours=math.floor(time_to_update_shops/120)
						local minutes=math.floor((time_to_update_shops-hours*120)/2)
						if hours<10 then hours="0"..hours end
						if minutes<10 then minutes="0"..minutes end
                        WriteTextNoOutline(4,{messages.new_shipment_in_strH_strM,tostring(hours),tostring(minutes)},0.3,0,0,0,255,0.307,0.20)
                        WriteTextNoOutline(2,"Item",0.3,0,0,0,255,0.290,0.24)
                        WriteTextNoOutline(2,"Price",0.3,0,0,0,255,0.40,0.24)
                        
                        local price_items_x=0.410
                        local trade_button_x=0.445
                        local trade_arrow_x=trade_button_x-0.06
                        
                        DrawRect(trade_scroll_bkg_x,trade_scroll_bkg_y,trade_scroll_bkg_size_x,trade_scroll_bkg_size_y,0,0,0,175)
                        
                        local totalscrolls=#current_trading-maxtradesinmenu
                        if totalscrolls>0 then
                            local newscrollsizey=trade_scroll_bkg_size_y/(totalscrolls+1)
                            local uppos=trade_scroll_bkg_y-trade_scroll_bkg_size_y/2+newscrollsizey/2
                            local lowpos=trade_scroll_bkg_y+trade_scroll_bkg_size_y/2-newscrollsizey/2
                            local step=(lowpos-uppos)/totalscrolls
                            local newscrollposy=uppos+(step*(scroll-1))
                            -- if scroll==1 then
                                -- newscrollposy=uppos
                            -- elseif scroll==totalscrolls+1 then
                                -- newscrollposy=lowpos
                            -- end
                            DrawRect(trade_scroll_bkg_x,newscrollposy,trade_scrollsize_x,newscrollsizey,255,255,255,255)
                        end
                        
                        -- WriteHint("tradescroll="..scroll)
                        -- WriteHint("totalscroll="..totalscrolls)
                        
                        for i=scroll,math.min(scroll+(maxtradesinmenu-1),#current_trading) do
                            local y=(i-scroll)*.08+.3
															
								local name=current_trading[i][1]
								local amount_on_left=2
								local amount_on_right=4
								local sprite_on_left=1
								local sprite_on_right=3
								
								if sellingorbuying=="selling" then 
									name=current_trading[i][3] 
									amount_on_left=4
									amount_on_right=2
									sprite_on_left=3
									sprite_on_right=1
								end
								
                                DrawSprite("lsm", current_trading[i][sprite_on_left],0.305,y,(inv_new.item_scl_x)*0.875,(inv_new.item_scl_y)*0.875,0.0, 255, 255, 255, 255)
                                SetTextWrap(0.325,trade_arrow_x-0.005)
                                
                                WriteTextNoOutline(4,item_names[name] or localization[name] or name,0.3,0,0,0,255,0.325,y-0.01)
                                SetTextCentre(true)
                                WriteTextNoOutline(2,{"x ~1~",current_trading[i][amount_on_left]},0.25,0,0,0,255,0.305,y+0.02)
                                
                                DrawSprite("lsm", current_trading[i][sprite_on_right],price_items_x,y,(inv_new.item_scl_x)*0.875,(inv_new.item_scl_y)*0.875,0.0, 255, 255, 255, 255)
                                SetTextCentre(true)
                                WriteTextNoOutline(2,{"x ~1~",current_trading[i][amount_on_right]},0.25,0,0,0,255,price_items_x,y+0.02)
                                DrawSprite("lsm", "Trade Button",trade_button_x,y,0.0255,0.0205,0.0, 255, 255, 255, 255)
                                SetTextCentre(true)
                                local color=255
                                if current_trade==i then
                                    color=0
                                    DrawSprite("lsm", "Trade Selected",trade_button_x,y,0.0255,0.0205,0.0, 255, 255, 255, 255)
									local arrowtype="arrow_left"
									if sellingorbuying=="selling" then arrowtype="arrow_right" end
                                    DrawSprite("lsm", arrowtype,trade_arrow_x,y,0.0075,0.015,0.0, 255, 255, 255, 255)
                                end
								local textonbutton="Trade"
								if current_trading[i][1]=="cash" then
									textonbutton="Sell"
								elseif current_trading[i][3]=="cash" then
									textonbutton="Buy"
								end
								local alpha=80
								local itemslot=get_inventory_item_slot(current_trading[i][3])
								if itemslot and inventory[itemslot].amount>=current_trading[i][4] then alpha=255 end
                                WriteTextNoOutline(2,textonbutton,0.25,color,color,color,alpha,trade_button_x,y-0.009)
                        end
                    end
                elseif GetRelationshipBetweenGroups(myfaction,zone.relationship)~=5 then
                    SimpleNotification(messages.need_to_be_in_this_faction_to_trade)
                else--if GetRelationshipBetweenGroups(myfaction,zone.relationship)==5 then
                    --zone.raided=true
                    --TriggerServerEvent("zoneraided",zone.tradepos.x,zone.tradepos.y,zone.tradepos.z,zone.name,current_trading,zone.relationship)
                    SimpleNotification(messages.need_to_be_in_this_faction_to_trade)
                    
                    Wait(300)
                end
            elseif zone~=nil and not zone.raided and zone.ransack~=nil and in_radius(mypos,zone.ransack,1) then 
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
                    SimpleNotification(messages.become_enemy_to_raid_base_warehouse)
                else
                    SimpleNotification(messages.you_started_safezone_raid)
                    TriggerServerEvent("zoneraided",zone.ransack.x,zone.ransack.y,zone.ransack.z,zone.name,zone.ransack_list,zone.relationship)
                    Wait(300)
                end
            elseif zone~=nil and not zone.raided and zone.join_faction~=nil and in_radius(mypos,zone.join_faction,1) then 
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
                    local myped=PlayerPedId()
                    local mypos=GetEntityCoords(myped)
                    local myfaction=GetPedRelationshipGroupHash(myped)
                    local openjoinmenu=false
                    local questid=math.random(1,#zone.quests)
                    openjoinmenu=in_radius(mypos,zone.join_faction,1)
                    while openjoinmenu do Wait(0)
                        mypos=GetEntityCoords(myped)
                        openjoinmenu=in_radius(mypos,zone.join_faction,1)
                        DrawRect(0.5,0.5,0.5,0.6,0,0,0,175)
                        SetTextCentre(true)
                        
                        if zone.join_faction.rep_moreorless=="more" then
                            if player.reputation>=zone.join_faction.rep_amount then
                                if zone.quests[questid] then
                                    if myfaction==zone.relationship then
                                        WriteText(4,zone.quests[questid].questname,0.55,255,255,255,255,0.5,0.225)
                                    else
                                        WriteText(4,zone.quests.join_name,0.55,255,255,255,255,0.5,0.225)
                                    end
                                    SetTextWrap(0.27,0.73)  
                                    if myfaction==zone.relationship then
                                        WriteText(4,{"~a~~a~",zone.quests.novice,zone.quests[questid].text},0.4,255,255,255,255,0.27,0.35)
                                    else
                                        WriteText(4,{"~a~~a~",zone.quests.join_text,zone.quests[questid].text},0.4,255,255,255,255,0.27,0.35)
                                    end
                                    WriteText(4,"Required items:",0.4,255,255,255,255,0.27,0.6)
                                    SetTextWrap(0.27,0.73)  
                                    SetTextRightJustify(true)
                                    WriteText(4,"Reward:",0.4,255,255,255,255,0.73,0.6)
                                    for i=1,#zone.quests[questid].items_reward,2 do
                                        SetTextWrap(0.27,0.73)  
                                        SetTextRightJustify(true)
                                        WriteText(2,{"~g~~a~ ~s~x~1~",zone.quests[questid].items_reward[i],zone.quests[questid].items_reward[i+1]},0.3,255,255,255,255,0.73,0.62+(i*0.01))
                                    end
                                    if do_we_have_all_that(zone.quests[questid].items_required) then
                                        WriteText(4,messages.press_e_to_give_required_items,0.4,255,255,255,255,0.27,0.8)
                                        if IsControlJustPressed(0,86) then
                                            remove_all_that(zone.quests[questid].items_required)
                                            Wait(0)
                                            SimpleNotification(messages.you_finished_quest)
                                            player.reputation=player.reputation+zone.quests[questid].rep_bonus
                                            SetResourceKvpInt("reputation",player.reputation)
                                            SimpleNotification("Reputation ~g~+~1~",zone.quests[questid].rep_bonus)
                                            if can_fit_all_into_inventory(zone.quests[questid].items_reward) then
                                                give_all_to_inventory(zone.quests[questid].items_reward)
                                            end
                                            if myfaction~=zone.relationship then
                                                SetPedRelationshipGroupHash(myped,zone.relationship)
                                                myfaction=GetPedRelationshipGroupHash(myped)
                                                SimpleNotification(messages.you_joined_factionname,relationship_names[zone.relationship])
                                            end
                                            questid=math.random(1,#zone.quests)
                                        end
                                    else
                                        WriteText(4,messages.you_dont_have_required_items,0.4,255,255,255,255,0.27,0.8)
                                    end
                                    for i=1,#zone.quests[questid].items_required,2 do
                                        local item
                                        item=zone.quests[questid].items_required[i]
                                        if HasStreamedTextureDictLoaded("lsm") then
                                            DrawSprite("lsm",item,.27+i*0.04,.7,inv_big_x,inv_big_y,0.0, 255, 255, 255, 255)
                                            SetTextCentre(true)
                                            local color=125
                                            if get_inventroy_item_amount(item)>=zone.quests[questid].items_required[i+1] then
                                                color=255
                                            end
                                            WriteText(4,{"~a~ x~1~",item_names[item],zone.quests[questid].items_required[i+1]},0.4,color,color,color,255,.27+i*0.04,.75)
                                        else
                                            RequestStreamedTextureDict("lsm")
                                        end
                                    end
                                else
                                    SetTextWrap(0.27,0.73)  
                                    WriteText(4,zone.quests.textnoquest,0.4,255,255,255,255,0.27,0.35)
                                end
                            else
                                SetTextWrap(0.27,0.73)  
                                WriteText(4,{messages.you_need_number_more_reputation,zone.join_faction.rep_amount-player.reputation},0.4,255,255,255,255,0.35,0.35)
                            end
                        elseif zone.join_faction.rep_moreorless=="less" then
                        
                        end
                    end
                end
            elseif zone~=nil and not zone.raided and zone.changingroompos~=nil and in_radius(mypos,zone.changingroompos,1) then 
                -- changing clothes 
                local current_menu=0
                local total_menu_count=15
                local component_name={
                [0]="Head",
                    "Mask",
                    "Hair",
                    "Hands",
                    "Legs",
                    "Parachute",
                    "Foot",
                    "Additional",
                    "Accessories1",
                    "Accessories2",
                    "Decals",
                    "Additional parts for torso",
                    "Helmets",
                    "Glasses",
                    "Ear accessories",
                    "Additional props",
                }
                while true do Wait(0)
                    inventory.highlight=0
                    pped=PlayerPedId()
                    mypos=GetEntityCoords(pped)
                    if IsControlJustPressed(0,177) or not in_radius(mypos,zone.changingroompos,5) then
                        break
                    elseif IsControlJustPressed(0,173) then --down
                        if current_menu<total_menu_count then
                            current_menu=current_menu+1
                        else
                            current_menu=0
                        end
                    elseif IsControlJustPressed(0,172) then --up
                        if current_menu>0 then
                            current_menu=current_menu-1
                        else
                            current_menu=total_menu_count
                        end
                    elseif IsControlJustPressed(0,175) then --right
                        if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
                        if current_menu<12 then
                            local current=GetPedDrawableVariation(pped,current_menu)
                            local total=GetNumberOfPedDrawableVariations(pped,current_menu)-1
                            if current<total then
                                current=current+1
                            else
                                if current_menu>=8 then
                                    current=-1
                                else
                                    current=0
                                end
                            end
                            --print("set "..current)
                            --local texture=GetPedTextureVariation(pped,current_menu,current)
                            local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
                            if textures>0 then textures=math.random(0,textures-1) end
                            SetPedComponentVariation(pped,current_menu,current,textures,0)
                        else
                            local current=GetPedPropIndex(pped,current_menu-12)
                            --print("current "..current)
                            local total=GetNumberOfPedPropDrawableVariations(pped,current_menu-12)-1
                            if current<total then
                                current=current+1
                            else
                                current=-1
                            end
                            --print("set "..current)
                            --local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
                            local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
                            if textures>0 then textures=math.random(0,textures-1) end
                            ClearPedProp(pped,current_menu-12)
                            SetPedPropIndex(pped,current_menu-12,current,textures,true)
                        end
                    elseif IsControlJustPressed(0,174) then --left
                        if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
                        if current_menu<12 then
                            local current=GetPedDrawableVariation(pped,current_menu)
                            local total=GetNumberOfPedDrawableVariations(pped,current_menu)-1
                            if current>0 or current_menu>=8 and current>-1 then
                                current=current-1
                            else
                                current=total
                            end
                            --print("set "..current)
                            --local texture=GetPedTextureVariation(pped,current_menu,current)
                            local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
                            if textures>0 then textures=math.random(0,textures-1) end
                            SetPedComponentVariation(pped,current_menu,current,textures,0)
                        else
                            local current=GetPedPropIndex(pped,current_menu-12)
                            --print("current "..current)
                            local total=GetNumberOfPedPropDrawableVariations(pped,current_menu-12)-1
                            if current>-1 then
                                current=current-1
                            else
                                current=total
                            end
                            --print("set "..current)
                            --local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
                            local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
                            if textures>0 then textures=math.random(0,textures-1) end
                            ClearPedProp(pped,current_menu-12)
                            SetPedPropIndex(pped,current_menu-12,current,textures,true)
                        end
                    elseif IsControlJustPressed(0,86) then --e veh horn
                        if player.headshot~=nil then UnregisterPedheadshot(player.headshot) player.headshot=nil end
                        if current_menu<12 then
                            local current=GetPedDrawableVariation(pped,current_menu)
                            local texture=GetPedTextureVariation(pped,current_menu,current)
                            local textures=GetNumberOfPedTextureVariations(pped,current_menu,current)
                            if textures>0 then
                                if texture<textures-1 then
                                    texture=texture+1
                                else
                                    texture=0
                                end
                            end
                            SetPedComponentVariation(pped,current_menu,current,texture,0)
                        else
                            local current=GetPedPropIndex(pped,current_menu-12)
                            local texture=GetPedPropTextureIndex(pped,current_menu-12,current)
                            local textures=GetNumberOfPedPropTextureVariations(pped,current_menu-12,current)
                            if textures>0 then
                                if texture<textures-1 then
                                    texture=texture+1
                                else
                                    texture=0
                                end
                            end
                            ClearPedProp(pped,current_menu-12)
                            SetPedPropIndex(pped,current_menu-12,current,texture,true)
                        end
                    end
                    DrawRect(0.25,0.65,0.2,0.6,0,0,0,175)
                    DrawRect(0.25,0.40,0.2,0.1,0,150,200,255) --blue header
                    SetTextCentre(true)
                    WriteText(7,"Changing room",1.0,255,255,255,255,0.25,0.375)
                    DrawRect(0.25,0.44+.025+current_menu*.025,0.2,0.025,255,255,255,255) --chosenline
                    local invalid=false
                    for i=0,11 do
                       local drawable=GetPedDrawableVariation(pped,i)
                       local texture=GetPedTextureVariation(pped,i)
                       --local palete=GetPedPaletteVariation(pped,i)
                       if not IsPedComponentVariationValid(pped,i,drawable,texture) then
                        invalid=true
                       end
                    end
                    for i=0,3 do
                       local drawable=GetPedPropIndex(pped,i)
                       local texture=GetPedPropTextureIndex(pped,i)
                       --local palete=GetPedPaletteVariation(pped,i)
                       if not IsPedPropValid(pped,i,drawable,texture) then
                        invalid=true
                       end
                    end
                    WriteTextNoOutline(2,"invalid",0.35,0,0,0,alpha,0.16,0.428+.025+(total_menu_count+1)*.025) --chosen line text
                    
                    for i=0,11 do
                        local current=GetPedDrawableVariation(pped,i)
                        local variations=GetNumberOfPedDrawableVariations(pped,i)
                        local alpha=(variations~=0) and 255 or 100
                        if i==current_menu then
                            local textures=GetNumberOfPedTextureVariations(pped,i,current)
                            local texture=GetPedTextureVariation(pped,i,current)
                            WriteTextNoOutline(2,component_name[i],0.35,0,0,0,alpha,0.16,0.428+.025+i*.025) --chosen line text
                            if (variations~=0) then current=current+1 end
                            if (textures~=0) then texture=texture+1 end
                            WriteTextNoOutline(4,"<",0.35,0,0,0,alpha,0.280,0.428+.025+i*.025) --chosen line text
                            WriteTextNoOutline(4,{"~1~ / ~1~ >",current,variations},0.35,0,0,0,alpha,0.285,0.428+.025+i*.025) --chosen line text
                            WriteTextNoOutline(4,{"E ~1~ / ~1~",texture,textures},0.35,0,0,0,alpha,0.315,0.428+.025+i*.025) --chosen line text
                        else
                            WriteTextNoOutline(2,component_name[i],0.35,255,255,255,alpha,0.16,0.428+.025+i*.025) --not chosen line text
                            if (variations~=0) then current=current+1 end
                            WriteTextNoOutline(4,{"~1~ / ~1~",current,variations},0.35,255,255,255,alpha,0.285,0.428+.025+i*.025) --not chosen line text
                        end
                    end
                    for i=12,total_menu_count do
                        local current=GetPedPropIndex(pped,i-12)
                        local variations=GetNumberOfPedPropDrawableVariations(pped,i-12)
                        local alpha=(variations~=0) and 255 or 100
                        if i==current_menu then
                            local textures=GetNumberOfPedPropTextureVariations(pped,i-12,current)
                            local texture=GetPedPropTextureIndex(pped,i-12,current)
                            WriteTextNoOutline(2,component_name[i],0.35,0,0,0,alpha,0.16,0.428+.025+i*.025) --chosen line text
                            if (variations~=0) then current=current+1 end
                            texture=texture+1
                            WriteTextNoOutline(4,"<",0.35,0,0,0,alpha,0.280,0.428+.025+i*.025) --chosen line text
                            WriteTextNoOutline(4,{"~1~ / ~1~ >",current,variations},0.35,0,0,0,alpha,0.285,0.428+.025+i*.025) --chosen line text
                            WriteTextNoOutline(4,{"E ~1~ / ~1~",texture,textures},0.35,0,0,0,alpha,0.325,0.428+.025+i*.025) --chosen line text
                        else
                            WriteTextNoOutline(2,component_name[i],0.35,255,255,255,alpha,0.16,0.428+.025+i*.025) --not chosen line text
                            if (variations~=0) then current=current+1 end
                            WriteTextNoOutline(4,{"~1~ / ~1~",current,variations},0.35,255,255,255,alpha,0.285,0.428+.025+i*.025) --not chosen line text
                        end
                    end
                end
            elseif zone~=nil and not zone.raided and zone.clothespos~=nil and in_radius(mypos,zone.clothespos,1) then 
                --clothes
                local current_menu=1

                while true do Wait(0)
                    inventory.highlight=0
                    pped=PlayerPedId()
                    mypos=GetEntityCoords(pped)
                    if IsControlJustPressed(0,177) or not in_radius(mypos,zone.clothespos,5) then
                        break
                    elseif IsControlJustPressed(0,173) then --right
                        if current_menu<#zone.clothes then
                            current_menu=current_menu+1
                        else
                            current_menu=1
                        end
                    elseif IsControlJustPressed(0,172) then --left
                        if current_menu>1 then
                            current_menu=current_menu-1
                        else
                            current_menu=#zone.clothes
                        end
                    elseif IsControlJustPressed(0,86) then --e veh horn
                        local enough=do_we_have_all_that(zone.clothes[current_menu][2])
                        if enough then
                            if enough then
                                local name=zone.clothes[current_menu][1]
                                local hash=GetHashKey(name)
                                SimpleNotification(messages.you_changed_clothes)
                                remove_all_that(zone.clothes[current_menu][2])
                                RequestModel(hash) while not HasModelLoaded(hash) do Wait(0) end
                                SetPlayerModel(PlayerId(),hash)
                                pped=PlayerPedId()
                                --SetPedRelationshipGroupHash(pped,GetHashKey("player"))
                                SetPedRandomComponentVariation(pped,false)
                                ClearAllPedProps(pped)
                                SetPedRandomProps(pped)
                                Wait(0)
                                break
                            else
                                --SetModelAsNoLongerNeeded(model)
                            end
                        end
                    end
                    DrawRect(0.25,0.65,0.2,0.6,0,0,0,175)
                    DrawRect(0.25,0.40,0.2,0.1,0,150,200,255) --blue header
                    SetTextCentre(true)
                    WriteText(7,"Clothes",1.0,255,255,255,255,0.25,0.375)
                    DrawRect(0.25,0.44+current_menu*.025,0.2,0.025,255,255,255,255) --chosenline
                    for i=1,#zone.clothes do
                        if i==current_menu then
                            WriteTextNoOutline(2,zone.clothes[i][1],0.35,0,0,0,255,0.16,0.428+i*.025) --chosen line text
                        else
                            WriteTextNoOutline(2,zone.clothes[i][1],0.35,255,255,255,255,0.16,0.428+i*.025) --not chosen line text
                        end
                    end
                    local item,have,need
                    for i=1,#zone.clothes[current_menu][2],2 do
                        item=zone.clothes[current_menu][2][i]
                        have=get_inventroy_item_amount(item)
                        need=zone.clothes[current_menu][2][i+1]
                        DrawSprite("lsm",item,.39,.435+i*.05,inv_big_x,inv_big_y,0.0, 255, 255, 255, 255)
                        if have<need then
                            WriteText(2,{"~a~\n~1~ of ~1~",item,have,need},0.35,255,0,0,255,.42,.428+i*.05)
                        else
                            WriteText(2,{"~a~\n~1~ of ~1~",item,have,need},0.35,0,255,0,255,.42,.428+i*.05)
                        end
                    end
                end
			elseif zone~=nil and zone.factionjoinpos~=nil and in_radius(mypos,zone.factionjoinpos,1) then
				-- faction join pos
				if IsControlJustPressed(0,86) then
					local cashslot=get_inventory_item_slot("cash")
					if player.faction==zone.relationship then
						SimpleNotification(messages.already_in_this_faction)
						while in_radius(mypos,zone.factionjoinpos,1) do
							mypos=GetEntityCoords(PlayerPedId())
							Wait(0)
							if IsControlJustPressed(0,86) then
								player.faction=nil
								FlashMinimapDisplay()
								SimpleNotification(messages.you_left_faction)
								break;
							end
						end
					elseif player.faction~=0 and player.faction~=nil then
						SimpleNotification(messages.leave_faction_before_joining_new_one)
					elseif cashslot and inventory[cashslot].amount>=zone.factionjoin.cost then
						inventory[cashslot].amount=inventory[cashslot].amount-zone.factionjoin.cost
						check_inv_slot_for_zero_amount(cashslot)
						--SwitchFaction(zone.relationship)
						--SetPedRelationshipGroupHash(pped,zone.relationship)
						player.faction=zone.relationship
						saving_kvp_mode.SetResourceKvpInt("player_faction",player.faction)
						print("saving player faction "..player.faction)
						FlashMinimapDisplay()
						SimpleNotification(messages.you_joined_faction)
					else
						SimpleNotification(messages.not_enough_cash)
					end
				end
					
			elseif zone~=nil and zone.extraction~=nil and in_radius(mypos,zone.extraction,1) then 
				local myfaction=GetPedRelationshipGroupHash(myped)
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
					if player.faction==zone.relationship then
						--- EXTRACTION CODE HERE
						player_extraction(zone.extraction)
					else
						SimpleNotification(messages.cant_use_faction_extraction_point)
					end
				else
					SimpleNotification(messages.cant_use_enemy_extraction_points)
				end
            elseif zone~=nil and zone.storagepos~=nil and zone.storagename~=nil and in_radius(mypos,zone.storagepos,1) then 
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
					if player.faction==zone.relationship then
						local howlongenterhasbeenhold=0
						--storage
						local storage=zone.storage
						if storage and storage.total and storage.total>0 then
							inventory.current=nil
							storage.rows=4
							storage.lines=5
							storage.scroll=0
							storage.current=1
						else
							storage={total=0,rows=4,lines=5,scroll=0}
							zone.storage=storage
							if inventory.total>0 and inventory.current==0 then
								inventory.current=1
							end
						end
						if inventory.total>0 then inventory.current=1 storage.current=nil inventory.scroll=0
						elseif storage.total>0 then storage.current=1 inventory.current=nil storage.scroll=0 end
						-- for k,v in pairs(inventory) do
							-- if type(v)=='table' then
								-- zone.storage[k]={}
								-- for n,m in pairs(v) do
									-- zone.storage[k][n]=m
								-- end
							-- else
								-- zone.storage[k]=v
							-- end
						-- end
						while true do Wait(0)
							pped=PlayerPedId()
							mypos=GetEntityCoords(pped)
							if not in_radius(mypos,zone.storagepos,1) then
								goto endofwhileforstorage
							end
							if storage.scroll<0 then storage.scroll=0 end
							--WriteHint(16,"scroll storage: "..storage.scroll.." inv scroll: "..inventory.scroll)
							if IsControlJustPressed(0,175) then --right
								if storage.current~=nil then
									if storage.current%storage.rows==0 or storage.current==zone.storage.total then
										if inventory.total>0 then
											storage.current=nil
											inventory.current=inventory.scroll*inventory.rows+1
										end
									-- elseif 
										-- storage.current=1
										-- storage.scroll=0
									else
										storage.current=storage.current+1
									end
								elseif inventory.current~=nil then
									if inventory.current==inventory.total then
										inventory.current=1
										inventory.scroll=0
									else
										inventory.current=inventory.current+1
									end
								end
							elseif IsControlJustPressed(0,174) then --left
								if storage.current~=nil then
									if storage.current==1 then
										storage.current=zone.storage.total
									else
										storage.current=storage.current-1
									end
								elseif inventory.current~=nil then
									if inventory.current%inventory.rows==1 then
										if storage.total>0 then
											inventory.current=nil
											storage.current=storage.scroll*storage.rows+1
										end
									-- elseif inventory.current==1 then
										-- inventory.current=nil
										-- storage.current=storage.scroll*storage.rows+1
									else
										inventory.current=inventory.current-1
									end
								end
							elseif IsControlJustPressed(0,172) then --up
								local opinv
								if inventory.current~=nil then opinv=inventory
								elseif storage.current~=nil then opinv=storage end
								
								if opinv.current==1 then -- first item
									opinv.current=opinv.total 
								elseif opinv.current>=1 and opinv.current<=opinv.rows then --first row
									opinv.current=1
									opinv.scroll=0
								else -- any other
									opinv.current=opinv.current-opinv.rows
								end
								
								while opinv.current<=opinv.scroll*opinv.rows do
									opinv.scroll=opinv.scroll-1
								--print("scroll="..storage.scroll)
								end
								while opinv.current>(opinv.scroll+opinv.lines)*opinv.rows do
									opinv.scroll=opinv.scroll+1
								--print("scroll="..storage.scroll)
								end
							elseif IsControlJustPressed(0,173) then --down
								local opinv
								if inventory.current~=nil then opinv=inventory
								elseif storage.current~=nil then opinv=storage end
								
								if opinv.current==opinv.total then
									opinv.current=1
								elseif opinv.current>opinv.total-opinv.rows and opinv.current<=opinv.total then
									opinv.current=opinv.total
								else
									opinv.current=opinv.current+opinv.rows
								end
								
								while opinv.current<=opinv.scroll*opinv.rows do
									opinv.scroll=opinv.scroll-1
								--print("scroll="..storage.scroll)
								end
								while opinv.current>(opinv.scroll+opinv.lines)*opinv.rows do
									opinv.scroll=opinv.scroll+1
								--print("scroll="..storage.scroll)
								end
							elseif IsControlPressed(0,191) then --enter
								local amounttomove
								howlongenterhasbeenhold=howlongenterhasbeenhold+1
								if howlongenterhasbeenhold<=1 or howlongenterhasbeenhold>=45 then
									amounttomove=1
									if howlongenterhasbeenhold>300 then amounttomove=50 
									elseif howlongenterhasbeenhold>200 then amounttomove=10 
									elseif howlongenterhasbeenhold>100 then amounttomove=5 end
									if storage.current~=nil then
										if zone.storage[storage.current] then
											if zone.storage[storage.current].item==nil or zone.storage[storage.current].amount==nil then 
												SimpleNotification("~r~ ERROR: invalid item")
											elseif zone.storage[storage.current].amount>amounttomove then
												give_item_to_inventory(zone.storage[storage.current].item,amounttomove)
												zone.storage[storage.current].amount=zone.storage[storage.current].amount-amounttomove
												saving_kvp_mode.SetResourceKvp("st_"..zone.storagename.."_item_"..storage.current,zone.storage[storage.current].item)
												saving_kvp_mode.SetResourceKvpInt("st_"..zone.storagename.."_amount_"..storage.current,zone.storage[storage.current].amount)
											else
												amounttomove=zone.storage[storage.current].amount
												give_item_to_inventory(zone.storage[storage.current].item,amounttomove)
												saving_kvp_mode.DeleteResourceKvp("st_"..zone.storagename.."_item_"..zone.storage.total)
												for i=storage.current,zone.storage.total-1 do
													saving_kvp_mode.SetResourceKvp("st_"..zone.storagename.."_item_"..i,zone.storage[i+1].item)
													saving_kvp_mode.SetResourceKvpInt("st_"..zone.storagename.."_amount_"..i,zone.storage[i+1].amount)
												end
												table.remove(zone.storage,storage.current)
												howlongenterhasbeenhold=2
												zone.storage.total=zone.storage.total-1
												if zone.storage.total==0 then
													storage.current=nil
													inventory.current=inventory.scroll*inventory.rows+1
												elseif storage.current>zone.storage.total then
													storage.current=zone.storage.total
												end
											end
										end
									elseif inventory.current~=nil then
										if inventory[inventory.current] then
											local weightleft=zone.storageweight-zone.storage.weight
											local itemweight=get_item_weight(inventory[inventory.current].item)
											if weightleft>=itemweight then
												if weightleft<itemweight*amounttomove then
													amounttomove=math.floor(weightleft/itemweight)
												end
												if inventory[inventory.current].amount>amounttomove then
													give_item_to_storage(storage,zone.storagename,inventory[inventory.current].item,amounttomove)
													inventory[inventory.current].amount=inventory[inventory.current].amount-amounttomove
													TriggerServerEvent("updateplayeritem",inventory[inventory.current].item,inventory[inventory.current].amount)
												else
													TriggerServerEvent("updateplayeritem",inventory[inventory.current].item,nil)
													amounttomove=inventory[inventory.current].amount
													give_item_to_storage(storage,zone.storagename,inventory[inventory.current].item,amounttomove)
													table.remove(inventory,inventory.current)
													howlongenterhasbeenhold=2
													inventory.total=inventory.total-1
													if inventory.total==0 then
														inventory.current=nil
														storage.current=storage.scroll*storage.rows+1
													elseif inventory.current>inventory.total then
														inventory.current=inventory.total
													end
												end
											--else
												--FlashMinimapDisplay()
												--SimpleNotification("Storage ~y~weight limit ~s~is ~r~reached~s~!")
											end
										end
									end
								end
							elseif IsControlJustPressed(0,177) then --backspace / rmb / esc
								goto endofwhileforstorage
							else
								howlongenterhasbeenhold=0
							end
							myped=PlayerPedId()
							inventory.highlight=255
							if HasStreamedTextureDictLoaded("lsm") then
								DrawSprite("lsm","stash",.35,.525,0.25,0.6,0.0, 255, 255, 255, 255)
								local totalscrolls=math.max(0,math.ceil((storage.total-(storage.rows*storage.lines))/storage.rows))
								--WriteHint("invscrlmax: "..totalscrolls)
								if totalscrolls>0 then
								
								--new storage scroll block
									local inventory_up_y=0.28
									local inventory_up_x_left=0.57
									local inventory_up_x_right=0.731
									local inventory_font_size=0.3
									
									local inventory_down_y_name=0.69
									local inventory_down_y_desc=0.715
									local inventory_down_x_left=0.57
									local inventory_down_x_right=0.69
									
									local inventory_grid_left=inventory_up_x_left
									local inventory_grid_right=inventory_up_x_right
									local inventory_grid_up=0.35
									local inventory_grid_down=0.7
									local inventory_grid_dist_x=0.042
									local inventory_grid_dist_y=0.070
									
									
									local inventory_grid_desc_pos_x=0.715
									local inventory_grid_desc_pos_y=0.745
									
									local inventory_scroll_bkg_x=0.2675
									local inventory_scroll_bkg_y=0.49
									local inventory_scroll_bkg_size_x=0.004
									local inventory_scroll_bkg_size_y=0.342
									local inventory_scroll_y=inventory_scroll_bkg_y
									local inventory_scrollsize_x=0.003
									
									DrawRect(inventory_scroll_bkg_x,inventory_scroll_bkg_y,inventory_scroll_bkg_size_x,inventory_scroll_bkg_size_y,0,0,0,255)
									
									local newscrollsizey=inventory_scroll_bkg_size_y/(totalscrolls+1)
									local uppos=inventory_scroll_bkg_y-inventory_scroll_bkg_size_y/2+newscrollsizey/2
									local lowpos=inventory_scroll_bkg_y+inventory_scroll_bkg_size_y/2-newscrollsizey/2
									local step=(lowpos-uppos)/totalscrolls
									local newscrollposy=uppos+(step*storage.scroll)
									if storage.scroll==0 then
										newscrollposy=uppos
									elseif storage.scroll==totalscrolls then
										newscrollposy=lowpos
									end
									DrawRect(inventory_scroll_bkg_x,newscrollposy,inventory_scrollsize_x,newscrollsizey,255,255,255,255)
								end
								local number
								local total=(storage.lines*storage.rows)-1
								if storage.scroll>0 then
									number=(storage.scroll*storage.rows)+1
								else
									number=1
								end
								--zone.storage={}
								zone.storage.weight=0
								for k=1,zone.storage.total do
									local v=zone.storage[k]
										zone.storage.weight=zone.storage.weight+get_item_weight(v.item)*v.amount
								end
								local x=0.29
								local y=0.33
								for k=math.max(1,number),math.min(number+total,zone.storage.total) do
									local v=zone.storage[k]
									local sprite="item"
									if storage.current==k then sprite="selected_item" end
									DrawSprite("lsm",sprite,x,y,inv_sml_x,inv_sml_y,0.0, 255, 255, 255, 255)
									--print("total"..zone.storage.total.." k"..k)
									DrawItem("lsm",v.item,x,y,inv_sml_x,inv_sml_y,0.0, 255, 255, 255, 255)
									
									
									SetTextRightJustify(true)
									SetTextWrap(
									x-(inv_new.item_scl_x/2),
									x+(inv_new.item_scl_x/2)-0.002)
									local inv_i=k-(storage.scroll*storage.rows)
									if v.amount~=nil then
										WriteText(2,{"~1~",v.amount},0.3,255,255,255,255,
										(0.57+(inv_new.item_scl_x/2))+(((inv_i-1)%zone.storage.rows)*0.042),
										0.33+(math.floor((inv_i-1)/zone.storage.rows)*0.070)+0.01
										)
									end
									x=x+.04
									if x>.41 then
										x=.29
										y=y+.07
									end
								end
								if zone.storage.total>0 then
									local v=zone.storage[storage.current]
									if v~=nil then
										local itemname=v.item
										if itemname==nil then
											itemname="nil"
										elseif string.find(itemname,"+") then
											parts=split_text(itemname,"+")
											itemname=parts[1]
											parts[1]=nil
										end
										WriteText(4,{"~a~",item_names[itemname] or v.item},0.3,255,255,255,255,0.27,0.6925)
										SetTextWrap(0.0,0.4)
										WriteText(4,{"~a~",item_descriptions[itemname] or v.item},0.3,155,155,155,155,0.27,0.7175)
										
										DrawSprite("lsm","selected_item",0.415,0.745,inv_sml_x*1.1,inv_sml_y*1.1,0.0, 255, 255, 255, 255)
										DrawItem("lsm",v.item,0.415,0.745,inv_sml_x*1.1,inv_sml_y*1.1,0.0, 255, 255, 255, 255)
									end
								else
									WriteText(2,"Empty",0.3,255,255,255,255,0.27,0.6925)
									SetTextWrap(0.0,0.43)
									WriteText(2,messages.have_nothing_in_your_storage,0.3,155,155,155,155,0.27,0.7175)
								end
							end
							WriteText(2,{"Storage ~c~"..zone.storagename},0.3,255,255,255,255,0.275,0.26)
							local sumweight
							if zone.storage.weight==nil then zone.storage.weight=0 end
							SetTextRightJustify(true)
							SetTextWrap(0.0,0.43)
							WriteText(4,{"~c~WEIGHT ~s~~1~~c~/~s~~1~ ~c~KG",zone.storage.weight,zone.storageweight},0.3,255,255,255,255,0.395,0.26)
						end
						::endofwhileforstorage::
						if inventory.current==nil then
							inventory.current=inventory.rows*inventory.scroll
						end
						if inventory.current>inventory.total then inventory.current=inventory.total end
					else
						SimpleNotification(messages.you_have_to_be_in_this_faction_to_use_this_storage)
					end
				else
					SimpleNotification(messages.cant_use_enemy_storages)
				end
				
            elseif zone~=nil and zone.craftpos~=nil and in_radius(mypos,zone.craftpos,1) then 
                --craft
                local current_menu=0
				local items_that_can_be_crafted={}
				local known_recipes={}
				for i=1,inventory.total do
					local v=inventory[i]
					if string.sub(v.item,1,10)=="blueprint_" then
						known_recipes[string.sub(v.item,11)]=true
					end
				end
				for i=1,#normal_crafts do
					local v=normal_crafts[i]
					if known_recipes[v[1]] then
						current_menu=current_menu+1
						items_that_can_be_crafted[current_menu]=v
					end
				end
				known_recipes=nil
				if current_menu==0 then
					SimpleNotification(messages.you_dont_have_any_blueprints)
				else
				
					while true do Wait(0)
						inventory.highlight=0
						pped=PlayerPedId()
						mypos=GetEntityCoords(pped)
						if IsControlJustPressed(0,177) or not in_radius(mypos,zone.craftpos,5) then
							break
						elseif IsControlJustPressed(0,175) then --right
							if current_menu<#items_that_can_be_crafted then
								current_menu=current_menu+1
							else
								current_menu=1
							end
						elseif IsControlJustPressed(0,174) then --left
							if current_menu>1 then
								current_menu=current_menu-1
							else
								current_menu=#items_that_can_be_crafted
							end
						elseif IsControlJustPressed(0,86) then --e veh horn
							local enough=do_we_have_all_that(items_that_can_be_crafted[current_menu][3])
							if enough then
								-- local model=GetHashKey(zone.crafts[current_menu][1])
								-- if not HasModelLoaded(model) then
									-- RequestModel(model)
									-- Wait(0)
									-- while not HasModelLoaded(model) do Wait(0) end
									-- enough=do_we_have_all_that(zone.crafts[current_menu][3])
								-- end
									-- local name=zone.crafts[current_menu][1]
									-- local hash=GetHashKey("weapon_"..name)
									-- if not IsWeaponValid(hash) then
										-- hash=GetHashKey("gadget_"..name)
										-- if not IsWeaponValid(hash) then
											-- hash=GetHashKey(name)
										-- end
									-- end
									-- if IsWeaponValid(hash) then
										-- GiveWeaponToPed(PlayerPedId(), hash, 1, false, true)
									--end
								if give_item_to_inventory(items_that_can_be_crafted[current_menu][1],items_that_can_be_crafted[current_menu][2]) then
									remove_all_that(items_that_can_be_crafted[current_menu][3])
									Wait(0)
								else
									SimpleNotification(messages.cant_fit_itemname_in_inventory,items_that_can_be_crafted[current_menu][1])
									--SetModelAsNoLongerNeeded(model)
								end
							end
						end
						DrawSprite("lsm","craft_background",.35,.5,0.25,0.7,0.0, 255, 255, 255, 255)
						DrawSprite("lsm","craft_icon",0.296,0.2045,0.017,0.03,0.0, 255, 255, 255, 255)
						WriteTextNoOutline(2,"Workshop",0.4,0,0,0,255,0.307,0.19)
						DrawRect(.3025,.28,inv_sml_x,inv_sml_y, 0, 0, 0, 255)
						DrawSprite("lsm","item",.3025,.28,inv_sml_x,inv_sml_y,0.0, 255, 255, 255, 255)
						DrawSprite("lsm",items_that_can_be_crafted[current_menu][1],.3025,.28,inv_sml_x,inv_sml_y,0.0, 255, 255, 255, 255)
						WriteTextNoOutline(4,item_names[items_that_can_be_crafted[current_menu][1]] or items_that_can_be_crafted[current_menu][1],0.4,0,0,0,255,.3325,.25)
								SetTextRightJustify(true)
								SetTextWrap(0.0,.3025+0.015)        
								WriteText(4,items_that_can_be_crafted[current_menu][2],0.3,255,255,255,255,.3025+0.01,.28+0.01)
						
						WriteTextNoOutline(2,"Ingredients",0.4,0,0,0,255,0.29,0.33)
						
						DrawSprite("lsm", "arrow_left",.32-0.025,0.75+0.001,0.0075*1.2,0.015*1.3,0.0, 255, 255, 255, 255)
						DrawSprite("lsm", "Trade Button",.32,0.75,0.0255*1.2,0.0205*1.2,0.0, 255, 255, 255, 255)
						DrawSprite("lsm", "arrow_right",.32+0.025,0.75+0.001,0.0075*1.2,0.015*1.3,0.0, 255, 255, 255, 255)
						SetTextCentre(true)
						WriteTextNoOutline(2,"Craft",0.3,255,255,255,255,0.32,0.75-0.011)
						
						
						WriteTextNoOutline(4,{"~1~ / ~1~",current_menu,#items_that_can_be_crafted},0.3,0,0,0,255,0.42,0.75-0.011)
						
						-- for k,v in pairs(zone.crafts) do
							-- if current_menu==k then
								-- DrawRect(0.275+k*0.015,0.785,inv_sml_x*0.5,inv_sml_y*0.5, 0, 0, 0, 255)
								-- --DrawSprite("lsm","item",0.275+k*0.015,0.785,inv_sml_x*0.5,inv_sml_y*0.5,0.0, 255, 255, 255, 255)
							-- end
							-- DrawSprite("lsm",v[1],0.275+k*0.015,0.785,inv_sml_x*0.5,inv_sml_y*0.5,0.0, 255, 255, 255, 255)
						-- end
						--WriteTextNoOutline(2,"Service",0.3,0,0,0,255,0.290,0.24)
						--WriteTextNoOutline(2,"Price",0.3,0,0,0,255,0.40,0.24)
						--DrawRect(0.25,0.65,0.2,0.6,0,0,0,175)
						--DrawRect(0.25,0.40,0.2,0.1,0,150,200,255) --blue header
						--SetTextCentre(true)
						--WriteText(7,"Crafting",1.0,255,255,255,255,0.25,0.375)
						--DrawRect(0.25,0.44+current_menu*.025,0.2,0.025,255,255,255,255) --chosenline
						-- for i=1,#zone.crafts do
							-- local txt=zone.crafts[i][1]
							-- if not do_we_have_all_that(zone.crafts[i][3]) then
								-- txt="~c~"..txt
							-- end
							-- if zone.crafts[i][2]~=1 then
								-- txt=txt.." ~c~x"..zone.crafts[i][2]
							-- end
							-- if i==current_menu then
								-- WriteTextNoOutline(2,txt,0.35,0,0,0,255,0.16,0.428+i*.025) --chosen line text
							-- else
								-- WriteTextNoOutline(2,txt,0.35,255,255,255,255,0.16,0.428+i*.025) --not chosen line text
							-- end
						-- end
						local item,have,need
						for i=1,#items_that_can_be_crafted[current_menu][3],2 do
							item=items_that_can_be_crafted[current_menu][3][i]
							have=get_inventroy_item_amount(item)
							need=items_that_can_be_crafted[current_menu][3][i+1]
							local x=.28275+i*.02
							local y=.4
							DrawRect(x,.4,inv_sml_x,inv_sml_y, 0, 0, 0, 255)
							if have>=need then
								DrawSprite("lsm","equipped_item",x,y,inv_sml_x,inv_sml_y,0.0, 255, 255, 255, 255)
								DrawSprite("lsm",item,x,y,inv_sml_x,inv_sml_y,0.0, 255, 255, 255, 255)
								SetTextRightJustify(true)
								SetTextWrap(0.0,x+0.015)        
								WriteText(4,need,0.3,255,255,255,255,x+0.01,y+0.01)
							else
								DrawSprite("lsm","item",x,y,inv_sml_x,inv_sml_y,0.0, 150, 150, 150, 255)
								DrawSprite("lsm",item,x,y,inv_sml_x,inv_sml_y,0.0, 150, 150, 150, 255)
								SetTextRightJustify(true)
								SetTextWrap(0.0,x+0.015)        
								WriteText(4,need,0.3,150,150,150,255,x+0.01,y+0.01)
							end
						end
					end
				end
			elseif false then --disabled client side loot bags
                local dict="anim@gangops@facility@servers@bodysearch@"
                local anim="player_search"
                local model=GetHashKey("prop_cs_heist_bag_02")
                local started=GetGameTimer()
                local ended=false
                local timestamp=started
                local timetopickup=5000
                local myplayerid=PlayerId()
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do Wait(0) end
                local can_pick_up=false
                local item_name=nil
                local count=0
                local delta
                local handle,obj=FindFirstObject()
                local loop=(handle~=-1)
                while loop do
                    if GetEntityModel(obj)==model then
                        delta=(GetEntityCoords(obj)-mypos)
                        if delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<1 then
                            if DecorExistOn(obj,"item") and DecorExistOn(obj,"count") then
                                count=DecorGetInt(obj,"count")
                                item_name=item_index_to_name[DecorGetInt(obj,"item")]
                                if item_name~=nil then
                                    if (inventory.total<inventory.max) then
                                        can_pick_up=true
                                    elseif (inventory.total==inventory.max) then
                                        for i=1,inventory.total do
                                            if inventory[i].item==item_name then
                                                can_pick_up=true
                                                break
                                            end
                                        end
                                    end
                                    if can_pick_up then
                                        break
                                    end
                                end
                            end
                        end
                    end
                    loop,obj=FindNextObject(handle)
                end
                EndFindObject(handle)
                if can_pick_up and not is_other_player_playing_anim_nearby(mypos,myplayerid,dict,anim) then
                    SetEntityCoords(pped,mypos.x,mypos.y,mypos.z-1.45)FreezeEntityPosition(pped,true)TaskPlayAnim(pped, dict, anim, 1.0, 1.0, -1, 0, .0, true, true, true)
                    --TaskPlayAnimAdvanced(pped,dict,anim,mypos.x,mypos.y,mypos.z-.45,.0,.0,.0, 1.0, 1.0, -1, 0, .0, false, false)
                    Wait(0)
                    while true do
                        if pped~=PlayerPedId() then break end
                        if square_dist(GetEntityCoords(pped),mypos)>1 then break end
                        if not IsEntityPlayingAnim(pped,dict,anim,3) then break end
                        if is_other_player_playing_anim_nearby(mypos,myplayerid,dict,anim) then
                            SimpleNotification("~r~Conflict, other player is picking up something.")
                            break
                        end
                        ended=((GetGameTimer()-started)>timetopickup)
                        handle,obj=FindFirstObject()
                        loop=(handle~=-1)
                        while loop do
                            if GetEntityModel(obj)==model then
                                delta=(GetEntityCoords(obj)-mypos)
                                if delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<1 then
                                    if DecorExistOn(obj,"item") and DecorExistOn(obj,"count") then
                                        item_name=item_index_to_name[DecorGetInt(obj,"item")]
                                        if item_name~=nil then
                                            count=DecorGetInt(obj,"count")
                                            can_pick_up=false
                                            if (inventory.total<inventory.max) then
                                                can_pick_up=true
                                            elseif (inventory.total==inventory.max) then
                                                for i=1,inventory.total do
                                                    if inventory[i].item==item_name then
                                                        can_pick_up=true
                                                        break
                                                    end
                                                end
                                            end
                                            if can_pick_up then
                                                if NetworkHasControlOfEntity(obj) then
                                                    if ended and give_item_to_inventory(item_name,count) then
                                                        SetEntityAsMissionEntity(obj)
                                                        DeleteEntity(obj)
                                                    end
                                                else
                                                    NetworkRequestControlOfEntity(obj)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            loop,obj=FindNextObject(handle)
                        end
                        EndFindObject(handle)
                        if ended then break end
                        Wait(0)
                    end
                    FreezeEntityPosition(PlayerPedId(),false)
                end
            end
        elseif inventory.total~=0 and inventory.highlight>0 then
			if inventory.current==nil and inventory.total>0 then inventory.current=1 end
            if IsControlJustPressed(0,175) then --left
                if not inventory.mode and (inventory.current%inventory.rows)==0 then
                    inventory.current=inventory.current-(inventory.rows-1)
                    if inventory.current<1 then inventory.current=1 end
                elseif inventory.current<inventory.total then
                    inventory.current=inventory.current+1
                else
                    inventory.current=1
                    inventory.scroll=0
                end
                inventory.highlight=500
            elseif IsControlJustPressed(0,174) then --right
                if not inventory.mode and (inventory.current%inventory.rows)==1 then
                    inventory.current=inventory.current+(inventory.rows-1)
                    if inventory.current>inventory.total then inventory.current=inventory.total end
                elseif inventory.current>1 then
                    inventory.current=inventory.current-1
                else
                    inventory.current=inventory.total
                end
                inventory.highlight=500
            elseif IsControlJustPressed(0,173) then --up
                if not inventory.mode then
                    if inventory.current>=inventory.total then
                        inventory.current=1
                        inventory.scroll=0
                    elseif inventory.current+inventory.rows<=inventory.total then
                        inventory.current=inventory.current+inventory.rows
                    else
                        inventory.current=inventory.total
                    end
                    inventory.highlight=500
                    while inventory.current<=inventory.scroll*inventory.rows do
                        inventory.scroll=inventory.scroll-1
                    print("scroll="..inventory.scroll)
                    end
                    while inventory.current>(inventory.scroll+inventory.lines)*inventory.rows do
                        inventory.scroll=inventory.scroll+1
                    print("scroll="..inventory.scroll)
                    end
                end
            elseif IsControlJustPressed(0,172) then --down
                if not inventory.mode then
                    if inventory.current>inventory.rows then
                        inventory.current=inventory.current-inventory.rows
                    else
                        inventory.current=inventory.total
                    end
                    inventory.highlight=500
                    while inventory.current<=inventory.scroll*inventory.rows do
                        inventory.scroll=inventory.scroll-1
                    print("scroll="..inventory.scroll)
                    end
                    while inventory.current>(inventory.scroll+inventory.lines)*inventory.rows do
                        inventory.scroll=inventory.scroll+1
                    print("scroll="..inventory.scroll)
                    end
                end
            elseif IsControlJustPressed(0,177) then --backspace / rmb / esc
                inventory.highlight=0
            -- elseif IsControlJustPressed(0,37) then --select weapon 
                -- inventory.highlight=500
            elseif IsControlJustPressed(0,191) then --INPUT_FRONTEND_RDOWN 
                if inventory.highlight>0 and inventory[inventory.current]~=nil and inventory[inventory.current].amount>0 then
                    if inventory[inventory.current].item=="water" then
                        if player.hydration<100 then
                            player.hydration=player.hydration+50
                            if player.hydration>100 then player.hydration=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="soda" then
                        if player.hydration<100 then
                            player.hydration=player.hydration+30
                            if player.hydration>100 then player.hydration=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="juice" then
                        if player.hydration<100 then
                            player.hydration=player.hydration+40
                            if player.hydration>100 then player.hydration=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="canfood" then
                        if player.saturation<100 then
                            player.saturation=player.saturation+40
                            if player.saturation>100 then player.saturation=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="food" then
                        if player.saturation<100 then
                            player.saturation=player.saturation+45
                            if player.saturation>100 then player.saturation=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="fish" then
                        if player.saturation<100 then
                            player.saturation=player.saturation+40
                            if player.saturation>100 then player.saturation=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="meat" then
                        if player.saturation<100 then
                            player.saturation=player.saturation+80
                            if player.saturation>100 then player.saturation=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="mre" then
                        if player.hydration<100 or player.saturation<100 then
                            player.hydration=player.hydration+20
                            player.saturation=player.saturation+60
                            if player.hydration>100 then player.hydration=100 end
                            if player.saturation>100 then player.saturation=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="fruits" then
                        if player.hydration<100 or player.saturation<100 then
                            player.hydration=player.hydration+20
                            player.saturation=player.saturation+40
                            if player.hydration>100 then player.hydration=100 end
                            if player.saturation>100 then player.saturation=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="trashfood" then
                        if player.hydration<100 or player.saturation<100 then
                            player.hydration=player.hydration+15
                            player.saturation=player.saturation+25
                            if player.hydration>100 then player.hydration=100 end
                            if player.saturation>100 then player.saturation=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="gasoline" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
                            local vehclass=GetVehicleClass(pveh)
							local pvehmodel=GetEntityModel(pveh)
                            if vehclass~=15 and vehclass~=16 and not kerosine_vehicles[pvehmodel] then
                                if GetPedInVehicleSeat(pveh,-1)==pped then
                                    if NetworkHasControlOfEntity(pveh) then
                                        local fuel=DecorGetFloat(pveh,"zm_fuel")
										local fuel_inv=inventory[inventory.current].amount
                                        if fuel<80.0 and fuel_inv>0 then
                                            if fuel<5.0 then
												if 75<fuel_inv then
													fuel_inv=fuel_inv-75
													fuel=79.5+.5
												else
													fuel=4.5+.5+fuel_inv
													fuel_inv=0
												end
                                            else
												if 80<fuel+fuel_inv then
													fuel_inv=math.floor(fuel_inv-80+fuel)
													fuel=79.5+.5
												else
													fuel=fuel+fuel_inv
													fuel_inv=0
												end
                                            end
                                            SetVehicleFuelLevel(pveh,fuel)
                                            DecorSetFloat(pveh,"zm_fuel",fuel)
                                            inventory[inventory.current].amount=fuel_inv
                                            check_inv_slot_for_zero_amount()
                                            SetVehicleFuelLevel(pveh,fuel)
                                        end
                                    else
                                        NetworkRequestControlOfEntity(pveh)
                                    end
                                else
                                    SimpleNotification(messages.you_must_be_in_driver_seat_to_refuel)
                                end
                            else
                                SimpleNotification(messages.you_need_aircraft_fuel_for_that_vehicle)
                            end
                        end
                    elseif inventory[inventory.current].item=="aircraftfuel" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
                            local vehclass=GetVehicleClass(pveh)
							local pvehmodel=GetEntityModel(pveh)
                            if vehclass==15 or vehclass==16 or kerosine_vehicles[pvehmodel] then
                                if GetPedInVehicleSeat(pveh,-1)==pped then
                                    if NetworkHasControlOfEntity(pveh) then
                                        local fuel=DecorGetFloat(pveh,"zm_fuel")
										local fuel_inv=inventory[inventory.current].amount
                                        if fuel<80.0 and fuel_inv>0 then
                                            if fuel<5.0 then
												if 75<fuel_inv then
													fuel_inv=fuel_inv-75
													fuel=79.5+.5
												else
													fuel=4.5+.5+fuel_inv
													fuel_inv=0
												end
                                            else
												if 80<fuel+fuel_inv then
													fuel_inv=math.floor(fuel_inv-80+fuel)
													fuel=79.5+.5
												else
													fuel=fuel+fuel_inv
													fuel_inv=0
												end
                                            end
                                            SetVehicleFuelLevel(pveh,fuel)
                                            DecorSetFloat(pveh,"zm_fuel",fuel)
                                            inventory[inventory.current].amount=fuel_inv
                                            check_inv_slot_for_zero_amount()
                                            SetVehicleFuelLevel(pveh,fuel)
                                        end
                                    else
                                        NetworkRequestControlOfEntity(pveh)
                                    end
                                else
                                    SimpleNotification(messages.you_must_be_in_driver_seat_to_refuel)
                                end
                            else
                                SimpleNotification(messages.this_fuel_can_be_used_only_in_aircraft)
                            end
                        end
                    elseif inventory[inventory.current].item=="engineparts" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
							local vehclass=GetVehicleClass(pveh)
                                --SimpleNotification(messages.cant_repair_aircraft_with_this_kit)
                            if GetPedInVehicleSeat(pveh,-1)==pped then
                                if NetworkHasControlOfEntity(pveh) then
									if vehclass==15 or vehclass==16 then
										if IsVehicleDamaged(pveh) then
											SetVehicleFixed(pveh)
											inventory[inventory.current].amount=inventory[inventory.current].amount-1
											check_inv_slot_for_zero_amount()
										else
											SimpleNotification(messages.engine_in_perfect_condition)
										end
                                    elseif GetVehicleEngineHealth(pveh)<1000.0 then
                                        SetVehicleEngineHealth(pveh,1000.0)
										inventory[inventory.current].amount=inventory[inventory.current].amount-1
										check_inv_slot_for_zero_amount()
                                    else
                                        SimpleNotification(messages.engine_in_perfect_condition)
									end
                                else
                                    NetworkRequestControlOfEntity(pveh)
                                end
                            else
                                SimpleNotification(messages.you_must_be_in_driver_seat_to_repair)
							end
                        end
                    -- elseif inventory[inventory.current].item=="ammo" then --rifle
                        -- give_ammo(pped,218444191)
                    -- elseif inventory[inventory.current].item=="pistolammo" then
                        -- give_ammo(pped,1950175060)
                    -- elseif inventory[inventory.current].item=="shotgunammo" then
                        -- give_ammo(pped,-1878508229)
                    -- elseif inventory[inventory.current].item=="heavyrifleammo" then
                        -- give_ammo(pped,1285032059)
                    -- elseif inventory[inventory.current].item=="flaregunammo" then
                        -- give_ammo(pped,1173416293)
                    -- elseif inventory[inventory.current].item=="smgammo" then
                        -- give_ammo(pped,1820140472)
                    -- elseif inventory[inventory.current].item=="mgammo" then
                        -- give_ammo(pped,1788949567)
                    -- elseif inventory[inventory.current].item=="launchergrenade" then
                        -- give_ammo(pped,1003267566)
                    elseif inventory[inventory.current].item=="medkit" then
                        if player.health<100.0 then
                            --player.health=player.health+80
                            local myhealth=GetEntityHealth(pped)
                            SetEntityHealth(pped,myhealth+100)
                            player.bleeding=0
                            if player.health>100 then player.health=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="painkillers" then
                        if player.health<100.0 then
                            --player.health=player.health+80
                            local myhealth=GetEntityHealth(pped)
                            SetEntityHealth(pped,myhealth+35)
                            if player.health>100 then player.health=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="alcohol" then
                        if player.hydration<100 then
                            player.hydration=player.hydration+1
                            if player.hydration>100 then player.hydration=100 end
                            player.drunk=player.drunk+1.5
                            ShakeGameplayCam("DRUNK_SHAKE",player.drunk)
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="weed" then
                        if player.saturation<100 then
                            player.saturation=player.saturation+10
                            if player.saturation>100 then player.saturation=100 end
                            player.drunk=player.drunk+0.5
                            ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",player.drunk)
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="gasmask" then
                        if player.mask=="gasmask" then 
                            player.mask=nil
                        else
                            player.mask="gasmask"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="halfmask" then
                        if player.mask=="halfmask" then 
                            player.mask=nil
                        else
                            player.mask="halfmask"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="roninmask" then
                        if player.mask=="roninmask" then 
                            player.mask=nil
                        else
                            player.mask="roninmask"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="tapemask" then
                        if player.mask=="tapemask" then 
                            player.mask=nil
                        else
                            player.mask="tapemask"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="balaclava" then
                        if player.mask=="balaclava" then 
                            player.mask=nil
                        else
                            player.mask="balaclava"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="tshirtmask" then
                        if player.mask=="tshirtmask" then 
                            player.mask=nil
                        else
                            player.mask="tshirtmask"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="smugglersgarb" then
                        if player.mask=="smugglersgarb" then 
                            player.mask=nil
                        else
                            player.mask="smugglersgarb"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="smugglersshemagh" then
                        if player.mask=="smugglersshemagh" then 
                            player.mask=nil
                        else
                            player.mask="smugglersshemagh"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="cowboyhat" then
                        if player.hat=="cowboyhat" then 
                            player.hat=nil
                        else
                            player.hat="cowboyhat"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="riothelmet" then
                        if player.hat=="riothelmet" then 
                            player.hat=nil
                        else
                            player.hat="riothelmet"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="merctacticalhelmet" then
                        if player.hat=="merctacticalhelmet" then 
                            player.hat=nil
                        else
                            player.hat="merctacticalhelmet"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="blackopstacticalhelmet" then
                        if player.hat=="blackopstacticalhelmet" and player.mask=="blackopstacticalhelmet" then 
                            player.hat=nil
							player.mask=nil
                        else
                            player.hat="blackopstacticalhelmet"
							player.mask="blackopstacticalhelmet"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="maraudercombathelmet" then
                        if player.hat=="maraudercombathelmet" and player.mask=="maraudercombathelmet" then 
                            player.hat=nil
							player.mask=nil
                        else
                            player.hat="maraudercombathelmet"
							player.mask="maraudercombathelmet"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="specopscommsgear" then
                        if player.hat=="specopscommsgear" and player.mask=="specopscommsgear" then 
                            player.hat=nil
							player.mask=nil
                        else
                            player.hat="specopscommsgear"
							player.mask="specopscommsgear"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="cheekiheavyhelmet" then
                        if player.hat=="cheekiheavyhelmet" and player.mask=="cheekiheavyhelmet" then 
                            player.hat=nil
							player.mask=nil
                        else
                            player.hat="cheekiheavyhelmet"
							player.mask="cheekiheavyhelmet"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="pmccap" then
                        if player.hat=="pmccap" then 
                            player.hat=nil
                        else
                            player.hat="pmccap"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="tacticalglasses" then
                        if player.glasses=="tacticalglasses" then 
                            player.glasses=nil
                        else
                            player.glasses="tacticalglasses"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="camocap" then
                        if player.hat=="camocap" then 
                            player.hat=nil
                        else
                            player.hat="camocap"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="lowcap" then
                        if player.hat=="lowcap" then 
                            player.hat=nil
                        else
                            player.hat="lowcap"
                        end
                        check_clothes(pped)
                        -- local obj
                        -- local model=GetHashKey("v_ret_gc_gasmask")
                        -- if not player.gasmask then
                            -- RequestModel(model)
                            -- while not HasModelLoaded(model) do Wait(0) WriteHint("You put on gasmask") end
                            -- obj=CreateObject(model, 0, 0, -199.6, true, false, false)
                            -- SetEntityCollision(obj,false,false)
                            -- AttachEntityToEntity(obj,pped,GetPedBoneIndex(pped,0x796e),
                            -- 0.05,0.079,0.02, --coords  --bag
                            -- -20.0,270.0,180.0, --rot    --bag
                            -- false, --p9
                            -- false, --soltpinning
                            -- false, --collision
                            -- true, --isped
                            -- 0, --vertexindex
                            -- true --fixedrot
                            -- )
                        -- end
                    elseif inventory[inventory.current].item=="brasscatcher" then
                        player.brasscatcher=not player.brasscatcher
                    elseif inventory[inventory.current].item=="bandage" then
                        if player.bleeding>0 or player.health<100 then
                            local myhealth=GetEntityHealth(pped)
                            myhealth=myhealth+15
                            SetEntityHealth(pped,myhealth)
                            if player.bleeding>0 then player.bleeding=player.bleeding-1 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="rags" 
					or	inventory[inventory.current].item=="scrapfabrics" 
					or	inventory[inventory.current].item=="industrialfabrics" 
					or	inventory[inventory.current].item=="milspecfabrics" 
					then
                            if player.bleeding>0 then 
                                player.bleeding=player.bleeding-1
                                inventory[inventory.current].amount=inventory[inventory.current].amount-1
                                check_inv_slot_for_zero_amount()
                            end
                    elseif inventory[inventory.current].item=="armorplate" then
                        local myarmor=GetPedArmour(pped)
                        if player.bodyarmor then
                            if myarmor<100 then
                                local newarmor=myarmor+50
                                if newarmor>100 then newarmor=100 end
                                SetPedArmour(pped,newarmor)
                                inventory[inventory.current].amount=inventory[inventory.current].amount-1
                                check_inv_slot_for_zero_amount()
                            end
                        else
                            SimpleNotification(messages.you_need_bodyarmor_to_insert_armor_plate_in)
                        end
                    elseif inventory[inventory.current].item=="level3asoftplate" then
                        local myarmor=GetPedArmour(pped)
                        if player.bodyarmor then
                            if myarmor<100 then
                                local newarmor=myarmor+13
                                if newarmor>100 then newarmor=100 end
                                SetPedArmour(pped,newarmor)
                                inventory[inventory.current].amount=inventory[inventory.current].amount-1
                                check_inv_slot_for_zero_amount()
                            end
                        else
                            SimpleNotification(messages.you_need_bodyarmor_to_insert_armor_plate_in)
                        end
                    elseif inventory[inventory.current].item=="level3plates" then
                        local myarmor=GetPedArmour(pped)
                        if player.bodyarmor then
                            if myarmor<100 then
                                local newarmor=myarmor+25
                                if newarmor>100 then newarmor=100 end
                                SetPedArmour(pped,newarmor)
                                inventory[inventory.current].amount=inventory[inventory.current].amount-1
                                check_inv_slot_for_zero_amount()
                            end
                        else
                            SimpleNotification(messages.you_need_bodyarmor_to_insert_armor_plate_in)
                        end
                    elseif inventory[inventory.current].item=="bodyarmor" then
                        player.bodyarmor=not player.bodyarmor
                        if not player.bodyarmor then
                            local armor=GetPedArmour(pped)
                            if armor==100 then
                                give_item_to_inventory("armorplate",2)
                            elseif armor>=50 then
                                give_item_to_inventory("armorplate",1)
                            end
                            SetPedArmour(pped,0)
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="radio" then
                        player.radio=not player.radio
                    elseif inventory[inventory.current].item=="clothes_marauder" then
                        if player.suit=="marauder" then
							player.suit=return_player_standard_outfit()
                        else
                            player.suit="marauder"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_scavenger" then
                        if player.suit=="scavenger" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="scavenger"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_banditauthority" then
                        if player.suit=="banditauthority" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="banditauthority"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_dawn" then
                        if player.suit=="dawn" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="dawn"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_camouflage" then
                        if player.suit=="camouflage" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="camouflage"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_offdutysheriff" then
                        if player.suit=="offdutysheriff" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="offdutysheriff"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_explorer" then
                        if player.suit=="explorer" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="explorer"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_pmc" then
                        if player.suit=="pmc" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="pmc"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_trash" then
                        if player.suit=="trash" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="trash"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_combat_green" then
                        if player.suit=="combat_green" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="combat_green"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_combat_desert" then
                        if player.suit=="combat_desert" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="combat_desert"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_loner" then
                        if player.suit=="loner" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="loner"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_mercenary" then
                        if player.suit=="mercenary" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="mercenary"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_banditgoon" then
                        if player.suit=="banditgoon" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="banditgoon"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_police" then
                        if player.suit=="police" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="police"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_banditmercenary" then
                        if player.suit=="banditmercenary" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="banditmercenary"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_riot" then
                        if player.suit=="riot" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="riot"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_smugglerslight" then
                        if player.suit=="smugglerslight" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="smugglerslight"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_toughguy" then
                        if player.suit=="toughguy" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="toughguy"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_rookie" then
                        if player.suit=="rookie" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="rookie"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_breekiscavenger" then
                        if player.suit=="breekiscavenger" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="breekiscavenger"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_combatmarauder" then
                        if player.suit=="combatmarauder" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="combatmarauder"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_mercexperimental" then
                        if player.suit=="mercexperimental" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="mercexperimental"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_merclight" then
                        if player.suit=="merclight" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="merclight"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_gunrunner" then
                        if player.suit=="gunrunner" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="gunrunner"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_smugglers" then
                        if player.suit=="smugglers" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="smugglers"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_trucker" then
                        if player.suit=="trucker" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="trucker"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_business" then
                        if player.suit=="business" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="business"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_ordinary" then
                        if player.suit=="ordinary" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="ordinary"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_gang" then
                        if player.suit=="gang" then
                            player.suit=return_player_standard_outfit()
                        else
                            player.suit="gang"
                        end
                        check_clothes(pped)
                    elseif weapon_upgrades[inventory[inventory.current].item] then
                        if use_weapon_upgrade(inventory[inventory.current].item) then
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="duffelbag" then
                        player.backpack=not player.backpack
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="tirerepair" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
                            SetVehicleTyreFixed(pveh,0)
                            SetVehicleTyreFixed(pveh,1)
                            SetVehicleTyreFixed(pveh,2)
                            SetVehicleTyreFixed(pveh,3)
                            SetVehicleTyreFixed(pveh,4)
                            SetVehicleTyreFixed(pveh,5)
                            SetVehicleTyreFixed(pveh,45)
                            SetVehicleTyreFixed(pveh,47)
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
					elseif inventory[inventory.current].item=="tattookey" or
						   inventory[inventory.current].item=="barberkey" or
						   inventory[inventory.current].item=="provisionkey" or
						   inventory[inventory.current].item=="gunstorekey" or
						   inventory[inventory.current].item=="sheriffkey" then
						local mypos=GetEntityCoords(pped)
						local handle,obj=FindFirstObject()
						local loop=(handle~=-1)
						local founddoors={}
						while loop do
							local model=GetEntityModel(obj)
							local coords=GetEntityCoords(obj)
							if doormodels[model] then
								local dx,dy,dz=math.abs(coords.x-mypos.x),math.abs(coords.y-mypos.y),math.abs(coords.z-mypos.z)
								if (dx<5.0 and dy<5.0 and dz<5.0) then
									local dword=coords_to_dword(coords.x,coords.y,coords.z)
									if not doors[dword] then
										founddoors[dword]={x=math.floor(coords.x),y=math.floor(coords.y)}
									end
								end
							end
							loop,obj=FindNextObject(handle)
						end
						EndFindObject(handle)
						
						local how_many_doors_opened=0
						for k,v in pairs(founddoors) do
							TriggerServerEvent("open_door",k,v.x,v.y)
							doors[k]=true
							how_many_doors_opened=how_many_doors_opened+1
						end
						if how_many_doors_opened>0 then
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
						end
					elseif string.find(inventory[inventory.current].item,"+") or weapon_slot[inventory[inventory.current].item] then
						local itemname=inventory[inventory.current].item
						local weaponname=itemname
						local parts
						if string.find(itemname,"+") then
							parts=split_text(itemname,"+")
							weaponname=parts[1]
							parts[1]=nil
						end
						local slot=weapon_slot[weaponname]
						if player[slot]~=itemname then --different weapons or upgrades
							local old_weaponname=player[slot]
							if old_weaponname then
								local fr=string.find(old_weaponname,"+")
								if fr then
									old_weaponname=string.sub(old_weaponname,1,fr-1)
								end
							end
							local weapon_hash=weapons[old_weaponname]
							if old_weaponname~=weaponname then
								--weapon_hash=weapons[old_weaponname]
								--if weapon_hash then
									--strip_weapon_upgrades(weapon_hash)
									RemoveAllPedWeapons(pped,false)
								--end
								player[slot]=itemname
								weapon_hash=weapons[weaponname]
								GiveWeaponToPed(pped, weapon_hash, 0, false, true) -- give weapon
								local weaponammotype=GetPedAmmoTypeFromWeapon(pped,weapon_hash)
								local ammonameininventory=ammo_name[weaponammotype]
								local inventoryslotwhereammois=get_inventory_item_slot(ammonameininventory)
								local amount=0
								if inventoryslotwhereammois then
									amount=inventory[inventoryslotwhereammois].amount
								end
								SetPedAmmoByType(pped,weaponammotype,amount)
								SetCurrentPedWeapon(pped,weapon_hash,true)
							else
								player[slot]=itemname
								weapon_hash=weapons[weaponname]
								SetCurrentPedWeapon(pped,weapon_hash,true)
								for upgrade_name,v in pairs(weapon_upgrades) do
									local upgrade_hash=v[weapon_hash]
									if upgrade_hash~=nil then
										if HasPedGotWeaponComponent(pped, weapon_hash, upgrade_hash) then
											RemoveWeaponComponentFromPed(pped, weapon_hash, upgrade_hash)
										end
									end
								end
							end
							if parts then
								for _,k in pairs(parts) do
									local v=weapon_upgrades[k]
									local upgrade_hash=v[weapon_hash]
									if upgrade_hash~=nil then
										GiveWeaponComponentToPed(pped,weapon_hash,upgrade_hash)
									end
								end
							end
						else
							local weapon_hash=weapons[weaponname]
							if weapon_hash then
								--strip_weapon_upgrades(weapon_hash)
								RemoveAllPedWeapons(pped,false)
								player[slot]=nil
							end
						end
                    end
                end
                inventory.highlight=500
            elseif IsControlJustPressed(0,214) then --INPUT_FRONTEND_DELETE
                if not IsPedInAnyVehicle(pped) and inventory.highlight>0 and inventory[inventory.current]~=nil and inventory[inventory.current].amount>0 then
                    if inventory.mode then inventory.highlight=0 end
                    amounttodrop=inventory[inventory.current].amount
                    droppingitem=true
                    while true do Wait(0)
                        if IsControlJustPressed(0,174) then
                            amounttodrop=amounttodrop-1
                            if amounttodrop<1 then amounttodrop=1 end
                        elseif IsControlJustPressed(0,175) then
                            amounttodrop=amounttodrop+1
                            if amounttodrop>inventory[inventory.current].amount then amounttodrop=inventory[inventory.current].amount end
                        elseif IsControlPressed(0,173) then
                            amounttodrop=amounttodrop-1
                            if amounttodrop<1 then amounttodrop=1 end
                        elseif IsControlPressed(0,172) then
                            amounttodrop=amounttodrop+1
                            if amounttodrop>inventory[inventory.current].amount then amounttodrop=inventory[inventory.current].amount end
                        end
                        
                        -- DrawSprite("lsm", "hand", 0.5025,0.85,inv_size_x,inv_size_y,0.0, 255, 255, 255, 255)
                        
                        -- local sprite=inventory[inventory.current].item
                        -- if sprite then DrawSprite("lsm", sprite, 0.5,0.875,inv_size_x,inv_size_y,0.0, 255, 255, 255, 255) end
                        -- DrawSprite("lsm", "arrowdown", 0.5,0.950,inv_size_x,inv_size_y,0.0, 255, 255, 255, 255)
                        -- WriteText(7,"~g~E ~c~to drop".." ~w~"..amounttodrop.."~c~/"..inventory[inventory.current].amount.." "..inventory[inventory.current].item,0.45,255,255,255,255,0.53,0.85)
                        -- WriteText(7,"~g~left ~c~and ~g~right ~c~to change amount to drop",0.35,255,255,255,255,0.53,0.89)
                        -- WriteText(7,"~g~backspace ~c~ or ~g~ RMB ~c~to cancel",0.35,255,255,255,255,0.53,0.92)
                        
                        
                        -- for i=1,45 do
                            -- WriteText(7,i.."~g~ "..string.char(i),0.25,255,255,255,255,0.3,0.0+i*0.02)
                        -- end
                        -- for i=46,90 do
                            -- WriteText(7,i.."~g~ "..string.char(i),0.25,255,255,255,255,0.4,0.0+(i-46)*0.02)
                        -- end
                        -- for i=91,135 do
                            -- WriteText(7,i.."~g~ "..string.char(i),0.25,255,255,255,255,0.5,0.0+(i-91)*0.02)
                        -- end
                        -- for i=136,136+45 do
                            -- WriteText(7,i.."~g~ "..string.char(i),0.25,255,255,255,255,0.6,0.0+(i-136)*0.02)
                        -- end
                        if IsControlJustPressed(0,86) then
                            local model=GetHashKey("prop_cs_heist_bag_02")
                            if HasModelLoaded(model) then
                                if amounttodrop<1 or amounttodrop>inventory[inventory.current].amount then amounttodrop=inventory[inventory.current].amount end
                                local mypos=GetEntityCoords(PlayerPedId())
                                local h=GetEntityHeightAboveGround(PlayerPedId())
                                -- local obj=CreateObject(model,mypos.x,mypos.y,mypos.z-.99,true,false,false)
                                -- SetEntityCollision(obj,false,false)
                                -- FreezeEntityPosition(obj,true)
                                -- DecorSetInt(obj,"item",item_name_to_index[inventory[inventory.current].item])
                                -- DecorSetInt(obj,"count",amounttodrop)
                                -- --SetObjectAsNoLongerNeeded(obj)
                                TriggerServerEvent("itemdrop",mypos.x,mypos.y,mypos.z+1-h,inventory[inventory.current].item,amounttodrop)
                                inventory[inventory.current].amount=inventory[inventory.current].amount-amounttodrop
                                check_inv_slot_for_zero_amount()
                                break
                            else
                                RequestModel(model)
                            end
                        elseif IsControlJustPressed(0,177) then --or IsControlJustPressed(0,173) then
                            break
                        end
                    end
                end
                inventory.highlight=500
			end
        else--if inventory.mode then
            if IsControlJustPressed(0,191) then
                inventory.highlight=500
            elseif IsControlJustPressed(0,177) then
                inventory.highlight=0
            end
        end
    end
end)






-- Citizen.CreateThread(function() --deprecated, all drops are server-sided now
    -- local player_peds
    -- while true do Wait(0)
        -- player_peds=get_player_peds()
        -- local handle,obj=FindFirstObject()
        -- local loop=(handle~=-1)
        -- while loop do
            -- if GetEntityModel(obj)==GetHashKey("prop_cs_heist_bag_02") then
                -- local closest,distance=closest_point(player_peds,GetEntityCoords(obj))
                -- if distance>2500 then
                    -- SetObjectAsNoLongerNeeded(obj)
                -- end
            -- end
            -- loop,obj=FindNextObject(handle)
        -- end
        -- EndFindObject(handle)
    -- end
-- end)



Citizen.CreateThread(function()
    local oldzone
    local traderblip
    local selltraderblip
    local ransackblip
    local joinfactionblip
	local extractionblip
    local vehblip
    local garageblips --table
    local clothesblip
    local changingroomblip
    local provisionblip
    local craftblip
    local storageblip
    local factionjoinblip
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        if zone~=oldzone then
            if oldzone~=nil and oldzone.name~=nil then
                if not disablehud then
                    --SimpleNotification("You left "..oldzone.name..".")
                end
                --print("you exited zone")
                --DisplayRadar(true)
				if oldzone.bliphandler then
					SetBlipDisplay(oldzone.bliphandler,2)
					--SimpleNotification("blip made visible")
				end
                FlashMinimapDisplay()
            end
            if zone~=nil then
                local enemybase
                local myfaction=GetPedRelationshipGroupHash(myped)
                
                if GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4 then
                    enemybase=false
                else
                    enemybase=true
                end
                
                
                if zone.tradepos~=nil and not zone.raided then
                    if traderblip~=nil then
                        SetBlipCoords(traderblip,zone.tradepos.x,zone.tradepos.y,zone.tradepos.z)
                    else
                        traderblip=AddBlipForCoord(zone.tradepos.x,zone.tradepos.y,zone.tradepos.z)
                        SetBlipSprite(traderblip,108)
						SetBlipDisplay(traderblip,5)
                        SetBlipColour(traderblip,2)
                        if enemybase then SetBlipColour(traderblip,55) end
                    end
                end
                if zone.sellpos~=nil and not zone.raided then
                    if selltraderblip~=nil then
                        SetBlipCoords(selltraderblip,zone.sellpos.x,zone.sellpos.y,zone.sellpos.z)
                    else
                        selltraderblip=AddBlipForCoord(zone.sellpos.x,zone.sellpos.y,zone.sellpos.z)
                        SetBlipSprite(selltraderblip,108)
						SetBlipDisplay(selltraderblip,5)
                        SetBlipColour(selltraderblip,3)
                        if enemybase then SetBlipColour(selltraderblip,55) end
                    end
                end
                if zone.ransack~=nil and not zone.raided then
                    if ransackblip~=nil then
                        SetBlipCoords(ransackblip,zone.ransack.x,zone.ransack.y,zone.ransack.z)
                    else
                        ransackblip=AddBlipForCoord(zone.ransack.x,zone.ransack.y,zone.ransack.z)
                        SetBlipSprite(ransackblip,478)
						SetBlipDisplay(ransackblip,5)
                        SetBlipColour(ransackblip,5)
                        if enemybase then SetBlipColour(ransackblip,75) end
                    end
                end
                if zone.join_faction~=nil and not zone.raided then
                    if joinfactionblip~=nil then
                        SetBlipCoords(joinfactionblip,zone.join_faction.x,zone.join_faction.y,zone.join_faction.z)
                    else
                        joinfactionblip=AddBlipForCoord(zone.join_faction.x,zone.join_faction.y,zone.join_faction.z)
                        SetBlipSprite(joinfactionblip,498)
						SetBlipDisplay(joinfactionblip,5)
                        SetBlipColour(joinfactionblip,67)
                        if enemybase then SetBlipColour(joinfactionblip,55) end
                    end
                end
                if zone.extraction~=nil and not zone.raided then
                    if extractionblip~=nil then
                        SetBlipCoords(extractionblip,zone.extraction.x,zone.extraction.y,zone.extraction.z)
                    else
                        extractionblip=AddBlipForCoord(zone.extraction.x,zone.extraction.y,zone.extraction.z)
                        SetBlipSprite(extractionblip,126)
						SetBlipDisplay(extractionblip,5)
                        SetBlipColour(extractionblip,2)
                        if enemybase then SetBlipColour(extractionblip,55) end
                    end
                end
                if zone.vehpos~=nil and not zone.raided then
                    if vehblip~=nil then
                        SetBlipCoords(vehblip,zone.vehpos.x,zone.vehpos.y,zone.vehpos.z)
                    else
                        vehblip=AddBlipForCoord(zone.vehpos.x,zone.vehpos.y,zone.vehpos.z)
                        SetBlipSprite(vehblip,225)
						SetBlipDisplay(vehblip,5)
                        SetBlipColour(vehblip,3)
                        if enemybase then SetBlipColour(vehblip,55) end
                    end
                end
                if zone.garages~=nil and not zone.raided then
					garageblips=zone.garages
					for k,v in pairs(zone.garages) do
						if v.blip~=nil then
							SetBlipCoords(v.blip,v.x,v.y,v.z)
						else
							v.blip=AddBlipForCoord(v.x,v.y,v.z)
							SetBlipSprite(v.blip,357)
							SetBlipDisplay(v.blip,5)
							SetBlipColour(v.blip,4)
							if enemybase then SetBlipColour(v.blip,55) end
						end
					end
                end
                if zone.craftpos~=nil then
                    if craftblip~=nil then
                        SetBlipCoords(craftblip,zone.craftpos.x,zone.craftpos.y,zone.craftpos.z)
                    else
                        craftblip=AddBlipForCoord(zone.craftpos.x,zone.craftpos.y,zone.craftpos.z)
                        SetBlipSprite(craftblip,402)
						SetBlipDisplay(craftblip,5)
                        SetBlipColour(craftblip,44)
                        --if enemybase then SetBlipColour(craftblip,55) end
                    end
                end
                if zone.storagepos~=nil then
                    if storageblip~=nil then
                        SetBlipCoords(storageblip,zone.storagepos.x,zone.storagepos.y,zone.storagepos.z)
                    else
                        storageblip=AddBlipForCoord(zone.storagepos.x,zone.storagepos.y,zone.storagepos.z)
                        SetBlipSprite(storageblip,408)
						SetBlipDisplay(storageblip,5)
                        SetBlipColour(storageblip,10)
                        --if enemybase then SetBlipColour(craftblip,55) end
                    end
                end
                if zone.factionjoinpos~=nil then
                    if factionjoinblip~=nil then
                        SetBlipCoords(factionjoinblip,zone.factionjoinpos.x,zone.factionjoinpos.y,zone.factionjoinpos.z)
                    else
                        factionjoinblip=AddBlipForCoord(zone.factionjoinpos.x,zone.factionjoinpos.y,zone.factionjoinpos.z)
                        SetBlipSprite(factionjoinblip,280)
						SetBlipDisplay(factionjoinblip,5)
                        SetBlipColour(factionjoinblip,18)
                    end
                end
                if zone.clothespos~=nil and not zone.raided then
                    if clothesblip~=nil then
                        SetBlipCoords(clothesblip,zone.clothespos.x,zone.clothespos.y,zone.clothespos.z)
                    else
                        clothesblip=AddBlipForCoord(zone.clothespos.x,zone.clothespos.y,zone.clothespos.z)
                        SetBlipSprite(clothesblip,366)
						SetBlipDisplay(clothesblip,5)
                        SetBlipColour(clothesblip,4)
                        if enemybase then SetBlipColour(clothesblip,55) end
                    end
                end
                if zone.changingroompos~=nil and not zone.raided then
                    if changingroomblip~=nil then
                        SetBlipCoords(changingroomblip,zone.changingroompos.x,zone.changingroompos.y,zone.changingroompos.z)
                    else
                        changingroomblip=AddBlipForCoord(zone.changingroompos.x,zone.changingroompos.y,zone.changingroompos.z)
                        SetBlipSprite(changingroomblip,73)
						SetBlipDisplay(changingroomblip,5)
                        SetBlipColour(changingroomblip,4)
                        if enemybase then SetBlipColour(changingroomblip,55) end
                    end
                end
                if zone.provisionpos~=nil and not zone.raided then
                    if provisionblip~=nil then
                        SetBlipCoords(provisionblip,zone.provisionpos.x,zone.provisionpos.y,zone.provisionpos.z)
                    else
                        provisionblip=AddBlipForCoord(zone.provisionpos.x,zone.provisionpos.y,zone.provisionpos.z)
                        SetBlipSprite(provisionblip,52)
						SetBlipDisplay(provisionblip,5)
                        SetBlipColour(provisionblip,5)
                        if enemybase then SetBlipColour(provisionblip,55) end
                    end
                end
                if zone.name~=nil then
                    if not disablehud then
                        --SimpleNotification("You entered "..zone.name..".")
                    end
                    --print("you entered zone")
					if zone.bliphandler then
						SetBlipDisplay(zone.bliphandler,0)
					end
                    FlashMinimapDisplay()
                    if lsm_random_spawn==0 and zone.spawnpos.x and zone.spawnpos.y and zone.spawnpos.z then
                        SimpleNotification("Now you respawn at ~a~.",zone.name)
                        SetResourceKvpFloat("x",zone.spawnpos.x)
                        SetResourceKvpFloat("y",zone.spawnpos.y)
                        SetResourceKvpFloat("z",zone.spawnpos.z)
                        
                        SetResourceKvpInt("pedmodel",GetEntityModel(myped))
                    end
					if zone.tradelistname then TriggerServerEvent("request_trade_table",zone.tradelistname) end
                end
            else
                if traderblip~=nil then
                    RemoveBlip(traderblip)
                    traderblip=nil
                end
                if selltraderblip~=nil then
                    RemoveBlip(selltraderblip)
                    selltraderblip=nil
                end
                if ransackblip~=nil then
                    RemoveBlip(ransackblip)
                    ransackblip=nil
                end
                if joinfactionblip~=nil then
                    RemoveBlip(joinfactionblip)
                    joinfactionblip=nil
                end
                if extractionblip~=nil then
                    RemoveBlip(extractionblip)
                    extractionblip=nil
                end
                if vehblip~=nil then
                    RemoveBlip(vehblip)
                    vehblip=nil
                end
                if garageblips~=nil then
					for k,v in pairs(garageblips) do
						if v.blip then
							RemoveBlip(v.blip)
							v.blip=nil
						end
					end
					garageblips=nil
                end
                if craftblip~=nil then
                    RemoveBlip(craftblip)
                    craftblip=nil
                end
                if storageblip~=nil then
                    RemoveBlip(storageblip)
                    storageblip=nil
                end
                if factionjoinblip~=nil then
                    RemoveBlip(factionjoinblip)
                    factionjoinblip=nil
                end
                if clothesblip~=nil then
                    RemoveBlip(clothesblip)
                    clothesblip=nil
                end
                if changingroomblip~=nil then
                    RemoveBlip(changingroomblip)
                    changingroomblip=nil
                end
                if provisionblip~=nil then
                    RemoveBlip(provisionblip)
                    provisionblip=nil
                end
            end
        else
            if zone~=nil then
                local enemybase
                local myfaction=GetPedRelationshipGroupHash(myped)
                
                if GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4 then
                    enemybase=false
                else
                    enemybase=true
                end
                if zone.vehpos~=nil and not zone.raided and not enemybase then
                    DrawMarker(20, zone.vehpos.x, zone.vehpos.y, zone.vehpos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    100, 150, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.garages~=nil and not zone.raided and not enemybase then
					for k,v in pairs(zone.garages) do
						DrawMarker(20, v.x, v.y, v.z, 
						0.0, 0.0, 0.0, --dir
						0.0, 0.0, 0.0, --rot
						1.0, 1.0, -1.0, --scl
						100, 150, 255, 200, 
						true, false, 2, true, 0, 0, false)
					end
                end
                if zone.craftpos~=nil then
                    DrawMarker(20, zone.craftpos.x, zone.craftpos.y, zone.craftpos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 200, 50, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.storagepos~=nil then
                    DrawMarker(20, zone.storagepos.x, zone.storagepos.y, zone.storagepos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 200, 50, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.tradepos~=nil and not zone.raided and not enemybase then
                    DrawMarker(29, zone.tradepos.x, zone.tradepos.y, zone.tradepos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, 1.0, --scl
                    100, 255, 100, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.sellpos~=nil and not zone.raided and not enemybase then
                    DrawMarker(29, zone.sellpos.x, zone.sellpos.y, zone.sellpos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, 1.0, --scl
                    100, 100, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.ransack~=nil and not zone.raided and enemybase then
                    DrawMarker(20, zone.ransack.x, zone.ransack.y, zone.ransack.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 100, 100, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.join_faction~=nil and not zone.raided and not enemybase then
                    DrawMarker(20, zone.join_faction.x, zone.join_faction.y, zone.join_faction.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    100, 100, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.extraction~=nil and not zone.raided and not enemybase then
					DrawMarker(20, zone.extraction.x, zone.extraction.y, zone.extraction.z, 
					0.0, 0.0, 0.0, --dir
					0.0, 0.0, 0.0, --rot
					0.6, 0.6, -0.6, --scl
					150, 255, 175, 200, 
					true, false, 2, true, 0, 0, false)
                end
                if zone.clothespos~=nil and not zone.raided and not enemybase then
                    DrawMarker(20, zone.clothespos.x, zone.clothespos.y, zone.clothespos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 255, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.changingroompos~=nil and not zone.raided and not enemybase then
                    DrawMarker(20, zone.changingroompos.x, zone.changingroompos.y, zone.changingroompos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 255, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.provisionpos~=nil and not zone.raided and not enemybase then
                    DrawMarker(20, zone.provisionpos.x, zone.provisionpos.y, zone.provisionpos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 255, 100, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.factionjoinpos~=nil and not zone.raided and not enemybase then
                    DrawMarker(20, zone.factionjoinpos.x, zone.factionjoinpos.y, zone.factionjoinpos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    50, 200, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
            end
        end
        oldzone=zone
    end
end)

Citizen.CreateThread(function()
	local cool_zombie_anims=true
	local zombie_loop=true
	RegisterCommand("coolanims",function(source,args,raw)
		cool_zombie_anims=not cool_zombie_anims
		print(cool_zombie_anims and "cool_zombie_anims enabled" or "cool_zombie_anims disabled")
	end,false)
	RegisterCommand("zombanims",function(source,args,raw)
		cool_zombie_anims=not cool_zombie_anims
		print(cool_zombie_anims and "cool_zombie_anims enabled" or "cool_zombie_anims disabled")
	end,false)
	RegisterCommand("zombloop",function(source,args,raw)
		zombie_loop=not zombie_loop
		print(zombie_loop and "zombie_loop enabled" or "zombie_loop disabled")
	end,false)
	
    SetAllRandomPedsFlee(PlayerId(),false)
    
    _,survivor_hash=AddRelationshipGroup("SURVIVOR")
    _,bandit_hash=AddRelationshipGroup("BANDIT")
    _,government_hash=AddRelationshipGroup("GOVERNMENT")
    _,raider_hash=AddRelationshipGroup("RAIDER")
    _,neutral_hash=AddRelationshipGroup("NEUTRAL")
    _,dawn_hash=AddRelationshipGroup("DAWN")
    _,marauder_hash=AddRelationshipGroup("MARAUDER")
    _,merc_hash=AddRelationshipGroup("MERC")
    _,military_hash=AddRelationshipGroup("MILITARY")
    _,smugglers_hash=AddRelationshipGroup("SMUGGLERS")
	_,hero_hash=AddRelationshipGroup("HERO")
	_,vigilante_hash=AddRelationshipGroup("VIGILANTE")
	_,guerilla_hash=AddRelationshipGroup("GUERILLA")
    _,outlaw_hash=AddRelationshipGroup("OUTLAW")
    _,renegade_hash=AddRelationshipGroup("RENEGADE")
    
    -- 5 shoot on sight
    -- 4 shoot when shoulder them or aim or shoot
    -- 3 shoot when shoulder them or aim or shoot
    -- 2 shoot when shoulder them or aim or shoot
    -- 1 nothing
    -- 0 nothing
    
    -------------------
	
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("COUGAR"), GetHashKey("SMUGGLERS"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("SHARK"), GetHashKey("SMUGGLERS"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUARD_DOG"), GetHashKey("SMUGGLERS"))
	
	
	
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(0, GetHashKey("SURVIVOR"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(3, GetHashKey("SURVIVOR"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(3, GetHashKey("SURVIVOR"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(3, GetHashKey("SURVIVOR"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(3, GetHashKey("SURVIVOR"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(3, GetHashKey("SURVIVOR"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(2, GetHashKey("SURVIVOR"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("SURVIVOR"), GetHashKey("SMUGGLERS"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(0, GetHashKey("BANDIT"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(3, GetHashKey("BANDIT"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(3, GetHashKey("BANDIT"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(3, GetHashKey("BANDIT"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(3, GetHashKey("BANDIT"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(3, GetHashKey("BANDIT"), GetHashKey("SMUGGLERS"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("RENEGADE"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(0, GetHashKey("GOVERNMENT"), GetHashKey("COP"))
    SetRelationshipBetweenGroups(0, GetHashKey("COP"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(0, GetHashKey("GOVERNMENT"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(3, GetHashKey("GOVERNMENT"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(3, GetHashKey("GOVERNMENT"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(3, GetHashKey("GOVERNMENT"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(2, GetHashKey("GOVERNMENT"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(2, GetHashKey("GOVERNMENT"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("SMUGGLERS"))
    
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(0, GetHashKey("RAIDER"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("COP"))
    SetRelationshipBetweenGroups(5, GetHashKey("COP"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("RAIDER"), GetHashKey("SMUGGLERS"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(0, GetHashKey("MERC"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(3, GetHashKey("MERC"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("COP"))
    SetRelationshipBetweenGroups(5, GetHashKey("COP"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(3, GetHashKey("MERC"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(3, GetHashKey("MERC"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(3, GetHashKey("MERC"), GetHashKey("SMUGGLERS"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("NEUTRAL"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(3, GetHashKey("NEUTRAL"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(3, GetHashKey("NEUTRAL"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(1, GetHashKey("NEUTRAL"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(1, GetHashKey("NEUTRAL"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(1, GetHashKey("NEUTRAL"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(1, GetHashKey("NEUTRAL"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(1, GetHashKey("NEUTRAL"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(1, GetHashKey("NEUTRAL"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("SMUGGLERS"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(3, GetHashKey("DAWN"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(3, GetHashKey("DAWN"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(3, GetHashKey("DAWN"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(0, GetHashKey("DAWN"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(3, GetHashKey("DAWN"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(3, GetHashKey("DAWN"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(4, GetHashKey("DAWN"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("DAWN"), GetHashKey("SMUGGLERS"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(3, GetHashKey("MARAUDER"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("SMUGGLERS"))
	
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(3, GetHashKey("MILITARY"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(3, GetHashKey("MILITARY"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(0, GetHashKey("MILITARY"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(4, GetHashKey("MILITARY"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("MILITARY"), GetHashKey("SMUGGLERS"))
	

    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("HERO"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("HERO"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("HERO"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(2, GetHashKey("HERO"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("HERO"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("HERO"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(3, GetHashKey("HERO"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(3, GetHashKey("HERO"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(1, GetHashKey("HERO"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(4, GetHashKey("HERO"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(1, GetHashKey("HERO"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(1, GetHashKey("HERO"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(1, GetHashKey("HERO"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(1, GetHashKey("HERO"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(1, GetHashKey("HERO"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("HERO"), GetHashKey("SMUGGLERS"))
	

    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(5, GetHashKey("VIGILANTE"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("VIGILANTE"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("VIGILANTE"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(2, GetHashKey("VIGILANTE"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("VIGILANTE"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("VIGILANTE"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(3, GetHashKey("VIGILANTE"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(3, GetHashKey("VIGILANTE"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(1, GetHashKey("VIGILANTE"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("VIGILANTE"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(1, GetHashKey("VIGILANTE"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(1, GetHashKey("VIGILANTE"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(1, GetHashKey("VIGILANTE"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(1, GetHashKey("VIGILANTE"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(1, GetHashKey("VIGILANTE"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("VIGILANTE"), GetHashKey("SMUGGLERS"))
	

    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUERILLA"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUERILLA"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUERILLA"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUERILLA"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(4, GetHashKey("GUERILLA"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("GUERILLA"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(1, GetHashKey("GUERILLA"), GetHashKey("SMUGGLERS"))
	

    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("OUTLAW"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("OUTLAW"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("OUTLAW"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("OUTLAW"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("OUTLAW"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("OUTLAW"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("OUTLAW"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(1, GetHashKey("OUTLAW"), GetHashKey("SMUGGLERS"))
	
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("RENEGADE"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(1, GetHashKey("RENEGADE"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(1, GetHashKey("RENEGADE"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(1, GetHashKey("RENEGADE"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(1, GetHashKey("RENEGADE"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(1, GetHashKey("RENEGADE"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(1, GetHashKey("RENEGADE"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(5, GetHashKey("RENEGADE"), GetHashKey("SMUGGLERS"))
	
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("SMUGGLERS"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(3, GetHashKey("SMUGGLERS"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(3, GetHashKey("SMUGGLERS"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(3, GetHashKey("SMUGGLERS"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("MILITARY"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("HERO"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("VIGILANTE"))
    SetRelationshipBetweenGroups(1, GetHashKey("SMUGGLERS"), GetHashKey("GUERILLA"))
    SetRelationshipBetweenGroups(1, GetHashKey("SMUGGLERS"), GetHashKey("OUTLAW"))
    SetRelationshipBetweenGroups(5, GetHashKey("SMUGGLERS"), GetHashKey("RENEGADE"))
    SetRelationshipBetweenGroups(0, GetHashKey("SMUGGLERS"), GetHashKey("SMUGGLERS"))
   
    -------------------
    
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("HATES_PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("HATES_PLAYER"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("HATES_PLAYER"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("HATES_PLAYER"))
    
    SetRelationshipBetweenGroups(2, GetHashKey("PLAYER"), GetHashKey("MISSION2"))
    SetRelationshipBetweenGroups(2, GetHashKey("MISSION2"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("HATES_PLAYER"), GetHashKey("MISSION2"))
    SetRelationshipBetweenGroups(5, GetHashKey("MISSION2"), GetHashKey("HATES_PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MISSION2"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("MISSION2"))
    
    SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("MISSION3"))
    SetRelationshipBetweenGroups(0, GetHashKey("MISSION3"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(0, GetHashKey("MISSION3"), GetHashKey("MISSION3"))
    SetRelationshipBetweenGroups(5, GetHashKey("HATES_PLAYER"), GetHashKey("MISSION3"))
    SetRelationshipBetweenGroups(5, GetHashKey("MISSION3"), GetHashKey("HATES_PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MISSION3"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("MISSION3"))
    
    
    
    for k,v in pairs(movementclipsets) do
        RequestAnimSet(v.anim)
        while not HasAnimSetLoaded(v.anim) do Wait(0) end
    end
    local loop,handle,ped,pped,ppos,player_peds,survivors
    local zpos,zombie_type,clipset,target,distance
    local zone
    local timestamp
    local last_timestamp=0
    local filter_mode=true
    local filter=0
    local maxfilter=0x7F00
    local function zombie_refresh()--needs ped, must be zombie and not dead
        SetPedCombatRange(ped,2)
        --SetPedSeeingRange(ped, 100.0)
        --SetPedHearingRange(ped, 100.0)
        --SetPedCombatAttributes(ped, 0, false)
        --SetPedCombatAttributes(ped, 1, true)
        --SetPedCombatAttributes(ped, 2, true)
        --SetPedCombatAttributes(ped, 3, true)
        SetPedCombatAttributes(ped, 5, true)
        SetPedCombatAttributes(ped, 16, true)
        SetPedCombatAttributes(ped, 17, false)
        SetPedCombatAttributes(ped, 46, true)
        SetPedCombatAttributes(ped, 1424, false)
        SetPedFleeAttributes(ped, 0, 0);
    end
    local function TaskWanderInArea(ped,x,y,z,r,d,t)
        Citizen.InvokeNative(0xE054346CA3A0F315,ped,x,y,z,r,d,t)
    end
    local function raider_think() --need ped, zpos and zone
        if zone==nil then
            if IsPedUsingAnyScenario(ped) then TaskGuardCurrentPosition(ped, 35.1, 35.1, true) end
        elseif zone.guard and not GetIsTaskActive(ped,342) then
            --TaskGuardCurrentPosition(ped, 35.1, 35.1, true)
            -- if not GetIsTaskActive(ped,222) then
                -- local pedpos=GetEntityCoords(ped)
                -- TaskWanderInArea(ped, pedpos.x, pedpos.y, pedpos.z, math.random(20,50)+0.1, math.random(10,30)+0.1, math.random(1,4)+0.1);
            -- end 
            if not GetIsTaskActive(ped,221) then
                TaskWanderStandard(ped, 9.9+0.1, 10);
            end
        elseif zone.goto_center and not GetIsTaskActive(ped,342) then
            if math.abs(zpos.x-zone.x)+math.abs(zpos.y-zone.y)<30.0 then
                --TaskGuardCurrentPosition(ped, 35.1, 35.1, true)
                if not GetIsTaskActive(ped,222) then
                    TaskWanderInArea(ped, zone.x, zone.y, zone.z, math.random(20,50)+0.1, math.random(1,30)+0.1, math.random(1,8)+0.1)
                end
            elseif zone.object~=nil then
                TaskGoToEntity(ped, zone.object, -1, 5.1, 2.0, 1073741824, 0)
            else
                TaskGoToCoordAnyMeans(ped, zone.x, zone.y, zone.z, 1.5+.5, 0, 0, 786603, 0xbf800000)
                -- TaskGoToCoordAndAimAtHatedEntitiesNearCoord(
                -- ped, 
                -- zone.x, zone.y, zone.z, 
                -- 0.0, 0.0, 0.0, 
                -- 2.5-.5, 
                -- true, 
                -- 10.5-.5, 
                -- 0.0, 
                -- true, 
                -- -1, 
                -- 1, 
                -- GetHashKey("FullAuto"));
            end
        end
    end
    local function zombie_init()--needs ped and zpos
        -- if GetPedType(ped)==6 then --cops
            -- DecorSetBool(ped,"raider",true)
        -- else
		if math.abs(zpos.x)+math.abs(zpos.y)+math.abs(zpos.z)<2.0 then return false end
        if IsPedHuman(ped) then
            zone=is_in_safe_zone(zpos.x,zpos.y,zpos.z)
            if zone==nil or zone.relationship==nil then
				if GetEntityModel(ped)==1885233650 then
					--local pedpos=GetEntityCoords(ped)
					--SimpleNotification("~r~ERROR 69! ~s~POS: ~1~, ~1~, ~1~",pedpos.x,pedpos.y,pedpos.z)
                    DecorSetBool(ped,"raider",true)
                    if IsPedUsingAnyScenario(ped) then ClearPedTasksImmediately(ped) end
					local fac=math.random(1,6)
					if fac==1 then
						SetPedRelationshipGroupHash(ped,GetHashKey("BANDIT"))
                        change_clothes(ped,suits.banditgoon_npc)
					elseif fac==2 then
						SetPedRelationshipGroupHash(ped,GetHashKey("SURVIVOR"))
                        change_clothes(ped,suits.scavenger_npc)
					elseif fac==3 then
						SetPedRelationshipGroupHash(ped,GetHashKey("GOVERNMENT"))
                        change_clothes(ped,suits.riot_npc)
					elseif fac==4 then
						SetPedRelationshipGroupHash(ped,GetHashKey("MERC"))
                        change_clothes(ped,suits.combat_desert_npc)
					elseif fac==5 then
						SetPedRelationshipGroupHash(ped,GetHashKey("MILITARY"))
                        change_clothes(ped,suits.pmc_npc)
					elseif fac==6 then
						SetPedRelationshipGroupHash(ped,GetHashKey("SMUGGLERS"))
                        change_clothes(ped,suits.smugglers_npc)
					end
                    SetPedCombatAttributes(ped, 0, true)
                    SetPedCombatAttributes(ped, 1, true)
                    SetPedCombatAttributes(ped, 2, true)
                    SetPedCombatAttributes(ped, 3, true)
                    SetPedCombatAttributes(ped, 5, true)
                    SetPedCombatAttributes(ped, 46, true)
                    SetPedCombatAttributes(ped, 1424, true)
                    SetPedFleeAttributes(ped, 0, 0);
                    SetPedFleeAttributes(ped, 1, 0)
                    SetPedFleeAttributes(ped, 2, 0)
                    SetPedFleeAttributes(ped, 4, 0)
                    SetPedFleeAttributes(ped, 8, 0)
                    SetPedFleeAttributes(ped, 16, 0)
                    SetPedFleeAttributes(ped, 32, 0)
                    SetPedFleeAttributes(ped, 64, 0)
                    local warray=weaponsarray.raiders
                    local randomweapon=math.random(1,#warray)
                    GiveWeaponToPed(ped, warray[randomweapon], math.random(1,5000), false, true)
                elseif IsPedInAnyHeli(ped) or IsPedInAnyPlane(ped) then --loners
                    DecorSetBool(ped,"raider",true)
                    if IsPedUsingAnyScenario(ped) then ClearPedTasksImmediately(ped) end
					local fac=math.random(1,3)
					if fac==1 then
						SetPedRelationshipGroupHash(ped,GetHashKey("BANDIT"))
					elseif fac==2 then
						SetPedRelationshipGroupHash(ped,GetHashKey("SURVIVOR"))
					elseif fac==3 then
						SetPedRelationshipGroupHash(ped,GetHashKey("RAIDER"))
					end
                    SetPedCombatAttributes(ped, 0, true)
                    SetPedCombatAttributes(ped, 1, true)
                    SetPedCombatAttributes(ped, 2, true)
                    SetPedCombatAttributes(ped, 3, true)
                    SetPedCombatAttributes(ped, 5, true)
                    SetPedCombatAttributes(ped, 46, true)
                    SetPedCombatAttributes(ped, 1424, true)
                    SetPedFleeAttributes(ped, 0, 0);
                    SetPedFleeAttributes(ped, 1, 0)
                    SetPedFleeAttributes(ped, 2, 0)
                    SetPedFleeAttributes(ped, 4, 0)
                    SetPedFleeAttributes(ped, 8, 0)
                    SetPedFleeAttributes(ped, 16, 0)
                    SetPedFleeAttributes(ped, 32, 0)
                    SetPedFleeAttributes(ped, 64, 0)
                    local warray=weaponsarray.raiders
                    local randomweapon=math.random(1,#warray)
                    GiveWeaponToPed(ped, warray[randomweapon], math.random(1,5000), false, true)
                else --zombie
                    SetPedRagdollBlockingFlags(ped,1)
                    SetPedCanRagdollFromPlayerImpact(ped,false)
                    SetPedSuffersCriticalHits(ped,false)
                    SetPedMaxHealth(ped,200)
                    SetEntityHealth(ped,200)
                    SetPedArmour(ped,225)
                    DecorSetInt(ped,"zm_health",GetEntityHealth(ped))
                    DecorSetInt(ped,"zm_armor",GetPedArmour(ped))
                    zombie_type=math.abs(math.floor(zpos.x+zpos.y*5+zpos.z*7))%#randomclipsets+1
                    DecorSetInt(ped,"zombie_type",zombie_type)
                    DecorSetInt(ped,"zombie_random",math.abs(math.floor(zpos.x+zpos.y*5+zpos.z*7))%100)
                    clipset=randomclipsets[zombie_type]
                    SetPedEnableWeaponBlocking(ped, true)
                    DisablePedPainAudio(ped, true)
                    SetPedMute(ped)
                    SetPedRelationshipGroupHash(ped,GetHashKey("AGGRESSIVE_INVESTIGATE"))
                    SetBlockingOfNonTemporaryEvents(ped, 1)
                    SetPedCombatRange(ped,2)
                    SetPedSeeingRange(ped, 99.9+.1)
                    SetPedHearingRange(ped, 99.9+.1)
                    SetPedCombatAttributes(ped, 0, false)
                    SetPedCombatAttributes(ped, 1, true)
                    SetPedCombatAttributes(ped, 2, true)
                    SetPedCombatAttributes(ped, 3, true)
                    SetPedCombatAttributes(ped, 5, true)
                    SetPedCombatAttributes(ped, 16, true)
                    SetPedCombatAttributes(ped, 17, false)
                    SetPedCombatAttributes(ped, 46, true)
                    SetPedCombatAttributes(ped, 1424, false)
                    -- SetPedConfigFlag(ped, 281, true);
                    -- SetPedRagdollBlockingFlags(ped, 1);
                    
                    -- SetPedCombatAttributes(ped, 16, 1)
                    -- SetPedCombatAttributes(ped, 17, 0)
                    -- SetPedCombatAttributes(ped, 46, 1)
                    -- SetPedCombatAttributes(ped, 1424, 0)
                    -- SetPedCombatAttributes(ped, 5, 1)
                    -- TaskWanderStandard(ped, 0.9+1.0, 10)
                    
                    SetPedFleeAttributes(ped, 0, 0);
                    
                    SetPedFleeAttributes(ped, 1, 0)
                    SetPedFleeAttributes(ped, 2, 0)
                    SetPedFleeAttributes(ped, 4, 0)
                    SetPedFleeAttributes(ped, 8, 0)
                    SetPedFleeAttributes(ped, 16, 0)
                    SetPedFleeAttributes(ped, 32, 0)
                    SetPedFleeAttributes(ped, 64, 0)
                    --SetEntityMaxSpeed(ped,0.1)
                    --ForcePedMotionState(ped, GetHashKey("motionstate_walk"));
                    TaskGoToEntity(ped, target, -1, 0.1, clipset.speed, 1073741824, 0)
                    RequestAnimSet(clipset.anim)
                    if HasAnimSetLoaded(clipset.anim) then
                        SetPedMovementClipset(ped,clipset.anim,clipset.speed)
                        ApplyPedDamagePack(ped, "SCR_Torture", 10.0, 10.0)
                    end
                    RemoveAllPedWeapons(ped,false)
                end
            else --safezone / raids
                if GetEntityModel(ped)==1885233650 then --freemode male
                    if zone.relationship==nil then
                        change_clothes(ped,suits.standard)
                    elseif zone.relationship==GetHashKey("SURVIVOR") then
                        local rand=math.random(1,100)
                        if rand<15 then
                            change_clothes(ped,suits.offdutysheriff_npc)
                        elseif rand<50 then
                            change_clothes(ped,suits.camouflage_npc)
                        else
                            change_clothes(ped,suits.scavenger_npc)
                        end
                    elseif zone.relationship==GetHashKey("BANDIT") then
                        local rand=math.random(1,100)
                        if rand<15 then
                            change_clothes(ped,suits.banditauthority_npc)
                        elseif rand<50 then
                            change_clothes(ped,suits.marauder_npc)
                        else
                            change_clothes(ped,suits.banditgoon_npc)
                        end
                    elseif zone.relationship==GetHashKey("SMUGGLERS") then
                        local rand=math.random(1,100)
                        if rand<50 then
                            change_clothes(ped,suits.smugglers_npc)
                        else
                            change_clothes(ped,suits.smugglerslight_npc)
                        end
                    elseif zone.relationship==GetHashKey("MERC") then
						change_clothes(ped,suits.combat_desert_npc)
                    elseif zone.relationship==GetHashKey("GOVERNMENT") then
                        change_clothes(ped,suits.riot_npc)
                    elseif zone.relationship==GetHashKey("DAWN") then
                        change_clothes(ped,suits.dawn_npc)
                    end
                end
                DecorSetBool(ped,"raider",true)   
                if math.random(1,8)==1 then
                    DecorSetInt(ped,"questnpc",math.random(1,1000000))
                end                             
                if IsPedUsingAnyScenario(ped) then ClearPedTasksImmediately(ped) end
                --TaskGuardCurrentPosition(ped, 5.0, 5.0, true);
                -- if GetPedRelationshipGroupHash(ped)==GetHashKey("COP") then
                    -- --SetEntityHealth(ped,-1)
                    -- --ExplodePedHead(ped,GetHashKey("WEAPON_PISTOL"))
                    
                -- end
                SetPedRelationshipGroupHash(ped,zone.relationship)
                --SetEntityCoords(ped,zone.x, zone.y, zone.z)
                --if zone.guard then TaskWanderInArea(ped, zone.x, zone.y, zone.z, zone.r, 3.0, 5.0); end
                --TaskGuardCurrentPosition(ped, 5.1, 5.1, true); 
                raider_think()
                SetPedSeeingRange(ped,100.1)
                SetPedCombatAttributes(ped, 0, true)
                SetPedCombatAttributes(ped, 1, true)
                SetPedCombatAttributes(ped, 2, true)
                SetPedCombatAttributes(ped, 3, true)
                SetPedCombatAttributes(ped, 5, true)
                SetPedCombatAttributes(ped, 46, true)
                SetPedCombatAttributes(ped, 1424, true)
                SetPedFleeAttributes(ped, 0, 0);
                SetPedFleeAttributes(ped, 1, 0)
                SetPedFleeAttributes(ped, 2, 0)
                SetPedFleeAttributes(ped, 4, 0)
                SetPedFleeAttributes(ped, 8, 0)
                SetPedFleeAttributes(ped, 16, 0)
                SetPedFleeAttributes(ped, 32, 0)
                SetPedFleeAttributes(ped, 64, 0)
                RemoveAllPedWeapons(ped,false)
                local warray=zone.weapons
                if warray then
                    local randomweapon=math.random(1,#warray)
                    GiveWeaponToPed(ped, warray[randomweapon], 5000, false, true)
                    SetPedCanSwitchWeapon(ped,false)
                end
                
            end
            SetPedConfigFlag(ped,281,true)
        end
    end
    local function get_survivors()
        survivors={}
        local count=0
        local handle,ped=FindFirstPed()
        local loop=(handle~=-1)
        while loop do
            if IsPedHuman(ped) and not IsPedDeadOrDying(ped) then
                if IsPedAPlayer(ped) or DecorExistOn(ped,"raider") then
                    survivors[ped]=GetEntityCoords(ped)
                    count=count+1
                end
            end
            loop,ped=FindNextPed(handle)
        end
        EndFindPed(handle)
        if count==0 then
            handle,ped=FindFirstPed()
            loop=(handle~=-1)
            while loop do
                if IsPedHuman(ped) then
                    if IsPedAPlayer(ped) or DecorExistOn(ped,"raider") then
                        survivors[ped]=GetEntityCoords(ped)
                        count=count+1
                    end
                end
                loop,ped=FindNextPed(handle)
            end
            EndFindPed(handle)
            -- if count==0 then
                -- handle,ped=FindFirstPed()
                -- loop=(handle~=-1)
                -- while loop do
                    -- if IsPedAPlayer(ped) or DecorExistOn(ped,"raider") then
                        -- survivors[ped]=GetEntityCoords(ped)
                        -- count=count+1
                    -- end
                    -- loop,ped=FindNextPed(handle)
                -- end
                -- EndFindPed(handle)
            -- end
        end
    end
    local damageticks=0
    -- Citizen.CreateThread(function()
        -- while true do
            -- if damageticks>0 then
                -- damageticks=damageticks-1
                -- WriteHint("YOU ARE TAKING DAMAGE FROM ZOMBIE")
            -- end
            -- Wait(0)
        -- end
    -- end)
    local function zombie_attack()--needs ped, zpos, player_peds
        --target,distance=closest_point(player_peds,zpos)
        target,distance=closest_point(survivors,zpos)
        --distance is squared
        -- if distance<9.0 then
            -- damageticks=300
            -- --damageticks=damageticks+1
            -- --if damageticks%50==0 then
                -- local myped=PlayerPedId()
                -- local myhealth=GetEntityHealth(myped)
                -- SetEntityHealth(myped,myhealth-1)
            -- --end
        -- end
        if distance>500.0 then --25m
            -- if IsPedInAnyVehicle(ped,false) then
                -- SetEntityHealth(ped,0)
            -- end
            zombie_type=DecorGetInt(ped,"zombie_type")
            clipset=randomclipsets[zombie_type]
            --clipset=movementclipsets.limper        
            RequestAnimSet(clipset.anim)
            if HasAnimSetLoaded(clipset.anim) then
                SetPedMovementClipset(ped,clipset.anim,clipset.speed)
            end
            TaskGoToEntity(ped, target, -1, 1.0, clipset.speed, 1073741824, 0)
        elseif distance>1.5 then 
            -- if IsPedInAnyVehicle(ped,false) then
                -- SetEntityHealth(ped,0)
            -- end
            zombie_type=DecorGetInt(ped,"zombie_type")
            clipset=randomclipsets[zombie_type]
            --clipset=movementclipsets.limper        
            RequestAnimSet(clipset.anim)
            --WriteHint("~g~ZOMBIE CLOSE ZOMBIE CLOSE ZOMBIE CLOSE ZOMBIE CLOSE ")
            if (DecorGetInt(ped,"zombie_random")<5) then
                if HasAnimSetLoaded(clipset.anim) then
                    SetPedMovementClipset(ped,clipset.anim,2.0)
                end
                TaskGoToEntity(ped, target, -1, 1.0, 2.0, 1073741824, 0)
            else
                if HasAnimSetLoaded(clipset.anim) then
                    SetPedMovementClipset(ped,clipset.anim,clipset.speed)
                end
                TaskGoToEntity(ped, target, -1, 1.0, clipset.speed, 1073741824, 0)
            end
        else
            --ClearPedSecondaryTask(ped)
            --ClearPedTasksImmediately(ped)
            --SetBlockingOfNonTemporaryEvents(ped, 1)
            TaskSetBlockingOfNonTemporaryEvents(ped, 1)
            --TaskCombatPed(ped, target, 0, 16);
            if not IsPedRagdoll(ped) and not IsPedGettingUp(ped) and not IsPedBeingStealthKilled(ped) and not IsPedBeingStunned(ped,0) and not IsPedInMeleeCombat(ped) then
            
                local dict="melee@unarmed@streamed_core_fps"--"melee@thrown@streamed_core" 
                local anim="running_shove"--"plyr_takedown_rear"
                
                local dictlow="melee@unarmed@streamed_core_fps"
                local animlow="ground_attack_0_psycho"
                
                if not IsEntityPlayingAnim(ped,dict,anim,3) and not IsEntityPlayingAnim(ped,dictlow,animlow,3) then
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do Wait(0) end
                    RequestAnimDict(dictlow)
                    while not HasAnimDictLoaded(dictlow) do Wait(0) end
                    ClearPedTasksImmediately(ped)
                    --TaskLookAtEntity(ped, target, 1000, 2048, 3);
                    --SetPedPrimaryLookat(ped,target)
                    --if not IsPedRagdoll(target) and not IsPedGettingUp(target) then
                        TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 48, 0.001, false, false, false)
                        ApplyDamageToPed(target, 20, false);
                        --SetHighFallTask(target, 3000, -1, -1)
                    -- else
                        -- ResetPedRagdollTimer(target)
                        -- ApplyDamageToPed(target, 5, false);
                        -- TaskPlayAnim(ped, dictlow, animlow, 8.0, 1.0, -1, 1, 0.001, false, false, false)
                        -- SetPedToRagdoll(target, 3000, 3000, 0, false, false, false);
                    -- end
                    --SetPedToRagdoll(target, 1000, 1000, 2, false, false, false);
                else
                    --SetHighFallTask(ped, 5000, -1, -1)
                end
            end
            
            TaskGetOffBoat(ped,nil)
            zombie_type=DecorGetInt(ped,"zombie_type")
            clipset=randomclipsets[zombie_type]
            --clipset=movementclipsets.limper        
            RequestAnimSet(clipset.anim)
            if HasAnimSetLoaded(clipset.anim) then
                SetPedMovementClipset(ped,clipset.anim,clipset.speed)
            end
        end
    end
    while true do
        timestamp=GetGameTimer()
        pped=PlayerPedId()
        ppos=GetEntityCoords(pped)
		if zombie_loop then
        if filter_mode then
            --if math.abs(timestamp-last_timestamp)>50 then
            --    last_timestamp=timestamp
                local bin=(filter+256)
                filter=bin&maxfilter
            --end
            player_peds=nil
            survivors=nil
            handle,ped=FindFirstPed()
            loop=(handle~=-1)
            while loop do
                if (ped&maxfilter)==filter then --heavy
                    if not IsPedAPlayer(ped) and IsPedHuman(ped) then
                        zpos=GetEntityCoords(ped)
                        if DecorExistOn(ped,"zombie_type") then
                            if (not IsPedDeadOrDying(ped)) and not (DecorExistOn(ped,"zm_dying")) then
                                if survivors==nil then get_survivors() end
                                zombie_attack()
                                RequestAnimSet(clipset.anim)
                                if HasAnimSetLoaded(clipset.anim) then
                                    SetPedMovementClipset(ped,clipset.anim,clipset.speed)
                                end
                            end
                        elseif DecorExistOn(ped,"raider") then
                            if (not IsPedDeadOrDying(ped)) and not (DecorExistOn(ped,"zm_dying")) then
                                --SetPedAccuracy(ped,0)
                                zone=is_in_safe_zone(zpos.x,zpos.y,zpos.z)
                                raider_think()
                                local blip=GetBlipFromEntity(ped)
                                if square_dist(zpos,ppos)<22500 then --150*150
                                    if blip==0 then
                                        blip=AddBlipForEntity(ped)
                                        SetBlipScale(blip,0.5)
                                        SetBlipDisplay(blip,5)
                                        SetBlipAsShortRange(blip,true)
										local blip_from_faction=GetBlipFromFaction(GetPedRelationshipGroupHash(ped))
										if blip_from_faction then
											SetBlipScale(blip,0.7)
											SetBlipSprite(blip,blip_from_faction)
										end
                                    end
                                    local reldif=GetRelationshipBetweenGroups(GetPedRelationshipGroupHash(pped),GetPedRelationshipGroupHash(ped))
                                    if reldif==0 then
                                        SetBlipColour(blip,2)
                                    elseif reldif==5 then
                                        SetBlipColour(blip,1)
                                    else
                                        SetBlipColour(blip,5)
                                    end
                                else
                                    if blip~=0 then
                                        RemoveBlip(blip)
                                    end
                                end
                            else
                                local blip=GetBlipFromEntity(ped)
                                if square_dist(zpos,ppos)<22500 then --150*150
                                    if blip==0 then
                                        blip=AddBlipForEntity(ped)
                                        SetBlipScale(blip,0.5)
                                        SetBlipDisplay(blip,5)
                                        SetBlipAsShortRange(blip,true)
                                    end
                                    if DecorExistOn(ped,"zm_looted") then
                                        SetBlipColour(blip,40)
                                    else
                                        SetBlipColour(blip,39)
                                    end
                                else
                                    if blip~=0 then
                                        RemoveBlip(blip)
                                    end
                                end
                            end
                        else
                            if (not IsPedDeadOrDying(ped)) and not (DecorExistOn(ped,"zm_dying")) then
                            -- if DecorGetInt(ped,"zombie_type")~=4 then
                                zombie_init()
                            -- end
                            end
                        end
                    end
                else --light
                    if not IsPedAPlayer(ped) and IsPedHuman(ped) then
                        if not IsPedDeadOrDying(ped) then
                            if DecorExistOn(ped,"zm_dying") then
                                local dict="dam_ko@shot" 
                                local anim={}
                                anim[1]="ko_front_01" --bad
                                anim[2]="ko_front_02"
                                anim[3]="ko_front_03"
                                anim[4]="ko_front_04"
                                anim[5]="ko_shot_head"
                                
                                local randomdeathanim=DecorGetInt(ped,"zm_dying")
                                local currenttime=GetEntityAnimCurrentTime(ped,dict,anim[randomdeathanim])
                                --local totaltime=GetEntityAnimTotalTime(ped,dict,anim[randomdeathanim])
                                
                                
                                -- SetPedRagdollOnCollision(ped,true)
                                -- SetPedConfigFlag(ped, 33, true);
                                
                                if (currenttime>0.1) then
                                    ApplyDamageToPed(ped, 5, false);
                                end
                                
                                --ApplyDamageToPed(ped, 3, false);
                                
                                
                            elseif DecorExistOn(ped,"zombie_type") then
								if cool_zombie_anims then
                                local bonebool,bone=GetPedLastDamageBone(ped)
                                if bonebool then
                                    local health=GetEntityHealth(ped)
                                    local armor=GetPedArmour(ped)
                                    if bone==31086 then
                                        ClearPedLastDamageBone(ped)
                                        if not DecorExistOn(ped,"zm_health") or not DecorExistOn(ped,"zm_armor")
                                        or DecorGetInt(ped,"zm_health")>health or DecorGetInt(ped,"zm_armor")>armor then
                                            --local pedpos=GetEntityCoords(ped)
                                            local healthdif=0
                                            local armordif=0
                                            if DecorExistOn(ped,"zm_health") then
                                                healthdif=DecorGetInt(ped,"zm_health")-health
                                            end
                                            if DecorExistOn(ped,"zm_armor") then
                                                armordif=DecorGetInt(ped,"zm_armor")-armor
                                            end
                                            if (health+armor-healthdif*5-armordif*5<100) then
                                                local dict="dam_ko@shot" 
                                                local anim={}
                                                anim[1]="ko_front_01" --bad
                                                anim[2]="ko_front_02"
                                                anim[3]="ko_front_03"
                                                anim[4]="ko_front_04"
                                                anim[5]="ko_shot_head"
                                                
                                                RequestAnimDict(dict)
                                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                                --ClearPedTasksImmediately(ped)
                                                local randomdeathanim=math.random(2,5)
                                                TaskPlayAnim(ped, dict, anim[randomdeathanim], 8.0, 8.0, -1, 2, 0.001, false, false, false)
                                                
                                                --SetHighFallTask(ped, 10000, -1, -1)
                                                DecorSetInt(ped,"zm_dying",randomdeathanim)
                                            else
                                                ApplyDamageToPed(ped, healthdif*5, false);
                                                ApplyDamageToPed(ped, armordif*5, true);
                                                local dict="melee@unarmed@streamed_core" 
                                                local anim={}
                                                anim[1]="hit_heavy_punch_a"
                                                anim[2]="hit_heavy_punch_b"
                                                anim[3]="hit_heavy_punch_c"
                                                RequestAnimDict(dict)
                                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                                TaskPlayAnim(ped, dict, anim[math.random(1,3)], 8.0, 2.0, 0.5, 48, 0.001, false, false, false)
                                                --SetHighFallTask(ped, 100, -1, -1)
                                            end
                                            --print("damage dealt: "..healthdif.." "..armordif)
                                            local hp=GetEntityHealth(ped)
                                            DecorSetInt(ped,"zm_health",hp)
                                            DecorSetInt(ped,"zm_armor",GetPedArmour(ped))
                                            -- local dict="melee@knife@streamed_variations" 
                                            -- local anim="victim_knife_front_takedown_variation_b"
                                            -- if not IsEntityPlayingAnim(ped,dict,anim,3) then
                                                -- RequestAnimDict(dict)
                                                -- while not HasAnimDictLoaded(dict) do Wait(0) end
                                                -- TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 0, 0.001, false, false, false)
                                            -- else
                                                -- SetHighFallTask(ped, 5000, -1, -1)
                                            -- end
                                            -- if hp<100 then
                                               -- DecorSetBool(ped,"headshotted")
                                               -- -- SetPedComponentVariation(ped, 0, -1, 0, 0);
                                               -- -- SetPedComponentVariation(ped, 1, -1, 0, 0);
                                               -- -- SetPedComponentVariation(ped, 2, -1, 0, 0);
                                               -- -- KnockOffPedProp(ped, true, true, true, true);
                                               -- local libname="core"
                                               -- local effectname="blood_entry_sniper"
                                               -- local effectname2="blood_headshot"
                                               -- local effectname3="blood_mist"
                                               -- if not HasNamedPtfxAssetLoaded(libname) then
                                                -- RequestNamedPtfxAsset(libname)
                                               -- end
                                               -- while not HasNamedPtfxAssetLoaded(libname) do Wait(0) WriteHint("Trying to load effect") end
                                               -- UseParticleFxAssetNextCall(libname)
                                               -- StartParticleFxNonLoopedOnPedBone(effectname, ped, 
                                               -- 0.0, 0.0, 0.0, --offset
                                               -- 0.0, 90.0, 0.0, --rot
                                               -- 31086, 1.5,  --bone index, scale
                                               -- false, false, false);
                                               -- StartParticleFxNonLoopedOnPedBone(effectname2, ped, 
                                               -- 0.0, 0.0, 0.0, --offset
                                               -- 0.0, 90.0, 0.0, --rot
                                               -- 31086, 1.0,  --bone index, scale
                                               -- false, false, false);
                                            -- end
                                        end
                                            --SetPedToRagdoll(ped, 1000, 1000, 2, false, false, false);
                                            -- SetPedToRagdollWithFall(
                                            -- ped, 5000, 5000, 2, 
                                            -- pedpos.x, pedpos.y, pedpos.z, 
                                            -- 0.5+0.5, --force
                                            -- 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
                                            -- if armor>0 then
                                                -- SetPedArmour(ped,math.floor(armor/2))
                                            -- end
                                            --SetEntityHealth(ped,math.floor(health/2))
                                            
                                            
                                        -- local pedpos=GetEntityCoords(ped)
                                        -- local pedbonepos=GetPedBoneCoords(ped, 24818, 0.0, 0.0, 0.0);
                                        -- ShootSingleBulletBetweenCoords(
                                        -- pedpos.x, pedpos.y, pedpos.z, 
                                        -- pedbonepos.x, pedbonepos.y, pedbonepos.z, 
                                        -- 10, true, GetHashKey("weapon_pistol"), 
                                        -- ped, false, true, 1.01);
                                        -- AddExplosion(pedpos.x, pedpos.y, pedpos.z,
                                        -- 19, 0.05, false, 
                                        -- true, 0.0);
                                        -- ApplyDamageToPed(ped, 5, false);
                                    elseif bone==36864 or bone==51826 or bone==63931 or bone==58271 then
                                        if DecorGetInt(ped,"zm_lastbone")~=bone then
                                            local dict="nm@recover@normal@" 
                                            local anim="nm_kneedown_recovery"
                                            -- if not IsEntityPlayingAnim(ped,dict,anim,3) then
                                                -- RequestAnimDict(dict)
                                                -- while not HasAnimDictLoaded(dict) do Wait(0) end
                                                -- TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 0, 0.001, false, false, false)
                                            -- else
                                                 SetHighFallTask(ped, 5000, -1, -1)
                                                --SetPedToRagdoll(ped, 5000, 5000, 0, false, false, false);
                                            --end
                                            DecorSetInt(ped,"zm_lastbone",bone)
                                            
                                            DecorSetInt(ped,"zm_health",health)
                                            DecorSetInt(ped,"zm_armor",armor)
                                        end
                                    else
                                        if DecorGetInt(ped,"zm_lastbone")~=bone then
                                            local dict="melee@unarmed@streamed_core" 
                                            local anim={}
                                            anim[1]="hit_heavy_punch_a"
                                            anim[2]="hit_heavy_punch_b"
                                            anim[3]="hit_heavy_punch_c"
                                             -- if not IsEntityPlayingAnim(ped,dict,anim[1],3) 
                                             -- and not IsEntityPlayingAnim(ped,dict,anim[2],3)
                                             -- and not IsEntityPlayingAnim(ped,dict,anim[3],3)
                                             -- then
                                                 RequestAnimDict(dict)
                                                 while not HasAnimDictLoaded(dict) do Wait(0) end
                                                 TaskPlayAnim(ped, dict, anim[math.random(1,3)], 2.0, 2.0, 0.5, 48, 0.001, false, false, false)
                                             -- end
                                             --else
                                                 --SetHighFallTask(ped, 100, -1, -1)
                                                --SetPedToRagdoll(ped, 200, 200, 0, false, false, false);
                                             --end
                                            --end
                                            DecorSetInt(ped,"zm_lastbone",bone)
                                            
                                            DecorSetInt(ped,"zm_health",health)
                                            DecorSetInt(ped,"zm_armor",armor)
                                        end
                                        DecorSetInt(ped,"zm_health",health)
                                        DecorSetInt(ped,"zm_armor",armor)
                                    end
                                end
                                end
								SetPedMute(ped)
                                if IsPedUsingAnyScenario(ped) then
                                    ClearPedTasksImmediately(ped)
                                elseif IsPedFleeing(ped) or GetIsTaskActive(ped,83) or GetIsTaskActive(ped,86) then
                                    --if player_peds==nil then player_peds=get_player_peds() end
                                    if survivors==nil then get_survivors() end
                                    zpos=GetEntityCoords(ped)
                                    zombie_attack()
                                    RequestAnimSet(clipset.anim)
                                    if HasAnimSetLoaded(clipset.anim) then
                                        SetPedMovementClipset(ped,clipset.anim,clipset.speed)
                                    end
                                --else
                                end
                                zombie_refresh()
                            elseif DecorExistOn(ped,"raider") then
                                --SetPedAccuracy(ped,0)
                                if IsPedUsingAnyScenario(ped) then TaskGuardCurrentPosition(ped, 35.1, 35.1, true) end
                            else
                                zpos=GetEntityCoords(ped)
                                zombie_init()
                            end
                        end
                            --print("killer="..GetPedKiller(ped).." source_of_death="..GetPedSourceOfDeath(ped).." cause_of_death="..GetPedCauseOfDeath(ped))
                        zpos=GetEntityCoords(ped)
                        if player_peds==nil then player_peds=get_player_peds() end
                        if dist_to_closest_point(player_peds,zpos)>persistence.npcsdistance then
                            if IsEntityAMissionEntity(ped) then
                                DeleteEntity(ped)
                            end
                        else
                            local savedrel=GetPedRelationshipGroupHash(ped)
                            SetEntityAsMissionEntity(ped)
                            SetPedRelationshipGroupHash(ped,savedrel)
                        end
                    end
                end
                loop,ped=FindNextPed(handle)
            end
            EndFindPed(handle)
        elseif math.abs(timestamp-last_timestamp)>5000 then
            last_timestamp=timestamp
            player_peds=get_player_peds()
            handle,ped=FindFirstPed()
            loop=(handle~=-1)
            while loop do
                if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) then
                    zpos=GetEntityCoords(ped)
                    if DecorExistOn(ped,"zombie_type") then
                        zombie_attack()
                    elseif DecorExistOn(ped,"raider") then
                        
                        --SetPedAccuracy(ped,0)
                    else
                       -- if DecorGetInt(ped,"zombie_type")~=4 then
                            zombie_init()
                       -- end
                    end
                end
                loop,ped=FindNextPed(handle)
            end
            EndFindPed(handle)
        else
            player_peds=nil
            handle,ped=FindFirstPed()
            loop=(handle~=-1)
            while loop do
                if not IsPedAPlayer(ped) and IsPedHuman(ped) then
                    if not IsPedDeadOrDying(ped) then
                        if DecorExistOn(ped,"zombie_type") then
                            if IsPedUsingAnyScenario(ped) then
                                ClearPedTasksImmediately(ped)
                            elseif IsPedFleeing(ped) or GetIsTaskActive(ped,83) or GetIsTaskActive(ped,86) then
                                if player_peds==nil then
                                    player_peds=get_player_peds()
                                end
                                zpos=GetEntityCoords(ped)
                                zombie_attack()
                                RequestAnimSet(clipset.anim)
                                if HasAnimSetLoaded(clipset.anim) then
                                    SetPedMovementClipset(ped,clipset.anim,clipset.speed)
                                end
                            else
                                SetPedMute(ped)
                            end
                            zombie_refresh()
                        elseif DecorExistOn(ped,"raider") then
                            --SetPedAccuracy(ped,0)
                        else
                            zpos=GetEntityCoords(ped)
                            zombie_init()
                        end
                    else
                        --print("killer="..GetPedKiller(ped).." source_of_death="..GetPedSourceOfDeath(ped).." cause_of_death="..GetPedCauseOfDeath(ped))
                        zpos=GetEntityCoords(ped)
                        if player_peds==nil then
                            player_peds=get_player_peds()
                        end
                        if dist_to_closest_point(player_peds,zpos)>2500.0 then
                            if IsEntityAMissionEntity(ped) then
                                DeleteEntity(ped)
                            end
                        elseif not IsPedInAnyVehicle(ped) then
                            SetEntityAsMissionEntity(ped)
                        end
                        -- if DecorExistOn(ped,"zombie_type") then
                            -- if DecorExistOn(ped,"zm_looted") then
                                -- if IsEntityAMissionEntity(ped) then
                                    -- DeleteEntity(ped)
                                -- end
                            -- else
                                -- if not IsEntityAMissionEntity(ped) and deadbodiesrewards[GetEntityModel(ped)]~=nil then
                                    -- SetEntityAsMissionEntity(ped)
                                -- end
                            -- end
                        -- end
                    end
                end
                loop,ped=FindNextPed(handle)
            end
            EndFindPed(handle)
        end
        end
		Wait(0)
    end
end)
-- Citizen.CreateThread(function()
    -- while true do Wait(0)
        -- local pped=PlayerPedId() 
        -- if IsPedUsingActionMode(pped) then
            -- SetPedUsingActionMode(pped, false, false, "DEFAULT_ACTION");
        -- end
    -- end
-- end)
-- Citizen.CreateThread(function()
    -- while true do Wait(0)
        -- local loop,handle,ped
        -- local pped=PlayerPedId()
        -- local player_peds=nil
        -- handle,ped=FindFirstPed()
        -- loop=(handle~=-1)
        -- while loop do
            -- if IsPedFleeing(ped) then
                -- --SetEntityHealth(ped,0)
                -- --TaskCombatPed(ped, pped, 0, 16);
                -- if player_peds==nil then
                    -- player_peds={}
                    -- for i=0,31 do
                        -- if NetworkIsPlayerActive(i) then
                            -- local ped=GetPlayerPed(i)
                            -- player_peds[ped]=GetEntityCoords(ped)
                        -- end
                    -- end
                -- end
                -- local clipset=movementclipsets.limper
                -- TaskGoToEntity(ped, closest_point(player_peds,GetEntityCoords(ped)), -1, 0.1, clipset.speed, 1073741824, 0)
            -- end
            -- loop,ped=FindNextPed(handle)
        -- end
        -- EndFindPed(handle)
    -- end
-- end)

local function any_player_inside(veh)
    for i=-1,GetVehicleNumberOfPassengers(veh) do
        local ped=GetPedInVehicleSeat(veh,i)
        if ped~=nil and ped~=0 and IsPedAPlayer(ped) then
            return true
        end
    end
    return false
end

--- Bodies and trunk search owo uwu
Citizen.CreateThread(function()
    local function try_to_loot_engine(veh) if true then return end
        --if DecorExistOn(veh,"scorched") then
            --SimpleNotification("Nothing to salvage here.")
        --else
		if any_player_inside(veh) then
            SimpleNotification("Can't loot engine while someone is in car.")
        else
            local engine=GetVehicleEngineHealth(veh)
            local parts=math.floor((engine-no_engine_parts)*.05)
            if parts>0 then
                if give_item_to_inventory("scrapmetal",parts) then --"engine_parts"
                    SetVehicleEngineHealth(veh,engine-parts*20)
                end
            end
        end
    end
    local function try_to_loot_trunk(veh)
        if not DecorExistOn(veh,"zm_looted") then
            --GiveWeaponToPed(PlayerPedId(), 883325847, 21, false, true)
            local randomitem
            local platenumber=GetHashKey(GetVehicleNumberPlateText(veh))
            if (platenumber&3)~=0 then
            
                local vehpos=GetEntityCoords(veh)
                local time=GetGameTimer()
                local random_number=math.abs(math.floor((vehpos.x+vehpos.y+vehpos.z)*10)+time+(platenumber>>2))
                local tier=(random_number%100)
                random_number=math.floor(random_number/100)
                local chosentier
                if      tier>98 then    chosentier=rewards.trunkrewards.tier6
                elseif  tier>93 then    chosentier=rewards.trunkrewards.tier5
                elseif  tier>84 then    chosentier=rewards.trunkrewards.tier4
                elseif  tier>60 then    chosentier=rewards.trunkrewards.tier3
                elseif  tier>33 then    chosentier=rewards.trunkrewards.tier2
                else                    chosentier=rewards.trunkrewards.tier1 end
                
                local reward=chosentier[random_number%#chosentier+1]
                local item=reward[1]
                local count=reward[2]
				
				if item=="blueprint" then
					local randomchosenitem=math.random(1,#normal_crafts)
					item="blueprint_"..normal_crafts[randomchosenitem][1]
				end
				
                if count<0 then count=math.random(1,-count) end
                
                if not DecorExistOn(veh,"item") then
                    DecorSetInt(veh,"item",item_name_to_index[item])
                    DecorSetInt(veh,"count",count)
                else
                    local item_decor=DecorGetInt(veh,"item")
                    local count_decor=DecorGetInt(veh,"count")
                    if item_decor==nil or item_decor==0 then
                        SimpleNotification("~r~ERROR Item from decor is nil or 0!")
                        print("ERROR Item from decor is nil or 0")
                    else
                        local item_name=item_index_to_name[item_decor]
                        if item_name==nil then
                            SimpleNotification("~r~ERROR Name from item_decor ~1~ is nil!",item_decor)
                            print("ERROR Item from item_decor "..item_decor.." is nil")
                        else
                            item=item_name
                        end
                    end
                    if count_decor==nil or count_decor==0 then
                        SimpleNotification("~r~ERROR Count from decor is nil or 0!",item_decor)
                        print("ERROR Count from decor is nil or 0")
                    else
                        count=count_decor
                    end
                    if give_item_to_inventory(item,count) then
                        DecorSetBool(veh,"zm_looted",true)
                    end
                end
            else
                SimpleNotification("Nothing useful.")
                DecorSetBool(veh,"zm_looted",true)
            end
        end
    end
    local function try_to_loot_side(veh)
        local fuel=DecorGetFloat(veh,"zm_fuel")--GetVehicleFuelLevel(veh)
        local liters=math.floor(fuel-5)
        local vehclass=GetVehicleClass(veh)
        if vehclass~=13 and liters>0 and IsVehicleSeatFree(veh,-1) then
            if vehclass==15 or vehclass==16 or kerosine_vehicles[pvehmodel] then
                if give_item_to_inventory("aircraftfuel",liters) then
                    fuel=fuel-liters
                    DecorSetFloat(veh,"zm_fuel",fuel)
                    SetVehicleFuelLevel(veh,fuel)
                end
            else
                if give_item_to_inventory("gasoline",liters) then
                    fuel=fuel-liters
                    DecorSetFloat(veh,"zm_fuel",fuel)
                    SetVehicleFuelLevel(veh,fuel)
                end
            end
        end
    end
    while true do Wait(0)
        local dict="pickup_object"
        local anim="pickup_low"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do Wait(0) end
        if IsControlJustPressed(0,86) then
            local pped=PlayerPedId()
            if (not IsPedInAnyVehicle(pped)) and (not IsPedDeadOrDying(pped)) and (not IsPedClimbing(pped)) then
                local mypos=GetEntityCoords(pped)
                local loop,handle,ped,veh
                handle,ped=FindFirstPed()
                loop=(handle~=-1)
                while loop do
                    local reward=deadbodiesrewards[GetEntityModel(ped)]
                    if reward==nil then 
                        if DecorExistOn(ped,"raider") then
                            -- 98-100 - tier6 (2%) --big guns/medkits
                            -- 93-97 - tier5 (4%) --small guns
                            -- 84-92 - tier4 (8%) --ammo
                            -- 68-83 - tier3 (15%) -- food
                            -- 43-67 - tier2 (24%) -- cigs/bandages
                            -- 0-42 - tier1 (42%) -- scrap/rags
                            local tier=math.random(1,100)
                            local chosentier
                            if      tier>88 then    chosentier=rewards.deadbodies.tier6
                            elseif  tier>73 then    chosentier=rewards.deadbodies.tier5
                            elseif  tier>44 then    chosentier=rewards.deadbodies.tier4
                            elseif  tier>28 then    chosentier=rewards.deadbodies.tier3
                            elseif  tier>3 then    chosentier=rewards.deadbodies.tier2
                            else                    chosentier=rewards.deadbodies.tier1 end
                            reward=chosentier[math.random(1,#chosentier)] 
                            if debug_mode then
                                SimpleNotification("Debug random loot number is: ~1~",tier)
                                print("Debug random loot number is: "..tier)
                            end
                        else --zombie loot
                            local tier=math.random(1,100)
                            local chosentier
                            if      tier>99 then        chosentier=rewards.deadbodies.tier4
                            elseif  tier>98 then        chosentier=rewards.deadbodies.tier3
                            elseif  tier>97 then        chosentier=rewards.deadbodies.tier2
                            else                    chosentier=rewards.deadbodies.tier1 end
                            reward=chosentier[math.random(1,#chosentier)] 
                            if debug_mode then
                                SimpleNotification("Debug random loot number is: ~1~",tier)
                                print("Debug random loot number is: "..tier)
                            end
                        end
                    end
                    --if reward~=nil then
                        if IsPedDeadOrDying(ped,true) then
                                local zpos=GetEntityCoords(ped)
                                local distance=sqrt_dist(mypos,zpos)
                                if distance<1.5 and not DecorExistOn(ped,"zm_looted") then
                                    --::trytolootagain::
                                    if NetworkHasControlOfEntity(ped) then
                                        TaskPlayAnim(pped, dict, anim, 1.0, 1.0, -1, 0, .0, false, false, false)
                                        --if type(reward[1])=='string' then
                                            if math.random(0,5)~=0 then
                                                local count=reward[2]
                                                if count<0 then count=math.random(1,-count) end
                                                if give_item_to_inventory(reward[1],count) then DecorSetBool(ped,"zm_looted",true) end
                                            else
                                                SimpleNotification("Nothing useful.")
                                                DecorSetBool(ped,"zm_looted",true)
                                            end
                                        -- else
                                            -- GiveWeaponToPed(pped, reward[1], reward[2], false, true)
                                            -- DecorSetBool(ped,"zm_looted",true)
                                        -- end
                                    else
                                        NetworkRequestControlOfEntity(ped)
                                        --Wait(100)
                                        --goto trytolootagain
                                    end
                                end
                        -- else
                            -- if not HasPedGotWeapon(ped,reward[1],false) then
                                -- GiveWeaponToPed(ped, reward[1], reward[2], false, true);
                            -- end
                        end
                    --end
                    loop,ped=FindNextPed(handle)
                end
                EndFindPed(handle)
                
                handle,veh=FindFirstVehicle()
                loop=(handle~=-1)
                while loop do
                    local vpos=GetEntityCoords(veh)
                    local distance=sqrt_dist(mypos,vpos)
                    if distance<30.0 and (GetVehicleEngineHealth(veh)>no_engine_parts or GetVehicleFuelLevel(veh)>5 or not DecorExistOn(veh,"zm_looted")) then
                        vpos=GetOffsetFromEntityGivenWorldCoords(veh,mypos.x,mypos.y,mypos.z)
                        local model=GetEntityModel(veh)
                        local box1,box2=GetModelDimensions(model)
                        if vpos.z>box1.z and vpos.z<box2.z+1 then
                            local front=false
                            local back=false
                            local side
                            if vpos.y>box1.y and vpos.y<box2.y and vpos.x>box1.x-1 and vpos.x<box2.x+1 then --side
                                --SetVehicleDoorOpen(veh,0,true,true)
                                --SetVehicleDoorOpen(veh,1,true,true)
                                side=true
                            end
                            if vpos.x>box1.x and vpos.x<box2.x then --front or back
                                if vpos.y>0 then
                                    front=(vpos.y<box2.y+1)
                                else
                                    back=(vpos.y>box1.y-1)
                                end
                            end
                            if front or back or side then
                                if NetworkHasControlOfEntity(veh) then
                                    if front and back then
                                        try_to_loot_engine(veh)
                                        try_to_loot_trunk(veh)
                                    elseif front or back then
                                        --vpos=GetOffsetFromEntityGivenWorldCoords(veh,GetWorldPositionOfEntityBone(veh,GetEntityBoneIndexByName(veh,'engine')))
                                        --print("engine pos "..vpos.x.." "..vpos.y.." "..vpos.z)
                                        if engine_at_front(veh,model) then
                                            if front then
                                                try_to_loot_engine(veh)
                                                SetVehicleDoorOpen(veh,4,true,true)
                                            end
                                            if back then
                                                try_to_loot_trunk(veh)
                                                SetVehicleDoorOpen(veh,5,true,true)
                                            end
                                        else
                                            if front then
                                                try_to_loot_trunk(veh)
                                                SetVehicleDoorOpen(veh,4,true,true)
                                            end
                                            if back then
                                                try_to_loot_engine(veh)
                                                SetVehicleDoorOpen(veh,5,true,true)
                                            end
                                        end
                                    end
                                    if side then
                                        try_to_loot_side(veh)
                                    end
                                else
                                    NetworkRequestControlOfEntity(veh)
                                end
                            end
                        end
                        
                    end
                    loop,veh=FindNextVehicle(handle)
                end
                EndFindVehicle(handle)
            end
        end
    end
end)

-- loot items in world
Citizen.CreateThread(function()
    while true do
        local ped=PlayerPedId()
		local mypos=GetEntityCoords(ped)
        if IsPedInAnyVehicle(ped,false) then
            local veh=GetVehiclePedIsUsing(ped)
            if veh~=0 and GetEntityModel(veh)==1938952078 then --fire truck
                GiveWeaponToPed(ped,101631238,1000,false,true) --fire extinguisher
                Wait(1000)
            else
                Wait(500)
            end
        elseif IsControlJustPressed(0,86) and not IsPedDeadOrDying(ped) then
            pos=GetEntityCoords(ped)
            local obj
            local empty=false
            local spoiled=false
            local found=false
            for k,v in pairs(weapon_model_to_hash) do
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.3, k, false, false, false)
                if obj~=0 then --and not NetworkGetEntityIsNetworked(obj) then
					--print("~y~There is an weapon entity near by")
                    local attached=GetEntityAttachedTo(obj)
                    if not IsEntityAPed(attached) or IsEntityDead(attached) then
						--print("~y~Weapon not attached to ped or ped is dead")
						local item=item_index_to_name[v]
						if give_item_to_inventory(item,1) then
							--print("~y~Succesfully given weapon to inventory")
							local weapon_hash=GetHashKey("weapon_"..item)
							local ammo_type=GetPedAmmoTypeFromWeapon(ped,weapon_hash)
							for k,v in pairs(ammo_types) do
								if v==ammo_type then
									give_item_to_inventory(k,math.random(1,15))
								end
							end
							SetEntityAsMissionEntity(obj)
							DeleteObject(obj)
							--print("~y~Deleted weapon in world")
						end
					end
					--print("~y~End of process")
				end
			end
			if not is_in_safe_zone(mypos.x,mypos.y,mypos.z) then
				for k,v in pairs(pickups_objects) do
					obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.3, k, false, false, false)
					if obj~=0 then --and not NetworkGetEntityIsNetworked(obj) then
						local attached=GetEntityAttachedTo(obj)
						if not IsEntityAPed(attached) or IsPedDeadOrDying(attached) then
							if (v.solid or v.exp) and DecorExistOn(obj,"zm_looted") then
								empty=true
							elseif v.spoiled then
								spoiled=true
							else
								if type(v[1])=="table" then v=v[1][math.random(1,#v[1])] end
								local took_something=false
								local local_spoiled=false
								for i=1,5,2 do
									if v[i]==nil then
										break
									end
									if (inventory_items_chances[v[i]]==nil) or (math.random(1,100)<inventory_items_chances[v[i]].chance) then
										print("trying to pickup "..v[i])
										local amount=v[i+1]
										if amount<0 then amount=math.random(1,-amount) end
										if give_item_to_inventory(v[i],amount) then took_something=true end
									else
										SimpleNotification(inventory_items_chances[v[i]].text)
										local_spoiled=true
									end
								end
								if took_something or local_spoiled then
									local objpos=GetEntityCoords(obj)
									if DecorExistOn(obj,"zm_dword") then
										looted_array[DecorGetInt(obj,"zm_dword")]=current_date
									else
										looted_array[coords_to_dword(objpos.x,objpos.y,objpos.z)]=current_date
									end
									if v.exp then
										DecorSetBool(obj,"zm_looted",true)
										local objpos=GetEntityCoords(obj)
										AddExplosion(objpos.x, objpos.y, objpos.z, 16, v.exp, false, true, false, true)
									elseif v.solid then
										DecorSetBool(obj,"zm_looted",true)
									else
										SetEntityAsMissionEntity(obj)
										DeleteObject(obj)
									end
								end
								found=true
								break
							end
						end
					end
				end
				if not found then
					if empty then
						SimpleNotification(messages.this_container_is_empty)
					end
					if spoiled then
						SimpleNotification(messages.this_food_is_spoiled)
					end
				end
			end
            -- if health~=maxhealth then
                -- obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, -509973344, false, false, false) --medkit
                -- if obj~=0 then
                    -- health=maxhealth
                -- else
                    -- obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 874345115, false, false, false) --ponchik
                    -- if obj~=0 then
                        -- health=health+5
                    -- else
                        -- obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 702242327, false, false, false) --ponchik
                        -- if obj~=0 then
                            -- health=health+5
                        -- else
                            -- obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 1753238891, false, false, false) --kiwi
                            -- if obj~=0 then
                                -- health=health+5
                            -- else
                                -- obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 1541274880, false, false, false) --cola
                                -- if obj~=0 then
                                    -- health=health+5
                                -- end
                            -- end
                        -- end
                    -- end
                -- end
                -- if obj~=0 then
                    -- SetEntityHealth(ped,health)
                    -- SetEntityAsMissionEntity(obj)
                    -- DeleteObject(obj)
                -- end
            -- end
            if not HasPedGotWeapon(ped,101631238,false) or GetAmmoInPedWeapon(ped,101631238)<2000 then --WEAPON.EXTINGUISHER=101631238
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, -1610165324, false, false, false)
                if obj==0 then
                    obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, -875057463, false, false, false)
                    if obj==0 then
                        obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, -666581633, false, false, false)
                        if obj==0 then
                            obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, -1980225301, false, false, false)
                        end
                    end
                end
                if obj~=0 then
                    GiveWeaponToPed(ped, 101631238, 2000, false, true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            if not HasPedGotWeapon(ped,1141786504,false) then --WEAPON.GOLFCLUB=1141786504
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 1933637837, false, false, false)
                if obj==0 then
                    obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 1750479612, false, false, false)
                    if obj==0 then
                        obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 1705580940, false, false, false)
                        if obj==0 then
                            obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 334347537, false, false, false)
                            if obj==0 then
                                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, -2141023172, false, false, false)
                            end
                        end
                    end
                end
                if obj~=0 then
                    GiveWeaponToPed(ped, 1141786504, 1, false, true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            if not HasPedGotWeapon(ped,-1786099057,false) then --WEAPON.BAT=-1786099057
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 1742452667, false, false, false)
                if obj==0 then
                    obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 32653987, false, false, false)
                end
                if obj~=0 then
                    GiveWeaponToPed(ped,-1786099057, 1, false, true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            if not HasPedGotWeapon(ped,-1951375401,false) then --WEAPON.FLASHLIGHT=-1951375401
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, -66965919, false, false, false)
                if obj~=0 then
                    GiveWeaponToPed(ped,-1951375401,1,false,true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            if not HasPedGotWeapon(ped,1317494643,false) then --WEAPON.HAMMER=1317494643
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 173895646, false, false, false)
                if obj~=0 then
                    GiveWeaponToPed(ped,1317494643,1,false,true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            if not HasPedGotWeapon(ped,419712736,false) then --WEAPON.WRENCH=419712736
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 1596752624, false, false, false)
                if obj~=0 then
                    GiveWeaponToPed(ped,419712736,1,false,true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            if not HasPedGotWeapon(ped,-1810795771,false) then --WEAPON.POOLCUE=-1810795771
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 1184113278, false, false, false)
                if obj~=0 then
                    GiveWeaponToPed(ped,-1810795771,1,false,true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            if not HasPedGotWeapon(ped,883325847,false) or GetAmmoInPedWeapon(ped,883325847)<4500 then --WEAPON.PETROLCAN=883325847
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, 786272259, false, false, false)
                if obj~=0 then
                    GiveWeaponToPed(ped, 883325847, 4500, false, true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            if not HasPedGotWeapon(ped,GetHashKey("weapon_crowbar"),false) then --WEAPON.crowbar
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.1, -142948810, false, false, false)
                if obj~=0 then
                    GiveWeaponToPed(ped,GetHashKey("weapon_crowbar"),1,false,true)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                end
            end
            Wait(0)
        else
            Wait(0)
        end
    end
end)
-- deleting objects that are looted
Citizen.CreateThread(function()
    Wait(100)
    while true do Wait(0)
        local loop,handle,obj
        local hash,t,model
        handle,obj=FindFirstObject()
        loop=(handle~=-1)
        while loop do
            model=pickups_objects[GetEntityModel(obj)]
            if model~=nil and not DecorExistOn(obj,"zm_looted") then
				if DecorExistOn(obj,"zm_dword") then
					hash=DecorGetInt(obj,"zm_dword")
					t=looted_array[hash]
					if t~=nil then
						if current_date-t>respawn_time then
							looted_array[hash]=nil
						elseif model.exp then
							local pos=GetEntityCoords(obj)
							DecorSetBool(obj,"zm_looted",true)
							AddExplosion(pos.x, pos.y, pos.z, 16, model.exp, false, true, false, true)
						elseif model.solid then
							DecorSetBool(obj,"zm_looted",true)
						else
							SetEntityAsMissionEntity(obj)
							DeleteObject(obj)
						end
					end
				else
					local pos=GetEntityCoords(obj)
					hash=coords_to_dword(pos.x,pos.y,pos.z)
					t=looted_array[hash]
					if t~=nil then
						if current_date-t>respawn_time then
							looted_array[hash]=nil
							DecorSetInt(obj,"zm_dword",hash)
						elseif model.exp then
							DecorSetInt(obj,"zm_dword",hash)
							DecorSetBool(obj,"zm_looted",true)
							AddExplosion(pos.x, pos.y, pos.z, 16, model.exp, false, true, false, true)
						elseif model.solid then
							DecorSetInt(obj,"zm_dword",hash)
							DecorSetBool(obj,"zm_looted",true)
						else
							SetEntityAsMissionEntity(obj)
							DeleteObject(obj)
						end
					else
						DecorSetInt(obj,"zm_dword",hash)
					end
				end
            end
            loop,obj=FindNextObject(handle)
        end
        EndFindObject(handle)
    end
end)


-- номер типа зомби и анимация
Citizen.CreateThread(function()
    local debug_mode=false
    RegisterCommand("debug",function(source,args,raw)
        debug_mode=not debug_mode
    end,false)
    while true do Wait(0)
        if debug_mode then
            local handle,ped=FindFirstPed()
            local loop=(handle~=-1)
            while loop do
                local pos=GetEntityCoords(ped)
                local not_on_screen,x,y=N_0xf9904d11f1acbec3(pos.x,pos.y,pos.z)
                if not not_on_screen then
                    WriteText(7,string.format('%x', ped),0.2,255,255,255,255,x,y)
                    y=y+.015
                    if DecorExistOn(ped,"zombie_type") then
                        local zombie_type=DecorGetInt(ped,"zombie_type")
                        WriteText(7,"["..zombie_type.."]="..randomclipsets[zombie_type].anim.."("..randomclipsets[zombie_type].speed..")",0.2,255,255,255,255,x,y)
                    elseif DecorExistOn(ped,"raider") then
                        if DecorGetBool(ped,"raider") then
                            WriteText(7,"~g~friendly ~s~human",0.2,255,255,255,255,x,y)
                        else
                            WriteText(7,"~r~enemy ~s~human",0.2,255,255,255,255,x,y)
                        end
                    else
                        WriteText(7,"~y~NO DECORATOR",0.2,255,255,255,255,x,y)
                    end
                    if IsEntityAMissionEntity(ped) then
                        y=y+.015
                        WriteText(7,"mission",0.2,255,255,255,255,x,y)
                    end
                    if IsPedFleeing(ped) then
                        y=y+.015
                        WriteText(7,"fleeing",0.2,255,255,255,255,x,y)
                    end
                    if IsPedDeadOrDying(ped) then
                        y=y+.015
                        WriteText(7,"dead",0.2,255,255,255,255,x,y)
                    end
                end
                loop,ped=FindNextPed(handle)
            end
            EndFindPed(handle)
        end
    end
end)

--heist
-- Citizen.CreateThread(function()
    -- local curheist=heists[1]
    -- local heistblip=AddBlipForRadius(curheist.x,curheist.y,curheist.z,curheist.r)
    -- SetBlipAlpha(heistblip,100)
-- end)

-- Citizen.CreateThread(function()
    -- local dict="creatures@rottweiler@melee@streamed_core@"
    -- local anim="victim_takedown_from_front"
    -- local fall
    -- local touch
    -- RequestAnimDict(dict)
    -- while not HasAnimDictLoaded(dict) do Wait(0) end
    -- local duration=math.floor(GetAnimDuration(dict, anim)*1000+100)
    -- while true do Wait(20)
        -- local timestamp=GetGameTimer()
        -- local myped=PlayerPedId()
        -- local mypos=GetEntityCoords(myped)
        -- local handle,ped=FindFirstPed()
        -- local loop=(handle~=-1)
        -- while loop do
            -- if not IsPedAPlayer(ped) and GetEntityHealth(ped)>0 then --and not IsPedRagdoll(ped) then
                -- local zpos=GetEntityCoords(ped)
                -- local distance=#(mypos-zpos)
                -- if distance<0.7 then
                    -- touch=timestamp
                    -- ClearPedTasksImmediately(ped)
                    -- SetBlockingOfNonTemporaryEvents(ped, 1)
                    -- TaskCombatPed(ped, pped, 0, 16);
                    -- --SetPedToRagdoll(ped, 10000, 3000, 0, true, true, false)
                -- end
            -- end
            -- loop,ped=FindNextPed(handle)
        -- end
        -- EndFindPed(handle)
        -- if touch~=nil and timestamp-touch<500 then
            -- if fall==nil then
                -- duration=1000
                -- --SetPedToRagdoll(myped, 10000, 3000, 0, true, true, false)
                -- --TaskPlayAnim(myped, dict, anim, 1.0, 1.0, duration, 0, .0, false, false, false)
                -- fall=timestamp
            -- elseif timestamp-fall>duration then
                -- --SetEntityHealth(myped,0)
                -- fall=nil
                -- Wait(0)
                -- while myped==PlayerPedId() do Wait(0) end
                -- Wait(500)
            -- end
        -- elseif fall~=nil then
            -- --ClearPedTasks(pped)
            -- SetPedToRagdoll(myped, 10000, 3000, 0, true, true, false)
            -- --ragdolled=true
            -- fall=nil
            -- touch=nil
        -- end
    -- end
-- end)

local replace_models={
--cops
-- [1581098148]=275618457,
-- [368603149]=275618457,
--altruists
[1413662315]=0xFFFFFFFF&-1782092083,
[1430544400]=0xFFFFFFFF&-261389155,
[0xFFFFFFFF&-1251702741]=0xFFFFFFFF&-12678997,
[1268862154]=1161072059,
[0xFFFFFFFF&-2132435154]=1358380044,

--animals
[0xFFFFFFFF&-664053099]=0xFFFFFFFF&-1404353274,--deer
[0xFFFFFFFF&-541762431]=539004493,--rabbit
[0xFFFFFFFF&-50684386]=1768677545,--cow
[1794449327]=732742363,--hen
[0xFFFFFFFF&-832573324]=1943971979,--boar
[0xFFFFFFFF&-1323586730]=1822107721,--pig
[307287994]=1822107721,--cougar mountain lion

--brad cadaver 1915268960 no legs
--salton 539004493
--methhead 1768677545
--drowned 1943971979
--filmnoir(corpse in mine) 732742363
--Zombie01 -1404353274
--HillBilly01AMM 1822107721
}
for _,v in pairs(replace_models) do
    RequestModel(v)
end

local animals={
	0xFFFFFFFF&-664053099,--deer
	0xFFFFFFFF&-541762431,--rabbit
	0xFFFFFFFF&-50684386,--cow
	1794449327,--hen
	0xFFFFFFFF&-832573324,--boar
	0xFFFFFFFF&-1323586730,--pig
	307287994,--cougar mountain lion
	1318032802,--husky
	1682622302,--coyote
}

AddEventHandler('populationPedCreating', function(x, y, z, model, setters)
    if (npcslimiter.enablelimit and npcslimiter.current>=npcslimiter.max) or npcslimiter.current>=npcslimiter.totalmax then
        CancelEvent()
        return
    elseif birds[model]==nil then
        local zone=is_in_safe_zone(x,y,z)
        if zone~=nil then
            --print("populationPedCreating in zone "..zone.zonetype)
        end
        local newmodel
        if zone~=nil and zone.models~=nil then
            newmodel=zone.models[(coords_to_dword(x,y,z)%(#zone.models))+1]
            --newmodel=newmodel
        else
			if math.random(1,100)==1 then
				newmodel=animals[math.random(1,#animals)]
			elseif math.random(1,150)==1 then
				newmodel=1885233650
			else
				newmodel=replace_models[model]
			end
        end
        if newmodel~=nil then
            if HasModelLoaded(newmodel) then
				local myped=PlayerPedId()
				local mypos=GetEntityCoords(myped)
				local theirpos={x=x,y=y,z=z}
				if square_dist(mypos,theirpos)<2500 then
					CancelEvent()
					return
				else				
					setters.setModel(0xFFFFFFFF&newmodel)
					setters.setPosition(x, y, z + 1.0)
				end
            else
                RequestModel(newmodel)
                CancelEvent()
                return
            end
        end
    end
    if npcslimiter.enablelimit then
        npcslimiter.current=npcslimiter.current+1
    end
end)

Citizen.CreateThread(function() --if true then return end
    local backpacks={
    {GetHashKey("p_ld_heist_bag_01"),0x60f2,--spine for bag
    0.02,0.035,0.0, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    {GetHashKey("prop_michael_backpack"),0x60f2,--blue backpack
    0.07,-0.2,-0.07, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    {GetHashKey("p_para_bag_xmas_s"),0x60f2,--blue backpack
    0.07,-0.17,-0.00, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    {GetHashKey("prop_beach_bag_01a"),0x60f2,--blue backpack
    0.06,-0.1,-0.015, --coords  --bag
    -90.0,180.0,180.0}, --rot    --bag
    {GetHashKey("prop_hockey_bag_01"),0x60f2,--blue backpack
    0.445,-0.155,-0.0, --coords  --bag
    -90.0,180.0,228.0}, --rot    --bag
    }
    local helmets={
    {GetHashKey("prop_player_gasmask"),0x796e,-- skel_head
    0.0,0.0,0.0, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    {GetHashKey("v_ret_gc_gasmask"),0x796e,-- skel_head
    0.05,0.079,0.02, --coords  --bag
    -20.0,270.0,180.0}, --rot    --bag
    {GetHashKey("prop_gas_mask_hang_01bb"),0x796e,-- skel_head
    0.04,0.035,0.025, --coords  --bag
    90.0,-33.5,67.5}, --rot    --bag
    {GetHashKey("prop_welding_mask_01_s"),0x796e,-- skel_head
    0.105,0.015,0.0, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    {GetHashKey("p_d_scuba_mask_s"),0x796e,-- skel_head
    0.0,0.0,0.0, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    {GetHashKey("p_trev_ski_mask_s"),0x796e,-- skel_head
    0.015,0.03,0.0, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    {GetHashKey("prop_hard_hat_01"),0x796e,-- skel_head
    0.135,0.015,0.0, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    {GetHashKey("prop_tool_hardhat"),0x796e,-- skel_head
    0.07,0.0,0.0, --coords  --bag
    0.0,270.0,180.0}, --rot    --bag
    }
    local objects_bp={}
    local objects_hlm={}
    while true do --ped props pedprops
        Wait(0)
        local peds_bp={}
        local peds_hlm={}
        for k,obj in pairs(objects_bp) do
            local ped=GetEntityAttachedTo(obj)
            if ped==0 then
                SetEntityAsNoLongerNeeded(obj)
                SetEntityAsMissionEntity(obj)
                DeleteObject(obj)
                objects_bp[k]=nil
            else
                -- local ped_pos=GetEntityCoords(ped)
                -- local obj_pos=GetEntityCoords(obj)
                -- if math.abs(obj_pos.x-ped_pos.x)+math.abs(obj_pos.y-ped_pos.y)+math.abs(obj_pos.z-ped_pos.z)>3 then
                    -- SetEntityAsNoLongerNeeded(obj)
                    -- SetEntityAsMissionEntity(obj)
                    -- DeleteObject(obj)
                    -- objects_bp[k]=nil
                -- else
                    peds_bp[ped]=true
                -- end
            end
        end
        for k,obj in pairs(objects_hlm) do
            local ped=GetEntityAttachedTo(obj)
            if ped==0 then
                SetEntityAsNoLongerNeeded(obj)
                SetEntityAsMissionEntity(obj)
                DeleteObject(obj)
                objects_hlm[k]=nil
            else
                -- local ped_pos=GetEntityCoords(ped)
                -- local obj_pos=GetEntityCoords(obj)
                -- if math.abs(obj_pos.x-ped_pos.x)+math.abs(obj_pos.y-ped_pos.y)+math.abs(obj_pos.z-ped_pos.z)>3 then
                    -- SetEntityAsNoLongerNeeded(obj)
                    -- SetEntityAsMissionEntity(obj)
                    -- DeleteObject(obj)
                   -- objects_hlm[k]=nil
               -- else
                    peds_hlm[ped]=true
               -- end
            end
        end
        local handle,ped=FindFirstPed()
        local loop=(handle~=-1)
        local prop,model,bone
        while loop do
            if DecorExistOn(ped,"raider") and not IsPedDeadOrDying(ped) and GetEntityModel(ped)~=1885233650 then
                bone=0x60f2
                if peds_bp[ped]==nil then
                    prop=backpacks[math.random(1,#backpacks)]
                    model=prop[1]
                    if not HasModelLoaded(model) then
                        RequestModel(model)
                    else
                        local obj=CreateObject(model, 0, 0, -199.6, false, false, false)
                        SetEntityCollision(obj,false,false)
                        AttachEntityToEntity(obj,ped,GetPedBoneIndex(ped,bone),
                        prop[3],prop[4],prop[5],
                        prop[6],prop[7],prop[8],
                        false, --p9
                        false, --soltpinning
                        false, --collision
                        true, --isped
                        0, --vertexindex
                        true --fixedrot
                        )
                        table.insert(objects_bp,obj)
                    end
                end
                bone=0x796e
                if peds_hlm[ped]==nil then
                    prop=helmets[math.random(1,#helmets)]
                    model=prop[1]
                    if not HasModelLoaded(model) then
                        RequestModel(model)
                    else
                        local obj=CreateObject(model, 0, 0, -199.6, false, false, false)
                        SetEntityCollision(obj,false,false)
                        AttachEntityToEntity(obj,ped,GetPedBoneIndex(ped,bone),
                        prop[3],prop[4],prop[5],
                        prop[6],prop[7],prop[8],
                        false, --p9
                        false, --soltpinning
                        false, --collision
                        true, --isped
                        0, --vertexindex
                        true --fixedrot
                        )
                        table.insert(objects_hlm,obj)
                    end
                end
            end
            loop,ped=FindNextPed(handle)
        end
        EndFindPed(handle)
    end
end)

RegisterCommand('invmode',function(source,args,raw)
    if inventory.mode then
        inventory.mode=false
    else
        inventory.mode=true
    end
end,false)
if devmode then
	RegisterCommand('changerep',function(source,args,raw)
		if args[1]~=nil then
			player.reputation=tonumber(args[1])
			saving_kvp_mode.SetResourceKvpInt("reputation",player.reputation)
		end
	end,false)
	RegisterCommand('rearm',function(source,args,raw)		
		local myped=PlayerPedId()
		local myveh=GetVehiclePedIsIn(myped)								
		local model=GetEntityModel(myveh)
		local using_vehicle_weapon,weapon=GetCurrentPedVehicleWeapon(myped)
		if using_vehicle_weapon and vehicles_ammo[model] and vehicles_ammo[model][weapon] then
			DecorSetInt(myveh,vehicles_ammo[model][weapon][1],vehicles_ammo[model][weapon][2])
		end
	end,false)
	RegisterCommand('kvp',function(source,args,raw)
		if args[1]==nil or args[1]=="help" or args[1]=="?" then
			print("/kvp del key")
			print("/kvp add type key data")
			print("/kvp list")
		elseif args[1]=="GetResourceKvpString" then
			print(GetResourceKvpString(args[2]))
		elseif args[1]=="GetResourceKvpInt" then
			print(GetResourceKvpInt(args[2]))
		elseif args[1]=="GetResourceKvpFloat" then
			print(GetResourceKvpFloat(args[2]))
		elseif args[1]=="ls" or args[1]=="list" or args[1]=="find" then
			local loop,key,handle
			if args[2]==nil then
				handle=StartFindKvp("")
			else
				handle=StartFindKvp(args[2])
			end
			loop=(handle~=-1)
			while loop do
				key=FindKvp(handle)
				if key==nil then
					print("nil")
					loop=false
				elseif key==0 then
					print("null")
					loop=false
				else
					if pcall(GetResourceKvpString,key) then
						print(key.."=\""..(GetResourceKvpString(key) or "nil").."\"--(string)")
					end
					if pcall(GetResourceKvpInt,key) then
						print(key.."="..GetResourceKvpInt(key).."--(int)")
					end
					if pcall(GetResourceKvpFloat,key) then
						print(key.."="..GetResourceKvpFloat(key).."--(float)")
					end
				end
			end
			EndFindKvp(handle)
		elseif args[1]=="del" or args[1]=="delete" or args[1]=="remove" then
			if args[2]~=nil then
				DeleteResourceKvp(args[2])
			else
				print("not enough arguments")
			end
		elseif args[1]=="add" or args[1]=="edit" then
			if args[2]~=nil and args[3]~=nil and args[4]~=nil then
				if args[2]=="float" then
					SetResourceKvpFloat(args[3],tonumber(args[4]))
				elseif args[2]=="int" then
					SetResourceKvpInt(args[3],math.floor(tonumber(args[4])))
				elseif args[2]=="string" then
					SetResourceKvp(args[3],args[4])
				else
					print("/kvp add type key data")
					print("unknown type: "..args[3])
					print("known types: int, float, string")
				end
			else
				print("not enough arguments")
				print("/kvp add type key data")
			end
		elseif args[1]=="give" and args[2]~=nil then
			if args[2]=="all" then
				for k,v in pairs(item_names) do
					if not give_item_to_inventory(k,1) then
						print("Can't give "..v)
					end
				end
			else
				print(give_item_to_inventory(args[2],math.tointeger(args[3]) or 1))
			end
		else
			print("unknown command")
		end
	end,false)
end

--Citizen.CreateThread(function()
    -- local x,y,angle
    -- local object=nil
    -- local oldobject=nil
    -- local checkpoint=nil
    -- local myped=PlayerPedId()
    -- local mypos=GetEntityCoords(myped)
    -- local playersposs
    -- ::regenerate_x_y_pos::
    -- x=mypos.x+math.random(-2000,2000)
    -- y=mypos.y+math.random(-2000,2000)
    -- for i=1,32 do
        -- if IsPlayerPlaying(i) then
            -- local pped=PlayerPedId(i)
            -- playersposs=GetEntityCoords(pped)
            -- local dist = #(vector3(playersposs.x, playersposs.y, 0.0) - vector3(x, y, 0.0))
            -- if dist>300.0 then 
                
            -- else
                -- Wait(0)
                -- goto regenerate_x_y_pos
            -- end
        -- end
    -- end
    -- local function place_thing_on_ground_or_water(v)
        -- local water,height=GetWaterHeight(v.x,v.y,999.5)
        -- if not water then
            -- _,height=GetGroundZFor_3dCoord(v.x,v.y,999.5,false)
        -- end
        -- if v.z==nil or math.abs(height-v.z)>.01 then
            -- if v.object==nil then
                -- if HasModelLoaded(prop_mb_crate_01a) then
                    -- v.object=CreateObject(prop_mb_crate_01a, v.x, v.y, height, false, false, false)
                    -- if not water then PlaceObjectOnGroundProperly(v.object) end
                    -- FreezeEntityPosition(v.object,true)
                    -- v.z=height
                -- else
                    -- RequestModel(prop_mb_crate_01a)
                -- end
            -- else
                -- SetEntityCoords(v.object, v.x, v.y, height)
                -- if not water then PlaceObjectOnGroundProperly(v.object) end
                -- FreezeEntityPosition(v.object,true)
                -- v.z=height
            -- end
        -- end
    -- end
    -- local dx,dy,quad,myped,mypos,selected_thing
    -- local menu_index=1
    -- while true do Wait(0)
        -- --- blip managment
        -- if checkpoint==nil then
        -- print("Created checkpoint")
            -- checkpoint=AddBlipForCoord(x,y,0)
            -- SetBlipSprite(checkpoint,161)
            -- SetBlipColour(checkpoint,2)
            -- SetBlipScale(checkpoint,1.0)
        -- end 
        -- ---
        -- myped=PlayerPedId()
        -- mypos=GetEntityCoords(myped)
        -- WriteText(7,"from entity height above ground: "..(mypos.z-GetEntityHeightAboveGround(myped)),0.2,255,255,255,255,0.3,0.5)
        -- local bool,height=GetWaterHeight(mypos.x, mypos.y, mypos.z)
        -- WriteText(7,height and ("~g~height waves: ~s~"..height) or "nil",0.2,255,255,255,255,0.3,0.55)
        -- WriteText(7,bool and "~b~water: ~s~true" or "~b~water: ~c~false",0.2,255,255,255,255,0.3,0.57)
        -- bool,height=GetGroundZFor_3dCoord(mypos.x, mypos.y, mypos.z,true)
        -- WriteText(7,height and ("~g~height z43dc1: ~s~"..(bool and "true" or "false").." "..height) or "nil",0.2,255,255,255,255,0.3,0.62)
        -- bool,height=GetGroundZFor_3dCoord(mypos.x, mypos.y, mypos.z,false)
        -- WriteText(7,height and ("~g~height z43dc0: ~s~"..(bool and "true" or "false").." "..height) or "nil",0.2,255,255,255,255,0.3,0.64)
        
        -- local dist = #(vector3(mypos.x, mypos.y, 0.0) - vector3(x, y, 0.0))
        
        -- if object==nil then
            -- print("Created Object")
            -- object=CreateObject(GetHashKey("prop_mb_crate_01a"), x, y, -250.0, false, false, false);
            -- FreezeEntityPosition(object,true)
        -- end
        
        -- local objectpos=GetEntityCoords(object)
        
        -- ::lowerofmeter::
        -- if GetEntityHeightAboveGround(object)>5.0 then 
            -- SetEntityCoords(object, x, y, objectpos.z-1.0, false, false, false, false) 
            -- goto lowerofmeter 
        -- end
        
        
        
        -- if dist<6.0 then
            -- SetTextCentre(true)
            -- WriteText(7,"You're close to checkpoint thing",1.0,255,255,255,255,0.5,0.7)
            -- if IsControlJustPressed(0,86) then
                -- x=mypos.x+math.random(-300,300)
                -- y=mypos.y+math.random(-300,300)
                -- SetBlipCoords(checkpoint,x+0.1-0.1,y+0.1-0.1,0.0)
                -- --checkpoint=nil
                -- if oldobject~=nil then SetEntityAsMissionEntity(oldobject) DeleteEntity(oldobject) end
                -- oldobject=object
                -- object=nil
            -- end
        -- end
    -- end
--end)

local zone_name_from_char={
AIRP="Los Santos International Airport",
ALAMO="Alamo Sea",
ALTA="Alta",
ARMYB="Fort Zancudo",
BANHAMC="Banham Canyon Dr",
BANNING="Banning",
BEACH="Vespucci Beach",
BHAMCA="Banham Canyon",
BRADP="Braddock Pass",
BRADT="Braddock Tunnel",
BURTON="Burton",
CALAFB="Calafia Bridge",
CANNY="Raton Canyon",
CCREAK="Cassidy Creek",
CHAMH="Chamberlain Hills",
CHIL="Vinewood Hills",
CHU="Chumash",
CMSW="Chiliad Mountain State Wilderness",
CYPRE="Cypress Flats",
DAVIS="Davis",
DELBE="Del Perro Beach",
DELPE="Del Perro",
DELSOL="La Puerta",
DESRT="Grand Senora Desert",
DOWNT="Downtown",
DTVINE="Downtown Vinewood",
EAST_V="East Vinewood",
EBURO="El Burro Heights",
ELGORL="El Gordo Lighthouse",
ELYSIAN="Elysian Island",
GALFISH="Galilee",
GOLF="GWC and Golfing Society",
GRAPES="Grapeseed",
GREATC="Great Chaparral",
HARMO="Harmony",
HAWICK="Hawick",
HORS="Vinewood Racetrack",
HUMLAB="Humane Labs and Research",
JAIL="Bolingbroke Penitentiary",
KOREAT="Little Seoul",
LACT="Land Act Reservoir",
LAGO="Lago Zancudo",
LDAM="Land Act Dam",
LEGSQU="Legion Square",
LMESA="La Mesa",
LOSPUER="La Puerta",
MIRR="Mirror Park",
MORN="Morningwood",
MOVIE="Richards Majestic",
MTCHIL="Mount Chiliad",
MTGORDO="Mount Gordo",
MTJOSE="Mount Josiah",
MURRI="Murrieta Heights",
NCHU="North Chumash",
NOOSE="N.O.O.S.E",
OCEANA="Pacific Ocean",
PALCOV="Paleto Cove",
PALETO="Paleto Bay",
PALFOR="Paleto Forest",
PALHIGH="Palomino Highlands",
PALMPOW="Palmer-Taylor Power Station",
PBLUFF="Pacific Bluffs",
PBOX="Pillbox Hill",
PROCOB="Procopio Beach",
RANCHO="Rancho",
RGLEN="Richman Glen",
RICHM="Richman",
ROCKF="Rockford Hills",
RTRAK="Redwood Lights Track",
SANAND="San Andreas",
SANCHIA="San Chianski Mountain Range",
SANDY="Sandy Shores",
SKID="Mission Row",
SLAB="Stab City",
STAD="Maze Bank Arena",
STRAW="Strawberry",
TATAMO="Tataviam Mountains",
TERMINA="Terminal",
TEXTI="Textile City",
TONGVAH="Tongva Hills",
TONGVAV="Tongva Valley",
VCANA="Vespucci Canals",
VESP="Vespucci",
VINE="Vinewood",
WINDF="Ron Alternates Wind Farm",
WVINE="West Vinewood",
ZANCUDO="Zancudo River",
ZP_ORT="Port of South Los Santos",
ZQ_UAR="Davis Quartz",
},

RegisterNetEvent("updatesignal")
AddEventHandler('updatesignal', function(id,x,y,z,b,m,r,t,name)
    --print("got signal name:"..(name or "nil"))
    local signal=signals[id]
    if x~=nil and y~=nil then
        if signal==nil then signal={} signals[id]=signal end
        x,y=x+0.1-0.1,y+0.1-0.1
        signal.x=x
        signal.y=y
        signal.loot=nil
        if r~=nil and t~=nil then
            signal.r=r
            signal.weapons=weaponsarray[t]
            signal.models=modelgroups[t]
            signal.goto_center=true
            if t=="raiders" then
                signal.relationship=GetHashKey("RAIDER")
            elseif t=="bandits" then
                signal.relationship=GetHashKey("BANDIT")
            elseif t=="military" then
                signal.relationship=GetHashKey("MILITARY")
            else
                signal.relationship=nil
            end
        end
        if z==nil then
            z=-250.5
            signal.auto_z=true
        else
            z=z-.5-.5
            signal.z=z
            signal.auto_z=nil
        end
        if signal.blip==nil then
            signal.blip=AddBlipForCoord(x,y,0)
            SetBlipSprite(signal.blip,b or 568)
            SetBlipColour(signal.blip,b and 4 or 1)
            SetBlipScale(signal.blip,1.0)
            if b==nil or b==568 then
                if name==nil then
                    name="Raider Encampment"
                end
            elseif b==408 then
                if name==nil then
                    name="Dropped Loot"
                end
                SetBlipDisplay(signal.blip,5)
            elseif b==310 then
                if name==nil then
                    name="Survivor Loot"
                end
            end
                
            SetBlipAsShortRange(signal.blip,true)
        else
            SetBlipCoords(signal.blip,x,y,0)
        end
        if name~=nil then
            signal.name=name
            SetBlipName(signal.blip, signal.name)
        end
        m=m or prop_mb_crate_01a
        signal.m=m
        RequestModel(m)
        if signal.object==nil then
            --print("Created Object")
            while not HasModelLoaded(m) do Wait(0) end
            signal.object=CreateObject(m, x, y, z, false, false, false)
			if m==GetHashKey("prop_big_bag_01") then
				SetEntityCollision(signal.object,false)
			else --not bag so cache and need to announce
				local zonename=GetNameOfZone(x,y,z)
				SimpleNotification(messages.cache_spawned,zone_name_from_char[zonename])
			end
            FreezeEntityPosition(signal.object,true)
        else
            if signal.old_object==nil then
                while not HasModelLoaded(m) do Wait(0) end
                signal.old_object=signal.object
                signal.object=CreateObject(m, x, y, z, false, false, false)
                FreezeEntityPosition(signal.object,true)
            else
                signal.object,signal.old_object=signal.old_object,signal.object
                SetEntityCoords(signal.object, x, y, z)
				if m==GetHashKey("prop_big_bag_01") then
					SetEntityCollision(signal.object,false)
				end
                FreezeEntityPosition(signal.object,true)
            end
        end
    elseif signal~=nil then
        if signal.old_object~=nil then
            SetEntityAsMissionEntity(signal.old_object)
            DeleteObject(signal.old_object)
        end
        if signal.object~=nil then
            SetEntityAsMissionEntity(signal.object)
            DeleteObject(signal.object)
        end
        if signal.blip~=nil then
            RemoveBlip(signal.blip)
        end
        if signal.x~=nil then
            signal.x=signal.x+10000 --workaround to break distance based loop in other thread
        end
        if signal.y~=nil then
            signal.y=signal.y+10000 --workaround to break distance based loop in other thread
        end
        signals[id]=nil
    end
    --update_blips_relationship_colors()
end)

RegisterNetEvent("lootcratehealth")
AddEventHandler('lootcratehealth', function(id,health)
    local signal=signals[id]
    if signal~=nil then
        signal.health=health
        if health~=nil then
            if signal.maxhealth==nil or health>signal.maxhealth then
                signal.maxhealth=health
            end
        end
    end
end)
RegisterNetEvent("updatelootcrate")
AddEventHandler('updatelootcrate', function(id,loot)
    local signal=signals[id]
    if signal~=nil then
        signal.loot=loot
        signal.health=nil
    end
end)

RequestModel(prop_mb_crate_01a)
Citizen.CreateThread(function()
Wait(2000)
TriggerServerEvent("request_data")
end)

Citizen.CreateThread(function()
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        local myveh=GetVehiclePedIsIn(myped)
        local havetrailer,trailer=GetVehicleTrailerVehicle(myveh)
        local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        local y=0.32
        if inventory.highlight<=0 then
            WriteHint(6,messages.press_e_to_open_inventory)
        else
            WriteHint(6,messages.press_backspace_to_close_inventory)
            WriteHint(6,messages.press_arrows_to_navigate_inventory)
            --WriteHint(6,"~c~Press ~s~F9 ~c~to drop weapon")
            --WriteHint(6,"~c~Press ~s~F10 ~c~to unload weapon")
            WriteHint(6,messages.press_to_deattach_upgrades)
            if inventory.total>0 then
                WriteHint(6,messages.press_enter_to_use_item)
                WriteHint(6,messages.press_delete_to_drop_item)
            end
        end
        if zone~=nil then
            if zone.craftpos~=nil and in_radius(mypos,zone.craftpos,1)
            or zone.clothespos~=nil and in_radius(mypos,zone.clothespos,1)
            or zone.changingroompos~=nil and in_radius(mypos,zone.changingroompos,1)
            or zone.garages~=nil and (dist_to_closest_point(zone.garages,mypos)<225)
            or zone.vehpos~=nil and in_radius(mypos,zone.vehpos,1)
            or zone.storagepos~=nil and in_radius(mypos,zone.storagepos,1)
            then 
                WriteHint(6,messages.press_e_to_interact)
            end
            if zone.factionjoinpos~=nil and in_radius(mypos,zone.factionjoinpos,1) then
                WriteHint(6,{messages.press_e_to_join_faction_for_cash,zone.factionname,zone.factionjoin.cost})
			end
            if zone.tradepos~=nil and in_radius(mypos,zone.tradepos,1) then
                WriteHint(6,messages.press_e_to_trade)
			end
            if zone.sellpos~=nil and in_radius(mypos,zone.sellpos,1) then
                WriteHint(6,messages.press_e_to_trade)
			end
            if zone.name~=nil then
                local rel=GetRelationshipBetweenGroups(GetPedRelationshipGroupHash(myped),zone.relationship)
                if rel==0 then
                    WriteHint(6,messages.youre_in_friendly_territory)
                elseif rel==5 then
                    WriteHint(6,messages.youre_in_enemy_territory)
                elseif not zone.t~=72 then
                    WriteHint(6,messages.youre_in_neutral_territory)
                end
            end
        end
        if player.hydration<=0.1 then
            WriteHint(6,messages.youre_dying_dehydration)
        end
        if player.saturation<=0.1 then
            WriteHint(6,messages.youre_dying_starvation)
        end
        if player.weight>player.maxweight then
            WriteHint(6,messages.youre_overencumbered)
        end
        if havetrailer then
            local trailermodel=GetEntityModel(trailer)
            if trailermodel==-730904777 or trailermodel==1956216962 or trailermodel==-1207431159 then
                if DecorExistOn(trailer,"gasoline") then
                    WriteHint(6,{messages.this_trailer_tank_has_x_gasoline,DecorGetInt(trailer,"gasoline")})
                else
                    WriteHint(6,messages.this_trailer_tank_has_no_gasoline)
                end
            end
        end
        if IsPedInAnyVehicle(myped) then
            if GetVehicleFuelLevel(myveh)<7.1 then
                if GetVehicleFuelLevel(myveh)<1.1 then
                    WriteHint(6,messages.vehicle_out_of_fuel)
                else
                    WriteHint(6,messages.fuel_level_low)
                end
            end
        end
        if player.bleeding>0 then
            if player.bleeding==1 then
                WriteHint(6,messages.you_have_bleeding_wound)
            else
                WriteHint(6,{messages.you_have_x_bleeding_wounds,player.bleeding})
            end
        end
        if player.blood<100.0 then
            WriteHint(6,messages.blood_loss_caused_faster_dehydration)
        end
    end
end)


--[[
local gasstations={
    
    {
        trader={x=162.09725952148,y=6636.5678710938,z=31.556589126587,blip=361},
        tank={x=172.08010864258,y=6622.7368164063,z=31.832139968872,blip=431},
        gasoline=0,
    },
    {
        trader={x=646.29534912109,y=267.25625610352,z=103.26166534424,blip=361},
        tank={x=635.08709716797,y=255.35494995117,z=103.12169647217,blip=431},
        gasoline=0,
    },
    {
        trader={x=1200.6888427734,y=2655.7438964844,z=37.851871490479,blip=361}, --NEAR SANDY
        tank={x=1192.6104736328,y=2662.490234375,z=37.822631835938,blip=431},
        gasoline=0,
    },
    
}
local gasoline_generators={
    
    {x=1527.603515625,y=-2113.7202148438,z=76.686614990234,blip=648,color=51},
    
}

RegisterNetEvent("gasstation_update")
AddEventHandler("gasstation_update",function(id,amount)
    gasstations[id].gasoline=amount
    gasstations[id].firsttimecheckdone=true
end)

Citizen.CreateThread(function()
    local price=5
    local sellprice=10
    local blip
    for k,v in ipairs(gasstations) do
        -- blip=AddBlipForCoord(v.tank.x,v.tank.y,v.tank.z)
        -- SetBlipSprite(blip, v.tank.blip)
        -- SetBlipAsShortRange(blip,true)
        -- SetBlipColour(blip, 4)
        -- SetBlipName(blip, "Sell fuel tank")
        
        blip=AddBlipForCoord(v.trader.x,v.trader.y,v.trader.z)
        SetBlipSprite(blip, v.trader.blip)
        SetBlipAsShortRange(blip,true)
        SetBlipColour(blip, 4)
        SetBlipName(blip, "Gas station")
    end
    for k,v in ipairs(gasoline_generators) do
        blip=AddBlipForCoord(v.x,v.y,v.z)
        SetBlipSprite(blip, v.blip)
        SetBlipAsShortRange(blip,true)
        SetBlipColour(blip, v.color)
        SetBlipName(blip, "Gasoline refinery")
    end
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        for k,v in ipairs(gasstations) do
            if in_radius(mypos,v.trader,20) then
                if v.firsttimecheckdone==nil then
                    TriggerServerEvent("request_gasstation",k)
                    v.firsttimecheckdone=true
                end
                DrawMarker(20, v.trader.x, v.trader.y, v.trader.z, 
                0.0, 0.0, 0.0, --dir
                0.0, 0.0, 0.0, --rot
                1.0, 1.0, -1.0, --scl
                200, 200, 200, 200, 
                true, false, 2, true, 0, 0, false);
            
                if in_radius(mypos,v.trader,2) then
                    --TriggerServerEvent("ask_for_gasoline_amount",k)
                    local inv_index_price=0
                    local inv_index_goods=0
                    local youhaveamount_price=0
                    local youhaveamount_goods=0
                    for j=1,inventory.total do
                        if inventory[j].item=="cash" then
                            youhaveamount_price=inventory[j].amount
                            inv_index_price=j
                        elseif inventory[j].item=="gasoline" then
                            youhaveamount_goods=inventory[j].amount
                            inv_index_goods=j
                        end
                    end
                    WriteText(4,"Buy gasoline for ~g~$"..price,0.8,255,255,255,255,0.4,0.5)
                    WriteText(4,"~g~E ~s~to accept",0.65,255,255,255,255,0.4,0.55)
                    if v.gasoline~=nil then
                        WriteText(4,{"Gas station has ~o~~1~ ~s~gasoline",v.gasoline},0.65,255,255,255,255,0.4,0.65)
                    end
                    WriteText(4,{"You have ~o~~1~ ~s~gasoline and ~g~$~1~",youhaveamount_goods,youhaveamount_price},0.65,255,255,255,255,0.4,0.70)
                    
                    
                    if IsControlJustPressed(0,86) then
                        if youhaveamount_price>=price and v.gasoline>0 then
                            if give_item_to_inventory("gasoline",1) then
                                inventory[inv_index_price].amount=youhaveamount_price-price
                                TriggerServerEvent("buy_gasoline",k)
                            end
                        else
                            SimpleNotification("Not enough cash or there is no gasoline at this gas station.")
                        end
                    end
                end
            end
            if in_radius(mypos,v.tank,20) then
                DrawMarker(20, v.tank.x, v.tank.y, v.tank.z, 
                0.0, 0.0, 0.0, --dir
                0.0, 0.0, 0.0, --rot
                1.0, 1.0, -1.0, --scl
                200, 200, 100, 200, 
                true, false, 2, true, 0, 0, false);
                if in_radius(mypos,v.tank,5) then
                    if v.gasoline<2000 then
                        if IsPedInAnyVehicle(myped) then
                            local myveh=GetVehiclePedIsIn(myped)
                            if GetPedInVehicleSeat(myveh,-1)~=myped then
                                WriteHint("~c~Only driver can sell gasoline")
                            elseif IsControlJustPressed(0,86) then
                                local havetrailer,trailer=GetVehicleTrailerVehicle(myveh)
                                if havetrailer then
                                    local trailermodel=GetEntityModel(trailer)
                                    if trailermodel==-730904777 or trailermodel==1956216962 or trailermodel==-1207431159 then
                                        if DecorExistOn(trailer,"gasoline") then
                                            local curgas=DecorGetInt(trailer,"gasoline")
                                            local gasneeded=2000-v.gasoline
                                            local reward
                                            if curgas>gasneeded then
                                                reward=gasneeded*3
                                                if give_item_to_inventory("cash",reward) then
                                                    DecorSetInt(trailer,"gasoline",curgas-gasneeded)
                                                    TriggerServerEvent("refill_gasstation",k,gasneeded)
                                                    FlashMinimapDisplay()
                                                    SimpleNotification("You sold ~o~~1~ gasoline ~s~and got ~g~$~1~",gasneeded,reward)
                                                else
                                                    SimpleNotification("You don't have place for reward in inventory")
                                                end
                                            else
                                                reward=curgas*3
                                                if give_item_to_inventory("cash",reward) then 
                                                    --SetEntityAsMissionEntity(trailer)
                                                    --DeleteVehicle(trailer)
                                                    DecorRemove(trailer,"gasoline")
                                                    TriggerServerEvent("refill_gasstation",k,curgas)
                                                    FlashMinimapDisplay()
                                                    SimpleNotification("You sold ~o~~1~ gasoline ~s~and got ~g~$~1~",curgas,reward)
                                                else
                                                    SimpleNotification("You don't have place for reward in inventory")
                                                end
                                            end
                                        else
                                            SimpleNotification("This trailer is empty")
                                        end
                                    else
                                        SimpleNotification("This is wrong trailer")
                                    end
                                else
                                    SimpleNotification("You don't have gasoline trailer tank attached!")
                                end
                            else
                                WriteHint("~c~Press ~s~E ~c~to sell ~g~FILLED GASOLINE TRAILER TANK")
                            end
                        else
                            WriteHint("~c~Bring ~g~FILLED GASOLINE TRAILER TANK ~c~here to sell it")
                        end
                    else
                        WriteHint("~c~This ~g~GAS STATION IS FULL ~c~and doesn't require resupply")
                    end
                end
            end
        end
        for k,v in ipairs(gasoline_generators) do
            if in_radius(mypos,v,15) then
                DrawMarker(20, v.x, v.y, v.z, 
                0.0, 0.0, 0.0, --dir
                0.0, 0.0, 0.0, --rot
                1.0, 1.0, -1.0, --scl
                250, 200, 50, 200, 
                true, false, 2, true, 0, 0, false);
                local myveh=GetVehiclePedIsIn(myped)
                if GetPedInVehicleSeat(myveh,-1)==myped then
                    local havetrailer,trailer=GetVehicleTrailerVehicle(myveh)
                    if havetrailer then
                        local trailermodel=GetEntityModel(trailer)
                        if trailermodel==-730904777 or trailermodel==1956216962 or trailermodel==-1207431159 then
                            if DecorExistOn(trailer,"gasoline") then
                                local curgas=DecorGetInt(trailer,"gasoline")
                                if curgas<1000 then
                                    DecorSetInt(trailer,"gasoline",curgas+1)
                                end
                            else
                                DecorSetInt(trailer,"gasoline",1)
                            end
                            Wait(300)
                        else
                            WriteHint("~c~You can not put gasoline in this trailer")
                        end
                    else
                        WriteHint("~c~You need ~s~GASOLINE TRAILER ~c~to refill it")
                    end
                else
                    WriteHint("~c~You need to be in vehicle and you need ~s~GASOLINE TRAILER ~c~to refill it")
                end
            end
        end
    end
end)]]

-- Citizen.CreateThread(function()
    -- while true do Wait(0)
    -- end
-- end)

local safehouses={
	{x=1699.8450927734,y=3866.7768554688,z=34.905326843262,sprite=40,color=13,name="safehouse",type="standard"}, -- sandy near lake
	{x=1737.7784423828,y=3709.4020996094,z=34.135791778564,sprite=40,color=13,name="safehouse",type="standard"}, -- honk for delivs
}
local safehouse_types={
	standard={x=266.05004882813,y=-1007.0971679688,z=-100.97016906738},
}

Citizen.CreateThread(function()
    local map_icons={
    {x=108.92474365234,y=6626.1171875,z=31.787254333496,sprite=446,color=13,name="Car parts shop"}, --paleto
    {x=1176.3358154297,y=2640.3842773438,z=37.754180908203,sprite=446,color=13,name="Car parts shop"}, --sandy
    {x=-336.08795166016,y=-134.01849365234,z=39.010066986084,sprite=446,color=13,name="Car parts shop"}, --middle
    {x=731.84368896484,y=-1082.7537841797,z=22.147554397583,sprite=446,color=13,name="Car parts shop"}, --anarchy
    {x=-205.81533813477,y=-1319.939453125,z=30.238958358765,sprite=446,color=13,name="Car parts shop"}, --benny
    {x=-1156.0357666016,y=-2009.0445556641,z=12.529552459717,sprite=446,color=13,name="Car parts shop"}, --airport
    
    {x=1962.7620849609,y=3744.193359375,z=32.343746185303,sprite=52,name="Provision store"}, --sandy
    {x=1733.9096679688,y=6414.2333984375,z=35.037258148193,sprite=52,name="Provision store"}, --norrth
    {x=-49.969524383545,y=-1753.4479980469,z=29.421014785767,sprite=52,name="Provision store"}, --ghetto
    {x=29.157470703125,y=-1345.513671875,z=29.496995925903,sprite=52,name="Provision store"}, --north ghetto
    {x=1159.0723876953,y=-321.81414794922,z=69.205070495605,sprite=52,name="Provision store"}, --EAST LS
    {x=-711.62475585938,y=-912.67266845703,z=19.215587615967,sprite=52,name="Provision store"}, --little seul
    {x=-1223.8529052734,y=-905.83740234375,z=12.3263463974,sprite=52,name="Provision store"}, --LEFT OF LITTLE SEUL
    {x=-1488.1184082031,y=-381.16339111328,z=40.163387298584,sprite=52,name="Provision store"}, --WEST exit ls
    {x=-1824.0257568359,y=790.37286376953,z=138.19316101074,sprite=52,name="Provision store"}, --WEST NORTH exit ls
    {x=-2969.3889160156,y=390.57669067383,z=15.043313980103,sprite=52,name="Provision store"}, --banham 1 (southern)
    {x=-3042.4968261719,y=588.54547119141,z=7.9089293479919,sprite=52,name="Provision store"}, --banham 2 
    {x=-3243.7302246094,y=1005.2648925781,z=12.830717086792,sprite=52,name="Provision store"}, --banham 3 
    {x=377.5036315918,y=326.63232421875,z=103.56637573242,sprite=52,name="Provision store"}, --ls north
    {x=544.240234375,y=2669.169921875,z=42.156532287598,sprite=52,name="Provision store"}, --HARMONY
    {x=2678.7194824219,y=3284.6645507813,z=55.24112701416,sprite=52,name="Provision store"}, --east near you tool
    {x=1702.1368408203,y=4927.0517578125,z=42.063678741455,sprite=52,name="Provision store"}, --GRAPESEED
    {x=1166.4211425781,y=2707.5710449219,z=38.15771484375,sprite=52,name="Provision store"}, --GRAND SENORA
    {x=2555.1860351563,y=385.80474853516,z=108.62294769287,sprite=52,name="Provision store"}, --swat east
    
    {x=136.49124145508,y=-1708.3150634766,z=29.291620254517,sprite=71}, --barber ghetto near station
    {x=-1283.5354003906,y=-1117.2982177734,z=6.9901118278503,sprite=71}, --barber NEAR BEACH
    {x=-815.05908203125,y=-184.52572631836,z=37.56888961792,sprite=71}, --barber elite
    {x=-33.047420501709,y=-152.32252502441,z=57.076499938965,sprite=71}, --barber CENTER CITY
    {x=1212.4984130859,y=-472.68957519531,z=66.208000183105,sprite=71}, --barber east
    {x=1932.1176757813,y=3729.2197265625,z=32.84423828125,sprite=71}, --barber sandy
    {x=-278.52871704102,y=6228.6616210938,z=31.695261001587,sprite=71}, --barber paleto
    
    {x=1323.6118164063,y=-1652.4865722656,z=52.275413513184,sprite=75}, --tatoo east
    {x=322.22174072266,y=181.4826965332,z=103.5864944458,sprite=75}, --tatoo north
    {x=-3170.7678222656,y=1076.0648193359,z=20.82918548584,sprite=75}, --tatoo west
    {x=1863.7347412109,y=3748.7912597656,z=33.031890869141,sprite=75}, --tatoo sandy
    {x=-292.48239135742,y=6197.263671875,z=31.488706588745,sprite=75}, --tatoo paleto
    {x=-1153.3564453125,y=-1426.2795410156,z=4.9544591903687,sprite=75}, --tatoo THE PIT
    
    {x=-326.86383056641,y=6080.3544921875,z=31.45477104187,sprite=110}, --paleto
    {x=2569.3251953125,y=297.60437011719,z=108.73485565186,sprite=110}, --swat east
    {x=1695.0667724609,y=3756.5124511719,z=34.70531463623,sprite=110}, --sandy
    {x=-3169.6496582031,y=1085.1940917969,z=20.838739395142,sprite=110}, --chumash
    {x=-1116.6037597656,y=2695.0380859375,z=18.554153442383,sprite=110}, --near military base
    {x=19.483867645264,y=-1110.0297851563,z=29.797027587891,sprite=110}, --near ALTA
    {x=-663.71563720703,y=-938.05987548828,z=21.829229354858,sprite=110}, --little syaomi
    {x=811.59045410156,y=-2154.2568359375,z=29.61901473999,sprite=110}, --east ls
    {x=249.35090637207,y=-47.442733764648,z=69.941123962402,sprite=110}, --сутеук дщеы ща ырщзы
    {x=843.78741455078,y=-1029.9522705078,z=28.194849014282,sprite=110}, --NEAR ANARCHISTS
    {x=-1308.6551513672,y=-392.06604003906,z=36.695762634277,sprite=110}, --diagonal
    }
    for k,v in ipairs(map_icons) do        
        blip=AddBlipForCoord(v.x,v.y,v.z)
        SetBlipSprite(blip, v.sprite)
        SetBlipAsShortRange(blip,true)
        SetBlipColour(blip, 4)
		SetBlipDisplay(blip, 5)
        if v.name~=nil then
            SetBlipName(blip, v.name)
        end
    end
    for k,v in ipairs(safezones) do        
        v.bliphandler=AddBlipForCoord(v.x,v.y,v.z)
		SetBlipDisplay(v.bliphandler,2)
        SetBlipSprite(v.bliphandler, v.blip)
        SetBlipScale(v.bliphandler, 1.5)
        SetBlipAsShortRange(v.bliphandler,true)
        if v.raided then
            SetBlipColour(v.bliphandler, 39)
        else
            SetBlipColour(v.bliphandler, v.color)
        end
        if v.name~=nil then
            SetBlipName(v.bliphandler, v.name)
        end
    end
end)

death_event=function()
        local ped=PlayerPedId()
        local h=GetEntityHeightAboveGround(ped)
        local pos=GetEntityCoords(ped)
        local loot={}
        local total=0
        if inventory.total>0 then
            total=inventory.total
            for i=1,inventory.total do
               loot[inventory[i].item]=inventory[i].amount
            end
        end
        inventory.total=0
        inventory.current=0
        inventory.scroll=0
        -- for k,v in pairs(weapons) do
            -- local weapon_hash=GetHashKey("weapon_"..k)
            -- if not IsWeaponValid(weapon_hash) then
                -- weapon_hash=GetHashKey("gadget_"..k)
                -- if not IsWeaponValid(weapon_hash) then
                    -- weapon_hash=GetHashKey(k)
                    -- if not IsWeaponValid(weapon_hash) then
                        -- weapon_hash=nil
                    -- end
                -- end
            -- end
            -- if weapon_hash~=nil and HasPedGotWeapon(ped,weapon_hash) then
                -- strip_weapon_upgrades(weapon_hash)
                -- total=total+1
                -- loot[k]=(loot[k] or 0)+1
                -- -- local found,clip=GetAmmoInClip(ped,weapon_hash)
                -- -- print("dropped "..k.." with "..(found and "true " or "false ")..clip)
                -- -- if found and clip>0 then
                    -- -- local ammo_type=GetPedAmmoTypeFromWeapon(ped,weapon_hash)
                    -- -- for ammo_name,ammo_type_hash in pairs(ammo_types) do
                        -- -- if ammo_type==ammo_type_hash then
                            -- -- loot[ammo_name]=(loot[ammo_name] or 0)+clip
                            -- -- break
                        -- -- end
                    -- -- end
                -- -- end
                -- RemoveWeaponFromPed(ped,weapon_hash)
            -- end
        -- end
        for k,v in pairs(ammo_types) do
            local ammo=GetPedAmmoByType(ped,v)
            if ammo>0 then
                total=total+1
                loot[k]=(loot[k] or 0)+ammo
            end
        end
        if inventory.total>0 then
            total=total+inventory.total
            for i=1,inventory.total do
               loot[inventory[i].item]=inventory[i].amount
            end
        end
        if total>0 then
            TriggerServerEvent("imdead",pos.x,pos.y,pos.z+1-h,loot)
        end
		local killer=GetPedSourceOfDeath(ped)
		if killer and killer~=0 and IsEntityAPed(killer) and killer~=ped then
			local killerfaction=GetPedRelationshipGroupHash(killer)
			local myfaction=GetPedRelationshipGroupHash(ped)
			
			local myfaction_cost=relationship_reputation_changes.player[myfaction]
			local killerfaction_cost=relationship_reputation_changes.player[killerfaction]
			
			if myfaction_cost~=nil and killerfaction_cost~=nil and myfaction_cost~=0 and killerfaction_cost~=0 then
				if (myfaction_cost~killerfaction_cost)<0 then -- means it's either - and + or + and -
					change_reputation(myfaction_cost)
					SimpleNotification(messages.you_got_killed_and_reputation_changed)
				end
			end
		end
		
        inventory.total=0
        inventory.current=0
        inventory.scroll=0
        SetResourceKvpInt("inventory_total",0)
        SetResourceKvpInt("inventory_current",0)
        for i=1,inventory.max do
            inventory[i]=nil
            DeleteResourceKvp("inventory_item_"..i)
            DeleteResourceKvp("inventory_amount_"..i)
        end
		-- player.faction=nil
		-- saving_kvp_mode.DeleteResourceKvp("player_faction")
end

RegisterNetEvent("zonestatus")
AddEventHandler("zonestatus",function(name,status)
    --print("zonestatus ")
    for k,v in pairs(safezones) do 
        if v.name==name then
            if status then
                SetBlipColour(v.bliphandler, 39)
            else
                SetBlipColour(v.bliphandler, v.color)
            end
            v.raided=status
            --print(v.raided)
        end
    end
end)

load_save_event=function()
	load_save_event=function() end
    local oldweapons=0
    --local totalweapons=0
    local hashsum=0
    local ammosum=0
    local oldammo=0
    local ammo=0
    local myped=PlayerPedId()
	for name,weapon_hash in pairs(weapons) do
		if GetResourceKvpInt(name)~=0 then
			GiveWeaponToPed(myped,weapon_hash,0,false,true)
			oldweapons=oldweapons~weapon_hash
			for upgrade_name,v in pairs(weapon_upgrades) do
				local upgrade_hash=v[weapon_hash]
				if upgrade_hash~=nil then
					local concname=string.format('_%x%x',weapon_hash&0xFFFFFFFF,upgrade_hash&0xFFFFFFFF)
					print("GetResourceKvpInt "..concname)
					if GetResourceKvpInt(concname)~=0 then
						GiveWeaponComponentToPed(myped,weapon_hash,upgrade_hash)
						print("give weapon with component:"..concname)
						DeleteResourceKvp(concname)
					end
				end
			end
		end
	end
    for name,hash in pairs(ammo_types) do
        ammo=GetResourceKvpInt(name)
        SetPedAmmoByType(myped,hash,ammo)
        oldammo=oldammo+ammo
        --DeleteResourceKvp(name)
    end
	player.suit=GetResourceKvpString("suit") or player.suit
	player.mask=GetResourceKvpString("mask") or player.mask
	player.hat=GetResourceKvpString("hat") or player.hat
	if GetResourceKvpString("backpack") then
		player.backpack=true
	end
	if GetResourceKvpString("bodyarmor") then
		player.bodyarmor=true
	end
	if GetResourceKvpInt("player_faction") then
		player.faction=GetResourceKvpInt("player_faction")
		print("loaded player faction "..player.faction or "nil")
	end
	Citizen.CreateThread(function()
		while true do
			Wait(0)
			hashsum=0
			myped=PlayerPedId()
			for name,hash in pairs(weapons) do
				if HasPedGotWeapon(myped,hash) then
					hashsum=hashsum~hash
				end
			end
			if hashsum~=oldweapons then
				Wait(0)
				oldweapons=0
				for name,hash in pairs(weapons) do
					myped=PlayerPedId()
					if HasPedGotWeapon(myped,hash) then
						oldweapons=oldweapons~hash
						SetResourceKvpInt(name,1)
					else
						DeleteResourceKvp(name)
					end
					Wait(0)
				end
			end
			Wait(0)
			myped=PlayerPedId()
			ammosum=0
			for name,hash in pairs(ammo_types) do
				ammo=GetPedAmmoByType(myped,hash)
				ammosum=ammosum+ammo
			end
			if ammosum~=oldammo then
				Wait(0)
				oldammo=0
				for name,hash in pairs(ammo_types) do
					myped=PlayerPedId()
					ammo=GetPedAmmoByType(myped,hash)
					SetResourceKvpInt(name,ammo)
					oldammo=oldammo+ammo
					Wait(0)
				end
			end
		end
	end)
end

local teleports={
{x=1717.3126220703,y=4791.8251953125,z=41.984027862549},--,angle=261.28918457031}, --north trading post
{x=1716.1958007813,y=4792.0146484375,z=41.983989715576},--,angle=80.689674377441},
}

Citizen.CreateThread(function()
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        for k,v in ipairs(teleports) do
            local dist=sqrt_dist(mypos,v)
            if dist<100.0 then
                DrawMarker(0, v.x, v.y, v.z, 
                0.0, 0.0, 0.0, --dir
                0.0, 0.0, 0.0, --rot
                0.6, 0.6, 0.6, --scl
                255, 255, 150, 200, 
                true, false, 2, true, 0, 0, false)
                if dist<1.0 then
                    if IsControlJustPressed(0,86) then
                        if k%2==1 then --не четное like 1 3 5 7
                            SetEntityCoords(myped,teleports[k+1].x,teleports[k+1].y,teleports[k+1].z-1.0)
                        else
                            SetEntityCoords(myped,teleports[k-1].x,teleports[k-1].y,teleports[k-1].z-1.0)
                        end
                    end
                end
            end
        end
    end
end)

local function check_for_people_in_raid(v,hash)
    local loop,handle,npc
    local dx,dy,r,r2
    r=v.r+30
    r2=r*r
    handle,npc=FindFirstPed()
    loop=(handle~=-1)
    while loop do
        if GetPedRelationshipGroupHash(npc)==hash and not IsPedDeadOrDying(npc) then
            local npcpos=GetEntityCoords(npc)
            dx=v.x-npcpos.x
            if math.abs(dx)<r then
                dy=v.y-npcpos.y
                if math.abs(dy)<r then
                    if dx*dx+dy*dy<r2 then
                        EndFindPed(handle)
                        return true
                    end
                end
            end
        end
        loop,npc=FindNextPed(handle)
    end
    EndFindPed(handle)
    return false
end

-- Citizen.CreateThread(function() --hide safezone blips when inside
	-- while true do Wait(2541)
		-- local myped=PlayerPedId()
		-- local mypos=GetEntityCoords(myped)
		-- local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
		-- if zone and zone.blip and zone.vehpos then
			-- SetBlipDisplay(zone.blip,0)
		-- else
			-- for k,v in pairs(safezones) do
				-- if v.blip and v.vehpos then
					-- SetBlipDisplay(v.blip,2)
				-- end
			-- end
		-- end
	-- end
-- end)

--killing zones roamers
Citizen.CreateThread(function()
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        --local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        local dx,dy
        for k,v in pairs(raids) do
            dx=v.x-mypos.x
            if math.abs(dx)<v.r then
                dy=v.y-mypos.y
                if math.abs(dy)<v.r then
                    if dx*dx+dy*dy<v.r*v.r then
                        if v.relationship==GetHashKey("BANDIT") then
                            if v.lives then
                                WriteHint(7,{messages.encountered_marauder_patrol,v.lives})
                            end
                        elseif v.relationship==GetHashKey("SURVIVOR") then
                            if v.lives then
                                WriteHint(7,{messages.encountered_scavenger_patrol,v.lives})
                            end
                        elseif v.relationship==GetHashKey("MERC") then
                            if v.lives then
                                WriteHint(7,{messages.encountered_mercenary_patrol,v.lives})
                            end
                        elseif v.relationship==GetHashKey("RAIDER") then
                            if v.lives then
                                if v.t==2 then
                                    WriteHint(7,{messages.encountered_military_patrol,v.lives})
                                elseif v.t==4 then
                                    WriteHint(7,{messages.encountered_mercenary_patrol,v.lives})
                                else
                                    WriteHint(7,{messages.encountered_raider_patrol,v.lives})
                                end
                            end
                        elseif v.relationship==GetHashKey("GOVERNMENT") then
                            if v.lives then
                                WriteHint(7,{messages.encountered_government_patrol,v.lives})
                            end
                        end
                        if not check_for_people_in_raid(v,v.relationship) then
                            local possible_bases={}
                            for _,base in pairs(safezones) do
                                if base.relationship==v.relationship then
                                    table.insert(possible_bases,base)
                                end
                            end
                            -- if 0<#possible_bases then
                                -- local base=possible_bases[math.random(1,#possible_bases)]
                                -- TriggerServerEvent("raid_killed",k,base.x,base.y,base.z)
                                -- SimpleNotification("Patrol has been ~r~eliminated~s~.")
                            -- end
                        end
                    end
                end
            end
        end
        for k,v in pairs(safezones) do
            dx=v.x-mypos.x
            if math.abs(dx)<v.r then
                dy=v.y-mypos.y
                if math.abs(dy)<v.r then
                    if dx*dx+dy*dy<v.r*v.r then
                        if v.relationship==GetHashKey("BANDIT") then
                            WriteHint(7,messages.encountered_marauder_base)
                        elseif v.relationship==GetHashKey("SURVIVOR") then
                            WriteHint(7,messages.encountered_scavenger_base)
                        elseif v.relationship==GetHashKey("GOVERNMENT") then
                            WriteHint(7,messages.encountered_government_base)
                        end
                    end
                end
            end
        end
    end
end)



Citizen.CreateThread(function()
    while true do Wait(1923)
		local result=nil
		local maximum=-9999
		local myped=PlayerPedId()
		if not player.faction or player.faction==0 then
			for k,v in pairs(faction_reputation_requirements) do
				if player.reputation>v and v>maximum then
					result=k
					maximum=v
				end
			end
			SetPedRelationshipGroupHash(myped,result)
		else
			local myped=PlayerPedId()
			local myfaction=GetPedRelationshipGroupHash(myped)
			if myfaction~=player.faction then
				SetPedRelationshipGroupHash(myped,player.faction)
			end
			for k,v in pairs(faction_reputation_requirements) do
				if player.reputation>v and v>maximum then
					result=k
					maximum=v
				end
			end
			if GetRelationshipBetweenGroups(result,player.faction)==5 then
				player.faction=nil
				saving_kvp_mode.DeleteResourceKvp("player_faction")
			end
		end
		--SimpleNotification("reputation: ~1~ / faction: ~a~",player.reputation,relationship_names[GetPedRelationshipGroupHash(myped)])
    end
end)


-- Citizen.CreateThread(function()
    -- local xxxxxxx=0.0
    
    -- local neutral={}
    -- neutral.r=255
    -- neutral.g=235
    -- neutral.b=100
    -- local friends={}
    -- friends.r=50
    -- friends.g=200
    -- friends.b=75
    -- local enemy={}
    -- enemy.r=200
    -- enemy.g=50
    -- enemy.b=50
    
    -- local r,g,b
    
    -- while true do Wait(0)
        -- local myped=PlayerPedId()
        -- local mypos=GetEntityCoords(myped)
        -- local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        -- if zone and zone.lives then
            -- WriteHint({"Patrol strength: ~1~/~1~",zone.lives,zone.maxlives})
            -- --WriteHint({"Zone relationship:~a~",tostring(zone.relationship or "nil")})
            -- --WriteHint({"Zone models:~a~",tostring(zone.models or "nil")})
        -- end
        -- if zone and zone.relationship and not disablehud then
            -- local myrel=GetPedRelationshipGroupHash(myped)
            
            -- local relnumber=GetRelationshipBetweenGroups(myrel,zone.relationship)
            
            -- local chunk_x=0.049
            -- local chunk_y=0.008
        
        
            -- SetTextCentre(true)
            -- DrawRect(0.5,0.05,0.301,0.012,0,0,0,255) -- -0.00025 --black bar
            
            -- DrawRect(0.5-.125,0.05,chunk_x,chunk_y,50,50,50,255) --grey
            -- DrawRect(0.5-.075,0.05,chunk_x,chunk_y,50,50,50,255)
            -- DrawRect(0.5-.025,0.05,chunk_x,chunk_y,50,50,50,255)
            -- DrawRect(0.5+.025,0.05,chunk_x,chunk_y,50,50,50,255)
            -- DrawRect(0.5+.075,0.05,chunk_x,chunk_y,50,50,50,255)
            -- DrawRect(0.5+.125,0.05,chunk_x,chunk_y,50,50,50,255)
            
            -- if relnumber==0 then
                -- r=friends.r
                -- g=friends.g
                -- b=friends.b
                -- DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.025,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5+.025,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5+.075,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5+.125,0.05,chunk_x,chunk_y,r,g,b,255)
            -- elseif relnumber==1 then
                -- r=friends.r
                -- g=friends.g
                -- b=friends.b
                -- DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.025,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5+.025,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5+.075,0.05,chunk_x,chunk_y,r,g,b,255)
            -- elseif relnumber==2 then
                -- r=neutral.r
                -- g=neutral.g
                -- b=neutral.b
                -- DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.025,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5+.025,0.05,chunk_x,chunk_y,r,g,b,255)
            -- elseif relnumber==3 then
                -- r=neutral.r
                -- g=neutral.g
                -- b=neutral.b
                -- DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.025,0.05,chunk_x,chunk_y,r,g,b,255)
            -- elseif relnumber==4 then
                -- r=enemy.r
                -- g=enemy.g
                -- b=enemy.b
                -- DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                -- DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
            -- elseif relnumber==5 then
                -- r=enemy.r
                -- g=enemy.g
                -- b=enemy.b
                -- DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
            -- end
            
            -- if zone.name then
                -- local newname=zone.name
                -- local firstchar=string.sub(newname,1,1)
                -- if firstchar=="~" then
                    -- newname=string.sub(newname,4)
                -- end
                -- WriteText(4,{"~a~ - ~a~",newname,relationship_names[zone.relationship]},0.5,r,g,b,255,0.5,0.008) --base name
            -- end
            
            -- SetTextRightJustify(true)
            -- SetTextWrap(0.0,0.34)            
            -- WriteText(4,"Hostile",0.4,r,g,b,255,xxxxxxx,0.035) --My faction
            -- WriteText(4,"Friendly",0.4,r,g,b,255,0.66,0.035) --Their faction
            -- -- WriteText(4,relationship_names[myrel],0.4,r,g,b,255,xxxxxxx,0.035) --My faction
            -- -- WriteText(4,relationship_names[zone.relationship],0.4,r,g,b,255,0.66,0.035) --Their faction
            -- SetTextCentre(true)
            -- WriteText(4,relationship_names[relnumber],0.3,r,g,b,255,0.5,0.062) --status
        -- end
    -- end
-- end)


Citizen.CreateThread(function()
    local checkeddeadbodies={}
    local loop,handle,npc
    while true do Wait(0)
        local myped=PlayerPedId()
		local mypos=GetEntityCoords(myped)
        handle,npc=FindFirstPed()
        loop=(handle~=-1)
        npcslimiter.current=0
        while loop do
			local isaplayer=IsPedAPlayer(npc)
			local plusorminus
			plusorminus=nil
            if not isaplayer then
                npcslimiter.current=npcslimiter.current+1
            end
            if IsPedDeadOrDying(npc) and (DecorExistOn(npc,"raider") or isaplayer) and GetPedSourceOfDeath(npc)==myped and npc~=myped then
                if not checkeddeadbodies[npc] then
                    local gametimer=GetGameTimer()
                    checkeddeadbodies[npc]=gametimer
                    local theirfaction=GetPedRelationshipGroupHash(npc)
                    local myfaction=GetPedRelationshipGroupHash(myped)
					if isaplayer then
						if relationship_reputation_changes.player[theirfaction] then
							local repchange=relationship_reputation_changes.player[theirfaction]
							local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
							if zone and zone.trade then
								repchange=repchange*2
							end
							change_reputation(repchange)
							if repchange>0 then
								SimpleNotification(messages.you_gained_num_retutation_for_killing_str,repchange,relationship_name[theirfaction])
							elseif repchange<0 then
								SimpleNotification(messages.you_lost_num_retutation_for_killing_str,(repchange*-1),relationship_name[theirfaction])
							end
							
							-- local myfactionposition=relationship_reputation_changes.player[myfaction]
							-- local theirfactionposition=relationship_reputation_changes.player[theirfaction]
							
							
						end
					else
						if relationship_reputation_changes.npc[theirfaction] then
							local repchange=relationship_reputation_changes.npc[theirfaction]
							local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
							if zone and zone.trade then
								repchange=repchange*2
							end
							change_reputation(repchange)
							if repchange>0 then
								SimpleNotification(messages.you_gained_num_retutation_for_killing_str,repchange,relationship_name[theirfaction])
							elseif repchange<0 then
								SimpleNotification(messages.you_lost_num_retutation_for_killing_str,(repchange*-1),relationship_name[theirfaction])
							end
						end
					end
                    -- if relationship_good_bad[theirfaction]=="bad" then
						-- plusorminus="plus"
						-- if isaplayer then
							-- change_reputation(10)
						-- else
							-- change_reputation(1)
						-- end
                        -- SimpleNotification("You have ~g~gained reputation ~s~for killing a ~r~~a~",relationship_name[theirfaction])
                    -- elseif relationship_good_bad[theirfaction]=="neutral" then
                        -- SimpleNotification("You don't gain ~y~reputation ~s~for killing ~y~~a~",relationship_names[theirfaction])
                    -- elseif relationship_good_bad[theirfaction]=="good" then
						-- plusorminus="minus"
						-- if isaplayer then
							-- change_reputation(-10)
						-- else
							-- change_reputation(-1)
						-- end
                        -- SimpleNotification("You have ~r~lost reputation ~s~for killing a ~g~~a~",relationship_name[theirfaction])
                    -- end
					
					-- if theirfaction==myfaction then
						-- if plusorminus=="plus" then change_reputation(50) 
						-- elseif plusorminus=="minus" then change_reputation(-50) end
						-- SimpleNotification("~r~You've killed ~a~ and got expelled from your faction.",relationship_name[theirfaction])
						-- player.faction=nil
						-- saving_kvp_mode.DeleteResourceKvp("player_faction")
						
					-- end
                    
                    local npcpos=GetEntityCoords(npc)
                    local npcrel=GetPedRelationshipGroupHash(npc)
                    local patrolindex,patrol=is_in_patrol(npcpos.x,npcpos.y,npcpos.z,npcrel)
                    if patrol~=nil and patrol.lives~=nil then                            
                        -- local possible_bases={}
                        -- for _,base in pairs(safezones) do
                            -- if base.relationship==patrol.relationship then
                                -- table.insert(possible_bases,base)
                            -- end
                        -- end
                        TriggerServerEvent("npc_killed_in_patrol",patrolindex)
                        if patrol.lives<=1 then
                            SimpleNotification(messages.patrol_eliminated)
                        end
                    end
                    
                end
			elseif checkeddeadbodies[npc] then
				checkeddeadbodies[npc]=nil
            end
            loop,npc=FindNextPed(handle)
        end
        EndFindPed(handle)
        -- WriteHint(8,"-----------------NPCs Limiter-------------")
        -- if npcslimiter.enablelimit then
            -- WriteHint(8,"NPCs Limiter: ~g~enabled")
        -- else
            -- WriteHint(8,"NPCs Limiter: ~c~disabled")
        -- end
        -- if npcslimiter.current>npcslimiter.max then
			-- if npcslimiter.current>80 then
				-- WriteHint(8,{"NPCs: ~r~~1~ ~s~/ ~1~",npcslimiter.current,npcslimiter.max})
			-- elseif npcslimiter.current>60 then
				-- WriteHint(8,{"NPCs: ~o~~1~ ~s~/ ~1~",npcslimiter.current,npcslimiter.max})
			-- else
				-- WriteHint(8,{"NPCs: ~y~~1~ ~s~/ ~1~",npcslimiter.current,npcslimiter.max})
			-- end
        -- else
            -- WriteHint(8,{"NPCs: ~1~ / ~1~",npcslimiter.current,npcslimiter.max})
        -- end
        -- WriteHint(8,"----------------------------------------------")
		
		-- WriteHint(8,"-------------------Debug----------------------")
		-- WriteHint(8,{"Reputation: ~1~",player.reputation})
		-- local myveh=GetVehiclePedIsIn(myped)
		-- if myveh then
			-- WriteHint(8,{"Veh engine hp: ~1~  Veh tank hp: ~1~ ",(GetVehicleEngineHealth(myveh)),(GetVehiclePetrolTankHealth(myveh))})
			-- WriteHint(8,{"Veh body hp: ~1~ hp2: ~1~",(GetVehicleBodyHealth(myveh)),(GetVehicleBodyHealth_2(myveh))})
			-- WriteHint(8,{"HeliEngine/Rotors: ~1~/~1~/~1~",(GetHeliEngineHealth(myveh)),(GetHeliMainRotorHealth(myveh)),(GetHeliTailRotorHealth(myveh))})
			-- WriteHint(8,{"Entity hp: ~1~",GetEntityHealth(myveh)})
			-- WriteHint(8,{"AreVehicleWingsIntact: ~1~",(AreVehicleWingsIntact(myveh))})
			-- --WriteHint(8,{"Veh  max hp: ~1~",GetEntityMaxHealth(myveh)})
		-- end
		-- local selweapon=GetSelectedPedWeapon(myped)
		-- WriteHint(8,{"Current weapon: ~1~ / Clip: ~a~ / Ammo: ~a~ / Ammotype: ~a~",selweapon,tostring(GetAmmoInClip(myped,selweapon)),tostring(GetAmmoInPedWeapon(myped,selweapon)),tostring(GetPedAmmoTypeFromWeapon(myped,selweapon))})
	-- 
		
    end
end)



Citizen.CreateThread(function()
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        for k,v in ipairs(extraction) do
            local dist=sqrt_dist(mypos,v)
            if dist<1000.0 then
                DrawMarker(20, v.x, v.y, v.z, 
                0.0, 0.0, 0.0, --dir
                0.0, 0.0, 0.0, --rot
                0.6, 0.6, -0.6, --scl
                150, 255, 175, 200, 
                true, false, 2, true, 0, 0, false)
            end
        end
    end
end)



Citizen.CreateThread(function()
    for k,v in pairs(extraction) do
        if not v.blip then
            v.blip=AddBlipForCoord(v.x,v.y,v.z)
            SetBlipSprite(v.blip,126)
            SetBlipColour(v.blip,2)
            SetBlipAsShortRange(v.blip,true)
            SetBlipName(v.blip,"Extraction")
        end
        v.r=v.r*v.r
    end
    --disable_kvp_saving()
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        local d,dx,dy,dz
        for k,v in pairs(extraction) do
            dx,dy,dz=mypos.x-v.x,mypos.y-v.y,mypos.z-v.z
            if dx*dx+dy*dy+dz*dz<v.r then
                WriteHint(9,messages.press_e_to_save_and_quit)
                if IsControlJustPressed(0,86) then
					player_extraction(v)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do Wait(0)
        --WriteTextNoOutline(4,"Drakeling Labs",0.4,200,200,200,255,0.025,0.007) 
        DrawSprite("lsm", "dlabs", 0.045,0.02   ,0.065*1.3,0.025*1.05,   0.0, 255, 255, 255, 255)
        WriteTextNoOutline(0,GetPlayerName(PlayerId()),0.4,200,200,200,55,0.005,0.035) 
        --WriteText(4,"Your character will not be saved if you disconnect without extracting. \nUse extraction points to save your character safely.",0.2,200,200,200,255,0.165,0.975) --status
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(10000)
        SimpleNotification("Welcome to Los Santos Muertos! We humbly request that unauthorized streamers refrain from broadcasting from this server without permission. Violators of this policy may be removed. Thank you!")
        Wait(300000)
		SimpleNotification("Thanks for playing Los Santos Muertos! If you enjoy our server, and want to support development... consider donating at ~b~https://donorbox.org/lossantosmuertos")
		Wait(300000)
        SimpleNotification("Your character will not be saved if you disconnect without extracting. Use extraction points to save your character safely.")
        Wait(300000)
        SimpleNotification("Join the Los Santos Muertos Discord community! Use our invite link at ~b~discord.gg/w9mZMqJ")
    end
end)



Citizen.CreateThread(function()
    while true do Wait(1000)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        TriggerServerEvent("updateplayerpos",mypos.x,mypos.y,mypos.z)
    end
end)


-- Citizen.CreateThread(function()
    -- while true do Wait(0)
    -- local ped=PlayerPedId()
    -- local h=GetEntityHeightAboveGround(ped)
    -- local pos=GetEntityCoords(ped)
        -- if IsControlJustPressed(0,344) then
			
            -- --local weaponhash=GetSelectedPedWeapon(ped)
            -- --strip_weapon_upgrades(weaponhash)
        -- -- elseif IsControlJustPressed(0,57) then
            -- -- local weaponhash=GetSelectedPedWeapon(ped)
            -- -- unload_weapon(weaponhash)
        -- -- elseif IsControlJustPressed(0,56) then
            -- -- local weaponhash=GetSelectedPedWeapon(ped)
            -- -- local weapon=item_index_to_name[weaponhash]
            -- -- if weapon~=nil then
                -- -- local weaponhash=GetSelectedPedWeapon(ped)
                -- -- strip_weapon_upgrades(weaponhash)
                -- -- drop_weapon(weaponhash)
                -- -- TriggerServerEvent("itemdrop",pos.x,pos.y,pos.z+1-h,weapon,1)
            -- -- end
        -- end
    -- end
-- end)

local function update_blips_relationship_colors()
    local myped=PlayerPedId()
    local myrel=GetPedRelationshipGroupHash(myped)
    for k,v in pairs(safezones) do
        if v.bliphandler and v.relationship then
            local rel=GetRelationshipBetweenGroups(v.relationship,myrel)
            if rel==0 then
                SetBlipColour(v.bliphandler,2)
            elseif rel==5 then
                SetBlipColour(v.bliphandler,1)
            else
                SetBlipColour(v.bliphandler,5)
            end
        end
    end
    for k,v in pairs(raids) do
        if v.blip and v.relationship then
            local rel=GetRelationshipBetweenGroups(v.relationship,myrel)
            if rel==0 then
                SetBlipColour(v.blip,2)
            elseif rel==5 then
                SetBlipColour(v.blip,1)
            else
                SetBlipColour(v.blip,5)
            end
        end
    end
    for k,v in pairs(signals) do
        if v.blip and v.relationship then
            local rel=GetRelationshipBetweenGroups(v.relationship,myrel)
            if rel==0 then
                SetBlipColour(v.blip,2)
            elseif rel==5 then
                SetBlipColour(v.blip,1)
            else
                SetBlipColour(v.blip,5)
            end
        end
    end
end


    
Citizen.CreateThread(function()
    while true do Wait(10000)
        update_blips_relationship_colors()
	end
end)

Citizen.CreateThread(function()
	Wait(532)
    while true do Wait(1000)
		if npcslimiter.basedonplayers then
			--local myplayerid=PlayerId()
			local myped=PlayerPedId()
			local mypos=GetEntityCoords(myped)
			npcslimiter.enablelimit=false
			for i=0,31 do
				if NetworkIsPlayerActive(i) then
					local otherped=GetPlayerPed(i)
					local otherpedpos=GetEntityCoords(otherped)
					local delta=(mypos - otherpedpos)
					if otherped~=myped and delta.x*delta.x+delta.y*delta.y+delta.z*delta.z<persistence.distance then
						npcslimiter.enablelimit=true
						break
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()-- if true then return end
	local prev_weapon
	while true do Wait(0)
		local myped=PlayerPedId()
		--player.weapon=GetHashKey("weapon_assaultrifle")
		--local secondary=GetHashKey("weapon_pistol")
		HideHudComponentThisFrame(2) --ammo counter
		if IsPedInAnyVehicle(myped) and DoesVehicleHaveWeapons(GetVehiclePedIsIn(myped)) then
			DisableControlAction(0,37,false) --enable weapon wheel
		else
			DisableControlAction(0,37,true) --hide weapon wheel
			BlockWeaponWheelThisFrame() --cant switch weapons but weapon wheel is active 
		end
		--SetPedCanSwitchWeapon(myped,false) --cant switch weapons even automatically when entering car
		
		if false and IsDisabledControlJustPressed(0,15) then
			local cur_selected=GetSelectedPedWeapon(myped)
			if cur_selected==-1569615261 then
				for k=#all_weapon_slots,1,-1 do
					local v=all_weapon_slots[k]
					local weapon_name=player[v]
					if weapon_name then
						local parts
						if string.find(weapon_name,"+") then
							parts=split_text(weapon_name,"+")
							weapon_name=parts[1]
							parts[1]=nil
						end
						local weapon_hash=weapons[weapon_name]
						if weapon_hash then
							if not HasPedGotWeapon(myped,weapon_hash) then
								GiveWeaponToPed(myped,weapon_hash,0,false,false)
							end
							SetCurrentPedWeapon(myped,weapon_hash,true)
							if parts then
								for k,v in pairs(parts) do
									GiveWeaponComponentToPed(myped,weapon_hash,weapon_upgrades[v][weapon_hash])
									--give all upgrades
								end
							end
							break
						end
					end
				end
			else
				local found=false
				local switched=false
				for k=#all_weapon_slots,1,-1 do
					local v=all_weapon_slots[k]
					local weapon_name=player[v]
					if weapon_name then
						local parts
						if string.find(weapon_name,"+") then
							parts=split_text(weapon_name,"+")
							weapon_name=parts[1]
							parts[1]=nil
						end
						local weapon_hash=weapons[weapon_name]
						if weapon_hash then
							if found then
								if not HasPedGotWeapon(myped,weapon_hash) then
									GiveWeaponToPed(myped,weapon_hash,0,false,false)
								end
								SetCurrentPedWeapon(myped,weapon_hash,true)
								if parts then
									for k,v in pairs(parts) do
										GiveWeaponComponentToPed(myped,weapon_hash,weapon_upgrades[v][weapon_hash])
										--give all upgrades
									end
								end
								switched=true
								break
							elseif cur_selected==weapon_hash then
								local all_upgrades=true
								if parts then
									for k,v in pairs(parts) do
										if not HasPedGotWeaponComponent(myped,weapon_hash,weapon_upgrades[v][weapon_hash]) then
											all_upgrades=false
											break
										end
									end
								end
								if all_upgrades then
									found=v
								end
							end
						end
					end
				end
				-- if found and not switched then
					-- for k,v in pairs(all_weapon_slots) do
						-- local weapon_name=player[v]
						-- if weapon_name then
							-- local weapon_hash=weapons[weapon_name]
							-- if weapon_hash and HasPedGotWeapon(myped,weapon_hash) then
								-- SetCurrentPedWeapon(myped,weapon_hash,true)
								-- switched=true
								-- break
							-- end
						-- end
					-- end
				-- end
				if not found then
					RemoveWeaponFromPed(myped,cur_selected)
				elseif not switched then
					SetCurrentPedWeapon(myped,-1569615261,true)
				end
			end
		elseif false and (IsDisabledControlJustPressed(0,14) or IsDisabledControlJustPressed(0,37)) then
			local cur_selected=GetSelectedPedWeapon(myped)
			if cur_selected==-1569615261 then
				for k,v in pairs(all_weapon_slots) do
					local weapon_name=player[v]
					if weapon_name then
						local parts
						if string.find(weapon_name,"+") then
							parts=split_text(weapon_name,"+")
							weapon_name=parts[1]
							parts[1]=nil
						end
						local weapon_hash=weapons[weapon_name]
						if weapon_hash then
							if not HasPedGotWeapon(myped,weapon_hash) then
								GiveWeaponToPed(myped,weapon_hash,0,false,false)
							end
							SetCurrentPedWeapon(myped,weapon_hash,true)
							if parts then
								for k,v in pairs(parts) do
									GiveWeaponComponentToPed(myped,weapon_hash,weapon_upgrades[v][weapon_hash])
									--give all upgrades
								end
							end
							break
						end
					end
				end
			else
				local found=false
				local switched=false
				for k,v in pairs(all_weapon_slots) do
					local weapon_name=player[v]
					if weapon_name then
						local parts
						if string.find(weapon_name,"+") then
							parts=split_text(weapon_name,"+")
							weapon_name=parts[1]
							parts[1]=nil
						end
						local weapon_hash=weapons[weapon_name]
						if weapon_hash then
							if found then
								if not HasPedGotWeapon(myped,weapon_hash) then
									GiveWeaponToPed(myped,weapon_hash,0,false,false)
								end
								SetCurrentPedWeapon(myped,weapon_hash,true)
								if parts then
									for k,v in pairs(parts) do
										GiveWeaponComponentToPed(myped,weapon_hash,weapon_upgrades[v][weapon_hash])
										--give all upgrades
									end
								end
								switched=true
								break
							elseif cur_selected==weapon_hash then
								local all_upgrades=true
								if parts then
									for k,v in pairs(parts) do
										if not HasPedGotWeaponComponent(myped,weapon_hash,weapon_upgrades[v][weapon_hash]) then
											all_upgrades=false
											break
										end
									end
								end
								if all_upgrades then
									found=v
								end
							end
						end
					end
				end
				-- if found and not switched then
					-- for k,v in pairs(all_weapon_slots) do
						-- local weapon_name=player[v]
						-- if weapon_name then
							-- local weapon_hash=weapons[weapon_name]
							-- if weapon_hash and HasPedGotWeapon(myped,weapon_hash) then
								-- SetCurrentPedWeapon(myped,weapon_hash,true)
								-- switched=true
								-- break
							-- end
						-- end
					-- end
				-- end
				if not found then
					RemoveWeaponFromPed(myped,cur_selected)
				elseif not switched then
					SetCurrentPedWeapon(myped,-1569615261,true)
				end
			end
		elseif IsControlJustPressed(0,121) then
			if inventory.highlight==0 then
				local cur_selected=GetSelectedPedWeapon(myped)
				local slot=false
				for k,slot in pairs(all_weapon_slots) do
					local weapon_name=player[slot]
					if weapon_name then
						local parts
						if string.find(weapon_name,"+") then
							parts=split_text(weapon_name,"+")
							local weapon_hash=weapons[parts[1]]
							if weapon_hash and cur_selected==weapon_hash then
								local invslot=get_inventory_item_slot(weapon_name)
								if invslot==nil then
									SimpleNotification(messages.cant_find_itemname_in_inventory,weapon_name)
								else
									weapon_name=parts[1]
									parts[1]=nil
									if inventory[invslot].amount==1 then
										local invslot2=get_inventory_item_slot(weapon_name)
										if invslot2 then
											inventory[invslot2].amount=inventory[invslot2].amount+1
											for k,v in pairs(parts) do
												inventory[invslot].item=v
												parts[k]=nil
												break
											end
										else
											inventory[invslot].item=weapon_name
										end
										for _,v in pairs(parts) do
											give_item_to_inventory(v,1,"anyway")
										end
										player[slot]=weapon_name
									elseif inventory[invslot].amount>1 then
										inventory[invslot].amount=inventory[invslot].amount-1
										give_item_to_inventory(weapon_name,1,"anyway")
										for _,v in pairs(parts) do
											give_item_to_inventory(v,1,"anyway")
										end
										player[slot]=weapon_name
									end
									break
								end
							end
						end
					end
				end
			elseif inventory[inventory.current] and string.find(inventory[inventory.current].item,"+") then
				local parts=split_text(inventory[inventory.current].item,"+")
				local item_name=parts[1]
				parts[1]=nil
				if inventory[inventory.current].amount==1 then
					local invslot2=get_inventory_item_slot(item_name)
					if invslot2 then
						inventory[invslot2].amount=inventory[invslot2].amount+1
						for k,v in pairs(parts) do
							inventory[inventory.current].item=v
							parts[k]=nil
							break
						end
					else
						inventory[inventory.current].item=item_name
					end
					for _,v in pairs(parts) do
						give_item_to_inventory(v,1,"anyway")
					end
				elseif inventory[inventory.current].amount>1 then
					inventory[inventory.current].amount=inventory[inventory.current].amount-1
					give_item_to_inventory(item_name,1,"anyway")
					for _,v in pairs(parts) do
						give_item_to_inventory(v,1,"anyway")
					end
				end
			end
		else
			local cur_selected=GetSelectedPedWeapon(myped)
			if prev_weapon==cur_selected then
				local slot=false
				for k,v in pairs(all_weapon_slots) do
					local weapon_name=player[v]
					if weapon_name then
						local parts
						if string.find(weapon_name,"+") then
							parts=split_text(weapon_name,"+")
							weapon_name=parts[1]
							parts[1]=nil
						end
						local weapon_hash=weapons[weapon_name]
						if weapon_hash then
							if cur_selected==weapon_hash then
								slot=v
								break
							end
							-- if not HasPedGotWeapon(myped,weapon_hash) then
								
							-- end
						end
					end
				end
				--print("== slot "..tostring(slot))
				if slot then
					local weapon_hash=cur_selected
					if weapon_hash~=-1569615261 then
						if get_inventory_item_slot(player[slot]) then
							local weaponammotype=GetPedAmmoTypeFromWeapon(myped,weapon_hash)
							local ammonameininventory=ammo_name[weaponammotype]
							local inventoryslotwhereammois=get_inventory_item_slot(ammonameininventory)
							local amount=0
							if inventoryslotwhereammois then
								amount=inventory[inventoryslotwhereammois].amount
							end
							local new=GetPedAmmoByType(myped,weaponammotype)
							-- if amount==1 and new==0 then
								-- inventory.current=inventoryslotwhereammois
								-- inventory[inventory.current].amount=0
								-- check_inv_slot_for_zero_amount()
							-- else
							if IsPedShooting(myped) then
								amount=amount-1
								inventory[inventoryslotwhereammois].amount=amount
								if amount==0 then
									inventory.current=inventoryslotwhereammois
									check_inv_slot_for_zero_amount()
									--SimpleNotification("no ammo normal")
									player[slot]=nil
								end
							end
							if new>amount then
								SetPedAmmoByType(myped,weaponammotype,amount)
							elseif new<100 and amount>new then
								SetPedAmmoByType(myped,weaponammotype,amount)
							end
							-- end
						else
							-- strip_weapon_upgrades(weapon_hash)
							player[slot]=nil
							RemoveWeaponFromPed(myped,cur_selected)
							prev_weapon=nil
						end
					end
				elseif cur_selected~=-1569615261 then
					RemoveWeaponFromPed(myped,cur_selected)
					prev_weapon=nil
				end
			else
				if prev_weapon then
					local slot=false
					for k,v in pairs(all_weapon_slots) do
						local weapon_name=player[v]
						if weapon_name then
							local parts
							if string.find(weapon_name,"+") then
								parts=split_text(weapon_name,"+")
								weapon_name=parts[1]
								parts[1]=nil
							end
							local weapon_hash=weapons[weapon_name]
							if weapon_hash and prev_weapon==weapon_hash and HasPedGotWeapon(myped,weapon_hash) then
								slot=v
								break
							end
						end
					end
					--print("old slot "..tostring(slot))
					if prev_weapon~=-1569615261 then
						if slot and get_inventory_item_slot(player[slot]) then
							local weaponammotype=GetPedAmmoTypeFromWeapon(myped,prev_weapon)
							local ammonameininventory=ammo_name[weaponammotype]
							local inventoryslotwhereammois=get_inventory_item_slot(ammonameininventory)
							local amount=0
							if inventoryslotwhereammois then
								amount=inventory[inventoryslotwhereammois].amount
							end
							local new=GetPedAmmoByType(myped,weaponammotype)
							if new==0 and inventoryslotwhereammois then
								inventory.current=inventoryslotwhereammois
								inventory[inventory.current].amount=0
								check_inv_slot_for_zero_amount()
								--SimpleNotification("no ammo workaround")
								player[slot]=nil
							end
						else
							RemoveWeaponFromPed(myped,prev_weapon)
						end
					end
				end
				slot=false
				for k,v in pairs(all_weapon_slots) do
					local weapon_name=player[v]
					if weapon_name then
						local parts
						if string.find(weapon_name,"+") then
							parts=split_text(weapon_name,"+")
							weapon_name=parts[1]
							parts[1]=nil
						end
						local weapon_hash=weapons[weapon_name]
						if weapon_hash and cur_selected==weapon_hash and HasPedGotWeapon(myped,weapon_hash) then
							slot=v
							break
						end
					end
				end
				--print("new slot "..tostring(slot))
				if cur_selected~=-1569615261 then
					if slot and get_inventory_item_slot(player[slot]) then
						local weaponammotype=GetPedAmmoTypeFromWeapon(myped,cur_selected)
						local ammonameininventory=ammo_name[weaponammotype]
						local inventoryslotwhereammois=get_inventory_item_slot(ammonameininventory)
						local amount=0
						if inventoryslotwhereammois then
							amount=inventory[inventoryslotwhereammois].amount
						end
						SetPedAmmoByType(myped,weaponammotype,amount)
					else
						RemoveWeaponFromPed(myped,cur_selected)
					end
				end
			end
			prev_weapon=cur_selected
		end
	end
end)

Citizen.CreateThread(function()-- lights on bases
	local lights={
	--{x=-592.65832519531,y=2076.7241210938,z=131.37731933594,r=200,g=255,b=100,range=15.0,intensity=1.0,shadow=1.0}, --mine
	--{x=-592.65832519531,y=2076.7241210938,z=131.37731933594,r=200,g=255,b=100,distance=50.0,brightness=1.0,hardness=0.0,roundness=0.1,radius=80.0,roundness=1.0,falloff=1.0,shadow=1.0}, --mine
	{x=-2346.2736816406,y=3267.4633789063,z=34.858726501465,r=200,g=255,b=100,range=15.0,intensity=1.0,shadow=1.0}, --military base
	{x=-2353.6850585938,y=3260.9162597656,z=33.850387573242,r=200,g=255,b=100,range=15.0,intensity=1.0,shadow=1.0}, --military base
	
	{x=454.69134521484,y=-990.87878417969,z=32.688674926758,r=170,g=255,b=200,range=10.0,intensity=0.8,shadow=1.0}, --lspd
	{x=440.91799926758,y=-983.01861572266,z=32.188743591309,r=170,g=255,b=200,range=10.0,intensity=0.8,shadow=1.0}, --lspd
	{x=451.81185913086,y=-980.51165771484,z=32.102115631104,r=170,g=255,b=200,range=5.0,intensity=0.8,shadow=1.0}, --lspd
	{x=449.20666503906,y=-976.04840087891,z=31.688035964966,r=170,g=255,b=200,range=10.0,intensity=0.8,shadow=1.0}, --lspd
	--{x=-2346.2736816406,y=3267.4633789063,z=34.858726501465,r=200,g=255,b=100,distance=50.0,brightness=1.0,hardness=0.0,roundness=0.1,radius=13.0,roundness=1.0,falloff=1.0,shadow=1.0}, --military base
	}
	while true do Wait(0)
		for k,v in pairs(lights) do
			DrawLightWithRange(v.x, v.y, v.z, v.r, v.g, v.b, v.range, v.intensity);
			-- DrawSpotLightWithShadow(v.x, v.y, v.z, 
			-- 0.0, 0.0, -90.0, 
			-- v.r, v.g, v.b, 
			-- v.distance, v.brightness, 
			-- v.roundness, v.radius, v.falloff,46346537);
		end
	end
end)


Citizen.CreateThread(function()-- car lights
	while true do Wait(0)
		local players=GetActivePlayers()
		local h=0
		for _,p in pairs(players) do
			local ped=GetPlayerPed(p)
			local veh=GetVehiclePedIsIn(ped)
			if IsPedInAnyVehicle(ped) and veh then
				local _,lightson,headbeam=GetVehicleLightsState(veh)
				local left=GetIsLeftVehicleHeadlightDamaged(veh)
				local right=GetIsRightVehicleHeadlightDamaged(veh)
				--WriteHint(145,{"lights: ~a~ beam: ~a~, left: ~a~, right: ~a~",tostring(lightson),tostring(headbeam),tostring(left),tostring(right)})
				local myvehdir=GetEntityForwardVector(veh)
				--WriteHint(145,{"Veh dir: ~a~ ~a~ ~a~ ~a~",tostring(myvehdir.x), tostring(myvehdir.y), tostring(myvehdir.z),tostring(#myvehdir)})
				local bones={}
				--local alwayslight={}
				if (lightson~=0 or headbeam~=0) and (left==false or right==false) and GetIsVehicleEngineRunning(veh) then
					bones.headlight_l=GetEntityBoneIndexByName(veh,"headlight_l")
					bones.headlight_r=GetEntityBoneIndexByName(veh,"headlight_r")
					bones.extralight_1=GetEntityBoneIndexByName(veh,"extralight_1")
					bones.extralight_2=GetEntityBoneIndexByName(veh,"extralight_2")
					bones.extralight_3=GetEntityBoneIndexByName(veh,"extralight_3")
					bones.extralight_4=GetEntityBoneIndexByName(veh,"extralight_4")
					
					-- alwayslight.taillight_l=GetEntityBoneIndexByName(veh,"taillight_l")
					-- alwayslight.taillight_r=GetEntityBoneIndexByName(veh,"taillight_r")
					
					
					local brightness=0.7
					local radius=25.0
					local distance=25.0
					if headbeam==1 then
						distance=30.0
						brightness=1.0
						radius=35.0
					end
					
					for k,v in pairs(bones) do
						if v~=-1 then
							--WriteHint(145,{"boneindex: ~1~",v})
							local bonepos=GetWorldPositionOfEntityBone(veh,v)
							DrawSpotLightWithShadow(bonepos.x+(myvehdir.x*0.1), bonepos.y+(myvehdir.y*0.1), bonepos.z+(myvehdir.z*0.1), 
							myvehdir.x, myvehdir.y, myvehdir.z, 
							255, 255, 255,
							distance, brightness,
							0.5, radius, 1.0,h)
							h=h+1
							DrawSpotLight(bonepos.x+(myvehdir.x*0.1), bonepos.y+(myvehdir.y*0.1), bonepos.z+(myvehdir.z*0.1), 
							-myvehdir.x, -myvehdir.y, -myvehdir.z, 
							255, 255, 255,
							0.2, brightness*99.9,
							0.5, 99.0, 99.0, 1.0)
						end
					end
					-- for k,v in pairs(alwayslight) do
						-- if v~=-1 then
							-- local bonepos=GetWorldPositionOfEntityBone(veh,v)
							-- DrawSpotLight(bonepos.x-(myvehdir.x*0.2), bonepos.y-(myvehdir.y*0.2), bonepos.z-(myvehdir.z*0.2), 
							-- myvehdir.x, myvehdir.y, myvehdir.z, 
							-- 255, 0, 0,
							-- 0.3, brightness*99.9,
							-- 0.5, 99.0, 99.0, 1.0)
						-- end
					-- end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
-- DecorRegister("zm_health",3) -- use those for ammo
-- DecorRegister("zm_dying",3) -- they were only used on peds
-- DecorRegister("zm_armor",3)
-- DecorRegister("zm_lastbone",3)

    local vehdata
    local oldmodel=0
	local color=hudcolor
    while true do Wait(0)
        --DisableControlAction(0,114,true)
        --DisableControlAction(0,69,true) DisableControlAction(0,92,true)
        --DisableControlAction(0,24,true) DisableControlAction(0,257,true)
        --for i=0,100 do DisableControlAction(0,i,true) end
        --{69,92}
        local ped=PlayerPedId()
        if IsPedInAnyVehicle(ped,false) then
            local veh=GetVehiclePedIsUsing(ped)
            --drawtext(GetVehicleHoverModePercentage(veh),.6,.6)
            if veh~=0 then
                local model=GetEntityModel(veh)
                if model~=oldmodel then
                    vehdata=vehicles_ammo[model]
                    oldmodel=model
                    if vehdata~=nil and vehdata.base~=nil then
                        for k,v in pairs(vehdata.base) do
                            if v.blip==nil then
                                v.blip=AddBlipForCoord(v.x,v.y,v.z)
                                SetBlipSprite(v.blip,v.icon)
                            end
                        end
                    end
                end
                if vehdata~=nil then
                    local reload=false
                    if vehdata.base~=nil and GetEntitySpeed(veh)<1 then
                        local pos=GetEntityCoords(ped)
                        for k,v in pairs(vehdata.base) do
                            if math.abs(v.x-pos.x)+math.abs(v.y-pos.y)+math.abs(v.z-pos.z)<v.r then
                                reload=true
                                break
                            end
                        end
                    end
                    if reload then
                        --DecorRemove(veh,"jetammo1")
                        --DecorRemove(veh,"jetammo2")
                        --DecorRemove(veh,"jetammo3")
                        for k,v in pairs(vehdata) do
                            if type(k)=='number' and type(v)=='table' then DecorSetInt(veh,v[1],v[2]) end
                        end
                        --TextCommandDisplayText(.75,.75,"ammunition loaded")
                    elseif vehdata.multiseat~=nil then
                        local myped=ped
                        local seats=GetVehicleMaxNumberOfPassengers(veh)-1 --GetVehicleModelNumberOfSeats(model)-1
                        --drawtext(seats.."seats",.75,.6-2*.15)
                        for seat=-1,seats do
                            ped=GetPedInVehicleSeat(veh,seat)
                            if ped~=0 then
                                local using_vehicle_weapon,weapon=GetCurrentPedVehicleWeapon(ped)
                                --if using_vehicle_weapon then
									if vehicles_ammo[model] then
										--WriteHint(356,"~y~DEBUG: 123")
										for k,v in pairs(vehicles_ammo[model]) do
											if v.pool then
												weapon=k
											end
										end
									end
                                    local weapondata=vehdata[weapon]
                                    if weapondata~=nil then
                                        local decor,maxammo=weapondata[1],weapondata[2]
                                        if DecorExistOn(veh,decor) then
                                            local ammo=DecorGetInt(veh,decor)
                                            --drawtext("ped "..ped.." in seat "..seat.." is using "..weapon.." "..ammo.."/"..maxammo,.75,.6+seat*.15)
                                            if ammo<=0 then
                                                if ped==myped then
                                                    local controls=weapondata[3]
                                                    --if controls==nil then
                                                        --DisableControlAction(0,114,true)
														for k,v in pairs(controls or vehicle_weapons_controls) do
															DisableControlAction(0,v,true)
                                                        end
                                                    --end
                                                end
                                            elseif IsPedShooting(ped) then
                                                DecorSetInt(veh,decor,ammo-1)
                                            end
                                            if ped==myped then
												local id=0
												local ammotypesinuse={}
												for _,weapon in pairs(vehdata) do
													if type(weapon)=="table" then
														local decor,maxammo=weapon[1],weapon[2]
														if (not ammotypesinuse[decor]) and ((weapon.upgrade==nil) or (GetVehicleMod(veh,weapon.upgrade[1])==weapon.upgrade[2])) then
															local ammo=DecorGetInt(veh,decor)
															ammotypesinuse[decor]=true
															DrawRect(0.921-(0.018*id),0.9,0.001,0.1,hudcolor.new.bkg.r,hudcolor.new.bkg.g,hudcolor.new.bkg.b,hudcolor.new.bkg.a)
															DrawSprite("lsm", "gradient", 0.921-(0.018*id),0.9,0.013,0.175,0.0, 255, 255, 255, 255)
															DrawRect(0.921-(0.018*id),0.9+0.0975*0.5*(maxammo-ammo)/maxammo,0.001,0.0975*ammo/maxammo,hudcolor.new.r,hudcolor.new.g,hudcolor.new.b,hudcolor.new.a) --
															
															if HasStreamedTextureDictLoaded("lsm") then
																DrawSprite("lsm", weapon.pool, 0.921-(0.018*id),0.97,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
															end
															id=id+1
														end
													end
												end
												--TextCommandDisplayText(.75,.75,"ammunition "..ammo.."/"..maxammo)
                                            end
                                        else
                                            --DecorSetInt(veh,decor,maxammo)
                                            DecorSetInt(veh,decor,0)
                                            --drawtext(decor,.75,.75)
                                        end
                                    else 
										--WriteHint(356,"~y~DEBUG: no weapondata")
                                    end
                                --end
                            end
                        end
                    else
                        local using_vehicle_weapon,weapon=GetCurrentPedVehicleWeapon(ped)
                        --if using_vehicle_weapon then
							if vehicles_ammo[model] then
								--WriteHint(356,"~y~DEBUG: 123")
								if not using_vehicle_weapon then
									for k,v in pairs(vehicles_ammo[model]) do
										if v.pool then
											weapon=k
										end
									end
								end
							end
                            local weapondata=vehdata[weapon]
                            --drawtext(weapon,.75,.6)
                            if weapondata~=nil then
                                local decor,maxammo=weapondata[1],weapondata[2]
                                if DecorExistOn(veh,decor) then
                                    local ammo=DecorGetInt(veh,decor)
                                    if ammo<=0 then
                                        local controls=weapondata[3]
                                        -- if controls==nil then
                                            -- DisableControlAction(0,114,true)
                                        -- else
                                            for _,v in pairs(controls or vehicle_weapons_controls) do
                                                DisableControlAction(0,v,true)
                                            end
                                        --end
                                    elseif IsPedShooting(ped) then
                                        DecorSetInt(veh,decor,ammo-1)
                                    end
									local id=0
									local ammotypesinuse={}
									for _,weapon in pairs(vehdata) do
										local decor,maxammo=weapon[1],weapon[2]
										if (not ammotypesinuse[decor]) and ((weapon.upgrade==nil) or (GetVehicleMod(veh,weapon.upgrade[1])==weapon.upgrade[2])) then
											local ammo=DecorGetInt(veh,decor)
											ammotypesinuse[decor]=true
											--TextCommandDisplayText(.75,.75,"ammunition "..ammo.."/"..maxammo)
											DrawRect(0.921-(0.018*id),0.9,0.001,0.1,hudcolor.new.bkg.r,hudcolor.new.bkg.g,hudcolor.new.bkg.b,hudcolor.new.bkg.a)
											DrawSprite("lsm", "gradient", 0.921-(0.018*id),0.9,0.013,0.175,0.0, 255, 255, 255, 255)
											DrawRect(0.921-(0.018*id),0.9+0.0975*0.5*(maxammo-ammo)/maxammo,0.001,0.0975*ammo/maxammo,hudcolor.new.r,hudcolor.new.g,hudcolor.new.b,hudcolor.new.a) --
											
											if HasStreamedTextureDictLoaded("lsm") then
												DrawSprite("lsm", weapon.pool, 0.921-(0.018*id),0.97,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
											end
											id=id+1
										end
									end
								else
                                    --DecorSetInt(veh,decor,maxammo)
                                    DecorSetInt(veh,decor,0)
                                    --drawtext(decor,.75,.75)
                                end
                            else --TextCommandDisplayText(.75,.6,tostring(weapon))
                            end
                        --end
                    end
                end
            end
        elseif vehdata~=nil then
            if vehdata.base~=nil then
                for k,v in pairs(vehdata.base) do
                    if v.blip~=nil then
                        RemoveBlip(v.blip)
                        v.blip=nil
                    end
                end
            end
            oldmodel=0
            vehdata=nil
        end
    end
end)


Citizen.CreateThread(function()
	while true do Wait(0)
        local loop,handle,pickup
        
        handle,pickup=FindFirstPickup()
        loop=(handle~=-1)
        while loop do
			if not IsEntityInAir(pickup) then
				local pickupcoords=GetEntityCoords(pickup)
				--local pickupheading=GetEntityHeading(pickup)
				--local pickuphash=GetPickupHash(pickup)
				--local weaponhash=GetWeaponHashFromPickup(pickuphash)
				--weaponhash=GetHashKey("weapon_combatpistol")
				local model=GetEntityModel(pickup)
				local weaponhash=weapon_model_to_hash[model]
				RequestWeaponAsset(weaponhash,31,0)
				-- SimpleNotification("~g~model: ~1~ hash: ~1~",model,weaponhash)
				--RequestModel(model)
				--if HasModelLoaded(model) then
				if HasWeaponAssetLoaded(weaponhash) then
					SetEntityAsMissionEntity(pickup)
					DeleteEntity(pickup)
					local objectweapon=CreateWeaponObject(weaponhash, 100, pickupcoords.x, pickupcoords.y, pickupcoords.z, true, 0.0, 0)
					--local objectweapon=CreateObject(model, pickupcoords.x, pickupcoords.y, pickupcoords.z, true, false, false);
					-- SimpleNotification("~g~Object Weapon: ~s~~1~",objectweapon)
					-- Wait(0)
					-- SimpleNotification("~g~Object Weapon after frame: ~s~~1~",objectweapon)
					--SetEntityAsMissionEntity(objectweapon)
					--SetEntityAsNoLongerNeeded(objectweapon)
				end
			end
            loop,pickup=FindNextPickup(handle)
        end
        EndFindPickup(handle)
	end
end)

-- Citizen.CreateThread(function()
	-- while true do Wait(0)
		-- WriteHint(536,{"GetFollowPedCamZoomLevel: ~a~",tostring(GetFollowPedCamZoomLevel())})
	-- end
-- end)
		
-- Citizen.CreateThread(function()
    -- local curcam
	-- while true do Wait(0)
		-- local myped=PlayerPedId()
		-- local myplayer=PlayerId()
		-- -- WriteHint(534,{"GetFollowPedCamViewMode: ~a~",tostring(GetFollowPedCamViewMode())})
		-- -- WriteHint(534,{"GetPedConfigFlag: ~a~",tostring(GetPedConfigFlag(myped,78,1))})
		-- --if IsPlayerFreeAiming(myplayer) then
		-- -- if GetPedConfigFlag(myped,78,1)~=false then
			-- -- if curcam==nil then
				-- -- curcam=GetFollowPedCamViewMode()
				-- -- if curcam~=4 then
					-- -- SetFollowPedCamViewMode(4)
				-- -- end
			-- -- elseif GetFollowPedCamViewMode()~=4 then
				-- -- SetFollowPedCamViewMode(4)
			-- -- end
		-- -- elseif curcam~=nil then
			-- -- Wait(500)
			-- -- --SetPedConfigFlag(myped,78,false)
			-- -- SetFollowPedCamViewMode(curcam)
			-- -- curcam=nil
		-- -- end
		-- --print("state 1")
		-- while true do
			-- curcam=GetFollowPedCamViewMode()
			-- if GetPedConfigFlag(myped,78,1)~=false and curcam~=4 then
				-- break
			-- end
			-- Wait(0)
			-- myped=PlayerPedId()
		-- end
		-- --print("state 2")
		-- SetFollowPedCamViewMode(4)
		-- while true do
			-- if GetPedConfigFlag(myped,78,1)==false then
				-- break
			-- end
			-- Wait(0)
			-- myped=PlayerPedId()
		-- end
		-- myped=PlayerPedId()
		-- if curcam~=4 then
			-- local i1,i2=40,300
			-- --for i=i1,i2 do DisableControlAction(0,i) end
			-- --Wait(1000)
			-- --for i=i1,i2 do DisableControlAction(0,i) end
			-- --SetPlayerSimulateAiming(myplayer,false)
			-- SetFollowPedCamViewMode(curcam)
			-- --SetPlayerSimulateAiming(myplayer,false)
			-- --SetPedConfigFlag(myped,78,false)
			-- Wait(0)
			-- --for i=i1,i2 do DisableControlAction(0,i) end
			-- Wait(0)
			-- --for i=i1,i2 do DisableControlAction(0,i) end
		-- end
		-- --print("state 3")
		-- while true do
			-- if GetPedConfigFlag(myped,78,1)==false and GetFollowPedCamViewMode()~=4 then
				-- break
			-- end
			-- Wait(0)
			-- myped=PlayerPedId()
		-- end
	-- end
-- end)
-- local function renderFPcam(cammode)
	-- RenderFirstPersonCam(cammode,0,3)
-- end
Citizen.CreateThread(function()
	while true do Wait(0)
			if IsControlJustPressed(0,15) then -- wheel up
				SetFollowPedCamViewMode(4)
				--SetFollowVehicleCamViewMode(4)
				--renderFPcam(1)
			elseif IsControlJustPressed(0,14) then
				--renderFPcam(0)
			end
	end
end)


RegisterNetEvent("updatetradelist")
AddEventHandler("updatetradelist",function(zonetradename,list,timetoupdate)
	time_to_update_shops=timetoupdate
    for k,v in pairs(safezones) do 
		if v.tradelistname==zonetradename then
			--v.trade={}
			--v.selltrade={}
			local si,ti=0,0
			for k2,v2 in pairs(list) do
				if v2[1]=="cash" then
					si=si+1
					v.selltrade[si]=v2
					--print("added "..v2[1].." to buy menu")
				else
					ti=ti+1
					v.trade[ti]=v2
					--print("added "..v2[3].." to sell menu")
				end
			end
			if si<#(v.selltrade) then
				for i=#(v.selltrade),si+1,-1 do
					v.selltrade[i]=nil
				end
			end
			if ti<#(v.trade) then
				for i=#(v.trade),ti+1,-1 do
					v.trade[i]=nil
				end
			end
			print("Got trade list. Buy list items: "..#v.trade..". Sell buy items: "..#v.selltrade..".")
			--v.trade=list
		end
	end
end)

RegisterNetEvent("updatevehshoplist")
AddEventHandler("updatevehshoplist",function(zonetradename,list,timetoupdate)
	time_to_update_shops=timetoupdate
    for k,v in pairs(safezones) do 
		if v.tradelistname==zonetradename then
			v.vehshop=list
		end
	end
end)
-- Citizen.CreateThread(function()
    -- local curcam=nil
	-- local camzoom=nil
	-- while true do Wait(0)
		-- -- if IsControlPressed(0,86) and GetFollowPedCamViewMode()~=4 then
			-- -- WriteNotification("RenderFirstPersonCam")
			-- -- RenderFirstPersonCam(true,0,3,0)
		-- -- end
		-- local myped=PlayerPedId()
		-- local myplayer=PlayerId()
		-- --SetPlayerForcedZoom(myplayer,1)
		-- if IsControlPressed(0,25) and GetFollowPedCamViewMode()~=4 then
			-- curcam=GetFollowPedCamViewMode()
			-- SetFollowPedCamViewMode(4)
		-- elseif not IsControlPressed(0,25) and curcam~=nil and curcam~=GetFollowPedCamViewMode() then
			-- SetFollowPedCamViewMode(0)
			-- local gettime=GetGameTimer()
			-- AnimateGameplayCamZoom(1.1-.1,1.1-.1)
			-- while true do 
				-- if GetGameTimer()-gettime>1000 then break end
				-- if not IsPedSprinting(myped) then
					-- AnimateGameplayCamZoom(1.1-.1,1.1-.1)
				-- end
				-- Wait(0)
			-- end
			-- curcam=nil
			-- camzoom=nil
		-- else
			-- camzoom=GetGameplayCamZoom()
			-- WriteHint(3361,"camzoom="..camzoom)
		-- end
	-- end
-- end)
--custom dispatch
-- Citizen.CreateThread(function()
-- local function makepedcombatreadydriver(ped)
   -- SetPedCombatAbility(ped,2)
   -- SetPedCombatRange(ped, 2);
   -- SetPedCombatMovement(ped, 1);
   -- SetPedCombatAttributes(ped, 0, true)
   -- SetPedCombatAttributes(ped, 1, true)
   -- SetPedCombatAttributes(ped, 2, true)
   -- SetPedCombatAttributes(ped, 3, false)
   -- SetPedCombatAttributes(ped, 5, true)
   -- SetPedCombatAttributes(ped, 46, true)
   -- SetPedCombatAttributes(ped, 1424, true)
   -- SetPedFleeAttributes(ped, 1, false)
   -- SetPedFleeAttributes(ped, 2, false)
   -- SetPedFleeAttributes(ped, 4, false)
   -- SetPedFleeAttributes(ped, 8, false)
   -- SetPedFleeAttributes(ped, 16, false)
   -- SetPedFleeAttributes(ped, 32, false)
   -- SetPedFleeAttributes(ped, 64, false)
   -- SetDriverAbility(ped, 1.0);
-- end
    -- local maxtimer=10
    -- local timer=maxtimer
    
    -- local maradeurs_models={
    -- {1581098148},--cop
    
    -- }
    -- local maradeurs_vehicles={
    -- --{GetHashKey("imperator")},
    -- {GetHashKey("police")},
    -- }
    -- while true do Wait(5000)
        -- local myped=PlayerPedId()
        -- local mypos=GetEntityCoords(myped)
        -- if GetPlayerWantedLevel(PlayerId())>0 then
            -- local a=math.random(0,31415)*.0002
            -- local s,c=math.sin(a),math.cos(a)
            -- local x,y=mypos.x+c*500,mypos.y+s*500
            -- local success,carpos=GetClosestMajorVehicleNode(x, y, 0.0, 3.0, 0);
            -- SimpleNotification("Node here: "..carpos)
            -- local vehmodel=maradeurs_vehicles[math.random(1,#maradeurs_vehicles)][1]
            -- RequestModel(vehmodel) while not HasModelLoaded(vehmodel) do Wait(0) end
            -- local pedmodel=maradeurs_models[math.random(1,#maradeurs_models)][1]
            -- RequestModel(pedmodel) while not HasModelLoaded(pedmodel) do Wait(0) end
            -- local veh=CreateVehicle(vehmodel, carpos.x, carpos.y, carpos.z, 0.0, true, false);
            -- DecorSetBool(veh,"post_apoc_car",true)
            -- DecorSetFloat(veh,"zm_fuel",79.5)
            -- SetVehicleFuelLevel(veh,79.5)
            
            -- local driver=CreatePedInsideVehicle(veh, 6, pedmodel, -1, true, false)
            -- DecorSetBool(driver,"raider",true)
            -- SetPedAsCop(driver,true)
            -- SetPedRelationshipGroupHash(driver,GetHashKey("COP"))
            
            -- makepedcombatreadydriver(driver)
            -- GiveWeaponToPed(driver, GetHashKey("weapon_pistol"), 5000, false, true)
            -- SetPlayerWantedCentrePosition(PlayerId(),mypos.x,mypos.y,mypos.z)
            -- --TaskVehicleDriveWander(driver, veh, 1000.0, 0);
            
            -- SimpleNotification("Spawned marauder vehicle "..veh.." and ped "..driver)
            -- local vehblip=AddBlipForEntity(veh)
                          -- SetBlipSprite(vehblip,198)
        -- end
    -- end
-- end)


-- Citizen.CreateThread(function()
    -- while true do Wait(0)
    -- SimpleHelpText("BCKS ~INPUT_CELLPHONE_CANCEL~ ENTER ~INPUT_FRONTEND_RDOWN~")
    -- end
    
-- end)

-- Citizen.CreateThread(function()
    -- local heistobject={}
    -- local heistobject_pos={}
    -- local heistobject_rot={}
    -- local models={
    -- GetHashKey("prop_mb_sandblock_03_cr"),
    -- GetHashKey("prop_mb_sandblock_02"),
    -- GetHashKey("prop_mb_sandblock_01"),
    -- GetHashKey("prop_conc_blocks01c"),
    -- GetHashKey("prop_conc_blocks01b"),
    -- GetHashKey("prop_conc_blocks01a"),
    -- GetHashKey("prop_jyard_block_01a"),
    -- GetHashKey("prop_mb_sandblock_01"),
    -- GetHashKey("prop_mb_sandblock_04"),
    -- GetHashKey("prop_mb_sandblock_05_cr"),
    -- }
    -- for i=1,50 do
        -- heistobject[i]=CreateObject(models[math.random(1,#models)],heists[1].x+((i*5)-25)+math.random(-10,10),heists[1].x+((i*5)-25)+math.random(-10,10),-250.0,true,false,false)
        -- heistobject_rot[i]=math.random(1,360)
        -- SetEntityRotation(heistobject[i], 0.0, 0.0, heistobject_rot[i], 0, true);
    -- end
    -- while true do Wait(0)
        -- for i=1,50 do
            -- heistobject_pos[i]=GetEntityCoords(heistobject[i])
            -- if GetEntityHeightAboveGround(heistobject[i])<0.0 then
                -- SetEntityCoords(heistobject[i],heistobject_pos[i].x, heistobject_pos[i].y, -250.0, false, false, false, false)
            -- end
            -- SetEntityRotation(heistobject[i], 0.0, 0.0, heistobject_rot[i], 0, true);
            -- PlaceObjectOnGroundProperly(heistobject[i])
        -- end
    -- end
-- end,false)
