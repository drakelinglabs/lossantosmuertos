local localization={
ratbike="Ratbike",
cerberus="Cerberus",
scarab="Scarab",
a_m_y_hiker_01="Male Hiker",
a_f_y_hiker_01="Female Hiker",
pipebomb="Pipe bomb",
molotov="Molotov Cocktail",
s_m_y_cop_01="Male Cop",
s_f_y_cop_01="Female Cop",
}

local string_registered_labels={}
local string_workarounds=0
if true then --disabled
    local function cache_format_string(formatstring)
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
        if type(text)=='table' then
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

local modelgroups={}
modelgroups.military={
GetHashKey("s_m_y_armymech_01"),
GetHashKey("s_m_m_marine_01"),
GetHashKey("s_m_m_marine_02"),
GetHashKey("s_m_y_marine_01"),
GetHashKey("s_m_y_marine_02"),
GetHashKey("s_m_y_marine_03"),
}
modelgroups.mercenaries={
GetHashKey("s_m_y_blackops_01"),
GetHashKey("s_m_y_blackops_02"),
GetHashKey("s_m_y_blackops_03"),
}

local weaponsarray={}
weaponsarray.raiders={
"dagger","knife","machete","crowbar","hatchet","bat",
"pistol","snspistol","vintagepistol","combatpistol",
"dbshotgun","pumpshotgun",
"marksmanrifle","sniperrifle"}
weaponsarray.military={
"carbinerifle","pistol","pumpshotgun","smg","sniperrifle"}

local signals={}
for i=1,5 do
    signals[i]={x=0,y=0}
end

local heists={}
heists[2]={x=200.0,y=509.0,z=300.1,r=200.0,guard=true,models=modelgroups.mercenaries,relationship=GetHashKey("HATES_PLAYER"),weapons=weaponsarray.military}
heists[1]={x=0.0,y=0.0,z=300.1,r=200.0,guard=true,models=modelgroups.mercenaries,relationship=GetHashKey("HATES_PLAYER"),weapons=weaponsarray.military}
RegisterNetEvent("heist")
AddEventHandler("heist",function(k,x,y,r)
    local v=heists[k]
    if v~=nil then    
        if v.blip==nil then 
            v.blip=AddBlipForRadius(x,y,0,r)
            SetBlipAlpha(v.blip,100)
        else
            SetBlipCoords(v.blip,x,y,0)
        end
        v.x=x
        v.y=y
        v.r=r
    end
end)



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


local vehiclesave={}

local inv_big_x=0.072 local inv_big_y=0.1279999
local inv_sml_x=0.0333333334 local inv_sml_y=0.0592592592
local inv_size_x=0.0576 local inv_size_y=0.1023999

            
local current_date=GetResourceKvpInt("date")
local lastprovisiontime=GetResourceKvpInt("provisiontaken")
local respawn_time=720 --two real days

local looted_array={}

local normal_crafts={
    {"molotov",
        {"gasoline",5,
        "alcohol",1,},
    },
    {"pipebomb",
        {"engineparts",15,
        "chemicals",10,
        "pistolammo",10},
    },
    {"bandage",
        {"alcohol",1},
    },
    {"medkit",
        {"alcohol",2,
        "bandage",2
        },
    },
}
for k,v in pairs(weaponsarray.raiders) do
    weaponsarray.raiders[k]=GetHashKey("weapon_"..v)
end
for k,v in pairs(weaponsarray.military) do
    weaponsarray.military[k]=GetHashKey("weapon_"..v)
end

local safezones={
    -- {x=444.47814941406,y=-984.21295166016,z=30.689596176147,r=50.0,
    -- models={131961260,766375082,-12678997},
    -- weapons={"dagger","knife","machete","crowbar","hatchet","bat","pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    -- relationship="HATES_PLAYER"},--LSPD

    {x=975.88543701172,y=-119.29508972168,z=74.220664978027,r=50.0,
    models={275618457},
    weapons={"dagger","knife","machete","crowbar","hatchet","bat","pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    relationship="HATES_PLAYER"},--Lost MC

    --Altruists camp
    {x=-1096.5206298828,y=4914.2548828125,z=215.85502624512,r=125.0,
    models={-12678997,1694362237,1939545845,-1105135100},
    name="~g~Old Cult Camp~s~",
    friends=true,
    trade={
        {"water",1,"cash",15},
        {"gasoline",1,"cash",10},
        {"bandage",1,"cash",10},
        {"canfood",1,"cash",15},
        {"cash",30,"cigarettes",1},
        {"cash",15,"soda",1},
        {"cash",10,"juice",1},
        {"cash",25,"alcohol",1},
    },
    tradepos={x=-1144.1071777344,y=4908.369140625,z=220.96875},
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
    clothespos={x=-1146.4151611328,y=4940.9018554688,z=222.26872253418},
    changingroompos={x=-1137.6760253906,y=4940.2631835938,z=222.26852416992},
    provision={
        "water",3,
        "canfood",2,
    },
    provisionpos={ x=-1098.6478271484,y=4893.4716796875,z=216.06663513184},
    weapons={"pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    garagepos={x=-1095.7849121094,y=4945.1254882813,z=218.58392333984,angle=205.9517364502},
    vehpos={x=-1069.4080810547,y=4937.5786132813,z=212.07720947266,angle=342.98559570313},
    vehshop={
        {"ratbike",
            {"cash",1000,
            "engineparts",1000,
            "gasoline",150},
        },
        {"cerberus",
            {"cash",5000,
            "engineparts",5000,
            "gasoline",150},
        },
        {"scarab",
            {"cash",5000,
            "engineparts",5000,
            "gasoline",150},
        },
    },
    craftpos={x=-1123.6444091797,y=4894.5190429688,z=218.47256469727},
    crafts=normal_crafts,
    spawnpos={x=-1112.9624023438,y=4903.9765625,z=218.59544372559,angle=323.06338500977},
    relationship="MISSION3"},--Altruists camp
    
    
    --LSPD station
    {x=449.93710327148,y=-986.46514892578,z=30.437593460083,r=50.0,
    --models={-44746786,1330042375,1032073858,850468060}, --nothing
    name="~g~LSPD Station~s~",
    friends=true,
    trade={
        {"pistolammo",30,"cash",70},
        {"shotgunammo",10,"cash",50},
        {"pistol",1,"cash",200},
        {"pumpshotgun",1,"cash",500},
        {"cash",30,"cigarettes",1},
        {"cash",15,"soda",1},
        {"cash",10,"juice",1},
        {"cash",25,"alcohol",1},
        {"cash",30,"water",1},
        {"cash",30,"canfood",1},
        {"cash",50,"mre",1},
    },
    tradepos={x=452.37100219727,y=-980.07110595703,z=30.689582824707},
    clothes={
    {"s_m_y_cop_01",
        {"cash",500},
    },
    {"s_f_y_cop_01",
        {"cash",500},
    },
    },
    clothespos={x=460.62753295898,y=-990.84625244141,z=30.689601898193},
    changingroompos={x=449.89859008789,y=-990.55810546875,z=30.689601898193},
    provision={
        "water",1,
        "pistolammo",20,
    },
    provisionpos={x=447.22109985352,y=-975.54309082031,z=30.689596176147},
    weapons={"pistol","pumpshotgun"},
    garagepos={x=449.07763671875,y=-1018.770324707,z=28.532030105591,angle=78.808685302734},
    vehpos={x=449.46347045898,y=-1012.5942382813,z=28.496547698975,angle=94.81258392334},
    vehshop={
        {"cerberus",
            {"cash",5000,
            "engineparts",5000,
            "gasoline",150},
        },
        {"scarab",
            {"cash",5000,
            "engineparts",5000,
            "gasoline",150},
        },
    },
    craftpos={x=441.29440307617,y=-975.71667480469,z=30.689594268799},
    crafts=normal_crafts,
    spawnpos={x=459.48818969727,y=-994.87622070313,z=24.914867401123,angle=92.499603271484},
    relationship="MISSION3"},--LSPD station
}
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
local function is_in_safe_zone(x,y,z)
    local dx,dy
    for k,v in pairs(safezones) do
        dx=v.x-x
        if math.abs(dx)<v.r then
            dy=v.y-y
            if math.abs(dy)<v.r then
                if dx*dx+dy*dy<v.r*v.r then
                    return v
                end
            end
        end
    end
    for k,v in pairs(heists) do
        dx=v.x-x
        if math.abs(dx)<v.r then
            dy=v.y-y
            if math.abs(dy)<v.r then
                if dx*dx+dy*dy<v.r*v.r then
                    return v
                end
            end
        end
    end
    return nil
end

local function coords_to_dword(x,y,z)
    return (0xFFFFFFFF&(
    math.floor(x*20)+
    math.floor(y*20)*19+
    math.floor(z*20)*41))
end

--for i=0,400 do
    SetHudComponentPosition(6,0.0,-0.15) --vehname
    SetHudComponentPosition(7,0.0,-0.18) --areaname
    SetHudComponentPosition(8,0.0,-0.21) --vehclass
    SetHudComponentPosition(9,0.0,-0.24) --strname
--    local r,g,b,a=GetHudColour(i)
--   g=math.floor((r+g+g+b)/4)
--    SetHudColour(i,g,g,g,a)
--end

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
        data=data..(string.char(k&255)..string.char((k>>8)&255)..string.char((k>>16)&255)..string.char((k>>24)&255)..string.char(v&255)..string.char((v>>8)&255)..string.char((v>>16)&255)..string.char((v>>24)&255))
    end
    SetResourceKvp("looted_props",data)
end

local function load_data()
    local data=GetResourceKvp("looted_props")
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

AddEventHandler("playerSpawned",function()
    local ped=PlayerPedId()
    StopAudioScenes()
    StartAudioScene("AH_3B_ESCAPE_START")
    SetMaxWantedLevel(0)
    player.health=GetResourceKvpFloat("health")
    player.blood=GetResourceKvpFloat("blood")
    player.hydration=GetResourceKvpFloat("hydration")
    player.saturation=GetResourceKvpFloat("saturation")
    player.health=100
    player.blood=100
    player.hydration=100
    player.saturation=100
    player.drunk=0
    local lsm_random_spawn=GetConvarInt("lsm_random_spawn",0)
    if lsm_random_spawn==1 then
        
        SetPedRandomComponentVariation(ped)
        
        local animdict="missarmenian2lamar_idles"
        local anim="idle_look_behind_left"
        RequestAnimDict(animdict)
        while not HasAnimDictLoaded(animdict) do Wait(0) end
        local duration=math.floor(GetAnimDuration(animdict, anim)*1000+.5)
        TaskPlayAnim(PlayerPedId(), animdict, anim, 1.0, 1.0, duration, 0, .0, false, false, false);
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
            RequestModel(pedmodel) while not HasModelLoaded(pedmodel) do Wait(0) WriteText(4,"Loading model "..pedmodel,0.4,255,255,255,255,0.2,0.7) end
            SetPlayerModel(PlayerId(),pedmodel)
            ped=PlayerPedId()
            SetPedRandomComponentVariation(ped,false)
        end
    end
    --SetPedRelationshipGroupHash(ped,GetHashKey("player"))
    --GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), 12, false, true);
    --GiveWeaponToPed(ped, GetHashKey("WEAPON_MACHETE"), 1000, false, true);
end)
AddEventHandler('onClientMapStart', function()
  exports.spawnmanager:setAutoSpawn(true)
  exports.spawnmanager:forceRespawn()
end)

-- Citizen.CreateThread(function()
    -- while true do
        -- Wait(10000)
        -- SetResourceKvpFloat("health",player.health)
        -- SetResourceKvpFloat("blood",player.blood)
        -- SetResourceKvpFloat("hydration",player.hydration)
        -- SetResourceKvpFloat("saturation",player.saturation)
        -- local pos=GetEntityCoords(PlayerPedId())
        -- SetResourceKvpFloat("x",pos.x)
        -- SetResourceKvpFloat("y",pos.y)
        -- SetResourceKvpFloat("z",pos.z)
    -- end
-- end)

local item_names={
water="Water",
canfood="Canned food",
fish="Fish",
gasoline="Gasoline",
mre="MRE",
meat="Meat",
chemicals="Chemicals",
ammo="Rifle ammo",
engineparts="Engine parts",
soda="Soda",
juice="Juice",
bandage="Bandage",
medkit="Medkit",
alcohol="Alcohol",
weed="Weed",
pistolammo="Pistol ammo",
heavyrifleammo="Heavy rifle ammo",
shotgunammo="Shotgun ammo",
food="Food",
cash="Cash",
cigarettes="Cigarettes",
}
local item_index_to_name={}
local item_name_to_index={}
for k,v in pairs(item_names) do
    local hash=(GetHashKey(k)&0x7FFFFFFF)
    item_index_to_name[hash]=k
    item_name_to_index[k]=hash
end

local inventory={}
inventory.rows=3
inventory.lines=5
inventory.max=15 --14
inventory.total=GetResourceKvpInt("inventory_total")
inventory.current=GetResourceKvpInt("inventory_current")
inventory.highlight=500
for i=1,inventory.total do
    inventory[i]={item=GetResourceKvpString("inventory_item_"..i),amount=GetResourceKvpInt("inventory_amount_"..i)}
end
if inventory.current>inventory.total then
    inventory.current=inventory.total
elseif inventory.current<1 then
    inventory.current=1
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
local deadbodiesrewards_random={
{"SWITCHBLADE",1},
{"cigarettes",1},
}
local deadbodiesrewards={
[-681004504]={"NIGHTSTICK",1}, --security
[1581098148]={"pistolammo",15}, --cop male
[368603149]={"pistolammo",15}, --cop female
[-673538407]={"HAMMER",1}, --construct
[-277793362]={"REVOLVER",12}, --ranger m
[-1614285257]={"REVOLVER",12}, --ranger f
[-1286380898]={"medkit",1}, --medic
}
local inventory_items_chances={
water=10,
juice=15,
soda=25,
alcohol=45,
canfood=35,
food=10,
}
local pickups_objects={
[-509973344]={"medkit",1,"bandage",2,solid=true},--wall medkit
[-742198632]={"water",5,solid=true}, --water cooler
[1541274880]={"soda",1}, -- cola 2 liters
[-1982036471]={"soda",4}, --soda 4 in pack
[-942878619]={"alcohol",4}, --shop thing red 4 in pack
[-1914723336]={"alcohol",4}, --shop thing yellow pride 4 in pack
[1793329478]={"alcohol",4}, --shop thing brown  in pack
[-53650680]={"alcohol",4}, --chinese alcohol pack
[2085005315]={"alcohol",12}, --piswasser 12 bottles dull white
[1661171057]={"alcohol",12}, --piswasser 12 bottles dull white 2
[-259124142]={"alcohol",12}, --biarn... black green 12
[898161667]={"alcohol",12}, --jackey's box dark blue 12 
[-1902841705]={"alcohol",12}, --logger 12
[-1699929937]={"alcohol",12}, --benedict
[-1551002089]={"alcohol",16}, --16 alcohol bottles
[-715967502]={"alcohol",17}, --17 alcohol bottles
[-1574447115]={"alcohol",22}, --22 alcohol bottles
[1350970027]={"alcohol",1}, --1 alcohol bottl
[674110876]={"alcohol",14}, --14 alcohol bottl
[-1720513558]={"alcohol",12}, --12 alcohol bottl
[1550641188]={"alcohol",12}, --12 patriot
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
[-54719154]={"food",10,"canfood",30,spoiled=true}, -- shop 30 canned and fod on low
[-220235377]={"soda",40,spoiled=true}, -- shop 40 soda
[643522702]={"alcohol",40,spoiled=true}, -- shop 40 alcohol
[1437777724]={"food",40,spoiled=true}, -- shop bread 
[-532065181]={"food",20,"chemicals",20,spoiled=true}, -- food and chem
[756199591]={"food",15}, -- shop gums
[2067313593]={"food",25}, -- shop long gums
[1404018125]={"alcohol",1}, -- green liquor
[-1461673141]={"alcohol",1}, -- orange blocky
[-169049173]={"alcohol",1}, -- black big alcohol
[1421582485]={"food",10,spoiled=true}, -- shop ponchiks
[-802238381]={"food",10}, -- fruits
[663958207]={"food",10}, -- shop guns shop type 3
[1238061242]={"alcohol",25,spoiled=true}, -- spoiled alcohol
[511490507]={"alcohol",100,spoiled=true}, -- spoiled alcohol
[-1766954369]={"alcohol",40,spoiled=true}, -- spoiled shelf
[-1243177429]={"alcohol",1}, -- 1 alcohol green
[-1317590321]={"food",25}, -- shop long gums meth shop
[2085590335]={"alcohol",6}, -- 6 triangle yellow bottles
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
[-1406045366]={"cigarettes",30}, -- 3 lines of cigs
[759654580]={"cash",100,solid=true}, -- cash register
[303280717]={"cash",200,solid=true}, -- cash register
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

DecorRegister("zm_looted",2)
DecorRegister("post_apoc_car",2)
DecorRegister("zombie_type",3)
DecorRegister("zm_fuel",1)
DecorRegister("raider",2)
DecorRegister("item",3)
DecorRegister("count",3)

local function get_inventroy_item_amount(item_name)
    for i=1,inventory.total do
        if inventory[i].item==item_name then
            return inventory[i].amount
        end
    end
    local ped=PlayerPedId()
    if HasPedGotWeapon(ped,GetHashKey("weapon_"..item_name)) then return 1 end
    if HasPedGotWeapon(ped,GetHashKey("gadget_"..item_name)) then return 1 end
    if HasPedGotWeapon(ped,GetHashKey(item_name)) then return 1 end
    return 0
end

local function get_inventory_item_slot(item_name)
    for i=1,inventory.total do
        if inventory[i].item==item_name then
            return i
        end
    end
    return nil
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

local function check_inv_slot_for_zero_amount()
    if inventory[inventory.current].amount<1 then
        for i=inventory.current,inventory.total do
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
        end
        SetResourceKvpInt("inventory_total",inventory.total)
    else
        SetResourceKvpInt("inventory_amount_"..inventory.current,inventory[inventory.current].amount)
    end
    SetResourceKvpInt("inventory_current",inventory.current)
    print(inventory.current.."- current / "..inventory.total.."- total")
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

local function give_item_to_inventory(add_name,add_amount)
    local add_to_slot=get_inventory_item_slot(add_name)
    if add_to_slot then
        inventory[add_to_slot].amount=inventory[add_to_slot].amount+add_amount
        SetResourceKvpInt("inventory_amount_"..add_to_slot,inventory[add_to_slot].amount)
    else
        local hash=GetHashKey("weapon_"..add_name)
        local valid_weapon=IsWeaponValid(hash)
        if not valid_weapon then
            hash=GetHashKey("gadget_"..add_name)
            valid_weapon=IsWeaponValid(hash)
            if not valid_weapon then
                hash=GetHashKey(add_name)
                valid_weapon=IsWeaponValid(hash)
            end
        end
        if valid_weapon then
            if add_amount>1 then
                return false
            else
                local ped=PlayerPedId()
                if not HasPedGotWeapon(ped,hash) then
                    GiveWeaponToPed(ped, hash, 0, false, true)
                    WriteNotification("You got ~g~"..(item_names[add_name] or add_name).."~s~.")
                    return true
                else
                    return false
                end
            end
        elseif inventory.total<inventory.max then
            inventory.total=inventory.total+1
            inventory[inventory.total]={item=add_name,amount=add_amount}
            SetResourceKvp("inventory_item_"..inventory.total,inventory[inventory.total].item)
            SetResourceKvpInt("inventory_amount_"..inventory.total,inventory[inventory.total].amount)
            SetResourceKvpInt("inventory_total",inventory.total)
            SetResourceKvpInt("inventory_current",inventory.current)
        else
            WriteNotification("You ~r~don't have ~s~inventory slots for that item!")
            return false
        end
    end
    WriteNotification("You got ~g~"..add_amount.." "..(item_names[add_name] or add_name).."~s~.")
    inventory.highlight=500
    return true
end

local function can_fit_into_inventory(add_name)
    return ((inventory.total<inventory.max) or (get_inventory_item_slot(add_name)~=0))
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

Citizen.CreateThread(function()
    for i=1,15 do
        EnableDispatchService(i,false)
    end
    NetworkSetTalkerProximity(50.0)
    while true do
        -- SetPedDensityMultiplierThisFrame(1.0)
        -- SetScenarioPedDensityMultiplierThisFrame(1.0)
        DisableVehicleDistantlights(true)
        DisplayDistantVehicles(false)
        HideHudComponentThisFrame(14)
        -- SetVehicleDensityMultiplierThisFrame(0.1)
        -- SetSomeVehicleDensityMultiplierThisFrame(0.1)
        -- SetRandomVehicleDensityMultiplierThisFrame(0.1)
        --DisableRadarThisFrame()

        DisablePoliceReports()
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
}

local function engine_at_front(veh,model)
    if engine_pos[model]~=nil then
        return engine_pos[model]
    end
    local pos=GetOffsetFromEntityGivenWorldCoords(veh,GetWorldPositionOfEntityBone(veh,GetEntityBoneIndexByName(veh,'engine')))
    return (pos.y>0)
end

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
    
    while true do Wait(0)
        while not showhints do Wait(300) end
        local pped=PlayerPedId()
        if not IsPedInAnyVehicle(pped) then
            mypos=GetEntityCoords(pped)
            handle,veh=FindFirstVehicle()
            loop=(handle~=-1)
            while loop do
                local fuel=(math.floor(DecorGetFloat(veh,"zm_fuel")-5)>0)--(math.floor(GetVehicleFuelLevel(veh)-5)>0)
                local engine=(math.floor(GetVehicleEngineHealth(veh)-no_engine_parts)>=10)
                local loot=not DecorExistOn(veh,"zm_looted")
                if (fuel or engine or loot) then
                    local vpos=GetEntityCoords(veh)
                    if #(mypos-vpos)<5.0 then
                        local model=GetEntityModel(veh)
                        local box1,box2=GetModelDimensions(model)
                        if fuel then
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                            if not not_on_screen then
                                SetTextCentre(true)
                                WriteText(font,"~g~E ~s~to take fuel",size,255,255,255,alpha,x,y)
                            end
                        end
                        if engine or loot then
                            if engine_at_front(veh,model) then
                                if engine then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box2.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,"~g~E ~s~to take engine parts",size,255,255,255,alpha,x,y)
                                    end
                                end
                                if loot then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box1.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,"~g~E ~s~to search for items",size,255,255,255,alpha,x,y)
                                    end
                                end
                            else
                                if engine then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box1.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,"~g~E ~s~to take engine parts",size,255,255,255,alpha,x,y)
                                    end
                                end
                                if loot then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box2.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,"~g~E ~s~to search for items",size,255,255,255,alpha,x,y)
                                    end
                                end
                            end
                        end
                    end
                end
                loop,veh=FindNextVehicle(handle)
            end
            EndFindVehicle(handle)
            
            handle,obj=FindFirstObject()
            loop=(handle~=-1)
            while loop do
                local model=pickups_objects[GetEntityModel(obj)]
                if model~=nil then
                    if not model.spoiled and not DecorExistOn(obj,"zm_looted") then
                        local objpos=GetEntityCoords(obj)
                        if #(objpos-mypos)<1.3 then
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(objpos.x,objpos.y,objpos.z)
                            if not not_on_screen then
                                SetTextCentre(true)
                                if model[3] then
                                    WriteText(font,"~g~E ~s~to pick up ~g~"..model[1].."~s~ and ~g~"..model[3],size,255,255,255,alpha,x,y)
                                else
                                    WriteText(font,"~g~E ~s~to pick up ~g~"..model[1],size,255,255,255,alpha,x,y)
                                end
                            end
                        end
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


Citizen.CreateThread(function()
    local loop,handle,veh,rand,ped,class
    while true do
        handle,veh=FindFirstVehicle()
        loop=(handle~=-1)
        while loop do
            class=GetVehicleClass(veh)
            if class~=15 and class~=16 then
                if not DecorExistOn(veh,"post_apoc_car") then
                    rand=GetHashKey(GetVehicleNumberPlateText(veh))
                    if (rand&1024)~=0 then
                        SmashVehicleWindow(veh,0)
                        SmashVehicleWindow(veh,1)
                        SmashVehicleWindow(veh,2)
                        SmashVehicleWindow(veh,3)
                    end
                    for i=0,5 do
                        local i2=(i<<1)
                        if (rand&(2048<<i2))~=0 then
                            SetVehicleDoorBroken(veh,i,true)
                        elseif (rand&(4096<<i2))~=0 then
                            SetVehicleDoorOpen(veh,i,true,true)
                        end
                    end
                    for i=0,5 do
                        if (rand&(1<<i))~=0 then
                            IsVehicleTyreBurst(veh, i, true)
                        end
                    end
                    if (rand&768)~=0 then
                        SetEntityRenderScorched(veh,true)
                        if GetVehicleEngineHealth(veh)>-3999.8 then
                            SetVehicleEngineHealth(veh,-3999.9)
                        end
                    else
                        rand=400+(rand&255)
                        if GetVehicleEngineHealth(veh)>rand then
                            SetVehicleEngineHealth(veh,rand-.1)
                        end
                        rand=(rand&63)*0.2
                        SetVehicleFuelLevel(veh,rand)
                        DecorSetFloat(veh,"zm_fuel",rand)
                    end
                    SetVehicleEngineOn(veh, false, true, false)
                    --SetVehicleHandbrake(veh,true)
                    SetVehicleHalt(veh, 0.1, 1, false);
                    DecorSetBool(veh,"post_apoc_car",true)
                end
                ped=GetPedInVehicleSeat(veh,-1)
                if ped~=0 and not IsPedAPlayer(ped) then
                    local vpos=GetEntityCoords(veh)
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
            end
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

Citizen.CreateThread(function()
    local color={}
    color.bkg=20
    color.bar=150
    color.barlight=200
    color.bardark=50
    while true do Wait(0)
        DrawRect(0.9,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200) -- health bkg
        DrawRect(0.9,0.9+0.000975*0.5*(100-player.health),0.004,0.000975*player.health,color.bar,color.bar,color.bar,200) -- health bar
        --DrawRect(0.902,0.9,0.0005,0.0975,color.barlight,color.barlight,color.barlight,200) -- health light
        --DrawRect(0.898,0.9,0.0005,0.0975,color.bardark,color.bardark,color.bardark,200) -- health dark
        
        DrawRect(0.925,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200) -- blood bkg
        DrawRect(0.925,0.9+0.000975*0.5*(100-player.blood),0.004,0.000975*player.blood,color.bar,color.bar,color.bar,200) -- blood bar
        --DrawRect(0.927,0.9,0.0005,0.0975,color.barlight,color.barlight,color.barlight,200)
        --DrawRect(0.923,0.9,0.0005,0.0975,color.bardark,color.bardark,color.bardark,200)
        
        DrawRect(0.95,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200) -- hydration bkg
        DrawRect(0.95,0.9+0.000975*0.5*(100-player.hydration),0.004,0.000975*player.hydration,color.bar,color.bar,color.bar,200) -- hydration bar
        
        DrawRect(0.975,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200) -- saturation bkg
        DrawRect(0.975,0.9+0.000975*0.5*(100-player.saturation),0.004,0.000975*player.saturation,color.bar,color.bar,color.bar,200) -- saturation bar
        if HasStreamedTextureDictLoaded("lsm") then
            DrawSprite("lsm", "heart", 0.9,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
            DrawSprite("lsm", "blood", 0.925,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
            DrawSprite("lsm", "hydration", 0.950,0.975,0.0166666667,0.025,0.0, 255, 255, 255, 255)
            DrawSprite("lsm", "saturation", 0.975,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
        else
            RequestStreamedTextureDict("lsm")
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
                            local x=(inventory.total+1-i-i)*.025*temp_scale+.5
                            DrawSprite("lsm", inventory[i].item, x,0.90+0.02,
                            inv_sml_x*temp_scale,
                            inv_sml_y*temp_scale,
                            0.0, 255, 255, 255, highlight)
                            
                            SetTextCentre(true)
                            WriteText(7,inventory[i].amount,0.5*temp_scale,160,160,160,highlight,x,0.93+0.02)
                            
                            name=inventory[i].item
                            name=(item_names[name] or name)
                            if name~=nil then
                                SetTextCentre(true)
                                WriteText(7,name,0.2*temp_scale,160,160,160,highlight,x,0.85+0.02)
                            end
                        end
                    end
                    if inventory.current~=0 then
                        --print("current="..inventory.current)
                        local i=inventory.current
                            local x=(inventory.total+1-i-i)*.025*temp_scale+.5
                            DrawSprite("lsm", 
                            inventory[i].item, 
                            x,0.90,
                            inv_big_x*temp_scale,
                            inv_big_y*temp_scale,
                            0.0, 255, 255, 255, highlight)
                            
                            SetTextCentre(true)
                            WriteText(7,inventory[i].amount,0.75*temp_scale,255,255,255,highlight,x,0.945)
                            
                            name=inventory[i].item
                            name=(item_names[name] or name)
                            if name~=nil then
                                SetTextCentre(true)
                                WriteText(7,name,0.35*temp_scale,255,255,255,highlight,x,0.825)
                            end
                    end
                end
            end
        elseif inventory.highlight>0 then
            --DrawRect(0.5,0.5,0.5,0.6,0,0,0,255) -- black header
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
                player.headshot=RegisterPedheadshot(player.headshotped)
                print("headshut is nil, registering")
            elseif myped~=player.headshotped then
                print("ped updated")
                if player.headshot~=nil then
                    if IsPedheadshotValid(player.headshot) then
                        UnregisterPedheadshot(player.headshot)
                        print("unregistering")
                    end
                    player.headshot=nil
                end
                player.headshotped=myped
                player.headshot=RegisterPedheadshot(player.headshotped)
                print("registering")
            elseif not IsPedheadshotValid(player.headshot) then
                UnregisterPedheadshot(player.headshot)
                player.headshot=nil
                print("headshot invalid, unregistered")
            elseif IsPedheadshotReady(player.headshot) then
                local txd=GetPedheadshotTxdString(player.headshot)
                DrawSprite(txd,txd,
                    pos_x-((scale_x/2)-0.0225),pos_y-0.04-(scale_y*.5),0.04,0.065,
                    0.0, 255, 255, 255, 255)
            end
            --DrawRect(pos_x-((scale_x/2)-0.0225),pos_y-0.04-(scale_y*.5),0.04,0.07,0,255,255,255) -- headshot
            WriteText(4,GetPlayerName(PlayerId()),0.7,255,255,255,255,pos_x-((scale_x/2)-0.045),pos_y-0.08-(scale_y*.5))
            WriteText(4,"Loner",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
            DrawRect(pos_x,pos_y,scale_x,scale_y,0,0,0,175) -- transparent inv background
            for i=0,inventory.rows do
                DrawRect(pos_x-(scale_x*.5)+i*(scale_x/inventory.rows),pos_y,v_line_width,scale_y,75,75,75,255)
            end
            for i=0,inventory.lines do
                DrawRect(pos_x,pos_y-(scale_y*.5)+i*(scale_y/inventory.lines),scale_x,h_line_width,75,75,75,255)
            end
            if HasStreamedTextureDictLoaded("lsm") and inventory.total~=0 then
                for i=1,inventory.total do
                    if inventory.current~=i then
                        local x=pos_x+scale_x*.5-((math.floor((i-1)%inventory.rows)+.5)*(scale_x/inventory.rows))
                        local y=pos_y+scale_y*.5-((math.floor((i-1)/inventory.rows)+.5)*(scale_y/inventory.lines))
                        DrawSprite("lsm", inventory[i].item, x,y,
                        inv_sml_x,
                        inv_sml_y,
                        0.0, 255, 255, 255, 255)
                        
                        SetTextCentre(true)
                        WriteText(4,inventory[i].amount,0.5,100,100,100,255,x,y+0.025)
                        
                        name=inventory[i].item
                        name=(item_names[name] or name)
                        if name~=nil then
                            SetTextCentre(true)
                            WriteText(4,name,0.4,100,100,100,255,x,y-0.06)
                        end
                    end
                end
                if inventory.current~=0 then
                    --print("current="..inventory.current)
                    local i=inventory.current
                        local x=pos_x+scale_x*.5-((math.floor((i-1)%inventory.rows)+.5)*(scale_x/inventory.rows))
                        local y=pos_y+scale_y*.5-((math.floor((i-1)/inventory.rows)+.5)*(scale_y/inventory.lines))
                        DrawSprite("lsm", inventory[i].item, x,y,
                        inv_big_x,
                        inv_big_y,
                        0.0, 255, 255, 255, 255)
                        
                        SetTextCentre(true)
                        WriteText(4,inventory[i].amount,0.5,255,255,255,255,x,y+0.025)
                        
                        name=inventory[i].item
                        name=(item_names[name] or name)
                        if name~=nil then
                            SetTextCentre(true)
                            WriteText(4,name,0.4,255,255,255,255,x,y-0.06)
                        end
                end
            end
        end
    end
end)

--stats management
Citizen.CreateThread(function()
    while true do Wait(500)
        
        local pped=PlayerPedId()
        --WriteText(7,tonumber(GetPlayerSprintStaminaRemaining(PlayerId())),0.4,255,255,255,255,0.5,0.5) 
        if player.hydration>0.01 then
            SetPlayerSprint(PlayerId(),true)
            if GetPlayerSprintStaminaRemaining(PlayerId())>0.01 then
                RestorePlayerStamina(PlayerId(),1.0)
                player.hydration=player.hydration-0.2
            end
        else
            SetPlayerSprint(PlayerId(),false)
        end
        if player.saturation>0.01 then
            player.saturation=player.saturation-0.015
        else
            SetEntityHealth(pped,GetEntityHealth(pped)-1)
        end
        local health=GetEntityHealth(pped)-100
        if health<=0 then player.health=0 else player.health=health end
        
        -- if player.health>0 then
            -- if GetEntityHealth(pped)<GetEntityMaxHealth(pped) then
                -- SetEntityHealth(pped,GetEntityHealth(pped)+1)
                -- player.health=player.health-1.0
                -- if player.health<0.0 then player.health=0.0 end
            -- end
        -- else
            -- SetEntityHealth(pped,GetEntityHealth(pped)-1)
        -- end
        if player.drunk>0 then
            player.drunk=player.drunk-0.01
            SetGameplayCamShakeAmplitude(player.drunk)
        end
    end
end)

--fuel managment
Citizen.CreateThread(function()
    while true do Wait(150)
        local pped=PlayerPedId()
        if IsPedInAnyVehicle(pped) then
            local pveh=GetVehiclePedIsIn(pped)
            -- WriteText(7,"RPM: "..GetVehicleCurrentRpm(pveh),0.4,255,255,255,255,0.7,0.500) 
            -- WriteText(7,"Fuel: "..GetVehicleFuelLevel(pveh),0.4,255,255,255,255,0.7,0.525) 
            -- WriteText(7,"Oil: "..GetVehicleOilLevel(pveh),0.4,255,255,255,255,0.7,0.550) 
            if DecorGetFloat(pveh,"zm_fuel")>5.0 then
                local fuel=(DecorGetFloat(pveh,"zm_fuel")-(0.005*GetVehicleCurrentRpm(pveh)))
                SetVehicleFuelLevel(pveh,fuel)
                DecorSetFloat(pveh,"zm_fuel",fuel)
            else
                SetVehicleFuelLevel(pveh,0.0)
                DecorSetFloat(pveh,"zm_fuel",0.0)
            end
        end
    end
end)
-- Citizen.CreateThread(function()
    -- while true do Wait(0)
        -- local pped=PlayerPedId()
        -- if IsPedInAnyVehicle(pped) then
            -- local pveh=GetVehiclePedIsIn(pped)
             -- WriteText(7,"Engine: "..GetVehicleEngineHealth(pveh),0.4,255,255,255,255,0.7,0.475)
             -- WriteText(7,"RPM: "..GetVehicleCurrentRpm(pveh),0.4,255,255,255,255,0.7,0.500)
             -- WriteText(7,"Fuel: "..GetVehicleFuelLevel(pveh),0.4,255,255,255,255,0.7,0.525)
        -- end
    -- end
-- end)
--inventory management

local prop_mb_crate_01a=GetHashKey("prop_mb_crate_01a")
Citizen.CreateThread(function()
    local function give_ammo(pped,ammo_type)
        local current_ammo=GetPedAmmoByType(pped,ammo_type)
        SetPedAmmoByType(pped,ammo_type,current_ammo+1)
        if GetPedAmmoByType(pped,ammo_type)~=current_ammo then
            inventory[inventory.current].amount=inventory[inventory.current].amount-1
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
                if HasModelLoaded(prop_mb_crate_01a) then
                    v.object=CreateObject(prop_mb_crate_01a, v.x, v.y, height, false, false, false)
                    if not water then PlaceObjectOnGroundProperly(v.object) end
                    FreezeEntityPosition(v.object,true)
                    v.z=height
                else
                    RequestModel(prop_mb_crate_01a)
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
        while true do
            Wait(0)
            local pped=PlayerPedId()
            local mypos=GetEntityCoords(pped)
            for k,v in pairs(signals) do
                local dx,dy=mypos.x-v.x,mypos.y-v.y
                local quad=dx*dx+dy*dy
                if quad<2500 then
                    place_thing_on_ground_or_water(v)
                end
            end
            Wait(0)
        end
    end)
    while true do Wait(0)
        local pped=PlayerPedId()
        collectgarbage("step")
        if inventory.highlight>0 then
            inventory.highlight=inventory.highlight-1
        end
        if IsControlJustPressed(0,86) then
            print("e pressed")
            local mypos=GetEntityCoords(pped)
            for k,v in pairs(signals) do
                local dx,dy=mypos.x-v.x,mypos.y-v.y
                local quad=dx*dx+dy*dy
                if quad<4 then
                    local menu_index=1
                    local selected_thing,selected_amount
                    inventory.highlight=0
                    if v.loot==nil then
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
                    --place_thing_on_ground_or_water(v)
                    while quad<4 do
                        local not_on_screen,x,y=N_0xf9904d11f1acbec3(v.x,v.y,v.z+1)
                        if v.loot~=nil then
                            local i=0
                            for thing,amount in pairs(v.loot) do
                                i=i+1
                                if menu_index==i then
                                    selected_thing=thing
                                    selected_amount=amount
                                    WriteText(7,thing.." x"..amount,.2,255,255,255,255,x,y)
                                else
                                    WriteText(7,thing.." x"..amount,.2,128,128,128,255,x,y)
                                end
                                y=y+.013
                            end
                            if i>0 then
                                if IsControlJustPressed(0,173) then --up
                                    menu_index=menu_index+1
                                elseif IsControlJustPressed(0,172) then --down
                                    menu_index=menu_index-1
                                elseif IsControlJustPressed(0,86) then
                                    if give_item_to_inventory(selected_thing,selected_amount) then
                                        inventory.highlight=0
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
                        --place_thing_on_ground_or_water(v)
                    end
                end
            end
            local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
            if IsPedInAnyVehicle(pped) then 
                if zone~=nil and zone.vehpos~=nil and in_radius(mypos,zone.vehpos,5) then
                    --sell car
                end
                if zone~=nil and zone.garagepos~=nil and in_radius(mypos,zone.garagepos,5) then
                    if vehiclesave~=nil and vehiclesave.model~=nil then
                        WriteNotification("You already have ~g~"..GetDisplayNameFromVehicleModel(vehiclesave.model).." ~s~in garage.")
                    else
                        -- place in garage
                        local flags=0
                        local myped=PlayerPedId()
                        local myveh=GetVehiclePedIsIn(myped)
                        
                        vehiclesave.model=GetEntityModel(myveh)
                        vehiclesave.enginehp=GetVehicleEngineHealth(myveh)
                        vehiclesave.fuellevel=GetVehicleFuelLevel(myveh)
                        flags=0
                        for i=0,7 do
                            if IsVehicleDoorDamaged(myveh,i) then flags=flags|(1<<i) end
                        end
                        vehiclesave.doors=flags
                        vehiclesave.colors={}
                        vehiclesave.colors[1],vehiclesave.colors[2]=GetVehicleColours(myveh)
                        vehiclesave.colors[3],vehiclesave.colors[4]=GetVehicleExtraColours(myveh)
                        vehiclesave.modkit=GetVehicleModKit(myveh)
                        local mod
                        vehiclesave.mods={}
                        vehiclesave.total_mods=0
                        for i=0,200 do
                            mod=GetVehicleMod(myveh,i)
                            if mod~=-1 then
                                vehiclesave.total_mods=vehiclesave.total_mods+1
                                vehiclesave.mods[i]=mod
                            else
                                vehiclesave.mods[i]=nil
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
                        vehiclesave.tyres=flags
                        
                        WriteNotification("~g~"..GetDisplayNameFromVehicleModel(vehiclesave.model).." ~s~saved in garage.")
                        SetEntityAsMissionEntity(myveh)
                        DeleteEntity(myveh)
                        
                        SetResourceKvpInt("garage_1_model",vehiclesave.model)
                        SetResourceKvpFloat("garage_1_enginehp",vehiclesave.enginehp)
                        SetResourceKvpFloat("garage_1_fuel",vehiclesave.fuellevel)
                        SetResourceKvpInt("garage_1_doors",vehiclesave.doors)
                        SetResourceKvpInt("garage_1_tyres",vehiclesave.tyres)
                        local colors=vehiclesave.colors[1]|(vehiclesave.colors[2]<<8)|(vehiclesave.colors[3]<<16)|(vehiclesave.colors[4]<<24)
                        SetResourceKvpInt("garage_1_colors",colors)
                        SetResourceKvpInt("garage_1_total_mods",vehiclesave.total_mods)
                        -- local mod_index=0
                        -- for k,v in pairs(vehiclesave.mods) then
                            -- mod_index=mod_index+1
                            -- SetResourceKvpInt("garage_1_mod_"..mod_index,(v|(v<<16)))
                        -- end
                        
                        local modstring=""
                        for k,v in pairs(vehiclesave.mods) do
                            modstring=modstring..string.char(k+1,v+1)
                        end
                        --WriteNotification("saving "..#modstring)
                        SetResourceKvp("garage_1_modstring",modstring)
                    end
                end
            elseif zone~=nil and zone.garagepos~=nil and in_radius(mypos,zone.garagepos,5) then
                -- laod car from garage
                if vehiclesave==nil and GetResourceKvpInt("garage_1_model")~=0 then
                    vehiclesave={}
                    vehiclesave.model=GetResourceKvpInt("garage_1_model")
                    vehiclesave.enginehp=GetResourceKvpFloat("garage_1_enginehp")
                    vehiclesave.fuellevel=GetResourceKvpFloat("garage_1_fuel")
                    vehiclesave.doors=GetResourceKvpInt("garage_1_doors")
                    vehiclesave.tyres=GetResourceKvpInt("garage_1_tyres")
                    local colors=GetResourceKvpInt("garage_1_colors")
                    vehiclesave.colors={colors&0xFF,(colors>>8)&0xFF,(colors>>16)&0xFF,(colors>>24)&0xFF}
                    vehiclesave.total_mods=SetResourceKvpInt("garage_1_total_mods")
                    vehiclesave.mods={}
                    local modstring=GetResourceKvpString("garage_1_modstring")
                    if modstring~=nil then
                        --WriteNotification("loading "..#modstring)
                        for i=1,#modstring,2 do
                            local k,v=string.byte(modstring,i,i+1)
                            k,v=k-1,v-1
                            vehiclesave.mods[k]=v
                        end
                    end
                end
                if vehiclesave~=nil and vehiclesave.model~=nil then
                    local vs=vehiclesave
                    local flags=0
                    local myped=PlayerPedId()
                    local mypos=GetEntityCoords(myped)
                    local myheading=GetEntityHeading(myped)
                    if vs.model then
                        RequestModel(vs.model)
                        while not HasModelLoaded(vs.model) do Wait(0) WriteText(2,"Loading vehicle",1.0,255,255,255,255,0.5,0.5) end
                        local myveh=CreateVehicle(vs.model, mypos.x, mypos.y, mypos.z, zone.garagepos.angle, true, false);
                        DecorSetBool(myveh,"zm_looted",true)                
                        DecorSetBool(myveh,"post_apoc_car",true)
                        DecorSetFloat(myveh,"zm_fuel",vs.fuellevel)
                        SetPedIntoVehicle(myped,myveh,-1)
                        
                        SetVehicleEngineHealth(myveh,vs.enginehp)
                        SetVehicleFuelLevel(myveh,vs.fuellevel)
                        
                        flags=vs.doors
                        for i=0,7 do
                            if (flags&(1<<i))~=0 then SetVehicleDoorBroken(myveh,i,true) end
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
                        WriteNotification("You took ~g~"..GetDisplayNameFromVehicleModel(vs.model).." ~s~from your garage.")
                        vehiclesave=nil
                        DeleteResourceKvp("garage_1_model")
                    else
                        WriteNotification("You don't have anything in your garage.")
                    end
                else
                    WriteNotification("You don't have anything in your garage.")
                end
            elseif zone~=nil and zone.vehpos~=nil and in_radius(mypos,zone.vehpos,5) then
                --buy car
                local current_trade=1
                while true do Wait(0)
                    inventory.highlight=0
                    pped=PlayerPedId()
                    mypos=GetEntityCoords(pped)
                    if IsControlJustPressed(0,177) or not in_radius(mypos,zone.vehpos,5) then
                        break
                    elseif IsControlJustPressed(0,173) then --right
                        if current_trade<#zone.vehshop then
                            current_trade=current_trade+1
                        else
                            current_trade=1
                        end
                    elseif IsControlJustPressed(0,172) then --left
                        if current_trade>1 then
                            current_trade=current_trade-1
                        else
                            current_trade=#zone.vehshop
                        end
                    elseif IsControlJustPressed(0,86) then --e veh horn
                        local enough=do_we_have_all_that(zone.vehshop[current_trade][2])
                        if enough then
                            local model=GetHashKey(zone.vehshop[current_trade][1])
                            if not HasModelLoaded(model) then
                                RequestModel(model)
                                Wait(0)
                                while not HasModelLoaded(model) do Wait(0) end
                                enough=do_we_have_all_that(zone.vehshop[current_trade][2])
                            end
                            if enough then
                                remove_all_that(zone.vehshop[current_trade][2])
                                local veh=CreateVehicle(model,zone.vehpos.x,zone.vehpos.y,zone.vehpos.z,zone.vehpos.angle,true,false)
                                DecorSetBool(veh,"zm_looted",true)
                                DecorSetBool(veh,"post_apoc_car",true)
                                DecorSetFloat(veh,"zm_fuel",20.0)
                                SetPedIntoVehicle(pped,veh,-1)
                                SetVehicleAsNoLongerNeeded(veh)
                                SetModelAsNoLongerNeeded(model)
                                Wait(0)
                                break
                            else
                                SetModelAsNoLongerNeeded(model)
                            end
                        end
                    end
                    DrawRect(0.25,0.65,0.2,0.6,0,0,0,175)
                    DrawRect(0.25,0.40,0.2,0.1,0,150,200,255) --blue header
                    SetTextCentre(true)
                    WriteText(7,"Vehicle shop",1.0,255,255,255,255,0.25,0.375)
                    DrawRect(0.25,0.44+current_trade*.025,0.2,0.025,255,255,255,255) --chosenline
                    for i=1,#zone.vehshop do
                        if i==current_trade then
                            WriteTextNoOutline(2,zone.vehshop[i][1],0.35,0,0,0,255,0.16,0.428+i*.025) --chosen line text
                        else
                            WriteTextNoOutline(2,zone.vehshop[i][1],0.35,255,255,255,255,0.16,0.428+i*.025) --not chosen line text
                        end
                    end
                    local item,have,need
                    for i=1,#zone.vehshop[current_trade][2],2 do
                        item=zone.vehshop[current_trade][2][i]
                        have=get_inventroy_item_amount(item)
                        need=zone.vehshop[current_trade][2][i+1]
                        DrawSprite("lsm",item,.39,.435+i*.05,inv_big_x,inv_big_y,0.0, 255, 255, 255, 255)
                        if have<need then
                            WriteText(2,item.."\n"..have.." of "..need,0.35,255,0,0,255,.42,.428+i*.05)
                        else
                            WriteText(2,item.."\n"..have.." of "..need,0.35,0,255,0,255,.42,.428+i*.05)
                        end
                    end
                end
            elseif zone~=nil and zone.provisionpos~=nil and in_radius(mypos,zone.provisionpos,1) then
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
                            WriteNotification("Your ~r~inventory is full~s~, you can't take anything.")
                        end
                    end
                else
                    WriteNotification("You cannot receive new free provision yet.")
                end
            elseif zone~=nil and zone.tradepos~=nil and in_radius(mypos,zone.tradepos,5) then
                --trade
                    print("trade open")
                    inventory.highlight=0
                    local current_trade=1
                    while true do Wait(0)
                        local inv_index_price=0
                        local inv_index_goods=0
                        local youhaveamount_price=0
                        local youhaveamount_goods=0
                        for j=1,inventory.total do
                            if inventory[j].item==zone.trade[current_trade][3] then
                                youhaveamount_price=inventory[j].amount
                                inv_index_price=j
                            elseif inventory[j].item==zone.trade[current_trade][1] then
                                youhaveamount_goods=inventory[j].amount
                                inv_index_goods=j
                            end
                        end
                        mypos=GetEntityCoords(PlayerPedId())
                        if IsControlJustPressed(0,177) or not in_radius(mypos,zone.tradepos,5) then
                            break
                        elseif IsControlJustPressed(0,175) then --right
                            if current_trade<#zone.trade then
                                current_trade=current_trade+1
                            else
                                current_trade=1
                            end
                        elseif IsControlJustPressed(0,174) then --left
                            if current_trade>1 then
                                current_trade=current_trade-1
                            else
                                current_trade=#zone.trade
                            end
                        elseif IsControlJustPressed(0,86) then --e veh horn
                            print(zone.trade[current_trade][4].." you have:"..youhaveamount_price)
                            if zone.trade[current_trade][4]<youhaveamount_price then
                                if give_item_to_inventory(zone.trade[current_trade][1],zone.trade[current_trade][2]) then
                                    inventory[inv_index_price].amount=youhaveamount_price-zone.trade[current_trade][4]
                                    inventory.current=inv_index_price --important for check_inv_slot_for_zero_amount()
                                    check_inv_slot_for_zero_amount() --to save
                                    inventory.highlight=0
                                    --WriteNotification("Bought ~g~"..zone.trade[current_trade][1].."~s~.")
                                end
                            elseif zone.trade[current_trade][4]==youhaveamount_price then
                                inventory[inv_index_price].amount=0
                                inventory.current=inv_index_price --important for check_inv_slot_for_zero_amount()
                                check_inv_slot_for_zero_amount()
                                give_item_to_inventory(zone.trade[current_trade][1],zone.trade[current_trade][2])
                                inventory.highlight=0
                            else
                                WriteNotification("Not enough ~g~"..zone.trade[current_trade][3].."~s~!")
                            end
                        end
                        for i=1,#zone.trade do
                            local x=(i+i-#zone.trade-1)*.03+0.5
                            if current_trade~=i then
                                SetTextCentre(true)
                                WriteText(7,zone.trade[i][1].." ~g~x"..zone.trade[i][2],0.2,255,255,255,255,x,0.3)
                                DrawSprite("lsm", zone.trade[i][1],x,0.35,inv_sml_x,inv_sml_y,0.0, 255, 255, 255, 255)
                                DrawSprite("lsm", "arrowdown",x,0.40,inv_sml_x,inv_sml_y,180.0, 255, 255, 255, 255)
                                DrawSprite("lsm", zone.trade[i][3],x,0.45,inv_sml_x,inv_sml_y,0.0, 255, 255, 255, 255)
                                SetTextCentre(true)
                                WriteText(7,zone.trade[i][3].." ~g~x"..zone.trade[i][4],0.2,255,255,255,255,x,0.4875)
                            end
                        end
                            local i=current_trade
                            local x=(i+i-#zone.trade-1)*.03+0.5
                                SetTextCentre(true)
                                WriteText(7,zone.trade[i][1].." ~g~x"..zone.trade[i][2],0.4,255,255,255,255,x,0.275)
                                DrawSprite("lsm", zone.trade[i][1],x,0.35,inv_big_x,inv_big_y,0.0, 255, 255, 255, 255)
                                DrawSprite("lsm", "arrowdown",x,0.40,inv_big_x,inv_big_y,180.0, 255, 255, 255, 255)
                                DrawSprite("lsm", zone.trade[i][3],x,0.45,inv_big_x,inv_big_y,0.0, 255, 255, 255, 255)
                                SetTextCentre(true)
                                WriteText(7,zone.trade[i][3].." ~g~x"..zone.trade[i][4],0.4,255,255,255,255,x,0.5)

                                SetTextCentre(true)
                                WriteText(7,"~c~You have\n"..zone.trade[i][3]..((zone.trade[current_trade][4]<=youhaveamount_price) and " ~g~x" or " ~r~x")..youhaveamount_price.."\n~c~"..zone.trade[i][1].." ~g~x"..youhaveamount_goods,0.3,255,255,255,255,x,0.55)
                        WriteText(7,"~g~E ~c~to make deal",0.35,255,255,255,255,0.53,0.86)
                        WriteText(7,"~g~left ~c~and ~g~right ~c~to select trade",0.35,255,255,255,255,0.53,0.89)
                        WriteText(7,"~g~backspace ~c~ or ~g~ RMB ~c~to cancel",0.35,255,255,255,255,0.53,0.92)
                    end
            elseif zone~=nil and zone.changingroompos~=nil and in_radius(mypos,zone.changingroompos,1) then 
                -- changing clothes 
                local current_menu=0
                local total_menu_count=15
                local component_name={
                [0]="Head",
                    "Beard",
                    "Hair",
                    "Torso",
                    "Legs",
                    "Hands",
                    "Foot",
                    "Additional",
                    "Accessories1",
                    "Accessories2",
                    "Decals and mask",
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
                            print("current "..current)
                            local total=GetNumberOfPedPropDrawableVariations(pped,current_menu-12)-1
                            if current<total then
                                current=current+1
                            else
                                current=-1
                            end
                            print("set "..current)
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
                            print("current "..current)
                            local total=GetNumberOfPedPropDrawableVariations(pped,current_menu-12)-1
                            if current>-1 then
                                current=current-1
                            else
                                current=total
                            end
                            print("set "..current)
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
                            WriteTextNoOutline(4,current.." / "..variations.." >",0.35,0,0,0,alpha,0.285,0.428+.025+i*.025) --chosen line text
                            WriteTextNoOutline(4,"E "..texture.." / "..textures,0.35,0,0,0,alpha,0.315,0.428+.025+i*.025) --chosen line text
                        else
                            WriteTextNoOutline(2,component_name[i],0.35,255,255,255,alpha,0.16,0.428+.025+i*.025) --not chosen line text
                            if (variations~=0) then current=current+1 end
                            WriteTextNoOutline(4,current.." / "..variations,0.35,255,255,255,alpha,0.285,0.428+.025+i*.025) --not chosen line text
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
                            WriteTextNoOutline(4,current.." / "..variations.." >",0.35,0,0,0,alpha,0.285,0.428+.025+i*.025) --chosen line text
                            WriteTextNoOutline(4,"E "..texture.." / "..textures,0.35,0,0,0,alpha,0.325,0.428+.025+i*.025) --chosen line text
                        else
                            WriteTextNoOutline(2,component_name[i],0.35,255,255,255,alpha,0.16,0.428+.025+i*.025) --not chosen line text
                            if (variations~=0) then current=current+1 end
                            WriteTextNoOutline(4,current.." / "..variations,0.35,255,255,255,alpha,0.285,0.428+.025+i*.025) --not chosen line text
                        end
                    end
                end
            elseif zone~=nil and zone.clothespos~=nil and in_radius(mypos,zone.clothespos,1) then 
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
                                WriteNotification("You changed your clothes.")
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
                            WriteText(2,item.."\n"..have.." of "..need,0.35,255,0,0,255,.42,.428+i*.05)
                        else
                            WriteText(2,item.."\n"..have.." of "..need,0.35,0,255,0,255,.42,.428+i*.05)
                        end
                    end
                end
            elseif zone~=nil and zone.craftpos~=nil and in_radius(mypos,zone.craftpos,1) then 
                --craft
                local current_menu=1

                while true do Wait(0)
                    inventory.highlight=0
                    pped=PlayerPedId()
                    mypos=GetEntityCoords(pped)
                    if IsControlJustPressed(0,177) or not in_radius(mypos,zone.craftpos,5) then
                        break
                    elseif IsControlJustPressed(0,173) then --right
                        if current_menu<#zone.crafts then
                            current_menu=current_menu+1
                        else
                            current_menu=1
                        end
                    elseif IsControlJustPressed(0,172) then --left
                        if current_menu>1 then
                            current_menu=current_menu-1
                        else
                            current_menu=#zone.crafts
                        end
                    elseif IsControlJustPressed(0,86) then --e veh horn
                        local enough=do_we_have_all_that(zone.crafts[current_menu][2])
                        if enough then
                            -- local model=GetHashKey(zone.crafts[current_menu][1])
                            -- if not HasModelLoaded(model) then
                                -- RequestModel(model)
                                -- Wait(0)
                                -- while not HasModelLoaded(model) do Wait(0) end
                                -- enough=do_we_have_all_that(zone.crafts[current_menu][2])
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
                            if give_item_to_inventory(zone.crafts[current_menu][1],1) then
                                remove_all_that(zone.crafts[current_menu][2])
                                Wait(0)
                            else
                                WriteNotification("Can't fit "..zone.crafts[current_menu][1].." in inventory, drop something.")
                                --SetModelAsNoLongerNeeded(model)
                            end
                        end
                    end
                    DrawRect(0.25,0.65,0.2,0.6,0,0,0,175)
                    DrawRect(0.25,0.40,0.2,0.1,0,150,200,255) --blue header
                    SetTextCentre(true)
                    WriteText(7,"Crafting",1.0,255,255,255,255,0.25,0.375)
                    DrawRect(0.25,0.44+current_menu*.025,0.2,0.025,255,255,255,255) --chosenline
                    for i=1,#zone.crafts do
                        if i==current_menu then
                            WriteTextNoOutline(2,zone.crafts[i][1],0.35,0,0,0,255,0.16,0.428+i*.025) --chosen line text
                        else
                            WriteTextNoOutline(2,zone.crafts[i][1],0.35,255,255,255,255,0.16,0.428+i*.025) --not chosen line text
                        end
                    end
                    local item,have,need
                    for i=1,#zone.crafts[current_menu][2],2 do
                        item=zone.crafts[current_menu][2][i]
                        have=get_inventroy_item_amount(item)
                        need=zone.crafts[current_menu][2][i+1]
                        DrawSprite("lsm",item,.39,.435+i*.05,inv_big_x,inv_big_y,0.0, 255, 255, 255, 255)
                        if have<need then
                            WriteText(2,item.."\n"..have.." of "..need,0.35,255,0,0,255,.42,.428+i*.05)
                        else
                            WriteText(2,item.."\n"..have.." of "..need,0.35,0,255,0,255,.42,.428+i*.05)
                        end
                    end
                end
            else
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
                        if #(GetEntityCoords(pped)-mypos)>1 then break end
                        if not IsEntityPlayingAnim(pped,dict,anim,3) then break end
                        if is_other_player_playing_anim_nearby(mypos,myplayerid,dict,anim) then
                            WriteNotification("~r~Conflict, other player is picking up something.")
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
        elseif inventory.total~=0 then
            if IsControlJustPressed(0,174) then --left
                if not inventory.mode and (inventory.current%inventory.rows)==0 then
                    inventory.current=inventory.current-(inventory.rows-1)
                    if inventory.current<1 then inventory.current=1 end
                elseif inventory.current<inventory.total then
                    inventory.current=inventory.current+1
                else
                    inventory.current=1
                end
                inventory.highlight=500
            elseif IsControlJustPressed(0,175) then --right
                if not inventory.mode and (inventory.current%inventory.rows)==1 then
                    inventory.current=inventory.current+(inventory.rows-1)
                    if inventory.current>inventory.total then inventory.current=inventory.total end
                elseif inventory.current>1 then
                    inventory.current=inventory.current-1
                else
                    inventory.current=inventory.total
                end
                inventory.highlight=500
            elseif IsControlJustPressed(0,172) then --up
                if not inventory.mode then
                    if inventory.current+inventory.rows<=inventory.total then
                        inventory.current=inventory.current+inventory.rows
                        if inventory.current>inventory.total then inventory.current=inventory.total end
                    else
                        inventory.current=inventory.current%inventory.rows
                        if inventory.current==0 then inventory.current=inventory.rows end
                        if inventory.current>inventory.total then inventory.current=inventory.total end
                    end
                    inventory.highlight=500
                end
            elseif IsControlJustPressed(0,173) then --down
                if not inventory.mode then
                    if inventory.current>inventory.rows then
                        inventory.current=inventory.current-inventory.rows
                        if inventory.current<1 then inventory.current=1 end
                    else
                        inventory.current=inventory.current+inventory.total-(inventory.total%inventory.rows)
                        if inventory.current>inventory.total then inventory.current=inventory.total end
                    end
                    inventory.highlight=500
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
                    elseif inventory[inventory.current].item=="gasoline" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
                            if NetworkHasControlOfEntity(pveh) then
                                local fuel=DecorGetFloat(pveh,"zm_fuel")
                                if fuel<80.0 then
                                    if fuel<5.0 then
                                        fuel=5.9+.1
                                    else
                                        fuel=fuel+(.9+.1)
                                    end
                                    SetVehicleFuelLevel(pveh,fuel)
                                    DecorSetFloat(pveh,"zm_fuel",fuel)
                                    inventory[inventory.current].amount=inventory[inventory.current].amount-1
                                    check_inv_slot_for_zero_amount()
                                    SetVehicleFuelLevel(pveh,fuel)
                                end
                            else
                                NetworkRequestControlOfEntity(pveh)
                            end
                        end
                    elseif inventory[inventory.current].item=="engineparts" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
                            if NetworkHasControlOfEntity(pveh) then
                                if GetVehicleEngineHealth(pveh)<1000.0 then
                                    SetVehicleEngineHealth(pveh,GetVehicleEngineHealth(pveh)+10.0)
                                    inventory[inventory.current].amount=inventory[inventory.current].amount-1
                                    check_inv_slot_for_zero_amount()
                                else
                                    WriteNotification("Vehicle engine is in perfect condition.")
                                end
                            else
                                NetworkRequestControlOfEntity(pveh)
                            end
                        end
                    elseif inventory[inventory.current].item=="ammo" then
                        give_ammo(pped,218444191)
                    elseif inventory[inventory.current].item=="pistolammo" then
                        give_ammo(pped,1950175060)
                    elseif inventory[inventory.current].item=="shotgunammo" then
                        give_ammo(pped,-1878508229)
                    elseif inventory[inventory.current].item=="heavyrifleammo" then
                        give_ammo(pped,1285032059)
                    elseif inventory[inventory.current].item=="medkit" then
                        if player.health<100.0 then
                            player.health=player.health+80
                            if player.health>100 then player.health=100 end
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="alcohol" then
                        if player.hydration<100 then
                            player.hydration=player.hydration+20
                            if player.hydration>100 then player.hydration=100 end
                            player.drunk=player.drunk+1.5
                            ShakeGameplayCam("DRUNK_SHAKE",player.drunk)
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    elseif inventory[inventory.current].item=="weed" then
                        if player.saturation<100 then
                            player.saturation=player.saturation+20
                            if player.saturation>100 then player.saturation=100 end
                            player.drunk=player.drunk+0.5
                            ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",player.drunk)
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    end
                end
                inventory.highlight=500
            elseif IsControlJustPressed(0,214) then --INPUT_FRONTEND_DELETE
                if not IsPedInAnyVehicle(pped) then
                    inventory.highlight=0
                    local amounttodrop=inventory[inventory.current].amount
                    while true do Wait(0)
                        if IsControlPressed(0,174) then
                            amounttodrop=amounttodrop-1
                            if amounttodrop<1 then amounttodrop=1 end
                        elseif IsControlPressed(0,175) then
                            amounttodrop=amounttodrop+1
                            if amounttodrop>inventory[inventory.current].amount then amounttodrop=inventory[inventory.current].amount end
                        end
                        DrawSprite("lsm", "hand", 0.5025,0.85,inv_size_x,inv_size_y,0.0, 255, 255, 255, 255)
                        DrawSprite("lsm", inventory[inventory.current].item, 0.5,0.875,inv_size_x,inv_size_y,0.0, 255, 255, 255, 255)
                        DrawSprite("lsm", "arrowdown", 0.5,0.950,inv_size_x,inv_size_y,0.0, 255, 255, 255, 255)
                        WriteText(7,"~g~E ~c~to drop".." ~w~"..amounttodrop.."~c~/"..inventory[inventory.current].amount.." "..inventory[inventory.current].item,0.45,255,255,255,255,0.53,0.85)
                        WriteText(7,"~g~left ~c~and ~g~right ~c~to change amount to drop",0.35,255,255,255,255,0.53,0.89)
                        WriteText(7,"~g~backspace ~c~ or ~g~ RMB ~c~to cancel",0.35,255,255,255,255,0.53,0.92)
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
                                local obj=CreateObject(model,mypos.x,mypos.y,mypos.z-.99,true,false,false)
                                SetEntityCollision(obj,false,false)
                                FreezeEntityPosition(obj,true)
                                DecorSetInt(obj,"item",item_name_to_index[inventory[inventory.current].item])
                                DecorSetInt(obj,"count",amounttodrop)
                                --SetObjectAsNoLongerNeeded(obj)
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
            end
        end
    end
end)



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


Citizen.CreateThread(function()
    local player_peds
    while true do Wait(0)
        --local myself=PlayerId()
        player_peds=get_player_peds()
        local handle,obj=FindFirstObject()
        local loop=(handle~=-1)
        while loop do
            if GetEntityModel(obj)==GetHashKey("prop_cs_heist_bag_02") then
                local closest,distance=closest_point(player_peds,GetEntityCoords(obj))
                if distance>2500 then
                    SetObjectAsNoLongerNeeded(obj)
                end
            end
            loop,obj=FindNextObject(handle)
        end
        EndFindObject(handle)
    end
end)



Citizen.CreateThread(function()
    local oldzone
    local traderblip
    local vehblip
    local garageblip
    local clothesblip
    local changingroomblip
    local provisionblip
    local craftblip
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        if zone~=oldzone then
            if zone~=nil then
                if zone.tradepos~=nil then
                    if traderblip~=nil then
                        SetBlipCoords(traderblip,zone.tradepos.x,zone.tradepos.y,zone.tradepos.z)
                    else
                        traderblip=AddBlipForCoord(zone.tradepos.x,zone.tradepos.y,zone.tradepos.z)
                        SetBlipSprite(traderblip,108)
                        SetBlipColour(traderblip,2)
                    end
                end
                if zone.vehpos~=nil then
                    if vehblip~=nil then
                        SetBlipCoords(vehblip,zone.vehpos.x,zone.vehpos.y,zone.vehpos.z)
                    else
                        vehblip=AddBlipForCoord(zone.vehpos.x,zone.vehpos.y,zone.vehpos.z)
                        SetBlipSprite(vehblip,225)
                        SetBlipColour(vehblip,3)
                    end
                end
                if zone.garagepos~=nil then
                    if garageblip~=nil then
                        SetBlipCoords(garageblip,zone.garagepos.x,zone.garagepos.y,zone.garagepos.z)
                    else
                        garageblip=AddBlipForCoord(zone.garagepos.x,zone.garagepos.y,zone.garagepos.z)
                        SetBlipSprite(garageblip,357)
                        SetBlipColour(garageblip,4)
                    end
                end
                if zone.craftpos~=nil then
                    if craftblip~=nil then
                        SetBlipCoords(craftblip,zone.craftpos.x,zone.craftpos.y,zone.craftpos.z)
                    else
                        craftblip=AddBlipForCoord(zone.craftpos.x,zone.craftpos.y,zone.craftpos.z)
                        SetBlipSprite(craftblip,402)
                        SetBlipColour(craftblip,44)
                    end
                end
                if zone.clothespos~=nil then
                    if clothesblip~=nil then
                        SetBlipCoords(clothesblip,zone.clothespos.x,zone.clothespos.y,zone.clothespos.z)
                    else
                        clothesblip=AddBlipForCoord(zone.clothespos.x,zone.clothespos.y,zone.clothespos.z)
                        SetBlipSprite(clothesblip,366)
                        SetBlipColour(clothesblip,4)
                    end
                end
                if zone.changingroompos~=nil then
                    if changingroomblip~=nil then
                        SetBlipCoords(changingroomblip,zone.changingroompos.x,zone.changingroompos.y,zone.changingroompos.z)
                    else
                        changingroomblip=AddBlipForCoord(zone.changingroompos.x,zone.changingroompos.y,zone.changingroompos.z)
                        SetBlipSprite(changingroomblip,73)
                        SetBlipColour(changingroomblip,4)
                    end
                end
                if zone.provisionpos~=nil then
                    if provisionblip~=nil then
                        SetBlipCoords(provisionblip,zone.provisionpos.x,zone.provisionpos.y,zone.provisionpos.z)
                    else
                        provisionblip=AddBlipForCoord(zone.provisionpos.x,zone.provisionpos.y,zone.provisionpos.z)
                        SetBlipSprite(provisionblip,52)
                        SetBlipColour(provisionblip,5)
                    end
                end
                if zone.name~=nil then
                    WriteNotification("You entered "..zone.name..".")
                    WriteNotification("Now you respawn at "..zone.name..".")
                    print("you entered zone")
                    FlashMinimapDisplay()
                    SetResourceKvpFloat("x",zone.spawnpos.x)
                    SetResourceKvpFloat("y",zone.spawnpos.y)
                    SetResourceKvpFloat("z",zone.spawnpos.z)
                    
                    SetResourceKvpInt("pedmodel",GetEntityModel(myped))
                    --DisplayRadar(false)
                end
            else
                if traderblip~=nil then
                    RemoveBlip(traderblip)
                    traderblip=nil
                end
                if vehblip~=nil then
                    RemoveBlip(vehblip)
                    vehblip=nil
                end
                if garageblip~=nil then
                    RemoveBlip(garageblip)
                    garageblip=nil
                end
                if craftblip~=nil then
                    RemoveBlip(craftblip)
                    craftblip=nil
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
                if oldzone~=nil and oldzone.name~=nil then
                    WriteNotification("You left "..oldzone.name..".")
                    print("you exited zone")
                    --DisplayRadar(true)
                    FlashMinimapDisplay()
                end
            end
        else
            if zone~=nil then
                if zone.vehpos~=nil then
                    DrawMarker(20, zone.vehpos.x, zone.vehpos.y, zone.vehpos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    100, 150, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.garagepos~=nil then
                    DrawMarker(20, zone.garagepos.x, zone.garagepos.y, zone.garagepos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    100, 150, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.craftpos~=nil then
                    DrawMarker(20, zone.craftpos.x, zone.craftpos.y, zone.craftpos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 200, 50, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.tradepos~=nil then
                    DrawMarker(29, zone.tradepos.x, zone.tradepos.y, zone.tradepos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, 1.0, --scl
                    100, 255, 100, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.clothespos~=nil then
                    DrawMarker(20, zone.clothespos.x, zone.clothespos.y, zone.clothespos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 255, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.changingroompos~=nil then
                    DrawMarker(20, zone.changingroompos.x, zone.changingroompos.y, zone.changingroompos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 255, 255, 200, 
                    true, false, 2, true, 0, 0, false);
                end
                if zone.provisionpos~=nil then
                    DrawMarker(20, zone.provisionpos.x, zone.provisionpos.y, zone.provisionpos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, -1.0, --scl
                    255, 255, 100, 200, 
                    true, false, 2, true, 0, 0, false);
                end
            end
        end
        oldzone=zone
    end
end)

Citizen.CreateThread(function()
    SetAllRandomPedsFlee(PlayerId(),false)
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
        SetPedSeeingRange(ped, 100.0)
        SetPedHearingRange(ped, 100.0)
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
    local function zombie_init()--needs ped and zpos
        if IsPedHuman(ped) then
            zone=is_in_safe_zone(zpos.x,zpos.y,zpos.z)
            if zone==nil then
                if IsPedInAnyHeli(ped) or math.random(1,20)==1 then --loners
                    DecorSetBool(ped,"raider",false)
                    if IsPedUsingAnyScenario(ped) then ClearPedTasksImmediately(ped) end
                    SetPedRelationshipGroupHash(ped,GetHashKey("HATES_PLAYER"))
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
                    local weaponsarray=weaponsarray.raiders
                    local randomweapon=math.random(1,#weaponsarray)
                    GiveWeaponToPed(ped, weaponsarray[randomweapon], 5000, false, true)
                else --zombie
                    zombie_type=math.abs(math.floor(zpos.x+zpos.y*5+zpos.z*7))%#randomclipsets+1
                    DecorSetInt(ped,"zombie_type",zombie_type)
                    clipset=randomclipsets[zombie_type]
                    SetPedEnableWeaponBlocking(ped, true)
                    DisablePedPainAudio(ped, true)
                    SetPedMute(ped)
                    SetPedRelationshipGroupHash(ped,GetHashKey("AGGRESSIVE_INVESTIGATE"))
                    SetBlockingOfNonTemporaryEvents(ped, 1)
                    SetPedArmour(ped,85)
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
            else --safezone / heists
                DecorSetBool(ped,"raider",true)                                
                if IsPedUsingAnyScenario(ped) then ClearPedTasksImmediately(ped) end
                --TaskGuardCurrentPosition(ped, 5.0, 5.0, true);
                -- if GetPedRelationshipGroupHash(ped)==GetHashKey("COP") then
                    -- --SetEntityHealth(ped,-1)
                    -- --ExplodePedHead(ped,GetHashKey("WEAPON_PISTOL"))
                    
                -- end
                SetPedRelationshipGroupHash(ped,zone.relationship)
                --SetEntityCoords(ped,zone.x, zone.y, zone.z)
                --if zone.guard then TaskWanderInArea(ped, zone.x, zone.y, zone.z, 10.0, 3.0, 5.0); end
                if zone.guard then TaskGuardCurrentPosition(ped, 35.1, 35.1, true); end
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
                local weaponsarray=zone.weapons
                local randomweapon=math.random(1,#weaponsarray)
                GiveWeaponToPed(ped, weaponsarray[randomweapon], 5000, false, true)
                
                SetPedCanSwitchWeapon(ped,false)
            end
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
    local function zombie_attack()--needs ped, zpos, player_peds
        --target,distance=closest_point(player_peds,zpos)
        target,distance=closest_point(survivors,zpos)
        --distance is squared
        if distance>4.0 then
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
            TaskGoToEntity(ped, target, -1, 0.1, clipset.speed, 1073741824, 0)
        else
            --ClearPedSecondaryTask(ped)
            --ClearPedTasksImmediately(ped)
            --SetBlockingOfNonTemporaryEvents(ped, 1)
            TaskSetBlockingOfNonTemporaryEvents(ped, 1)
            TaskCombatPed(ped, target, 0, 16);
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
        if filter_mode then
            --if math.abs(timestamp-last_timestamp)>50 then
            --    last_timestamp=timestamp
                filter=(filter+256)&maxfilter
            --end
            player_peds=nil
            survivors=nil
            handle,ped=FindFirstPed()
            loop=(handle~=-1)
            while loop do
                if (ped&maxfilter)==filter then --heavy
                    if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) then
                        zpos=GetEntityCoords(ped)
                        if DecorExistOn(ped,"zombie_type") then
                            if survivors==nil then get_survivors() end
                            zombie_attack()
                            RequestAnimSet(clipset.anim)
                            if HasAnimSetLoaded(clipset.anim) then
                                SetPedMovementClipset(ped,clipset.anim,clipset.speed)
                            end
                        elseif DecorExistOn(ped,"raider") then
                            if IsPedUsingAnyScenario(ped) then TaskGuardCurrentPosition(ped, 35.1, 35.1, true) end
                        else
                           -- if DecorGetInt(ped,"zombie_type")~=4 then
                                zombie_init()
                           -- end
                        end
                    end
                else --light
                    if not IsPedAPlayer(ped) then
                        if not IsPedDeadOrDying(ped) then
                            if DecorExistOn(ped,"zombie_type") then
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
                                if IsPedUsingAnyScenario(ped) then TaskGuardCurrentPosition(ped, 35.1, 35.1, true) end
                            else
                                zpos=GetEntityCoords(ped)
                                zombie_init()
                            end
                        else
                            --print("killer="..GetPedKiller(ped).." source_of_death="..GetPedSourceOfDeath(ped).." cause_of_death="..GetPedCauseOfDeath(ped))
                            zpos=GetEntityCoords(ped)
                            if player_peds==nil then player_peds=get_player_peds() end
                            if dist_to_closest_point(player_peds,zpos)>2500.0 then
                                if IsEntityAMissionEntity(ped) then
                                    DeleteEntity(ped)
                                end
                            else
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
                    elseif not DecorExistOn(ped,"raider") then
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
                if not IsPedAPlayer(ped) then
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
                        elseif not DecorExistOn(ped,"raider") then
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
    local function try_to_loot_engine(veh)
        if not any_player_inside(veh) then
            local engine=GetVehicleEngineHealth(veh)
            local parts=math.floor((engine-no_engine_parts)*.1)
            if parts>0 then
                if give_item_to_inventory("engineparts",parts) then --"engine_parts"
                    SetVehicleEngineHealth(veh,engine-parts*10)
                end
            end
        else
            WriteNotification("Cannot loot engine while someone is in car.")
        end
    end
    local function try_to_loot_trunk(veh)
        if not DecorExistOn(veh,"zm_looted") then
            --GiveWeaponToPed(PlayerPedId(), 883325847, 21, false, true)
            local randomitem
            local platenumber=GetVehicleNumberPlateText(veh)
            if (GetHashKey(platenumber)&7)==0 then
                local randomamount=math.random(1,20)
                local randchose=math.random(1,15)
                if      randchose==1  then randomitem="water" 
                elseif  randchose==2  then randomitem="canfood" 
                elseif  randchose==3  then randomitem="mre" 
                elseif  randchose==4  then randomitem="weed" 
                elseif  randchose==5  then randomitem="chemicals" 
                elseif  randchose==6  then randomitem="gasoline" 
                elseif  randchose==7  then randomitem="juice" 
                elseif  randchose==8  then randomitem="soda" 
                elseif  randchose==9  then randomitem="medkit" 
                elseif  randchose==10 then randomitem="alcohol" 
                elseif  randchose==11 then randomitem="bandage" 
                elseif  randchose==12 then randomitem="ammo" 
                elseif  randchose==13 then randomitem="pistolammo" 
                elseif  randchose==14 then randomitem="heavyrifleammo" 
                elseif  randchose==15 then randomitem="shotgunammo" 
                end
                local finalrandammo
                if randchose>=12 then finalrandammo=randomamount else finalrandammo=1 end
                if give_item_to_inventory(randomitem,finalrandammo) then
                    DecorSetBool(veh,"zm_looted",true)
                end
            else
                WriteNotification("Nothing useful.")
                DecorSetBool(veh,"zm_looted",true)
            end
        end
    end
    local function try_to_loot_side(veh)
        local fuel=DecorGetFloat(veh,"zm_fuel")--GetVehicleFuelLevel(veh)
        local liters=math.floor(fuel-5)
        if liters>0 then
            if give_item_to_inventory("gasoline",liters) then
                fuel=fuel-liters
                DecorSetFloat(veh,"zm_fuel",fuel)
                SetVehicleFuelLevel(veh,fuel)
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
            if not IsPedInAnyVehicle(pped) then
                local mypos=GetEntityCoords(pped)
                local loop,handle,ped,veh
                handle,ped=FindFirstPed()
                loop=(handle~=-1)
                while loop do
                    local reward=deadbodiesrewards[GetEntityModel(ped)]
                    if reward==nil then reward=deadbodiesrewards_random[math.random(1,#deadbodiesrewards_random)] end
                    --if reward~=nil then
                        if IsPedDeadOrDying(ped,true) then
                                local zpos=GetEntityCoords(ped)
                                local distance=#(mypos-zpos)
                                if distance<1.5 and not DecorExistOn(ped,"zm_looted") then
                                    --::trytolootagain::
                                    if NetworkHasControlOfEntity(ped) then
                                        TaskPlayAnim(pped, dict, anim, 1.0, 1.0, -1, 0, .0, false, false, false)
                                        --if type(reward[1])=='string' then
                                            if math.random(0,7)==0 then
                                                if give_item_to_inventory(reward[1],reward[2]) then DecorSetBool(ped,"zm_looted",true) end
                                            else
                                                WriteNotification("Nothing useful.")
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
                    local distance=#(mypos-vpos)
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
        if IsPedInAnyVehicle(ped,false) then
            local veh=GetVehiclePedIsUsing(ped)
            if veh~=0 and GetEntityModel(veh)==1938952078 then --fire truck
                GiveWeaponToPed(ped,101631238,1000,false,true) --fire extinguisher
                Wait(1000)
            else
                Wait(500)
            end
        elseif IsControlJustPressed(0,86) then
            pos=GetEntityCoords(ped)
            local obj
            local empty=false
            local spoiled=false
            local found=false
            for k,v in pairs(pickups_objects) do
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.3, k, false, false, false)
                if obj~=0 and NetworkGetEntityIsLocal(obj) then
                    if v.solid and DecorExistOn(obj,"zm_looted") then
                        empty=true
                    elseif not v.spoiled then
                        for i=1,5,2 do
                            if v[i]==nil then
                                break
                            end
                            if (inventory_items_chances[v[i]]==nil) or (math.random(1,100)<inventory_items_chances[v[i]]) then
                                give_item_to_inventory(v[i],v[i+1])
                            else
                                WriteNotification("This food is ~r~spoiled~s~.")
                            end
                        end
                        local objpos=GetEntityCoords(obj)
                        looted_array[coords_to_dword(objpos.x,objpos.y,objpos.z)]=current_date
                        if v.solid then
                            DecorSetBool(obj,"zm_looted",true)
                        else
                            SetEntityAsMissionEntity(obj)
                            DeleteObject(obj)
                        end
                        found=true
                        break
                    else
                        spoiled=true
                    end
                end
            end
            if not found then
                if empty then
                    WriteNotification("This thing is ~r~empty~s~.")
                end
                if spoiled then
                    WriteNotification("This food is ~r~spoiled~s~.")
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
            Wait(0)
        else
            Wait(0)
        end
    end
end)
-- deleting objects that are looted
Citizen.CreateThread(function()
    while true do Wait(0)
        local loop,handle,obj
        local hash,t,model
        handle,obj=FindFirstObject()
        loop=(handle~=-1)
        while loop do
            model=pickups_objects[GetEntityModel(obj)]
            if model~=nil and not DecorExistOn(obj,"zm_looted")  then
                hash=coords_to_dword(table.unpack(GetEntityCoords(obj)))
                t=looted_array[hash]
                if t~=nil then
                    if current_date-t>respawn_time then
                        looted_array[hash]=nil
                    elseif model.solid then
                        DecorSetBool(obj,"zm_looted",true)
                    else
                        SetEntityAsMissionEntity(obj)
                        DeleteObject(obj)
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
AddEventHandler('populationPedCreating', function(x, y, z, model, setters)
    if birds[model]==nil then
        local zone=is_in_safe_zone(x,y,z)
        local newmodel
        if zone~=nil and zone.models~=nil then
            newmodel=0xFFFFFFFF&zone.models[(coords_to_dword(x,y,z)%(#zone.models))+1]
        else
            newmodel=replace_models[model]
        end
        if newmodel~=nil then
            if HasModelLoaded(newmodel) then
                setters.setModel(newmodel)
                setters.setPosition(x, y, z + 1.0)
            else
                RequestModel(newmodel)
                --CancelEvent()
            end
        end
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
                local ped_pos=GetEntityCoords(ped)
                local obj_pos=GetEntityCoords(obj)
                if math.abs(obj_pos.x-ped_pos.x)+math.abs(obj_pos.y-ped_pos.y)+math.abs(obj_pos.z-ped_pos.z)>2 then
                    SetEntityAsNoLongerNeeded(obj)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                    objects_bp[k]=nil
                else
                    peds_bp[ped]=true
                end
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
                local ped_pos=GetEntityCoords(ped)
                local obj_pos=GetEntityCoords(obj)
                if math.abs(obj_pos.x-ped_pos.x)+math.abs(obj_pos.y-ped_pos.y)+math.abs(obj_pos.z-ped_pos.z)>2 then
                    SetEntityAsNoLongerNeeded(obj)
                    SetEntityAsMissionEntity(obj)
                    DeleteObject(obj)
                    objects_hlm[k]=nil
                else
                    peds_hlm[ped]=true
                end
            end
        end
        local handle,ped=FindFirstPed()
        local loop=(handle~=-1)
        local prop,model,bone
        while loop do
            if DecorExistOn(ped,"raider") then
                bone=0x60f2
                if peds_bp[ped]==nil then
                    prop=backpacks[math.random(1,#backpacks)]
                    model=prop[1]
                    if not HasModelLoaded(model) then
                        RequestModel(model)
                    else
                        local obj=CreateObject(model, 0, 0, -199.6, true, false, false)
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
                        local obj=CreateObject(model, 0, 0, -199.6, true, false, false)
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
RegisterCommand('kvp',function(source,args,raw)
    if args[1]==nil or args[1]=="help" or args[1]=="?" then
        print("/kvp del key")
        print("/kvp add type key data")
        print("/kvp list")
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
                    print(key.."=\""..GetResourceKvpString(key).."\"--(string)")
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
    else
        print("unknown command")
    end
end,false)

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


RegisterNetEvent("updatesignal")
AddEventHandler('updatesignal', function(id,x,y)
    local signal=signals[id]
    if signal==nil then signal={} signals[id]=signal end
    x,y=x+0.1-0.1,y+0.1-0.1
    if signal.blip==nil then
        signal.blip=AddBlipForCoord(x,y,0)
        SetBlipSprite(signal.blip,161)
        SetBlipColour(signal.blip,2)
        SetBlipScale(signal.blip,1.0)
        SetBlipAsShortRange(signal.blip,true)
    else
        SetBlipCoords(signal.blip,x,y,0)
    end
    if signal.object==nil then
        print("Created Object")
        if HasModelLoaded(prop_mb_crate_01a) then
            signal.object=CreateObject(prop_mb_crate_01a, x, y, -250.1, false, false, false)
            FreezeEntityPosition(signal.object,true)
        end
    else
        if signal.old_object==nil then
            if HasModelLoaded(prop_mb_crate_01a) then
                signal.old_object=signal.object
                signal.object=CreateObject(prop_mb_crate_01a, x, y, -250.1, false, false, false)
                FreezeEntityPosition(signal.object,true)
            end
        else
            signal.object,signal.old_object=signal.old_object,signal.object
            SetEntityCoords(signal.object, x, y, -250.1)
            FreezeEntityPosition(signal.object,true)
        end
    end
    signal.x=x
    signal.y=y
    signal.loot=nil
end)

RegisterNetEvent("updatelootcrate")
AddEventHandler('updatelootcrate', function(id,loot)
    local signal=signals[id]
    if signal~=nil then
        signal.loot=loot
    end
end)

RequestModel(prop_mb_crate_01a)
Citizen.CreateThread(function()
Wait(2000)
TriggerServerEvent("requestsignals")
end)

Citizen.CreateThread(function()
    local step=0.02
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        local y=0.32
        if inventory.highlight<=0 then
            WriteText(4,"~c~Press ~s~ENTER ~c~to open inventory",0.3,255,255,255,255,0.005,y) y=y+step
        else
            WriteText(4,"~c~Press ~s~BACKSPACE ~c~to close inventory",0.3,255,255,255,255,0.005,y) y=y+step
            WriteText(4,"~c~Press ~s~ENTER ~c~to use item",0.3,255,255,255,255,0.005,y) y=y+step
            WriteText(4,"~c~Press ~s~DELETE ~c~to drop item",0.3,255,255,255,255,0.005,y) y=y+step
        end
        if zone~=nil then
            if zone.craftpos~=nil and in_radius(mypos,zone.craftpos,1)
            or zone.clothespos~=nil and in_radius(mypos,zone.clothespos,1)
            or zone.tradepos~=nil and in_radius(mypos,zone.tradepos,1)
            or zone.changingroompos~=nil and in_radius(mypos,zone.changingroompos,1)
            or zone.garagepos~=nil and in_radius(mypos,zone.garagepos,1)
            or zone.vehpos~=nil and in_radius(mypos,zone.vehpos,1)
            then 
                WriteText(4,"~c~Press ~s~E ~c~to interact",0.3,255,255,255,255,0.005,y) y=y+step
            end
        end
    end
end)

local gasstations={
    {
        trader={x=162.09725952148,y=6636.5678710938,z=31.556589126587,blip=361},
        tank={x=172.08010864258,y=6622.7368164063,z=31.832139968872,blip=431},
    },
}


Citizen.CreateThread(function()
    local price=5
    local sellprice=10
    local blip
    for k,v in ipairs(gasstations) do
        blip=AddBlipForCoord(v.tank.x,v.tank.y,v.tank.z)
        SetBlipSprite(blip, v.tank.blip)
        SetBlipAsShortRange(blip,true)
        SetBlipColour(blip, 4)
        SetBlipName(blip, "Sell fuel tank")
        
        blip=AddBlipForCoord(v.trader.x,v.trader.y,v.trader.z)
        SetBlipSprite(blip, v.trader.blip)
        SetBlipAsShortRange(blip,true)
        SetBlipColour(blip, 4)
        SetBlipName(blip, "Gas station")
    end
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        for k,v in ipairs(gasstations) do
            if in_radius(mypos,v.trader,20) then
            
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
                        WriteText(4,{"Gas station has ~1~ gasoline",v.gasoline},0.65,255,255,255,255,0.4,0.65)
                    end
                    WriteText(4,{"You have ~1~ gasoline and ~1~ cash",youhaveamount_goods,youhaveamount_price},0.65,255,255,255,255,0.4,0.70)
                    
                    
                    if IsControlJustPressed(0,86) then
                        if youhaveamount_price>=price then
                            if give_item_to_inventory("gasoline",1) then
                                inventory[inv_index_price].amount=youhaveamount_price-price
                                TriggerServerEvent("buy_gasoline",k)
                                TriggerServerEvent("ask_for_gasoline_amount",k)
                            end
                        else
                            SimpleNotification("Not enough cash.")
                        end
                    end
                end
            elseif in_radius(mypos,v.tank,20) then
            
            end
        end
    end
end)

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
