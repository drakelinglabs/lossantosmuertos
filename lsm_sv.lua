local raid_content={
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
ball=5,
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
provisionkey=4,
barberkey=4,
tattookey=4,
gunstorekey=4,
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
sheriffkey=4,
policedocs=10,
painkillers=10,
smgammo=400,
mgammo=200,
launchergrenade=10,
armorplate=20,
}

local safezones={}

Citizen.CreateThread(function()
    local raids={
    {x=-140.69189453125,y=6385.9951171875,z=52.0,r=50.0,t=1},
    {x=-1192.4921875,y=457.84497070313,z=89.999290466309,r=50.0,t=1},
    {x=-1566.6458740234,y=-471.15328979492,z=40.5,r=50.0,t=1},
    
    {x=1906.786067962646,y=5002.458984375,z=31.234939575195,r=50.0,t=5},
    {x=1599.3823242188,y=3708.7058105469,z=37.19930267334,r=50.0,t=5},
    
    {x=-1800.0466308594,y=3111.767578125,z=43.999034881592,r=50.0,t=2},
    
    {x=0.786067962646,y=0.458984375,z=0.234939575195,r=750.0,t=72},
    }
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
{x=56.786067962646,y=6302.458984375,z=31.234939575195,r=150,health=200,t="raiders"}, --north paleto
{x=-554.94830322266,y=5324.9028320313,z=73.599601745605,r=150,health=200,t="raiders"}, --lumber
{x=-2188.0004882813,y=4251.279296875,z=48.940055847168,r=150,health=200,t="raiders"}, --lost highway
{x=-2789.5698242188,y=1414.8918457031,z=100.91932678223,r=150,health=200,t="raiders"}, --lone mansion
{x=-805.78601074219,y=177.47267150879,z=76.743286132813,r=150,health=200,t="raiders"}, --michael
{x=-1064.5677490234,y=-245.05058288574,z=44.021064758301,r=150,health=200,t="raiders"}, --LIFEIN
{x=-1156.7033691406,y=-1518.7808837891,z=10.632717132568,r=150,health=200,t="raiders"}, --hostel
{x=-1036.0079345703,y=-2774.0158691406,z=4.639799118042,r=150,health=200,t="raiders"}, --AIRPORT subway
--{x=-14.403273582458,y=-1430.6143798828,z=31.101537704468,r=150,health=200,t="raiders"}, --franklin
{x=110.2142868042,y=-750.44287109375,z=45.750293731689,r=150,health=200,t="raiders"}, --FIB
{x=-109.45634460449,y=-9.004246711731,z=70.519630432129,r=150,health=200,t="raiders"}, --JaNITOR
{x=-78.318687438965,y=361.18103027344,z=112.4418182373,r=150,health=200,t="raiders"}, --ELITE
{x=-465.20986938477,y=-882.05413818359,z=38.683715820313,r=150,health=200,t="raiders"}, --construction
{x=175.63375854492,y=1228.6217041016,z=231.32667541504,r=150,health=200,t="raiders"}, --small open scene
{x=-234.09332275391,y=-2006.7995605469,z=24.685373306274,r=150,health=200,t="raiders"}, --arena fame
{x=870.16912841797,y=-2309.2395019531,z=30.570411682129,r=150,health=200,t="raiders"}, --promzone small int
{x=712.86987304688,y=-963.63873291016,z=30.39533996582,r=150,health=200,t="raiders"}, --lester warh
{x=-1910.8470458984,y=2084.9750976563,z=140.38409423828,r=150,health=200,t="raiders"}, --виноград
{x=-56.35758972168,y=1905.7098388672,z=195.38105773926,r=150,health=200,t="raiders"}, --farm
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
        signal.abandoned=nil
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
        signal.abandoned=nil
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
            if v.b==nil or v.b~=310 then
                if v.abandoned==nil then
                    active=active+1
                    v.abandoned=0
                elseif v.abandoned<25 then
                    active=active+1
                    v.abandoned=v.abandoned+1
                else
                    signals[k]=nil
                    TriggerClientEvent("updatesignal",-1,k)
                end
            else
                if v.abandoned==nil then
                    v.abandoned=0
                elseif v.abandoned<20 then
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
    create_loot_crate(x,y,z,loot,20,310,GetHashKey("prop_big_bag_01"),20,"raiders")
end)


RegisterServerEvent("zoneraided")
AddEventHandler("zoneraided",function(x,y,z,name,trades,relationship)
    if safezones[name]==nil or safezones[name].raided==nil then
        local loot={}
        for k,v in pairs(trades) do
            if v[1]~=nil and v[2]~=nil and v[3]~=nil and v[4]~=nil then
                if loot[v[1]]==nil then
                    loot[v[1]]=v[2]*10
                else
                    loot[v[1]]=loot[v[1]]+v[2]*10
                end
                if loot[v[3]]==nil then
                    loot[v[3]]=v[4]*7
                else
                    loot[v[3]]=loot[v[3]]+v[4]*7
                end
            end
        end
        if safezones[name]==nil then
            safezones[name]={}
        end
        safezones[name].raided=GetGameTimer()
        TriggerClientEvent("zonestatus",-1,name,true)
        create_loot_crate(x,y,z,loot,200,nil,nil,300,"raiders")
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