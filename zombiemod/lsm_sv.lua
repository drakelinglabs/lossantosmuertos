local players_inventory={}
local players_pos={}

local raid_content={
cash=1000,
scrapplastic=150,
scrapmetal=120,
rags=50,
cigarettes=50,
alcohol=50,
chemicals=50,
bandage=50,
engineparts=20,
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
pipebomb=1,
flaregun=1,
ball=1,
flaregunammo=50,
food=20,
canfood=20,
soda=20,
juice=20,
mre=20,
gasoline=30,
pistolammo=200,
shotgunammo=100,
ammo=200,
heavyrifleammo=200,
weed=25,
gasmask=15,
water=20,
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
-- provisionkey=4,
-- barberkey=4,
-- tattookey=4,
-- gunstorekey=4,
medkit=5,
assaultshotgun=1,
bullpupshotgun=1,
heavyshotgun=1,
pumpshotgun=1,
pumpshotgun_mk2=1,
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
bodyarmor=4,
brasscatcher=2,
gunpowder=40,
radio=10,
aircraftfuel=30,
--sheriffkey=4,
policedocs=10,
painkillers=10,
smgammo=400,
mgammo=200,
launchergrenade=10,
armorplate=20,
grip=5,
flashlight_small=5,
flashlight_large=5,
suppressor_1=2,
suppressor_2=2,
suppressor_3=2,
suppressor_4=2,
suppressor_5=2,
scope_1=4,
scope_2=4,
scope_3=4,
scope_advanced=2,
scope_compactholo=4,
muzzlebrake_1=4,
heavybarrel=4,
scope_nightvision=1,
scope_thermal=1,
}

local safezones={}

local raids={
-- {x=1697.1645507813,y=2611.8725585938,z=45.56494140625,r=125.0,t=1},
-- {x=1697.1645507813,y=2611.8725585938,z=45.56494140625,r=125.0,t=1},
-- {x=1697.1645507813,y=2611.8725585938,z=45.56494140625,r=125.0,t=1},
-- {x=-1094.7305908203,y=4916.3178710938,z=215.40106201172,r=125.0,t=5},
-- {x=449.26019287109,y=-985.76031494141,z=30.689590454102,r=125.0,t=5},
-- {x=449.26019287109,y=-985.76031494141,z=30.689590454102,r=125.0,t=5},
-- {x=-2051.8083496094,y=3237.236328125,z=31.501235961914,r=125.0,t=2},
-- {x=568.62316894531,y=-3124.1098632813,z=18.768627166748,r=125.0,t=4},
{x=0.786067962646,y=0.458984375,z=0.234939575195,r=750.0,t=72},
}

Citizen.CreateThread(function()
    for k,v in pairs(raids) do
        --local v={}
        local traveldistance=.3
        --v.x=math.random(-3000,3000)
        --v.y=math.random(-3000,10000)
        --v.r=250.0
        v.rotation_x=math.cos(.01)
        v.rotation_y=math.sin(.01)
        local angle=math.random(0,31416)*.0002
        v.speed_x=math.cos(angle)*traveldistance
        v.speed_y=math.sin(angle)*traveldistance
        --raids[k]=v
    end
    local function rotate2d(x,y,c,s)
        return x*c+y*s,y*c-x*s
    end
    local limits={
    xmin=-2000,
    xmax=3000,
    ymin=-2000,
    ymax=7000,
    }
    while true do
        for k,v in pairs(raids) do
            v.x=v.x+v.speed_x
            v.y=v.y+v.speed_y
            local direction=math.random(1,5)
            if durection==1 then
                v.speed_x,v.speed_y=rotate2d(v.speed_x,v.speed_y,v.rotation_x,v.rotation_y)
            elseif direction==2 then
                v.rotation_y=-v.rotation_y
            end
            --r=math.random(100.0,500.0)+0.00001
            if v.x<limits.xmin then
                v.x=limits.xmin
                if v.speed_x<0 then
                    v.speed_x=-v.speed_x
                end
            elseif v.x>limits.xmax then
                v.x=limits.xmax
                if v.speed_x>0 then
                    v.speed_x=-v.speed_x
                end
            end
            if v.y<limits.ymin then
                v.y=limits.ymin
                if v.speed_y<0 then
                    v.speed_y=-v.speed_y
                end
            elseif v.y>limits.ymax then
                v.y=limits.ymax
                if v.speed_y>0 then
                    v.speed_y=-v.speed_y
                end
            end
            TriggerClientEvent("raid",-1,k,v.x,v.y,v.r,v.t)
            Wait(50)
        end
    end
end)

local heists={
{x=-2051.8083496094,y=3237.236328125,z=31.501235961914,r=150,health=30,t="raiders"}, --military bunker base
{x=445.91668701172,y=5572.1088867188,z=781.18475341797,r=150,health=30,t="raiders"}, --mountain top
{x=3536.2355957031,y=3665.2844238281,z=28.121892929077,r=150,health=30,t="raiders"}, --research labs
{x=2746.4077148438,y=1487.2686767578,z=30.791791915894,r=150,health=30,t="raiders"}, --power plant
--{x=2790.9555664063,y=-707.29125976563,z=4.7133226394653,r=150,health=30,t="raiders"}, --beach
{x=1238.3894042969,y=-2951.0502929688,z=9.3192529678345,r=150,health=30,t="raiders"}, --container ship
{x=568.62316894531,y=-3124.1098632813,z=18.768627166748,r=150,health=30,t="raiders"}, --mercenary warehouse
{x=236.56707763672,y=-3262.6123046875,z=40.538223266602,r=150,health=30,t="raiders"}, --container building
{x=-936.50152587891,y=-2931.2546386719,z=13.945076942444,r=150,health=30,t="raiders"}, --airport
{x=2.5822401046753,y=524.87506103516,z=170.61721801758,r=150,health=30,t="raiders"}, --fancy house
{x=1661.3355712891,y=1.8060301542282,z=166.11805725098,r=150,health=30,t="raiders"}, --the dam
{x=1451.8610839844,y=1135.7989501953,z=114.33403778076,r=150,health=30,t="raiders"}, --horse place
{x=758.7587890625,y=1274.16015625,z=360.29653930664,r=150,health=30,t="raiders"}, --radio station
{x=-2953.1159667969,y=55.811592102051,z=11.608504295349,r=150,health=30,t="raiders"}, --business area
{x=-555.87243652344,y=5321.4926757813,z=73.599678039551,r=150,health=30,t="raiders"}, --grain refinery
{x=-106.81156158447,y=6201.3974609375,z=31.025737762451,r=150,health=30,t="raiders"}, --chicken processing plant
{x=1541.8145751953,y=6335.2880859375,z=24.075588226318,r=150,health=30,t="raiders"}, --northern vagrant warehouse
{x=2812.8129882813,y=5972.2504882813,z=350.70419311523,r=150,health=30,t="raiders"}, --mountain top radio station
{x=2435.546875,y=4967.5439453125,z=42.34757232666,r=150,health=30,t="raiders"}, --heroin house
{x=2940.3942871094,y=4623.1337890625,z=48.720832824707,r=150,health=30,t="raiders"}, --shitty train station
{x=1716.3363037109,y=3322.0368652344,z=41.22350692749,r=150,health=30,t="raiders"}, --airport hanger
{x=137.80360412598,y=-565.8564453125,z=22.023969650269,r=150,health=30,t="raiders"}, --abandoned under construction underground subway terminal
{x=-507.38482666016,y=-672.91925048828,z=11.808968544006,r=150,health=30,t="raiders"}, --subway terminal
}

local signals={}
--local maxsignals=5
-- for i=1,5 do
    -- signals[i]={x=math.random(-3000,3000),y=math.random(-3000,10000),infinite=true}
-- end

--RegisterServerEvent("updatesignal")
--RegisterServerEvent("deactivatesignal")
RegisterServerEvent("signalfound")
AddEventHandler("signalfound",function(id)
    local signal=signals[id]
    if signal~=nil then
        if signal.abandoned~=nil then signal.abandoned=0 end
        if signal.health then
            signal.health=signal.health-1
            if signal.health<0 then signal.health=nil end
            TriggerClientEvent("lootcratehealth",source,id,signal.health)
        else
            if signal.loot==nil then
                signal.loot={mre=2,water=2,canfood=2,medkit=1}
            end
            TriggerClientEvent("updatelootcrate",source,id,signal.loot)
        end
    end
end)
RegisterServerEvent("loot")
AddEventHandler("loot",function(id,thing)
    local signal=signals[id]
    if signal~=nil then
        --if signal.abandoned~=nil then 
            signal.abandoned=0 
        --end
        local loot=signal.loot
        if loot~=nil and thing~=nil and loot[thing]~=nil then
            TriggerClientEvent("loot_crate_give",source,thing,loot[thing])
            loot[thing]=nil
            local count=0
            for k,v in pairs(loot) do
                count=count+1
            end
            if count==0 then
                if signal.infinite then
                    signal.x=math.random(-3000,3000)
                    signal.y=math.random(-3000,10000)
                    signal.loot=nil
                    TriggerClientEvent("updatesignal",-1,id,signal.x,signal.y,signal.z,signal.b,signal.m,signal.r,signal.t)
                else
                    signals[id]=nil
                    TriggerClientEvent("updatesignal",-1,id)
                end
            else
                TriggerClientEvent("updatelootcrate",-1,id,loot)
            end
        else
            TriggerClientEvent("loot_crate_fail",source,id,loot)
        end
    else
        TriggerClientEvent("loot_crate_fail",source,id)
    end
end)

RegisterServerEvent("request_data")
AddEventHandler("request_data",function()
    local _s=source
    for name,v in pairs(safezones) do
        if v.raided then
            TriggerClientEvent("zonestatus",_s,name,true)
            Wait(100)
        end
    end
    for id,signal in pairs(signals) do
        TriggerClientEvent("updatesignal",_s,id,signal.x,signal.y,signal.z,signal.b,signal.m,signal.r,signal.t)
        Wait(100)
    end
end)

local function create_loot_crate(x,y,z,loot,health,b,m,r,t)
    local id=1+#signals
    signals[id]={x=x,y=y,z=z,loot=loot,health=health,b=b,m=m,r=r,t=t}
    TriggerClientEvent("updatesignal",-1,id,x,y,z,b,m,r,t)
    return id
end

Citizen.CreateThread(function()
    local used_heists={}
    while true do Wait(60000)
        local active=0
        for k,v in pairs(signals) do
            if v.b==nil or (v.b~=310 and v.b~=408) then
                if v.abandoned==nil then
                    active=active+1
                    -- v.abandoned=0
                elseif v.abandoned<15 then
                    active=active+1
                    v.abandoned=v.abandoned+1
                else
                    signals[k]=nil
                    TriggerClientEvent("updatesignal",-1,k)
                end
            else
                if v.abandoned==nil then
                    v.abandoned=0
                elseif v.abandoned<15 then
                    v.abandoned=v.abandoned+1
                else
                    signals[k]=nil
                    TriggerClientEvent("updatesignal",-1,k)
                end
            end
        end
        if active<3 then
            active=0
            if 0==#heists then
                heists,used_heists=used_heists,heists
            end
            local heistid=math.random(1,#heists)
            local rand=heists[heistid]
            local loot={}
            for k,v in pairs(raid_content) do
                if math.random(1,18)==1 then
                    active=active+1
                    if v>1 then
                        loot[k]=math.random(math.floor(v/2),v)
                    else
                        loot[k]=1
                    end
                end
            end
            if active>1 then
                --create_loot_crate(rand.x,rand.y,rand.z,loot,20,rand.b,rand.m,rand.r,rand.t)
                create_loot_crate(rand.x,rand.y,rand.z,loot,rand.health,rand.b,rand.m,rand.r,rand.t)
                table.insert(used_heists,rand)
                table.remove(heists,heistid)
            end
        end
    end
    --create_loot_crate(56.786067962646,6302.458984375,31.234939575195,{pistolammo=300,ammo=200,medkit=5,bandage=15,water=20,food=30,canfood=25},300,478,GetHashKey("prop_mb_crate_01a"),300,"raiders")
end)


local gasstations={
    {
        trader={x=162.09725952148,y=6636.5678710938,z=31.556589126587,blip=361},
        tank={x=172.08010864258,y=6622.7368164063,z=31.832139968872,blip=431},
        gasoline=math.random(1,10),
    },
    {
        trader={x=646.29534912109,y=267.25625610352,z=103.26166534424,blip=361},
        tank={x=635.08709716797,y=255.35494995117,z=103.12169647217,blip=431},
        gasoline=math.random(1,10),
    },
    {
        trader={x=1200.6888427734,y=2655.7438964844,z=37.851871490479,blip=361}, --NEAR SANDY
        tank={x=1192.6104736328,y=2662.490234375,z=37.822631835938,blip=431},
        gasoline=math.random(1,10),
    },
}

RegisterServerEvent("buy_gasoline")
AddEventHandler("buy_gasoline",function(id)
    gasstations[id].gasoline=gasstations[id].gasoline-1
    TriggerClientEvent("gasstation_update",-1,id,gasstations[id].gasoline)
end)
RegisterServerEvent("request_gasstation")
AddEventHandler("request_gasstation",function(id)
    TriggerClientEvent("gasstation_update",source,id,gasstations[id].gasoline)
end)
RegisterServerEvent("refill_gasstation")
AddEventHandler("refill_gasstation",function(id,amount)
    gasstations[id].gasoline=gasstations[id].gasoline+amount
    TriggerClientEvent("gasstation_update",-1,id,gasstations[id].gasoline)
end)

RegisterServerEvent("imdead")
AddEventHandler("imdead",function(x,y,z,loot)
    create_loot_crate(x,y,z,loot,20,310,GetHashKey("prop_big_bag_01"),0,"raiders")
    players_inventory[source]=nil
end)


RegisterServerEvent("zoneraided")
AddEventHandler("zoneraided",function(x,y,z,name,trades,relationship)
    if safezones[name]==nil or safezones[name].raided==nil then
        local loot={}
        for k,v in pairs(trades) do
            if v[1]~=nil and v[2]~=nil and v[3]~=nil and v[4]~=nil then
                if loot[v[1]]==nil then
                    loot[v[1]]=v[2]
                else
                    loot[v[1]]=loot[v[1]]+v[2]
                end
                if loot[v[3]]==nil then
                    loot[v[3]]=v[4]
                else
                    loot[v[3]]=loot[v[3]]+v[4]
                end
            end
        end
        if safezones[name]==nil then
            safezones[name]={}
        end
        safezones[name].raided=GetGameTimer()
        TriggerClientEvent("zonestatus",-1,name,true)
        create_loot_crate(x,y,z,loot,40,nil,nil,150,"raiders")
    end
end)

Citizen.CreateThread(function()
    local timedifference=1800000 --30 min
    while true do Wait(1000)
        local curtime=GetGameTimer()
        for k,v in pairs(safezones) do
            if v.raided then
                if curtime-v.raided>timedifference then
                    TriggerClientEvent("zonestatus",-1,k,nil)
                    safezones[k]=nil
                end
            end
        end
    end
end)


RegisterServerEvent("raid_killed")
AddEventHandler("raid_killed",function(k,x,y,z)
    local raid=raids[k]
    if raid then
        raid.x,raid.y,raid.z=x,y,z
    end
end)

RegisterServerEvent("updateplayerloot")
AddEventHandler("updateplayerloot",function(loot)
    if loot==nil then loot={} end
    players_inventory[source]=loot
end)
RegisterServerEvent("updateplayeritem")
AddEventHandler("updateplayeritem",function(item,amount)
    if item then
        if players_inventory[source]==nil then
            if amount~=nil then
                players_inventory[source]={[item]=amount}
            end
        else
            players_inventory[source][item]=amount
        end
    end
end)
RegisterServerEvent("updateplayerpos")
AddEventHandler("updateplayerpos",function(x,y,z)
    local p=players_pos[source]
    if p==nil then
        players_pos[source]={x=x,y=y,z=z}
    else
        p.x,p.y,p.z=x,y,z
    end
end)
AddEventHandler('playerDropped', function()
    local p=players_pos[source]
    local loot=players_inventory[source]
    if p~=nil and loot~=nil then
        for k,v in pairs(loot) do
            create_loot_crate(p.x,p.y,p.z,loot,20,310,GetHashKey("prop_big_bag_01"),0,"raiders")
            print("player "..source.." dropped from server and dropped items")
            break
        end
    end
    players_pos[source]=nil
    players_inventory[source]=nil
end)


RegisterServerEvent("itemdrop")
AddEventHandler("itemdrop",function(x,y,z,item,amount)
    local loot={}
    loot[item]=amount
    create_loot_crate(x,y,z,loot,5,408,GetHashKey("prop_big_bag_01"),0,"weapon")
end)
    
-- RegisterServerEvent("place")
-- AddEventHandler("place",function(model,x,y,z,yaw)

-- end)

-- RegisterServerEvent("destroy")
-- AddEventHandler("destroy",function(index)
    -- TriggerClientEvent("destroy",-1,index)
-- end)

-- RegisterServerEvent("heist")
-- AddEventHandler("heist",function(index)
    -- for i=1,maxheists do
        -- heist=heists[i]
        -- heist.x=math.random(-1000,3000)
        -- heist.y=math.random(-1000,1000)
        
    -- end
    -- TriggerClientEvent("heist",-1,index)
-- end)