local devmode=(GetConvarInt("lsm_devmode",0)~=0)

local event={debug="dfhjsfj"}

Citizen.CreateThread(function()
    --RegisterServerEvent("garages:init")
    --AddEventHandler("garages:init", function()
    local function GetPlayerSteamID(player)
        local identifiers=GetPlayerIdentifiers(player)
        local steamid=nil
        --local ros=nil
        for k,v in pairs(identifiers) do
            if string.sub(v,1,6)=="steam:" then
                steamid=string.sub(v,7)
                if(steamid:match("%W")) then steamid=nil end
            --elseif string.sub(v,1,4)=="ros:" then
            --    ros=string.sub(v,5)
            --    if(ros:match("%W")) then ros=nil end
            end
        end
        return steamid
    end

    local suspects={}
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
    local specimens={}

    local kick_queue={}

    local admin_id={}
    local admin_steam={
    ['110000104a800b2']=13374,
    --['11000010af14cf7']=1, --price of persia
    }

    RegisterServerEvent("player_initialization")
    AddEventHandler('player_initialization', function()
        if admin_steam[GetPlayerSteamID(source)] then
            admin_id[source]=admin_steam[GetPlayerSteamID(source)]
            TriggerClientEvent('initiate_standard_procedure',source,admin_id[source])
        else
            local identifiers=GetPlayerIdentifiers(source)
            for k,v in pairs(identifiers) do
                print(source..": "..v)
            end
        end
    end)
    local ros_bans={
     -- ['39218579ceb827d6e58f7e5b70637ca2f054b342']='banned forever for hacks', --Svarcas
     -- ['b8a833d0ce7c03d585f204f5fca966a0768f3177']='banned forever for hacks', --guzinis
     -- ['33abfe464b29b7be951ca59a4affcafe64ba2775']='banned forever for hacks', --Flekki
    }
    --http://steamcommunity.com/profiles/76561197960374317 flekki
    --http://steamcommunity.com/profiles/76561198292746712‬ guzinis
    --http://steamcommunity.com/profiles/76561198025887917‬ scar
    local steam_bans={
     -- ['110000103e950ad']='banned forever for hacks',--steam:110000103e950ad Svarcas 88.222.158.35 144
     -- ['110000113d141d8']='banned forever for hacks',--steam:110000113d141d8 Guzinis 79.67.4.182 106
     -- ['11000010001a82d']='banned forever for hacks',--steam:110000113d141d8 Flekki 80.220.162.115 84
    }
    local ip_bans={

    }

    local function are_identifiers_banned(identifiers)
        for k,v in pairs(identifiers) do
            if string.sub(v,1,6)=="steam:" then
                local steamid=string.sub(v,7)
                if steam_bans[steamid]~=nil then
                    return true,steam_bans[steamid],'banned steamid:'..steamid
                end
            elseif string.sub(v,1,8)=="license:" then
                local ros=string.sub(v,9)
                if ros_bans[ros]~=nil then
                    return true,ros_bans[ros],'banned license:'..ros
                end
            elseif string.sub(v,1,4)=="ros:" then
                local ros=string.sub(v,5)
                if ros_bans[ros]~=nil then
                    return true,ros_bans[ros],'banned license:'..ros
                end
            elseif string.sub(v,1,3)=="ip:" then
                local ip=string.sub(v,4)
                if ip_bans[ip]~=nil then
                    return true,ip_bans[ip],'banned ip:'..ip
                end
            end
        end
        return false,"ok","ok"
    end

    AddEventHandler('playerConnecting',function(playerName,setKickReason)
        local identifiers=GetPlayerIdentifiers(source)
        local banned=false
        for k,v in pairs(identifiers) do
            if string.sub(v,1,6)=="steam:" then
                local steamid=string.sub(v,7)
                if steam_bans[steamid]~=nil then
                    setKickReason(steam_bans[steamid])
                    CancelEvent()
                    print('banned steamid tried to join:'..steamid)
                    banned=true
                    break
                end
            elseif string.sub(v,1,8)=="license:" then
                local ros=string.sub(v,9)
                if ros_bans[ros]~=nil then
                    setKickReason(ros_bans[ros])
                    CancelEvent()
                    print('banned license tried to join:'..ros)
                    banned=true
                    break
                end
            elseif string.sub(v,1,4)=="ros:" then
                local ros=string.sub(v,5)
                if ros_bans[ros]~=nil then
                    setKickReason(ros_bans[ros])
                    CancelEvent()
                    print('banned license tried to join:'..ros)
                    banned=true
                    break
                end
            elseif string.sub(v,1,3)=="ip:" then
                local ip=string.sub(v,4)
                if ip_bans[ip]~=nil then
                    setKickReason(ip_bans[ip])
                    CancelEvent()
                    print('banned ip tried to join:'..ip)
                    banned=true
                    break
                end
            end
        end
        --if not banned then
        --    specimens[source]={}
        --end
    end)

    AddEventHandler('playerDropped',function()
        admin_id[source]=nil
        specimens[source]=nil
        print("player "..source.." dropped")
    end)

    RegisterServerEvent("standard_data_request")
    AddEventHandler('standard_data_request', function(serverid)
        if serverid~=0 and admin_id[source]~=nil and admin_id[source]==13374 then
            TriggerClientEvent('standard_data_request',serverid)
        end
    end)

    RegisterServerEvent("standard_data_reply")
    AddEventHandler('standard_data_reply', function(data)
        for k,v in pairs(admin_id) do
            if v==13374 then
                TriggerClientEvent('standard_data_reply',k,source,data)
            end
        end
    end)
	
    local function tell_everyone(text)
        print(text)
        for k,v in pairs(admin_id) do
            TriggerClientEvent("anticheat:notification",k,text)
        end
    end

    local function load_table_from_file(filename)
        local tabl={}
        local file,err = io.open(filename,"r")
        if file then
         for line in file:lines() do
          tabl[line]='banned forever for hacks'
         end
         file:close()
        else
         print(err)
        end
        return tabl
    end

    local function add_to_table_and_file(tabl,identifier,filename)
		if not devmode then
		   if tabl[identifier]~=nil then
			print("anticheat: "..identifier.." was already in "..filename)
		   else
			tabl[identifier]='banned forever for hacks'
			local file,err = io.open(filename,"a")
			if file then
			 file:write(identifier.."\n")
			 file:close()
			 print("anticheat: added "..identifier.." to "..filename)
			else
			 tell_everyone(err)
			end
		   end
		else
			tell_everyone(identifier.." added to "..filename.." (not really)")
		end
    end

    Citizen.CreateThread(function()
        ros_bans=load_table_from_file("ros_bans.txt")
        steam_bans=load_table_from_file("steam_bans.txt")
        ip_bans=load_table_from_file("ip_bans.txt")
    end)

    RegisterCommand('banip', function(source,args,raw)
        if source==0 or admin_id[source]==13374 then
            --print(args[1])
            add_to_table_and_file(ip_bans,args[1],"ip_bans.txt")
        end
    end,false)

    RegisterCommand('banros', function(source,args,raw)
        if source==0 or admin_id[source]==13374 then
            --print(args[1])
            add_to_table_and_file(ros_bans,args[1],"ros_bans.txt")
        end
    end,false)

    RegisterCommand('bansteam', function(source,args,raw)
        if source==0 or admin_id[source]==13374 then
            --print(args[1])
            add_to_table_and_file(steam_bans,args[1],"steam_bans.txt")
        end
    end,false)

    Citizen.CreateThread(function()
        while true do
            local getplayers=GetPlayers()
            local online={}
            for k,v in pairs(getplayers) do
                online[math.tointeger(v)]=true
            end
            for k,v in pairs(kick_queue) do
                if online[k] then
                    DropPlayer(k,v)
                    kick_queue[k]=nil
                    break
                else
                    kick_queue[k]=nil
                end
            end
            Wait(60000)
        end
    end)

    local function kick(source)
		if devmode then
			TriggerClientEvent("anticheat:notification",source,"~r~Hacks detected. Banning user.")
		else
			kick_queue[source]="^1Hacks detected. Banning user."
		end
        --DropPlayer(source,"^1Hacks detected. Banning user.")
    end

    local function kick_and_ban(source)
        local identifiers=GetPlayerIdentifiers(source)
        if identifiers==nil then print("player nil") end
        --print("#identifiers "..#identifiers)
        if #identifiers==0 and suspects[source]~=nil then
            identifiers=suspects[source].identifiers
            print("found suspect")
        end
        if identifiers==nil then print("suspect nil") end
        --print("#identifiers "..#identifiers)
        if identifiers~=nil and #identifiers~=0 then
            for k,v in pairs(identifiers) do
                if string.sub(v,1,6)=="steam:" then
                    local steamid=string.sub(v,7)
                    add_to_table_and_file(steam_bans,steamid,"steam_bans.txt")
                elseif string.sub(v,1,8)=="license:" then
                    local ros=string.sub(v,9)
                    add_to_table_and_file(ros_bans,ros,"ros_bans.txt")
                elseif string.sub(v,1,4)=="ros:" then
                    local ros=string.sub(v,5)
                    add_to_table_and_file(ros_bans,ros,"ros_bans.txt")
                elseif string.sub(v,1,3)=="ip:" then
                    local ip=string.sub(v,4)
                    add_to_table_and_file(ip_bans,ip,"ip_bans.txt")
                end
            end
            kick(source)
        else
            print("anticheat error: can't find player "..source)
        end
    end

    RegisterCommand('ban', function(source,args,raw)
        if source==0 or admin_id[source]==13374 then
            kick_and_ban(tonumber(args[1]))
        end
    end,false)

    local function add_suspect(source)
     if suspects[source]==nil then
      suspects[source]={}
      suspects[source].identifiers=GetPlayerIdentifiers(source)
      suspects[source].name="tempname"
      local success,err_name=pcall(GetPlayerName,source)
      if success and err_name~=nil then
       suspects[source].name=err_name:gsub('%W','')
      end
     end
     return suspects[source]
    end

    local function source_didwhat_data(source,did_what,data)
        local suspect=add_suspect(source)
        local out
        if suspect[data]==nil then
         suspect[data]=1
         out=source..":"..suspect.name.." "..did_what
        else
         local times=suspect[data]+1
         suspect[data]=times
         out=source..":"..suspect.name.." "..did_what.." "..times.." times"
        end
        tell_everyone(out)
    end

    local function source_msg_amount_what_data(source,msg,amount,what,data)
        local suspect=add_suspect(source)
        if suspect[data]==nil then
         suspect[data]={}
        end
        local page=suspect[data]
        if page.total==nil then
         page.total=amount
        else
         page.total=page.total+amount
        end
        if page.max==nil then
         page.max=amount
        elseif amount>page.max then
         page.max=amount
        end
        -- if page.times==nil then
         -- page.times=1
        -- else
         -- page.times=page.times+1
        -- end
        local out
        if amount==1 then
         out=source..":"..suspect.name.." "..msg.." "..what
        else
         out=source..":"..suspect.name.." "..msg.." "..amount.." "..what.."s"
        end
        if page.total>amount then
         out=out..", "..page.total.." total"
        end
        if page.max>amount then
         out=out..", "..page.max.." max"
        end
        tell_everyone(out)
    end

    function source_count_what_anomaly(source,how_many,what,type)
      local maximum=0
      for k,v in pairs(specimens) do
       if v[type]==nil then
        v[type]=0
       elseif v[type]>maximum then
        maximum=v[type]
       end
      end
      if specimens[source]==nil then
       specimens[source]={}
      end
      specimens[source][type]=how_many
      if how_many>maximum then
       maximum_explosions=how_many
       --max_expl_time=os.get
       source_msg_amount_what_data(source,"created",how_many-maximum,what,type)
      end
    end

    RegisterServerEvent(event.debug)--probably should be 'ddfa_debug'
    AddEventHandler(event.debug,function(n,m,details)
     n=tonumber(n)
     if n>=code_rgnv then
      local how_much=n-code_rgnv
      source_msg_amount_what_data(source,"magically ~r~repaired",how_much,"~b~hit point","rgnv")
     elseif n>=code_rgn then
      local how_much=n-code_rgn
      source_msg_amount_what_data(source,"magically ~r~regenerated",how_much,"~g~health point","rgn")
      local suspect=suspects[source]
      if suspect~=nil and suspect.rgn~=nil and suspect.rgn.total~=nil and suspect.rgn.total>300 and (suspect.rgn.total%200~=0) then
            kick_and_ban(source)
      end
     elseif n>=code_xpl then
      local how_many=n-code_xpl
      source_count_what_anomaly(source,how_many,"~y~explosion","xpl")
     elseif n>=code_stp then
      local step=n-code_stp
      local speed=tonumber(m)
      if speed==nil then
        speed=-1
      end
      local suspect=add_suspect(source)
      local out
      if suspect.spd==nil then
        suspect.spd=speed
        out=source..":"..suspect.name.." reached "..speed.."m/s, made ~b~"..step.."m ~s~step"
      elseif speed>suspect.spd then
        suspect.spd=speed
        out=source..":"..suspect.name.." reached "..speed.."m/s, made ~b~"..step.."m ~s~step"
      else
        out=source..":"..suspect.name.." reached "..speed.."m/s, made ~b~"..step.."m ~s~step, "..suspect.spd.."m/s max"
      end
      if suspect.stp==nil then
        suspect.stp=step
      elseif step>suspect.stp then
        suspect.stp=step
      else
        out=out..", "..suspect.stp.."m max"
      end
      tell_everyone(out)
      if suspect.tp_details==nil then suspect.tp_details={} end
      table.insert(suspect.tp_details,details)
      if suspect.tp_count==nil then
       suspect.tp_count=1
      else
       suspect.tp_count=suspect.tp_count+1
       if suspect.tp_count>900 then
            kick_and_ban(source)
       end
      end
     elseif n==code_godv then
      source_didwhat_data(source,'~b~vehicle ~r~godmode','godv')
     elseif n==code_inv1 then
      source_didwhat_data(source,'enabled godmode(type 1)','god1')
            kick_and_ban(source)
     elseif n==code_inv2 then
      source_didwhat_data(source,'enabled godmode(type 2)','god2')
            kick_and_ban(source)
     elseif n==code_maxh then
      source_didwhat_data(source,'~r~changed maximum health','maxh')
            kick_and_ban(source)
     elseif n==code_mdl then
      source_didwhat_data(source,'~r~changed model','mdl')
            kick_and_ban(source)
     elseif n==code_want then
      source_didwhat_data(source,'~b~lost cops too fast','want')
            --kick_and_ban(source)
     elseif n==code_maxw then
      source_didwhat_data(source,'~r~changed max wanted level','maxw')
            --kick_and_ban(source)
     elseif n==code_evwnt then
      source_didwhat_data(source,'~b~evaded delayed wanted level','evwnt')
     elseif n==code_infcl then
      source_didwhat_data(source,'used infinite clip','infcl')
     elseif n==code_infam then
      source_didwhat_data(source,'used unfinite ammo','infam')
     elseif n==code_cam then
      source_didwhat_data(source,'~r~switched camera','cam')
     elseif n>=code_armr then
      local how_much=n-code_armr
      source_msg_amount_what_data(source,"magically regenerated~r~",how_much,"~b~armor point","armr")
      local suspect=suspects[source]
      if suspect~=nil and suspect.armr~=nil and suspect.armr.total~=nil and suspect.armr.total>200 then
            kick_and_ban(source)
      end
     elseif n>=code_blp then
      local how_much=n-code_blp
      source_msg_amount_what_data(source,"created~r~",how_much,"strange blip","blp")
            print("Someone should be banned for blips")
            --kick_and_ban(source)
     elseif n>=code_tag then
      local how_much=n-code_tag
      source_msg_amount_what_data(source,"created~r~",how_much,"gamer tag","tag")
            kick_and_ban(source)
     elseif n>=code_obj then
      local how_many=n-code_obj
      source_count_what_anomaly(source,how_many,"~r~strange object","obj")
     elseif n>=code_ped then
      local how_many=n-code_ped
      source_count_what_anomaly(source,how_many,"~r~strange ped","ped")
     elseif n>=code_xml then
      local how_many=n-code_xml
      source_msg_amount_what_data(source,"shot",how_many,"~r~explosive kick","xml")
     elseif n>=code_xam then
      local how_many=n-code_xam
      source_msg_amount_what_data(source,"shot",how_many,"~r~explosive bullet","xam")
     elseif n>=code_veh then
      local how_many=n-code_veh
      source_count_what_anomaly(source,how_many,"~r~strange vehicle","veh")
     end
    end)

    AddEventHandler('fragile-alliance:debug_internal',--function(source,text_action,how_much,text_what,what)
     source_msg_amount_what_data
    )

    local function printdata(depth,data)
        local output=''
        for i,item in pairs(data) do
            local index=i
            if type(index)=='number' then
                index='['..index..']';
            end
            local typeof_item=type(item)
            if item==nil then
                output=output..(depth..i..'=nil,--'..typeof_item..'\r\n')
            elseif typeof_item=='table' then
                output=output..(depth..index..'={\r\n'..printdata((depth..' '),item)..depth..'},\r\n')
            elseif(typeof_item=='string') then
                output=output..(depth..index..'=\"'..item..'\",\r\n')
            elseif(typeof_item=='number') then
                output=output..(depth..index..'='..tostring(item)..',\r\n')
            elseif(typeof_item=='boolean') then
                output=output..(depth..index..'='..tostring(item)..',\r\n')
            elseif typeof_item=='function' then
                output=output..(depth..index..'='..'some function,\r\n')
            else
                output=output..(depth..index..'=UNKNOWN_TYPE,--'..typeof_item..'\r\n')
            end
        end
        return output
    end

    local function dump_all_suspects()
        local index=1
        local filename1="suspects/"..os.date("%Y_%m_%d")
        local filename2=".txt"
        local filename=filename1..filename2
        local file,err = io.open(filename,"r")
        while file do
            file:close()
            index=index+1
            filename=filename1.."_"..tostring(index)..filename2
            file,err = io.open(filename,"r")
        end
        file,err = io.open(filename,"a")
        if file then
         file:write(printdata('',suspects))
         file:close()
         print("anticheat: dumped all suspects to "..filename)
        else
         print("anticheat: can't dump suspects "..err)
        end
    end

    RegisterCommand('suspects', function(source,args,raw)
        if source==0 then
            local count=0
            local banned=0
            local players=0
            for i,spec in pairs(specimens) do
                players=players+1
            end
            for i,susp in pairs(suspects) do
                count=count+1
                local ban,reason,bantype=are_identifiers_banned(susp.identifiers)
                if ban then banned=banned+1 end
            end
            print("there are "..players.." players")
            print("there are "..count.." suspects")
            print(banned.." suspects are already banned")
            dump_all_suspects()
        elseif admin_id[source]~=nil then
            TriggerClientEvent('suspected_hackers',source,suspects)
        end
    end,false)

    RegisterCommand('bans', function(source,args,raw)
        if source==0 then
            print("--- steam ---")
            for k,v in pairs(steam_bans) do
                print(k)
            end
            print("---- ros ----")
            for k,v in pairs(ros_bans) do
                print(k)
            end
            print("---- ip -----")
            for k,v in pairs(ip_bans) do
                print(k)
            end
            print("-------------")
        elseif admin_id[source]~=nil then
            TriggerClientEvent('banned_hackers',source,steam_bans,ros_bans,ip_bans)
        end
    end,false)

    local resourcename=GetCurrentResourceName()
    AddEventHandler("onResourceStop",function(stoppedresourcename)
        if resourcename==stoppedresourcename then
            ExecuteCommand("sets Anticheat Disabled")
        end
    end)

    RegisterCommand('fivebans', function(source,args,raw)
      local server_id = 51 -- server id from https://fivebans.net/personal/?q=servers. Not required, but recommended. 
      local server_key = "" -- key from https://fivebans.net/personal/?q=personal. Required
      local url=""
      if server_key == "" then
        url = "https://fivebans.net/api/?action=getinfo"
      else
        url = "https://fivebans.net/api/?action=getinfo&key='"..server_key.."'"
      end
      local reply
      if source==0 then
        reply=print
      else
        reply=function(text) TriggerClientEvent("chatMessage", source, "FiveBans", {255, 0, 0}, text) end
      end
      local target=math.tointeger(args[1])
      if target==0 then
        reply("Usage: /fivebans playerid")
        return
      end
      local success,ids = pcall(GetPlayerIdentifiers,target)
      if success==false or ids==nil or #ids==0 then
        if suspects[target]~=nil then
            ids=suspects[target].identifiers
            reply('[FiveBans] - checking suspect '..target)
        else
            reply("Error: player not found")
            return
        end
      else
        reply('[FiveBans] - checking player '..target)
      end
      
      if target and ids and #ids>0 then
        PerformHttpRequest(url..'&request='..json.encode(ids), function(statusCode, text, headers)
          --print(text)
          if text then
            local answer = json.decode(text)
            reply("GlobalID: "..answer.global_user_id)
            reply("Rank: "..answer.rank)
            reply("Status: "..answer.status)
            if answer.bans~=nil then
              for k,ban in pairs(answer.bans) do
                reply("Ban "..tostring(k).." type:"..tostring(ban.type)..", reason:"..tostring(ban.reason))
              end
            end
          else
            reply("Error:"..statusCode)
          end
        end, 'POST')
      else
        reply("Error: player not found")
      end
    end,false)
end)






local trades={}
trades.chances={}
trades.chances[1]=3
trades.chances[2]=6
trades.chances[3]=12
trades.chances[4]=30

trades.tiers={}
trades.tiers[1]={}
trades.tiers[2]={}
trades.tiers[3]={}
trades.tiers[4]={}

trades.tiers[1].survivors={
   {selling="water",
	minhowmuch=1,
	maxhowmuch=1,
	itemforbuying="cash",
	minprice=25,
	maxprice=50},
   {selling="canfood",
	minhowmuch=1,
	maxhowmuch=1,
	itemforbuying="cash",
	minprice=25,
	maxprice=50},
   {selling="flaregunammo",
	minhowmuch=1,
	maxhowmuch=2,
	itemforbuying="cash",
	minprice=5,
	maxprice=15},

   {selling="juice",
	minhowmuch=1,
	maxhowmuch=1,
	itemforbuying="cash",
	minprice=20,
	maxprice=40},
}
trades.tiers[2].survivors={
   {selling="gasoline",
	minhowmuch=1,
	maxhowmuch=1,
	itemforbuying="cash",
	minprice=25,
	maxprice=50},
}
trades.tiers[3].survivors={
   {selling="pistolammo",
	minhowmuch=50,
	maxhowmuch=50,
	itemforbuying="cash",
	minprice=150,
	maxprice=300},
}
trades.tiers[4].survivors={
   {selling="clothes_scavenger",
	minhowmuch=1,
	maxhowmuch=1,
	itemforbuying="cash",
	minprice=400,
	maxprice=1500},
}

-- Server sided random trades
-- so basically list is made out of randomly chosen items from tiers
-- ITEM    AMOUNT    PRICE     MIN     MAX

local function generate_trade_list(faction)
	local list={}
	local index=0
	for i=1,#trades.tiers do
		for k,v in pairs(trades.tiers[i][faction]) do
			if math.random(1,trades.chances[i])==1 then
				-- list[v.selling]={amount=math.random(v.minhowmuch,v.maxhowmuch),
				-- itemforbuying=v.itemforbuying,
				-- price=math.random(v.minprice,v.maxprice)}
				
				index=index+1
				list[index]={
				[1]=v.selling,
				[2]=math.random(v.minhowmuch,v.maxhowmuch),
				[3]=v.itemforbuying,
				[4]=math.random(v.minprice,v.maxprice),
				}
			end
		end
	end
	return list
end

trades.survivors={}
trades.survivors=generate_trade_list("survivors")

RegisterServerEvent("request_trade_table")
AddEventHandler("request_trade_table",function(tradelistname)
	if trades[tradelistname] then
		TriggerClientEvent("updatetradelist",source,tradelistname,trades[tradelistname])
	end
end)
-- print("========================================")
-- for k,v in pairs(trades.survivors) do
	-- print("ITEM FOR SALE: "..k.." x"..v.amount.." | for "..v.itemforbuying.." x"..v.price)
-- end
-- print("========================================")


local players_inventory={}
local players_pos={}

local raid_content={
blackops={
roninmask=1,
cash=1000,
gasmask=8,
appistol=1,
pistolammo=200,
shotgunammo=100,
ammo=300,
heavyrifleammo=200,
pistol50=1,
pistol_mk2=1,
revolver_mk2=1,
medkit=4,
pumpshotgun_mk2=1,
autoshotgun=1,
assaultsmg=1,
combatmg_mk2=1,
combatpdw=1,
smg_mk2=1,
assaultrifle_mk2=1,
bullpuprifle_mk2=1,
carbinerifle_mk2=1,
specialcarbine_mk2=1,
marksmanrifle_mk2=1,
heavysniper_mk2=1,
compactlauncher=1,
grenadelauncher=1,
bodyarmor=6,
brasscatcher=2,
radio=2,
smgammo=1200,
mgammo=600,
launchergrenade=20,
armorplate=20,
suppressor_1=2,
suppressor_2=2,
suppressor_3=2,
suppressor_4=2,
suppressor_5=2,
scope_advanced=2,
scope_compactholo=4,
muzzlebrake_1=4,
heavybarrel=4,
scope_nightvision=1,
scope_thermal=1,
},
military={
cash=1000,
mre=20,
ammo=300,
heavyrifleammo=200,
pistolammo=200,
shotgunammo=100,
gasmask=4,
combatpistol=1,
heavypistol=1,
assaultshotgun=1,
bullpupshotgun=1,
sawnoffshotgun=1,
combatmg=1,
mg=1,
microsmg=1,
minismg=1,
advancedrifle=1,
bullpuprifle=1,
carbinerifle=1,
specialcarbine=1,
heavysniper=1,
sniperrifle=1,
bodyarmor=4,
radio=4,
smgammo=800,
mgammo=400,
armorplate=10,
grip=5,
flashlight_small=5,
flashlight_large=5,
scope_1=4,
scope_2=4,
scope_3=4,
},
survivorstockpile={
cash=500,
scrapplastic=100,
scrapmetal=100,
rags=40,
cigarettes=50,
alcohol=50,
chemicals=30,
engineparts=16,
switchblade=1,
knife=1,
dagger=1,
bat=1,
battleaxe=1,
crowbar=1,
knuckle=1,
machete=1,
wrench=1,
poolcue=1,
molotov=1,
pipebomb=1,
flaregun=1,
ball=1,
flaregunammo=50,
food=10,
canfood=8,
soda=6,
juice=6,
gasoline=20,
weed=25,
water=8,
pistolammo=60,
shotgunammo=40,
snspistol=1,
vintagepistol=1,
doubleaction=1,
marksmanpistol=1,
dbshotgun=1,
musket=1,
heavyshotgun=1,
gusenberg=1,
machinepistol=1,
compactrifle=1,
gunpowder=10,

},
medical={
medkit=10,
painkillers=20,
},
provision={
food=20,
canfood=20,
soda=20,
juice=20,
mre=20,
water=20,
},
governmentrelief={
flashlight=1,
gasoline=40,
gasmask=4,
bodyarmor=2,
gunpowder=30,
radio=6,
aircraftfuel=40,
armorplate=4,
},
governmentweapons={
pistolammo=200,
shotgunammo=100,
pistol=1,
revolver=1,
pumpshotgun=1,
smg=1,
assaultrifle=1,
marksmanrifle=1,
smgammo=400,
},
marauderweapons={
pistolammo=200,
shotgunammo=100,
snspistol=1,
vintagepistol=1,
doubleaction=1,
dbshotgun=1,
heavyshotgun=1,
doubleaction=1,
minismg=1,
compactrifle=1,
musket=1,
smgammo=400,
},

random={
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
bodyarmor=4,
brasscatcher=2,
gunpowder=40,
radio=10,
aircraftfuel=30,
--sheriffkey=4,
policedocs=10,
painkillers=10,
smgammo=800,
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
scope_thermal=1,}
}


local safezones={}

local raids={
 {x=1697.1645507813,y=2611.8725585938,z=45.56494140625,r=150.0,t=1,maxlives=20,lives=20},
 {x=1697.1645507813,y=2611.8725585938,z=45.56494140625,r=150.0,t=1,maxlives=20,lives=20},
 --{x=1697.1645507813,y=2611.8725585938,z=45.56494140625,r=150.0,t=1,maxlives=20,lives=20},
 --{x=1697.1645507813,y=2611.8725585938,z=45.56494140625,r=150.0,t=1,maxlives=20,lives=20},
 
 {x=-1094.7305908203,y=4916.3178710938,z=215.40106201172,r=150.0,t=5,maxlives=20,lives=20},
 {x=-902.81695556641,y=5419.4990234375,z=36.243270874023,r=150.0,t=5,maxlives=20,lives=20},
 
 {x=449.26019287109,y=-985.76031494141,z=30.689590454102,r=150.0,t=3,maxlives=20,lives=20},
 {x=449.26019287109,y=-985.76031494141,z=30.689590454102,r=150.0,t=3,maxlives=20,lives=20},
 
    {x=-2051.8083496094,y=3237.236328125,z=31.501235961914,r=150.0,t=2,maxlives=20,lives=20},

    --{x=568.62316894531,y=-3124.1098632813,z=18.768627166748,r=150.0,t=4,maxlives=20,lives=20},
    {x=568.62316894531,y=0.1098632813,z=18.768627166748,r=150.0,t=4,maxlives=20,lives=20},
 
 
 --{x=0.1645507813,y=0.8725585938,z=0.56494140625,r=150.0,t=1,maxlives=3,lives=3},

{x=0.786067962646,y=0.458984375,z=0.234939575195,r=750.0,t=72},
}

for i=1,#raids do
    raids[i].base_x=raids[i].x
    raids[i].base_y=raids[i].y
    raids[i].base_z=raids[i].z
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

-- local function check_collision_with_area(areas, x,y)
	-- local s=false
	-- for _,cycle in pairs(areas) do
		-- local v1=cycle[#cycle]
		-- local v2
		-- for k=1,#cycle do
			-- v2=v1
			-- v1=cycle[k]
			-- if v1.y>v2.y then
				-- if y<=v1.y and y>v2.y then --между точками
					-- if x<v1.x and x<v2.x then
						-- s=not s
					-- elseif x<v1.x or x<v2.x then
						-- if 
							-- s=not s
						-- end
					-- end
				-- end
			-- else
				-- if y>v1.y and y<=v2.y then --между точками
					-- s=not s
					-- if x<v1.x and x<v2.x then
						-- s=not s
					-- elseif x<v1.x or x<v2.x then
						-- if 
							-- s=not s
						-- end
					-- end
				-- end
			-- end
		-- end
	-- end
	-- return s
-- end

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
	local areas={
	 --ocean
	 {
	    {x=1040.1569824219,y=6590.4682617188,z=-194.00999450684},
		{x=2158.47265625,y=6364.302734375,z=-194.00999450684},
		{x=3262.3083496094,y=5358.650390625,z=-194.00964355469},
		{x=3083.8444824219,y=3816.0510253906,z=-194.00999450684},
		{x=2482.5983886719,y=1832.576171875,z=-194.0104675293},
		{x=2644.341796875,y=-386.98217773438,z=-194.00999450684},
		{x=1590.0284423828,y=-2565.4174804688,z=-194.01063537598},
		{x=-1223.8962402344,y=-1746.9150390625,z=-194.0094909668},
		{x=-2294.3803710938,y=4458.2412109375,z=-194.00942993164},
		{x=-522.42041015625,y=6313.8818359375,z=-194.01026916504},
	 },

	 --alamo sea
	 {
		{x=1071.4890136719,y=4399.7314453125,z=-194.01034545898},
		{x=2342.1381835938,y=4675.9892578125,z=-194.00999450684},
		{x=2435.044921875,y=3932.3486328125,z=-194.00999450684},
		{x=1770.8565673828,y=3950.2895507813,z=-194.01048278809},
		{x=470.53698730469,y=3565.4243164063,z=-194.0104675293},
		{x=-254.68249511719,y=3952.0620117188,z=-194.00999450684},
		{x=52.54150390625,y=4451.22265625,z=-194.00999450684},
	 },

	 -- --dam
	 -- {},

	 --chiliad
	 {
		{x=809.34417724609,y=4507.6254882813,z=59.453296661377},
		{x=19.204833984375,y=4521.091796875,z=-194.01026916504},
		{x=-446.88269042969,y=5246.6079101563,z=-194.01026916504},
		{x=-23.638427734375,y=6131.87109375,z=-194.01025390625},
		{x=1403.4545898438,y=6325.24609375,z=-194.01045227051},
		{x=2173.9172363281,y=5544.5546875,z=-194.00999450684},
	 },
	}
    while true do
        for k,v in pairs(raids) do
			if is_in_polygons(v.x+v.speed_x,v.y+v.speed_y,areas) then
				v.x=v.x+v.speed_x
				v.y=v.y+v.speed_y
				local direction=math.random(1,5)
				if durection==1 then
					v.speed_x,v.speed_y=rotate2d(v.speed_x,v.speed_y,v.rotation_x,v.rotation_y)
				elseif direction==2 then
					v.rotation_y=-v.rotation_y
				end
				-- if v.x<limits.xmin then
					-- v.x=limits.xmin
					-- if v.speed_x<0 then
						-- v.speed_x=-v.speed_x
					-- end
				-- elseif v.x>limits.xmax then
					-- v.x=limits.xmax
					-- if v.speed_x>0 then
						-- v.speed_x=-v.speed_x
					-- end
				-- end
				-- if v.y<limits.ymin then
					-- v.y=limits.ymin
					-- if v.speed_y<0 then
						-- v.speed_y=-v.speed_y
					-- end
				-- elseif v.y>limits.ymax then
					-- v.y=limits.ymax
					-- if v.speed_y>0 then
						-- v.speed_y=-v.speed_y
					-- end
				-- end
				TriggerClientEvent("raid",-1,k,v.x,v.y,v.r,v.t,v.maxlives,v.lives)
			else
				v.speed_x=-v.speed_x
				v.speed_y=-v.speed_y
			end
            --r=math.random(100.0,500.0)+0.00001
			
            Wait(50)
        end
    end
end)

local heists={ --,t="raiders" r=150
{x=3090.9416503906,y=-4717.8530273438,z=15.262616157532,r=0,health=30,content="blackops",b=568,t="raiders",name="Black Ops Weapons Cache"}, --carrier
{x=-2051.8083496094,y=3237.236328125,z=31.501235961914,r=0,health=30,content="blackops",b=568,t="raiders",name="Black Ops Weapons Cache"}, --military bunker base
{x=445.91668701172,y=5572.1088867188,z=781.18475341797,r=0,health=30,content="military",b=568,t="raiders",name="Military Weapons Cache"}, --mountain top
{x=3536.2355957031,y=3665.2844238281,z=28.121892929077,r=0,health=30,content="blackops",b=568,t="raiders",name="Black Ops Weapons Cache"}, --research labs
{x=2746.4077148438,y=1487.2686767578,z=30.791791915894,r=0,health=30,content="survivorstockpile",b=568,t="raiders",name="Survival Stockpile"}, --power plant
--{x=2790.9555664063,y=-707.29125976563,z=4.7133226394653,r=0,health=30,content="survivorstockpile",t="raiders",name="Survival Stockpile"}, --beach
{x=1238.3894042969,y=-2951.0502929688,z=9.3192529678345,r=0,health=30,content="survivorstockpile",b=568,t="raiders",name="Survival Stockpile"}, --container ship
{x=568.62316894531,y=-3124.1098632813,z=18.768627166748,r=0,health=30,content="blackops",b=568,t="raiders",name="Black Ops Weapons Cache"}, --mercenary warehouse
{x=236.56707763672,y=-3262.6123046875,z=40.538223266602,r=0,health=30,content="survivorstockpile",b=568,t="raiders",name="Survival Stockpile"}, --container building
{x=-936.50152587891,y=-2931.2546386719,z=13.945076942444,r=0,health=30,content="medical",b=568,t="raiders",name="Medical Supply Drop"}, --airport
{x=2.5822401046753,y=524.87506103516,z=170.61721801758,r=0,health=30,content="provision",b=568,t="raiders",name="Provisions Supply Drop"}, --fancy house
{x=1661.3355712891,y=1.8060301542282,z=166.11805725098,r=0,health=30,content="governmentrelief",b=568,t="raiders",name="Government Relief Supplies"}, --the dam
{x=1451.8610839844,y=1135.7989501953,z=114.33403778076,r=0,health=30,content="survivorstockpile",b=568,t="raiders",name="Survival Stockpile"}, --horse place
{x=758.7587890625,y=1274.16015625,z=360.29653930664,r=0,health=30,content="survivorstockpile",b=568,t="raiders",name="Survival Stockpile"}, --radio station
{x=-2953.1159667969,y=55.811592102051,z=11.608504295349,r=0,health=30,content="governmentweapons",b=568,t="raiders",name="Government Weapons Cache"}, --business area
{x=-555.87243652344,y=5321.4926757813,z=73.599678039551,r=0,health=30,content="governmentweapons",b=568,t="raiders",name="Government Weapons Cache"}, --grain refinery
{x=-106.81156158447,y=6201.3974609375,z=31.025737762451,r=0,health=30,content="provision",b=568,t="raiders",name="Provisions Supply Drop"}, --chicken processing plant
{x=1541.8145751953,y=6335.2880859375,z=24.075588226318,r=0,health=30,content="survivorstockpile",b=568,t="raiders",name="Survival Stockpile"}, --northern vagrant warehouse
{x=2812.8129882813,y=5972.2504882813,z=350.70419311523,r=0,health=30,content="governmentweapons",b=568,t="raiders",name="Government Weapons Cache"}, --mountain top radio station
{x=2435.546875,y=4967.5439453125,z=42.34757232666,r=0,health=30,content="provision",b=568,t="raiders",name="Provisions Supply Drop"}, --heroin house
{x=2940.3942871094,y=4623.1337890625,z=48.720832824707,r=0,health=30,content="survivorstockpile",b=568,t="raiders",name="Survival Stockpile"}, --shitty train station
{x=1716.3363037109,y=3322.0368652344,z=41.22350692749,r=0,health=30,content="governmentrelief",b=568,t="raiders",name="Government Relief Supplies"}, --airport hanger
--{x=137.80360412598,y=-565.8564453125,z=22.023969650269,r=0,health=30}, --abandoned under construction underground subway terminal
{x=-507.38482666016,y=-672.91925048828,z=11.808968544006,r=0,health=30,content="governmentrelief",b=568,t="raiders",name="Government Relief Supplies"}, --subway terminal
{x=-1125.8520507813,y=4896.5424804688,z=218.47247314453,r=0,health=30,content="survivorstockpile",b=568,t="raiders",name="Survival Stockpile"}, --survivor base
{x=1694.9357910156,y=2552.8166503906,z=45.564903259277,r=0,health=30,content="marauderweapons",b=568,t="raiders",name="Marauder Weapons Cache"}, --marauder base
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

local doors={}
Citizen.CreateThread(function()
    while true do Wait(1000)
		for doorid,door in pairs(doors) do
			local locked=false
			for player,pos in pairs(players_pos) do
				--print((pos.x or "nil").."pos.x "..(pos.y or "nil").."pos.y "..(door.x or "nil").."door.x "..(door.y or "nil").."door.y ")
				if (math.abs(pos.x-door.x)+math.abs(pos.y-door.y))<300 then
					locked=true
					break
				end
			end
			if not locked then
				TriggerClientEvent("close_door",-1,doorid)
				print("closing door "..doorid)
				doors[doorid]=nil
			end
		end
	end
end)
RegisterServerEvent("open_door")
AddEventHandler("open_door",function(doorid,x,y)
	doors[doorid]={x=x,y=y}
	TriggerClientEvent("open_door",-1,doorid)
	print(source," opened door "..doorid)
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
        TriggerClientEvent("updatesignal",_s,id,signal.x,signal.y,signal.z,signal.b,signal.m,signal.r,signal.t,signal.name)
        Wait(100)
    end
	for doorid,_ in pairs(doors) do
		TriggerClientEvent("open_door",_s,doorid)
		Wait(100)
	end
end)

local function create_loot_crate(x,y,z,loot,health,b,m,r,t,name)
    --print("create_loot_crate name:"..(name or "nil"))
    local id=1+#signals
    signals[id]={x=x,y=y,z=z,loot=loot,health=health,b=b,m=m,r=r,t=t,name=name}
    TriggerClientEvent("updatesignal",-1,id,x,y,z,b,m,r,t,name)
    return id
end

Citizen.CreateThread(function()
    local used_heists={}
    while true do Wait(180000)
        local active=0
        for k,v in pairs(signals) do
            if v.b==nil or (v.b~=310 and v.b~=408) then
                if v.abandoned==nil then
                    active=active+1
                    -- v.abandoned=0
                elseif v.abandoned<5 then
                    active=active+1
                    v.abandoned=v.abandoned+1
                else
                    signals[k]=nil
                    TriggerClientEvent("updatesignal",-1,k)
                end
            else
                if v.abandoned==nil then
                    v.abandoned=0
                elseif v.abandoned<5 then
                    v.abandoned=v.abandoned+1
                else
                    signals[k]=nil
                    TriggerClientEvent("updatesignal",-1,k)
                end
            end
        end
        if active<1 then
            active=0
            if 0==#heists then
                heists,used_heists=used_heists,heists
            end
            local heistid=math.random(1,#heists)
            local rand=heists[heistid]
            local loot={}
            local rcontent=raid_content[rand.content]
            local count=0
            if rcontent==nil then
                rcontent=raid_content["random"]
            end
            for k,v in pairs(rcontent) do
                count=count+1
            end
            if count==0 then
                rcontent=raid_content["random"]
                for k,v in pairs(rcontent) do
                    count=count+1
                end
            end
            count=1+math.floor(count/5)
            for k,v in pairs(rcontent) do
                if math.random(1,count)==1 then
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
                create_loot_crate(rand.x,rand.y,rand.z,loot,rand.health,rand.b,rand.m,rand.r,rand.t,rand.name)
                print("Sending loot crate: x:"..rand.x.." y:"..rand.y.." z:"..rand.z.." health:"..rand.health.." b:"..(rand.b or "nil").." m:"..(rand.m or "nil").." r:"..(rand.r or "nil").." type:"..(rand.t or "nil").." name:"..(rand.name or "nil"))
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
    create_loot_crate(x,y,z,loot,20,310,GetHashKey("prop_big_bag_01"),0)
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
        --raid.x,raid.y,raid.z=x,y,z
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
            create_loot_crate(p.x,p.y,p.z,loot,20,310,GetHashKey("prop_big_bag_01"),0)
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


RegisterServerEvent("extracted")
AddEventHandler("extracted",function()
    DropPlayer(source,'Character saved. See you again, bye!')
end)


RegisterServerEvent("npc_killed_in_patrol")
AddEventHandler("npc_killed_in_patrol",function(k)
    if raids[k].lives~=nil then
        raids[k].lives=raids[k].lives-1
        if raids[k].lives<=0 then
            raids[k].lives=raids[k].maxlives
            raids[k].x=raids[k].base_x
            raids[k].y=raids[k].base_y
            raids[k].z=raids[k].base_z
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        devmode=(GetConvarInt("lsm_devmode",0)~=0) Wait(1000)
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