local function WriteText(font,text,scale,r,g,b,a,posx,posy)
    SetTextOutline()
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(r,g,b,a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    EndTextCommandDisplayText(posx,posy)
end

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

--for i=0,400 do
    SetHudComponentPosition(6,0.0,-0.15) --vehname
    SetHudComponentPosition(7,0.0,-0.18) --areaname
    SetHudComponentPosition(8,0.0,-0.21) --vehclass
    SetHudComponentPosition(9,0.0,-0.24) --strname
--    local r,g,b,a=GetHudColour(i)
--   g=math.floor((r+g+g+b)/4)
--    SetHudColour(i,g,g,g,a)
--end
    
AddEventHandler("playerSpawned",function()
    local ped=PlayerPedId()
    SetPedRelationshipGroupHash(ped,GetHashKey("player"))
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
    SetEntityCoords(ped,GetResourceKvpFloat("x"),GetResourceKvpFloat("y"),GetResourceKvpFloat("z"))
    --GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), 12, false, true);
    GiveWeaponToPed(ped, GetHashKey("WEAPON_MACHETE"), 1000, false, true);
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
local total_item_types=0
for k,v in pairs(item_names) do
    total_item_types=total_item_types+1
    item_index_to_name[total_item_types]=k
    item_name_to_index[k]=total_item_types
end

local inventory={}
inventory.max=14
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
local deadbodiesrewards={
[-681004504]={GetHashKey("WEAPON_NIGHTSTICK"),1}, --security
[1581098148]={"pistolammo",15}, --cop male
[368603149]={"pistolammo",15}, --cop female
[-673538407]={GetHashKey("WEAPON_HAMMER"),1}, --construct
[-277793362]={GetHashKey("WEAPON_REVOLVER"),12}, --ranger m
[-1614285257]={GetHashKey("WEAPON_REVOLVER"),12}, --ranger f
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
[-509973344]={"medkit",1,"bandage",2},--wall medkit
[-742198632]={"water",5}, --water cooler
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
[759654580]={"cash",100}, -- cash register
[303280717]={"cash",200}, -- cash register
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

local function give_item_to_inventory(add_name,add_amount)
    local add_to_slot=nil
    for i=1,inventory.total do
        if inventory[i].item==add_name then
            add_to_slot=i
        end
    end
    if add_to_slot then
        inventory[add_to_slot].amount=inventory[add_to_slot].amount+add_amount
        SetResourceKvpInt("inventory_amount_"..add_to_slot,inventory[add_to_slot].amount)
    else
        if inventory.total<inventory.max then
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
    WriteNotification("You found ~g~"..add_amount.." "..item_names[add_name].."~s~.")
    inventory.highlight=500
    return true
end

Citizen.CreateThread(function()
    for i=1,15 do
        EnableDispatchService(i,false)
    end
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
                local engine=(math.floor(GetVehicleEngineHealth(veh)-no_engine_parts)>0)
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
                        vpos=GetWorldPositionOfEntityBone(veh,GetEntityBoneIndexByName(veh,'engine'))
                        if engine or loot then
                            vpos=GetOffsetFromEntityGivenWorldCoords(veh,vpos)
                            if vpos.y>0 then
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
            
            for k,v in pairs(pickups_objects) do
                obj=GetClosestObjectOfType(mypos.x,mypos.y,mypos.z, 1.3, k, false, false, false)
                if obj~=0 then
                    if not v.spoiled then
                        local not_on_screen,x,y=N_0xf9904d11f1acbec3(table.unpack(GetEntityCoords(obj)))
                        if not not_on_screen then
                            SetTextCentre(true)
                            WriteText(font,"~g~E ~s~to pick up ~g~"..v[1],size,255,255,255,alpha,x,y)
                        end
                        break
                    end
                end
            end
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
    local loop,handle,veh,rand,ped
    while true do
        handle,veh=FindFirstVehicle()
        loop=(handle~=-1)
        while loop do
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
                        SetVehicleDoorBroken(veh,i,false)
                    elseif (rand&(4096<<i2))~=0 then
                        SetVehicleDoorOpen(veh,i,true,true)
                    end
                end
                for i=0,5 do
                    if (rand&(1<<i))~=0 then
                        IsVehicleTyreBurst(veh, i, true)
                    end
                end
                if (rand&512)~=0 then
                    SetEntityRenderScorched(veh,true)
                    if GetVehicleEngineHealth(veh)>-3999.8 then
                        SetVehicleEngineHealth(veh,-3999.9)
                    end
                else
                    rand=1000-511+(rand&511)
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
        local highlight=inventory.highlight
        if highlight>255 then highlight=255 end
        if highlight<0 then highlight=0 end
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
        if not HasStreamedTextureDictLoaded("lsm") then
			RequestStreamedTextureDict("lsm", true)
		else
            local inv_big_x=0.072 local inv_big_y=0.1279999
            local inv_sml_x=0.0333333334 local inv_sml_y=0.0592592592
            local inv_hud={}
            local name
            
            
            -- DrawSprite("lsm", "pc_mouse_middle", 0.875,0.925,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
            -- DrawSprite("lsm", "inventory", 0.875,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
            
            DrawSprite("lsm", "heart", 0.9,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
            DrawSprite("lsm", "blood", 0.925,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
            DrawSprite("lsm", "hydration", 0.950,0.975,0.0166666667,0.025,0.0, 255, 255, 255, 255)
            DrawSprite("lsm", "saturation", 0.975,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
            --local x=0.90-i*0.05
            
            for i=1,inventory.total do
                if inventory.current~=i then
                    local x=(inventory.total+1-i-i)*.025+.5
                    DrawSprite("lsm", inventory[i].item, x,0.90+0.02,
                    inv_sml_x,
                    inv_sml_y,
                    0.0, 255, 255, 255, highlight)
                    
                    SetTextCentre(true)
                    WriteText(7,inventory[i].amount,0.5,160,160,160,highlight,x,0.93+0.02)
                    
                    name=item_names[inventory[i].item]
                    if name~=nil then
                        SetTextCentre(true)
                        WriteText(7,name,0.2,160,160,160,highlight,x,0.85+0.02)
                    end
                end
            end
            if inventory.total~=0 then
                local i=inventory.current
                    local x=(inventory.total+1-i-i)*.025+.5
                    DrawSprite("lsm", 
                    inventory[i].item, 
                    x,0.90,
                    inv_big_x,
                    inv_big_y,
                    0.0, 255, 255, 255, highlight)
                    
                    SetTextCentre(true)
                    WriteText(7,inventory[i].amount,0.75,255,255,255,highlight,x,0.945)
                    
                    name=item_names[inventory[i].item]
                    if name~=nil then
                        SetTextCentre(true)
                        WriteText(7,name,0.35,255,255,255,highlight,x,0.825)
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
        if player.health>0 then
            if GetEntityHealth(pped)<GetEntityMaxHealth(pped) then
                SetEntityHealth(pped,GetEntityHealth(pped)+1)
                player.health=player.health-1.0
                if player.health<0.0 then player.health=0.0 end
            end
        else
            SetEntityHealth(pped,GetEntityHealth(pped)-1)
        end
        if player.drunk>0 then
            player.drunk=player.drunk-0.01
            SetGameplayCamShakeAmplitude(player.drunk)
        end
    end
end)

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
end

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
    while true do Wait(0)
        local pped=PlayerPedId()
        collectgarbage("step")
        if inventory.highlight>0 then
            inventory.highlight=inventory.highlight-1
        end
        if inventory.total~=0 then
            if IsControlJustPressed(0,174) then --left
                if inventory.current<inventory.total then
                    inventory.current=inventory.current+1
                    inventory.highlight=500
                else
                    inventory.current=1
                    inventory.highlight=500
                end
            elseif IsControlJustPressed(0,175) then --right
                if inventory.current>1 then
                    inventory.current=inventory.current-1
                    inventory.highlight=500
                else
                    inventory.current=inventory.total
                    inventory.highlight=500
                end
            elseif IsControlJustPressed(0,177) then --backspace / rmb / esc
                inventory.highlight=0
            elseif IsControlJustPressed(0,37) then --select weapon 
                inventory.highlight=500
            elseif IsControlJustPressed(0,27) then --or IsControlJustPressed(0,201) then --up / frontend accept
                inventory.highlight=500
                if inventory[inventory.current].amount>0 then
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
                                SetVehicleEngineHealth(pveh,GetVehicleEngineHealth(pveh)+100.0)
                                inventory[inventory.current].amount=inventory[inventory.current].amount-100
                                check_inv_slot_for_zero_amount()
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
            elseif IsControlJustPressed(0,173) then --down key cellphone
                if not IsPedInAnyVehicle(pped) then
                    inventory.highlight=0
                    local amounttodrop=1
                    local inv_size_x=0.0576 local inv_size_y=0.1023999
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
            elseif IsControlJustPressed(0,86) and not IsPedInAnyVehicle(pped) then 
                local dict="anim@gangops@facility@servers@bodysearch@"
                local anim="player_search"
                local model=GetHashKey("prop_cs_heist_bag_02")
                local started=GetGameTimer()
                local ended=false
                local timestamp=started
                local timetopickup=5000
                local mypos=GetEntityCoords(pped)
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
        end
    end
end)

-- Citizen.CreateThread(function()
    -- local loop,handle,obj
-- end)


local safezones={
{x=444.47814941406,y=-984.21295166016,z=30.689596176147,r=50.0,
models={131961260,766375082,-12678997},
relationship=GetHashKey("MISSION2")},--LSPD
{x=975.88543701172,y=-119.29508972168,z=74.220664978027,r=50.0,
models={-44746786,1330042375,1032073858,850468060},
relationship=GetHashKey("MISSION2")},--Lost MC
}
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
    return nil
end

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
                zombie_type=math.abs(math.floor(zpos.x+zpos.y*5+zpos.z*7))%#randomclipsets+1
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
                DecorSetInt(ped,"zombie_type",zombie_type)
            else
                DecorSetInt(ped,"raider",true)
                --TaskGuardCurrentPosition(ped, 5.0, 5.0, true);
                -- if GetPedRelationshipGroupHash(ped)==GetHashKey("COP") then
                    -- --SetEntityHealth(ped,-1)
                    -- --ExplodePedHead(ped,GetHashKey("WEAPON_PISTOL"))
                    
                -- end
                SetPedRelationshipGroupHash(ped,GetHashKey("HATES_PLAYER"))
                --SetEntityCoords(ped,zone.x, zone.y, zone.z)
                TaskWanderInArea(ped, zone.x, zone.y, zone.z, 10.0, 3.0, 5.0);
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
                local weaponsarray={
                GetHashKey("WEAPON_DAGGER"),
                GetHashKey("WEAPON_KNIFE"),
                GetHashKey("WEAPON_MACHETE"),
                GetHashKey("WEAPON_HATCHET"),
                GetHashKey("WEAPON_CROWBAR"),
                GetHashKey("WEAPON_BAT"),
                GetHashKey("WEAPON_SNSPISTOL"),
                GetHashKey("WEAPON_VINTAGEPISTOL"),
                GetHashKey("WEAPON_PISTOL"),
                GetHashKey("WEAPON_COMBATPISTOL"),
                GetHashKey("WEAPON_DBSHOTGUN"),
                GetHashKey("WEAPON_PUMPSHOTGUN"),
                GetHashKey("WEAPON_MARKSMANRIFLE"),
                GetHashKey("WEAPON_SNIPERRIFLE"),
                }
                local randomweapon=math.random(1,#weaponsarray)
                GiveWeaponToPed(ped, weaponsarray[randomweapon], 5000, false, true)
            end
        end
    end
    local function get_player_peds()
        player_peds={}
        for i=0,31 do
            if NetworkIsPlayerActive(i) then
                pped=GetPlayerPed(i)
                player_peds[pped]=GetEntityCoords(pped)
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
                        elseif not DecorExistOn(ped,"raider") then
                           -- if DecorGetInt(ped,"zombie_type")~=4 then
                                zombie_init()
                           -- end
                        end
                    end
                else --light
                    if not IsPedAPlayer(ped) then
                        if not IsPedDeadOrDying(ped) then
                            if DecorExistOn(ped,"zombie_type") then
                                if IsPedUsingAnyScenario(ped) then
                                    ClearPedTasksImmediately(ped)
                                elseif IsPedFleeing(ped) or GetIsTaskActive(ped,83) or GetIsTaskActive(ped,86) then
                                    --if player_peds==nil then get_player_peds() end
                                    if survivors==nil then get_survivors() end
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
                            if player_peds==nil then get_player_peds() end
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
            get_player_peds()
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
                                    get_player_peds()
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
                            get_player_peds()
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
Citizen.CreateThread(function()
    while true do Wait(0)
        local pped=PlayerPedId() 
        if IsPedUsingActionMode(pped) then
            SetPedUsingActionMode(pped, false, false, "DEFAULT_ACTION");
        end
    end
end)
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


--- Bodies and trunk search owo uwu
Citizen.CreateThread(function()
    local function try_to_loot_engine(veh)
        local engine=GetVehicleEngineHealth(veh)
        local parts=math.floor(engine-no_engine_parts)
        if parts>0 then
            if give_item_to_inventory("engineparts",parts) then --"engine_parts"
                SetVehicleEngineHealth(veh,engine-parts)
            end
        end
    end
    local function try_to_loot_trunk(veh)
        if not DecorExistOn(veh,"zm_looted") then
            --GiveWeaponToPed(PlayerPedId(), 883325847, 21, false, true)
            local randomitem
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
                    if reward~=nil then
                        if IsPedDeadOrDying(ped,true) then
                                local zpos=GetEntityCoords(ped)
                                local distance=#(mypos-zpos)
                                if distance<1.5 and not DecorExistOn(ped,"zm_looted") then
                                    --::trytolootagain::
                                    if NetworkHasControlOfEntity(ped) then
                                        TaskPlayAnim(pped, dict, anim, 1.0, 1.0, -1, 0, .0, false, false, false)
                                        if type(reward[1])=='string' then 
                                            if give_item_to_inventory(reward[1],reward[2]) then DecorSetBool(ped,"zm_looted",true) end
                                        else
                                            GiveWeaponToPed(pped, reward[1], reward[2], false, true)
                                            DecorSetBool(ped,"zm_looted",true)
                                        end
                                    else
                                        NetworkRequestControlOfEntity(ped)
                                        --Wait(100)
                                        --goto trytolootagain
                                    end
                                end
                        else
                            if not HasPedGotWeapon(ped,reward[1],false) then
                                GiveWeaponToPed(ped, reward[1], reward[2], false, true);
                            end
                        end
                    end
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
                                        vpos=GetOffsetFromEntityGivenWorldCoords(veh,GetWorldPositionOfEntityBone(veh,GetEntityBoneIndexByName(veh,'engine')))
                                        --print("engine pos "..vpos.x.." "..vpos.y.." "..vpos.z)
                                        if vpos.y>0 then
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
            local spoiled=false
            local found=false
            for k,v in pairs(pickups_objects) do
                obj=GetClosestObjectOfType(pos.x,pos.y,pos.z, 1.3, k, false, false, false)
                if obj~=0 then
                    if not v.spoiled then
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
                        SetEntityAsMissionEntity(obj)
                        DeleteObject(obj)
                        found=true
                        break
                    else
                        spoiled=true
                    end
                end
            end
            if spoiled and not found then
                WriteNotification("This food is ~r~spoiled~s~.")
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
                    else
                        WriteText(7,"human",0.2,255,255,255,255,x,y)
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
[1581098148]=275618457,
[368603149]=275618457,

--animals
[-664053099]=-1404353274,--deer
[-541762431]=539004493,--rabbit
[-50684386]=1768677545,--cow

--brad cadaver 1915268960
--salton 539004493
--methhead 1768677545
--drowned 1943971979
}
for k,v in pairs(replace_models) do
    RequestModel(v)
end
AddEventHandler('populationPedCreating', function(x, y, z, model, setters)
    local newmodel=replace_models[model]
    if newmodel~=nil then
        if HasModelLoaded(newmodel) then
            setters.setModel(newmodel)
            setters.setPosition(x, y, z + 1.0)
        else
            CancelEvent()
        end
    end
end)

