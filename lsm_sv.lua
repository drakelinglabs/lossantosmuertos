
Citizen.CreateThread(function()
    local heists={}
    local maxheists=1
    local heists={}
    for k=1,maxheists do
        local v={}
        local traveldistance=.2
        v.x=math.random(-3000,3000)
        v.y=math.random(-3000,10000)
        v.r=250.0
        v.rotation_x=math.cos(.01)
        v.rotation_y=math.sin(.01)
        local angle=math.random(0,31416)*.0002
        v.speed_x=math.cos(angle)*traveldistance
        v.speed_y=math.sin(angle)*traveldistance
        heists[k]=v
    end
    local function rotate2d(x,y,c,s)
        return x*c+y*s,y*c-x*s
    end
    local limits={
    xmin=-2000,
    xmax=3000,
    ymin=-2000,
    ymax=6000,
    }
    while true do
        for k,v in pairs(heists) do
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
            TriggerClientEvent("heist",-1,k,v.x,v.y,v.r)
            Wait(10)
        end
    end
end)

local signals={}
--local maxsignals=5
for i=1,5 do
    signals[i]={x=math.random(-3000,3000),y=math.random(-3000,10000)}
end

--RegisterServerEvent("updatesignal")
--RegisterServerEvent("deactivatesignal")
RegisterServerEvent("signalfound")
AddEventHandler("signalfound",function(id)
    local signal=signals[id]
    if signal~=nil then
        if signal.loot==nil then
            signal.loot={mre=10,water=10,canfood=5,medkit=2}
        end
        TriggerClientEvent("updatelootcrate",source,id,signal.loot)
    end
end)
RegisterServerEvent("loot")
AddEventHandler("loot",function(id,thing)
    local signal=signals[id]
    if signal~=nil then
        if signal.loot~=nil and thing~=nil and signal.loot[thing]~=nil then
            signal.loot[thing]=nil
            local count=0
            for k,v in pairs(signal.loot) do
                count=count+1
            end
            if count==0 then
                signal.x=math.random(-3000,3000)
                signal.y=math.random(-3000,10000)
                signal.loot=nil
                TriggerClientEvent("updatesignal",-1,id,signal.x,signal.y)
            else
                TriggerClientEvent("updatelootcrate",-1,id,signal.loot)
            end
        end
    end
end)

RegisterServerEvent("requestsignals")
AddEventHandler("requestsignals",function()
    local _s=source
    for id,signal in pairs(signals) do
        TriggerClientEvent("updatesignal",_s,id,signal.x,signal.y)
        Wait(100)
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