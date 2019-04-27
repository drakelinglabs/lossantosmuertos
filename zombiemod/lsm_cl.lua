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
[9]={var=0-1,tex=1-1}, --accesories 2 (armor)
[10]={var=0-1,tex=1-1}, --decals
[11]={var=1-1,tex=range(2-1,12-1,{7-1,10-1,11-1})}, --additional parts for torso
bodyarmor={[9]={var=2-1,tex=2-1}},
backpack={[5]={var=39-1,tex=1-1}},
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
backpack={[5]={var=39-1,tex=1-1}},
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
backpack={[5]={var=39-1,tex=1-1}},
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
backpack={[5]={var=39-1,tex=1-1}},
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
backpack={[5]={var=39-1,tex=1-1}},
},
offdutysheriff={
[0]={var=1-1,tex=1-1}, --head
[1]={var=1-1,tex=1-1}, --"beard" masks
[2]={var=5-1,tex=range(2-1,6-1)}, --hair
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
backpack={[5]={var=33-1,tex=5-1}},
hat={[11]={var=252-1,tex=range(1-1,5-1)}},
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
backpack={[5]={var=67-1,tex=1-1}},
hat={[11]={var=70-1,tex=range(1-1,6-1)}},
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
backpack={[5]={var=10-1,tex=2-1}},
hat={[11]={var=70-1,tex=range(1-1,6-1)}},
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
backpack={[5]={var=70-1,tex=7-1}},
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
backpack={[5]={var=52-1,tex=1-1}},
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
backpack={[5]={var=52-1,tex=1-1}},
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
backpack={[5]={var=67-1,tex=1-1}},
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
backpack={[5]={var=58-1,tex=10-1}},
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
backpack={[5]={var=58-1,tex=10-1}},
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
backpack={[5]={var=67-1,tex=1-1}},
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
backpack={[5]={var=67-1,tex=1-1}},
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
backpack={[5]={var=70-1,tex=7-1}},
},
}

local hats={
["cowboyhat"]={var=14-1,tex=8-1},
["camocap"]={var=7-1,tex=6-1},
["lowcap"]={var=121-1,tex=1-1,removehair=true},
}
local masks={
["gasmask"]={[1]={var=47-1,tex=1-1}},
["halfmask"]={[1]={var=52-1,tex=1-1}},
["balaclava"]={[1]={var=53-1,tex=1-1}},
["tshirtmask"]={[1]={var=55-1,tex=range(1-1,11-1)},blockhat=true},
}


local relationship_name={
[GetHashKey("SURVIVOR")]="Survivor",
[GetHashKey("NEUTRAL")]="Scavenger",
[GetHashKey("DAWN")]="Dawn",
[GetHashKey("GOVERNMENT")]="Government",
[GetHashKey("BANDIT")]="Bandit",
[GetHashKey("RAIDER")]="Raider",
[GetHashKey("MARAUDER")]="Marauder",
}
local relationship_names={
[0]="You are allied with this faction. You may use your weapons freely.",
[1]="You have a friendly relationship with this faction. You may use your weapons freely.",
[2]="You have a neutral relationship with this faction. Keep your weapons holstered or be fired upon.",
[3]="You have a neutral relationship with this faction. Keep your weapons holstered or be fired upon.",
[4]="You have a neutral relationship with this faction. Keep your weapons holstered or be fired upon.",
[5]="Your relationship with this faction is hostile. You will be attacked on sight.",
[GetHashKey("SURVIVOR")]="Survivors",
[GetHashKey("NEUTRAL")]="Scavengers",
[GetHashKey("DAWN")]="Dawn",
[GetHashKey("GOVERNMENT")]="Government",
[GetHashKey("BANDIT")]="Bandits",
[GetHashKey("RAIDER")]="Raiders",
[GetHashKey("MARAUDER")]="Marauders",
}

local relationship_good_bad={
[GetHashKey("SURVIVOR")]="good",
[GetHashKey("NEUTRAL")]="neutral",
[GetHashKey("BANDIT")]="bad",
[GetHashKey("GOVERNMENT")]="good",
[GetHashKey("DAWN")]="good",
[GetHashKey("RAIDER")]="neutral",
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

local survivor_hash,bandit_hash,government_hash,raider_hash,neutral_hash,dawn_hash,marauder_hash

local weapons={
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
}

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

local hint_y=0.32
Citizen.CreateThread(function()
    while true do hint_y=0.32 Wait(0) end
end)
local function WriteHint(text)
    if not disablehud then
        WriteText(4,text,0.4,255,255,255,255,0.005,hint_y) hint_y=hint_y+0.025
    end
end

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
player.suit="standard"
player.brasscatcher=false
player.radio=false
player.bleeding=0
player.reputation=GetResourceKvpInt("reputation") or 10
player.maxweight=35.0
player.weight=0.0


local weaponsarray={
    raiders={-- 1 raiders
    "dagger","knife","machete","crowbar","hatchet","bat","poolcue","switchblade","poolcue","knuckle",
    "dagger","knife","machete","crowbar","hatchet","bat","poolcue","switchblade","poolcue","knuckle",
    "dagger","knife","machete","crowbar","hatchet","bat","poolcue","switchblade","poolcue","knuckle",
    "dagger","knife","machete","crowbar","hatchet","bat","poolcue","switchblade","poolcue","knuckle",
    "dagger","knife","machete","crowbar","hatchet","bat","flaregun","poolcue","switchblade","poolcue","knuckle",
    "pistol","snspistol","vintagepistol","combatpistol",
    "dbshotgun","pumpshotgun",
    "musket"},
    bandit={-- 
    "pistol","snspistol","vintagepistol","combatpistol",
    "dbshotgun","pumpshotgun",
    "musket"},
    survivor={-- 
    "pistol","snspistol","vintagepistol","combatpistol",
    "dbshotgun","pumpshotgun",
    "musket"},
    military={-- 2 military
    "carbinerifle","pistol","pumpshotgun","smg","sniperrifle"
    },
    mercenaries={-- 4 mercenaries
    "carbinerifle_mk2","pistol_mk2","assaultrifle_mk2","sniperrifle"
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
    bandit={-- 5
    1885233650,
    },
}

local raids={}
Citizen.CreateThread(function()

    --local blipcolors={military=2,mercenaries=4,raiders=1}
    local types={
        [1]="bandit",
        [2]="military",
        [4]="mercenaries",
        [5]="survivor",
    }

    local relationships={
        [1]=GetHashKey("BANDIT"),-- 1 raiders
        [2]=GetHashKey("RAIDER"),-- 2 military
        [4]=GetHashKey("RAIDER"),-- 4 mercenaries
        [5]=GetHashKey("SURVIVOR"),-- 
    }
    RegisterNetEvent("raid")
    AddEventHandler("raid",function(k,x,y,r,t)
        --r=r+0.5
        --print("raid "..k,x,y,r,t)
        local v=raids[k]
        if v==nil then
            if t==nil then
                raids[k]={x=x,y=y,r=r}
            else
                if modelgroups[types[t]]~=nil or relationships[t]~=nil then
                    raids[k]={x=x,y=y,r=r,guard=true,models=modelgroups[types[t]],relationship=relationships[t],weapons=weaponsarray[types[t]]}
                else
                    raids[k]={x=x,y=y,r=r,t=t}
                end
            end
        else
            if x~=nil then
                if t<=5 and t>=1 then
                    local success,nodepos=GetClosestMajorVehicleNode(x, y, 0.0, 3.0, 0)
                    if success then
                        x=nodepos.x
                        y=nodepos.y
                    end
                end
                v.x=x
                v.y=y
                v.r=r
                if v.blip==nil then 
                    v.blip=AddBlipForRadius(x,y,0,r)
                    SetBlipAlpha(v.blip,100)
                    SetBlipColour(v.blip,t)
                else
                    SetBlipCoords(v.blip,x,y,0)
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
                            WriteHint("You have encountered ~r~RADIOACTIVE FALLOUT~s~! Equip a gasmask!")
                            if ((currenttime~prevtime)&-2048)~=0 then
                                prevtime=currenttime
                                SetEntityHealth(ped,GetEntityHealth(ped)-1)
                            end
                        end
                    end
                else
                    
                end
            end
        end
    end
end)

local vehiclesave={}

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
    {"flare",3,
        {"chemicals",1,
        "scrapplastic",1},
    },
    {"flaregun",1,
        {"scrapplastic",1,
        "scrapmetal",1},
    },
    {"flaregunammo",5,
        {"chemicals",1,
        "gunpowder",1,
        "scrapplastic",1},
    },
    {"bandage",1,
        {"alcohol",1,
        "rags",2},
    },
}

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

for k,v in pairs(weaponsarray.raiders) do
    weaponsarray.raiders[k]=GetHashKey("weapon_"..v)
end
for k,v in pairs(weaponsarray.military) do
    weaponsarray.military[k]=GetHashKey("weapon_"..v)
end

local safezones={

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

    --Altruists camp
    {x=-1096.5206298828,y=4914.2548828125,z=215.85502624512,r=125.0,blip=181,color=36,
    models={1885233650},--{-12678997,1694362237,-1105135100},--,1939545845
    name="~y~Old Cult Camp~s~",
    friends=true,
    tradespace=5,
    trade={
        {"water",1,"cash",30},
        {"gasoline",1,"cash",30},
        {"bandage",1,"cash",20},
        {"canfood",1,"cash",25},
        {"clothes_explorer",1,"cash",4000},
        
        {"cash",30,"cigarettes",1},
        {"cash",40,"gunpowder",1},
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
    --clothespos={x=-1146.4151611328,y=4940.9018554688,z=222.26872253418},
    --changingroompos={x=-1137.6760253906,y=4940.2631835938,z=222.26852416992},
    provision={
        "water",3,
        "canfood",2,
    },
    --provisionpos={ x=-1098.6478271484,y=4893.4716796875,z=216.06663513184},
    questpos={x=-1098.6478271484,y=4893.4716796875,z=216.06663513184},
    weapons={"pistol","snspistol","vintagepistol","combatpistol","dbshotgun","pumpshotgun","marksmanrifle","sniperrifle"},
    garagepos={x=-1095.7849121094,y=4945.1254882813,z=218.58392333984,angle=205.9517364502},
    vehpos={x=-1069.4080810547,y=4937.5786132813,z=212.07720947266,angle=342.98559570313},
    vehshop={
        {"cruiser",
            {"scrapmetal",15,
            "cash",50},
        },
        {"scorcher",
            {"cash",300},
        },
        {"cerberus",
            {"cash",5000,
            "engineparts",1000,
            "gasoline",150,
            "scrapmetal",1500},
        },
        {"scarab",
            {"cash",10000,
            "engineparts",2000,
            "gasoline",250,
            "scrapmetal",2000},
        },
    },
    craftpos={x=-1123.6444091797,y=4894.5190429688,z=218.47256469727},
    crafts=normal_crafts,
    spawnpos={x=-1112.9624023438,y=4903.9765625,z=218.59544372559,angle=323.06338500977},
    ransack={x=-1111.5389404297,y=4936.8647460938,z=218.38740539551,angle=151.02191162109},
    ransack_list={
        {"water",20,"gasoline",10},
        {"gasoline",10,"bandage",15},
        {"canfood",15,"cigarettes",10},
        {"gunpowder",10,"cash",650},
        {"soda",10,"juice",10},
        {"alcohol",5,"cash",100},
    },
    join_faction={x=-1146.4794921875,y=4940.9321289063,z=222.2685546875,
        rep_moreorless="more",rep_amount=50,

    },
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
    {x=449.93710327148,y=-986.46514892578,z=30.437593460083,r=50.0,blip=60,color=3,
    --models={-44746786,1330042375,1032073858,850468060}, --nothing
    models={1885233650},--
    name="~b~LSPD Station~s~",
    friends=true,
    tradespace=4,
    trade={
        {"pistolammo",30,"cash",150},
        {"shotgunammo",10,"cash",100},
        {"pistol",1,"cash",400},
        {"pumpshotgun",1,"cash",800},
        
        {"cash",30,"cigarettes",1},
        {"cash",40,"gunpowder",1},
        {"cash",15,"soda",1},
        {"cash",10,"juice",1},
        {"cash",25,"alcohol",1},
        {"cash",30,"water",1},
        {"cash",30,"canfood",1},
        {"cash",50,"mre",1},
        {"cash",400,"policedocs",1},
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
    --clothespos={x=460.62753295898,y=-990.84625244141,z=30.689601898193},
    --changingroompos={x=449.89859008789,y=-990.55810546875,z=30.689601898193},
    provision={
        "water",1,
        "pistolammo",20,
    },
    --provisionpos={x=447.22109985352,y=-975.54309082031,z=30.689596176147},
    questpos={x=447.22109985352,y=-975.54309082031,z=30.689596176147},
    weapons={"pistol","pumpshotgun"},
    garagepos={x=449.07763671875,y=-1018.770324707,z=28.532030105591,angle=78.808685302734},
    vehpos={x=449.46347045898,y=-1012.5942382813,z=28.496547698975,angle=94.81258392334},
    vehshop={
        {"cruiser",
            {"scrapmetal",15,
            "cash",50},
        },
        {"scorcher",
            {"cash",300},
        },
        {"cerberus",
            {"cash",5000,
            "engineparts",1000,
            "gasoline",150,
            "scrapmetal",1500},
        },
        {"scarab",
            {"cash",10000,
            "engineparts",2000,
            "gasoline",250,
            "scrapmetal",2000},
        },
    },
    craftpos={x=441.29440307617,y=-975.71667480469,z=30.689594268799},
    crafts=normal_crafts,
    spawnpos={x=459.48818969727,y=-994.87622070313,z=24.914867401123,angle=92.499603271484},
    relationship="GOVERNMENT"},--LSPD station
    
    
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
    
    
    
----------------------------------------------------
    {x=1697.1645507813,y=2611.8725585938,z=45.564865112305,r=250.0,blip=84,color=1,
    models={1885233650},--{1746653202,-44746786,1330042375,1032073858,850468060,275618457},
    name="~r~Prison~s~",
    tradespace=4,
    trade={
        {"gasoline",1,"cash",30},
        {"bandage",1,"cash",20},
        {"canfood",1,"cash",25},
        {"clothes_banditgoon",1,"cash",300},
        {"clothes_police",1,"cash",1500},
        {"clothes_banditauthority",1,"cash",5000},
        {"clothes_banditmercenary",1,"cash",8000},
        
        {"cash",40,"cigarettes",1},
        {"cash",30,"gunpowder",1},
        {"cash",20,"soda",1},
        {"cash",15,"juice",1},
        {"cash",35,"alcohol",1},
        {"cash",120,"mre",1},
        {"cash",220,"armorplate",1},
        {"cash",330,"medkit",1},
        {"cash",400,"ammo",30},
    },
    questpos={x=1775.5057373047,y=2551.951171875,z=45.564979553223},
    tradepos={x=1682.52734375,y=2476.2099609375,z=45.823303222656},
    craftpos={x=1689.4483642578,y=2552.2507324219,z=45.56485748291},
    crafts=normal_crafts,
    weapons={"carbinerifle","pumpshotgun","sniperrifle"},    
    garagepos={x=1655.3520507813,y=2665.0593261719,z=45.465591430664,angle=229.13996887207},
    vehpos={x=1710.98828125,y=2691.3481445313,z=45.472282409668,angle=180.61428833008},
    vehshop={
        {"placeholder",
            {"cash",1000,
            "engineparts",5,
            "scrapmetal",500},
        },
    },
    ransack={x=1661.6795654297,y=2566.5334472656,z=45.564865112305,angle=229.75936889648},
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
        if not v.raided then
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
    end
    for k,v in pairs(raids) do
        dx=v.x-x
        if math.abs(dx)<v.r then
            dy=v.y-y
            if math.abs(dy)<v.r then
                if dx*dx+dy*dy<v.r*v.r then
                    --WriteNotification("raid:"..v.."/r:"..v.r.."xyz:"..x..y..z)
                        v.name="Patrol"
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
                        v.name="Cache"
                        return v
                    end
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

local lsm_random_spawn
Citizen.CreateThread(function()
    while true do
        lsm_random_spawn=GetConvarInt("lsm_random_spawn",0) Wait(10000)
    end
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
local item_weight={
water=1.0,
canfood=0.6,
fish=0.7,
gasoline=0.75,
mre=1.2,
meat=1.3,
chemicals=2.8,
ammo=0.05,
engineparts=5.0,
soda=0.5,
juice=1.0,
bandage=0.3,
medkit=1.5,
alcohol=0.8,
weed=0.1,
pistolammo=0.02,
heavyrifleammo=0.1,
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
smgammo=0.02,
mgammo=0.1,
launchergrenade=0.7,
clothes_marauder=5.5,
clothes_camouflage=7.8,
armorplate=2.0,
clothes_offdutysheriff=9.2,
cowboyhat=0.7,
halfmask=0.2,
balaclava=0.3,
tshirtmask=0.5,
camocap=0.3,
clothes_explorer=11.2,
clothes_mercenary=26.2,
clothes_banditgoon=6.8,
clothes_police=8.7,
lowcap=0.3,
clothes_banditmercenary=18.0,
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
}
local item_names={
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
armorplate="Armor Plate",
clothes_offdutysheriff="Camouflaged Raincoat",
cowboyhat="Cowboy Hat",
halfmask="Bandana Mask",
balaclava="Balaclava",
tshirtmask="T-shirt Mask",
camocap="Camouflaged Cap",
clothes_explorer="Explorer Gear",
clothes_mercenary="Mercenary Armor",
clothes_banditgoon="Bandit Clothes",
clothes_police="Police Uniform",
lowcap="Beanie",
clothes_banditmercenary="Marauder Armor",
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
}
local item_descriptions={
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
rags="A few strips of clean cloth. Useful when cleaning wounds or crafting items.",
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
halfmask="A bandana fashioned into a crude mask. Useful for disguising identity.",
balaclava="A full balaclava face mask. Useful for disguising identity.",
tshirtmask="A crude mask fashioned from a ragged t-shirt.",
camocap="A camouflaged military cap.",
clothes_explorer="A heavy set of expedition hardwear. Slowly regenerates health when injured.",
clothes_mercenary="A set of mercenary combat armor. Provides ballistic damage resistance at the cost of mobility.",
clothes_banditgoon="A thick set of clothes typically worn by bandits. Provides light melee damage resistance.",
clothes_police="A traditional police uniform.",
lowcap="A standard polyester knitted beanie.",
clothes_banditmercenary="A set of marauder combat armor. Provides ballistic damage resistance at the cost of mobility.",
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
scope_compactholo="Compact Holographic Sight",
muzzlebrake_1="Tactical Muzzle Brake",
heavybarrel="Reinforced Rifle Barrel",
scope_nightvision="Night Vision Scope",
scope_thermal="Thermal Vision Scope",
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
        [GetHashKey("weapon_combatpdw")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_assaultrifle")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_carbinerifle")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_specialcarbine")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_bullpuprifle")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_combatmg")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_assaultshotgun")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_bullpupshotgun")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_heavyshotgun")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_marksmanrifle")]=0xFFFFFFFFC164F53,
        [GetHashKey("weapon_grenadelauncher")]=0xFFFFFFFFC164F53,
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
        [GetHashKey("weapon_heavysniper")]=0xFFFFFFFFBC54DA77,
        [GetHashKey("weapon_sniperrifle")]=0xFFFFFFFFBC54DA77,
        [GetHashKey("weapon_heavysniper_mk2")]=0xFFFFFFFFBC54DA77,
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


local function use_weapon_upgrade(upgradename)
    local myped=PlayerPedId()
    local myweapon=GetSelectedPedWeapon(myped)
    local upgrade=weapon_upgrades[upgradename]
    if upgrade~=nil then
        local hash=upgrade[myweapon]
        if hash~=nil then
            if HasPedGotWeaponComponent(myped, myweapon, hash) then
                WriteNotification("You already have this upgrade attached to weapon.")
                return false
            else
                GiveWeaponComponentToPed(myped,myweapon, hash)
                return true
            end
        else
            WriteNotification("Cannot attach this upgrade to selected weapon.")
            return false
        end
    else
        WriteNotification("~r~ERROR! ~s~No such upgrade.")
        return false
    end
end

local item_index_to_name={}
local item_name_to_index={}
for k,v in pairs(item_names) do
    local hash=(GetHashKey(k)&0x7FFFFFFF)
    item_index_to_name[hash]=k
    item_name_to_index[k]=hash
end
for k,v in pairs(weapons) do
    local hash=(GetHashKey(k)&0x7FFFFFFF)
    item_index_to_name[hash]=k
    item_name_to_index[k]=hash
end

local inventory={}
inventory.rows=4
inventory.lines=5
inventory.max=9000 --15
inventory.total=GetResourceKvpInt("inventory_total")
inventory.current=GetResourceKvpInt("inventory_current")
inventory.highlight=500
inventory.scroll=0

for i=1,inventory.total do
    inventory[i]={item=GetResourceKvpString("inventory_item_"..i),amount=GetResourceKvpInt("inventory_amount_"..i)}
end
if inventory.current>inventory.total then
    inventory.current=inventory.total
elseif inventory.current<1 then
    inventory.current=((inventory.total>0) and 1 or 0)
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
local deadbodiesrewards_tier1={
{"scrapplastic",1},
{"rags",-2},
}
local deadbodiesrewards_tier2={
{"cigarettes",1},
{"bandage",-2},
{"flaregunammo",-5},
{"gunpowder",1},
{"cash",-20},
}
local deadbodiesrewards_tier3={
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
}
local deadbodiesrewards_tier4={
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
{"clothes_marauder",1},
{"clothes_camouflage",1},
{"halfmask",1},
{"balaclava",1},
{"camocap",1},
{"clothes_banditgoon",1},
{"clothes_scavenger",1},
{"lowcap",1},
{"mre",1},
{"dawntokens",1},
}
local deadbodiesrewards_tier5={
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
}
local deadbodiesrewards_tier6={
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
}

local trunkrewards_tier1={
{"scrapplastic",-5},
{"scrapmetal",-5},
{"rags",-3},
}
local trunkrewards_tier2={
{"cigarettes",-3},
{"alcohol",-2},
{"chemicals",-3},
{"bandage",-2},
{"engineparts",-5},
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
}
local trunkrewards_tier3={
{"food",-3},
{"canfood",-2},
{"soda",-2},
{"juice",1},
{"gasoline",-7},
{"painkillers",-2},
}
local trunkrewards_tier4={
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
{"clothes_marauder",1},
{"clothes_camouflage",1},
{"halfmask",1},
{"balaclava",1},
{"camocap",1},
{"clothes_banditgoon",1},
{"clothes_scavenger",1},
{"lowcap",1},
{"mre",-2},
{"dawntokens",1},
}
local trunkrewards_tier5={
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
}
local trunkrewards_tier6={
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
}

local deadbodiesrewards={
[-681004504]={"NIGHTSTICK",1}, --security
[1581098148]={"pistolammo",15}, --cop male
[368603149]={"pistolammo",15}, --cop female
[-673538407]={"HAMMER",1}, --construct
[-277793362]={"REVOLVER",12}, --ranger m
[-1614285257]={"REVOLVER",12}, --ranger f
[-1286380898]={"medkit",1}, --medic
[307287994]={"meat",8}, --mountain lion
[-1788665315]={"meat",3}, --rottweiler
[-1286380898]={"bandage",1}, --medic
}
local inventory_items_chances={
water={chance=80,text="This water is ~r~spoiled~s~."},
juice={chance=15,text="This juice is ~r~spoiled~s~."},
soda={chance=25,text="This soda is ~r~spoiled~s~."},
alcohol={chance=45,text="This alcohol is ~r~spoiled~s~."},
canfood={chance=35,text="This canned food is ~r~spoiled~s~."},
food={chance=10,text="This food is ~r~spoiled~s~."},
pistolammo={chance=30,text="These cartriges are ~r~not suitable for use ~s~anymore."},
shotgunammo={chance=25,text="These cartriges are ~r~not suitable for use ~s~anymore."},
ammo={chance=20,text="These cartriges are ~r~not suitable for use ~s~anymore."},
heavyrifleammo={chance=60,text="These cartriges are ~r~not suitable for use ~s~anymore."},
cash={chance=30,text="There is ~r~nothing inside~s~."},
gasmask={chance=20,text="This ~r~gasmask is broken~s~."},
grenade={chance=20,text="These grenades are ~r~not suitable for use ~s~anymore."},
weed={chance=50,text="This weed is ~r~not suitable for use ~s~."},
bodyarmor={chance=50,text="This bodyarmor is ~r~not suitable for use ~s~anymore."},
}
local pickups_objects={
[-509973344]={"medkit",1,"bandage",2,solid=true},--wall medkit
[-742198632]={"water",10,solid=true}, --water cooler
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
[-54719154]={"food",10,"canfood",30,exp=true}, -- shop 30 canned and fod on low
[-220235377]={"soda",40,exp=true}, -- shop 40 soda
[643522702]={"alcohol",40,exp=true}, -- shop 40 alcohol
[1437777724]={"food",40,exp=true}, -- shop bread 
[-532065181]={"food",20,"chemicals",20,exp=true}, -- food and chem
[756199591]={"food",15}, -- shop gums
[2067313593]={"food",25}, -- shop long gums
[1404018125]={"alcohol",1}, -- green liquor
[-1461673141]={"alcohol",1}, -- orange blocky
[-169049173]={"alcohol",1}, -- black big alcohol
[1421582485]={"food",10,exp=true}, -- shop ponchiks
[-802238381]={"food",10}, -- fruits
[663958207]={"food",10}, -- shop guns shop type 3
[1238061242]={"alcohol",25,exp=true}, -- spoiled alcohol
[511490507]={"alcohol",100,exp=true}, -- spoiled alcohol
[-1766954369]={"alcohol",40,exp=true}, -- spoiled shelf
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

[1093460780]={"ammo",10}, --green open rifle thing
-- [2084498973]={"machete",1}, -- camo machete
-- [1179681321]={"machete",1}, -- black machete
[-1920611843]={"pistolammo",50}, --blue case
[1430410579]={"pistolammo",50}, --white case
[27391672]={"shotgunammo",40}, -- box
[-278834633]={"heavyrifleammo",50}, -- box
[1580014892]={"ammo",50}, --green closed rifle thing
[1936480843]={"pistolammo",50}, --green closed rifle thing
[-868490170]={"gasmask",1}, --green closed rifle thing
[701173564]={"bodyarmor",1,"armorplate",2}, --light cool black
[1111175276]={"bodyarmor",1,"armorplate",2}, --forest armor
[-1779214373]={"bodyarmor",1,"armorplate",2}, --right up armor
[-1497794201]={"bodyarmor",1,"armorplate",2}, --green armor
[2022153476]={"bodyarmor",1,"armorplate",2}, --sand armor

[-1422265815]={"grenade",5,"gunpowder",5}, --15green closed rifle thing
[1824078756]={"grenade",3,"gunpowder",5}, --10white closed rifle thing

[1158698200]={"engineparts",10}, --car battery
[-2124552702]={"engineparts",1}, --car black fix box
[-1532806025]={"gasoline",5}, --beige diesel
[-449200111]={"cash",100}, --100$ bill

[-1023683840]={"chemicals",1}, --barber 3 green small things
[-2140074399]={"medkit",1}, --barber medkit
[-1515174995]={"chemicals",3}, --barber 3 cyan
[-1133354853]={"chemicals",1}, --barber 1 red
[795984016]={"chemicals",1}, --barber 1 cyan white shampoo
[202070568]={"chemicals",1}, --barber 1 cyan

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

[-276344022]={"aircraftfuel",5}, --red xero
[786272259]={"gasoline",10}, --red metal canister
[309108893]={"gasoline",8}, --white ron
[544881832]={"chemicals",8}, --terroil
[-239954748]={"aircraftfuel",2}, --motoroil but ok

[-305885281]={"weed",3}, --weed small 
[452618762]={"weed",6}, --weed high

[-2031321722]={"revolver",1}, --sheriff station box handle with care
[-445408901]={"policedocs",1}, --sheriff PAPERS docs
[-1929385697]={"clothes_offdutysheriff",1,"cowboyhat",1}, --sheriff hat and clothes

[-1922399062]={"food",3}, --burger shot packet
[2127253708]={"juice",1}, --burger shot can

[-1130190827]={"bandits_records",1}, --plastic thing with lists
[1299967108]={"cues",1}, --wall cues

[-1326111298]={"engineparts",10}, --red big open tools
[-1674314660]={"engineparts",5}, --red closed tools
[1871266393]={"engineparts",5}, --black closed tools
[-738161850]={"engineparts",2}, --dark red closed

[1165008631]={"mre",10}, --military crate blue eagle mre
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
DecorRegister("zm_armor",3)
DecorRegister("zm_lastbone",3)

DecorRegister("zm_looted",2)
DecorRegister("post_apoc_car",2)
DecorRegister("zombie_type",3)
DecorRegister("zm_fuel",1)
DecorRegister("raider",2)
DecorRegister("questnpc",3)
DecorRegister("item",3)
DecorRegister("count",3)
DecorRegister("gasoline",3) --fuel truck tank
DecorRegister("scorched",2)
DecorRegister("dontdelete",3)
DecorRegister("quest_entity",3) --non zero means is quest and contains item, 0 means is quest but doesn't contain quest item

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
        if inventory.total<=inventory.rows then
            inventory.scroll=0
        elseif inventory.scroll*inventory.rows>=inventory.total then
            inventory.scroll=inventory.scroll-1
        end
    else
        SetResourceKvpInt("inventory_amount_"..inventory.current,inventory[inventory.current].amount)
    end
    SetResourceKvpInt("inventory_current",inventory.current)
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

local function give_item_to_inventory(add_name,add_amount)
    local add_to_slot=get_inventory_item_slot(add_name)
    --print("add_to_slot is")
    --print(add_to_slot)
    if add_to_slot then
        --print("add_to_slot _ true")
        inventory[add_to_slot].amount=inventory[add_to_slot].amount+add_amount
        SetResourceKvpInt("inventory_amount_"..add_to_slot,inventory[add_to_slot].amount)
        --print("set kvp int")
    else
        --print("add_to_slot _ false")
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
            --groups GetWeapontypeGroup
            -- melee      -728555052
            -- throwable  1548507267
            local wtg=GetWeapontypeGroup(hash)
            local ped=PlayerPedId()
            if wtg==1548507267 then
                local oldammo
                local has_weapon
                if not HasPedGotWeapon(ped,hash) then
                    has_weapon=false
                    oldammo=0
                else
                    has_weapon=true
                    oldammo=GetAmmoInPedWeapon(ped,hash)
                end
                GiveWeaponToPed(ped, hash, add_amount, false, false)
                if HasPedGotWeapon(ped,hash) and GetAmmoInPedWeapon(ped,hash)==oldammo+add_amount then
                    WriteNotification("You got ~g~"..(item_names[add_name] or localization[add_name] or add_name).."~s~.")
                    return true
                else
                    SetPedAmmo(ped,hash,oldammo)
                    if not has_weapon then
                        RemoveWeaponFromPed(ped,hash)
                    end
                    return false
                end
            else
                if add_amount<=1 and not HasPedGotWeapon(ped,hash) then
                    GiveWeaponToPed(ped, hash, 0, false, false)
                    WriteNotification("You got ~g~"..(item_names[add_name] or localization[add_name] or add_name).."~s~.")
                    return true
                else
                    return false
                end
            end
                    -- if HasPedGotWeapon(ped,hash) then
                        -- print("you now have weapon")
                        
                        -- return true
                    -- else print("failed to give weapon")
                        -- GiveWeaponToPed(ped, hash, 1, false, true)
                        -- if HasPedGotWeapon(ped,hash) then
                            -- WriteNotification("You got ~g~"..(item_names[add_name] or localization[add_name] or add_name).."~s~.")
                            -- return true
                        -- else
                            -- return false
                        -- end
                    -- end
                -- else
                    -- local oldammo=GetAmmoInPedWeapon(ped, hash)
                    -- GiveWeaponToPed(ped, hash, 1, false, true)
                    -- return (GetAmmoInPedWeapon(ped, hash)>oldammo)
                -- end
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
    --inventory.highlight=500
    return true
end

local function give_all_to_inventory(data)
    for i=1,#data,2 do
        give_item_to_inventory(data[i],data[i+1])
    end
end

local function can_fit_into_inventory(add_name,add_amount)
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
        --groups GetWeapontypeGroup
        -- melee      -728555052
        -- throwable  1548507267
        local wtg=GetWeapontypeGroup(hash)
        local ped=PlayerPedId()
        if wtg==1548507267 then
            local oldammo
            local has_weapon
            if not HasPedGotWeapon(ped,hash) then
                has_weapon=false
                oldammo=0
            else
                has_weapon=true
                oldammo=GetAmmoInPedWeapon(ped,hash)
            end
            GiveWeaponToPed(ped, hash, add_amount, false, true)
            if HasPedGotWeapon(ped,hash) and GetAmmoInPedWeapon(ped,hash)==oldammo+add_amount then
                SetPedAmmo(ped,hash,oldammo)
                if not has_weapon then
                    RemoveWeaponFromPed(ped,hash)
                end
                return true
            else
                SetPedAmmo(ped,hash,oldammo)
                if not has_weapon then
                    RemoveWeaponFromPed(ped,hash)
                end
                return false
            end
        else
            if add_amount<=1 and not HasPedGotWeapon(ped,hash) then
                return true
            else
                return false
            end
        end
    elseif (inventory.total<inventory.max) then
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

local function check_clothes(pped) --if true then return true end
    --if player.suit=="standard" then
        --ClearAllPedProps(pped)
        if player.suit~="standard" then
            if not get_inventory_item_slot("clothes_"..player.suit) and not IsPedDeadOrDying(pped) then
                player.suit="standard"
            end
        end
        local override={}
        local s=suits[player.suit]
        if player.mask and masks[player.mask] and s.mask then --change clothes to masks compatible
            for k,v in pairs(s.mask) do
                override[k]=v
            end
        end
        if player.hat and hats[player.hat] and s.hat then --change clothes to hats compatible
            for k,v in pairs(s.hat) do
                override[k]=v
            end
        end
        if player.mask and masks[player.mask].blockhat and not player.hat and s.hat then
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
        
        if player.mask and masks[player.mask] then --add mask to face
            for k,v in pairs(masks[player.mask]) do
                override[k]=v
            end
        end
        if player.hat and hats[player.hat] then --add prop to head
            if hats[player.hat].removehair then
                override[2]={var=1-1,tex=1-1}
            end
            SetPedPropIndex(pped, 0, hats[player.hat].var, hats[player.hat].tex, true);
        else
            ClearPedProp(pped,0)
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

local function change_clothes(ped,s)
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
    player.suit="standard"
    player.brasscatcher=false
    player.radio=false
    player.bleeding=0
    SetPedRelationshipGroupHash(ped,GetHashKey("NEUTRAL"))
    StopAudioScenes()
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetPedRelationshipGroupHash(ped,GetHashKey("NEUTRAL"))
    if lsm_random_spawn==1 then
        
        --SetPedRandomComponentVariation(ped)
        
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
            RequestModel(pedmodel)
            while not HasModelLoaded(pedmodel) do
                Wait(0)
                if not disablehud then
                    WriteText(4,"Loading model "..pedmodel,0.4,255,255,255,255,0.2,0.7)
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
end)
AddEventHandler('onClientMapStart', function()
  exports.spawnmanager:setAutoSpawn(true)
  exports.spawnmanager:forceRespawn()
end)

Citizen.CreateThread(function()
    for i=1,15 do
        EnableDispatchService(i,false)
    end
    NetworkSetTalkerProximity(50.0)
    
    local sniperrifles={
    [GetHashKey("weapon_sniperrifle")]=true,
    [GetHashKey("weapon_marksmanrifle")]=true,
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
        if not IsPedInAnyVehicle(pped) then
            local brightness
            if IsPedClimbing(pped) then
                brightness=100
            else
                brightness=255
            end
            mypos=GetEntityCoords(pped)
            handle,veh=FindFirstVehicle()
            loop=(handle~=-1)
            while loop do
                local fuel=(math.floor(DecorGetFloat(veh,"zm_fuel")-5)>0)--(math.floor(GetVehicleFuelLevel(veh)-5)>0)
                local engine
                local loot=not DecorExistOn(veh,"zm_looted")
                if DecorExistOn(veh,"scorched") then
                    --fuel=false
                    engine=false
                else
                    --fuel=(math.floor(DecorGetFloat(veh,"zm_fuel")-5)>0)--(math.floor(GetVehicleFuelLevel(veh)-5)>0)
                    engine=(math.floor(GetVehicleEngineHealth(veh)-no_engine_parts)>=100)
                end
                if (fuel or engine or loot) then
                    local vpos=GetEntityCoords(veh)
                    if #(mypos-vpos)<5.0 then
                        local model=GetEntityModel(veh)
                        local box1,box2=GetModelDimensions(model)
                        if fuel then
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                            if not not_on_screen then
                                SetTextCentre(true)
                                WriteText(font,"~g~E ~s~to take fuel",size,brightness,brightness,brightness,alpha,x,y)
                            end
                        end
                        if engine or loot then
                            if engine_at_front(veh,model) then
                                if false then--engine then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box2.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,"~g~E ~s~to take engine parts",size,brightness,brightness,brightness,alpha,x,y)
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
                                                WriteText(font,{"~g~E ~s~to take ~b~~1~ ~a~",count,name},size,brightness,brightness,brightness,alpha,x,y)
                                            else
                                                WriteText(font,{"~g~E ~s~to take ~b~~a~",name},size,brightness,brightness,brightness,alpha,x,y)
                                            end
                                        else
                                            WriteText(font,"~g~E ~s~to search for items",size,brightness,brightness,brightness,alpha,x,y)
                                        end
                                    end
                                end
                            else
                                if false then--engine then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box1.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,"~g~E ~s~to take engine parts",size,brightness,brightness,brightness,alpha,x,y)
                                    end
                                end
                                if loot then
                                    vpos=GetOffsetFromEntityInWorldCoords(veh,0,box2.y,0)
                                    local not_on_screen,x,y=N_0xf9904d11f1acbec3(vpos.x,vpos.y,vpos.z)
                                    if not not_on_screen then
                                        SetTextCentre(true)
                                        WriteText(font,"~g~E ~s~to search for items",size,brightness,brightness,brightness,alpha,x,y)
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
                local model=GetEntityModel(obj)
                local prop=pickups_objects[model]
                if prop~=nil then
                    if not prop.spoiled and not DecorExistOn(obj,"zm_looted") then
                        local objpos=GetEntityCoords(obj)
                        if #(objpos-mypos)<1.3 then
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(objpos.x,objpos.y,objpos.z)
                            if not not_on_screen then
                                local attached=GetEntityAttachedTo(obj)
                                if not IsEntityAPed(attached) or IsPedDeadOrDying(attached) then
                                    SetTextCentre(true)
                                    if prop[3] then
                                        WriteText(font,"~g~E ~s~to pick up ~g~"..prop[1].."~s~ and ~g~"..prop[3],size,255,255,255,alpha,x,y)
                                        WriteHint("~c~Press ~s~E ~c~to pick up ~g~"..prop[1].."~c~ and ~g~"..prop[3])
                                    else
                                        WriteText(font,"~g~E ~s~to pick up ~g~"..prop[1],size,255,255,255,alpha,x,y)
                                        WriteHint("~c~Press ~s~E ~c~to pick up ~g~"..prop[1])
                                    end
                                end
                            end
                        end
                    end
                end
                local doorkey=doormodels[model]
                if doorkey~=nil then
                    local doorpos=GetEntityCoords(obj)
                    if not get_inventory_item_slot(doorkey) then
                        FreezeEntityPosition(obj,true)
                        if #(doorpos-mypos)<2.0 then
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(doorpos.x,doorpos.y,doorpos.z)
                            if not not_on_screen then
                                WriteText(font,"You need ~g~"..item_names[doorkey].." ~s~to unlock this door",0.3,255,255,255,200,x,y)
                            end
                        end
                    else
                        FreezeEntityPosition(obj,false)
                    end
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
                    if not get_inventory_item_slot(doorkey) then
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


Citizen.CreateThread(function()
    local loop,handle,veh,rand,ped,class
    while true do
        handle,veh=FindFirstVehicle()
        loop=(handle~=-1)
        local player_peds
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
                    if (rand&800)~=0 then
                        SetEntityRenderScorched(veh,true)
                        SetEntityInvincible(veh,true)
                        DecorSetBool(veh,"scorched",true)
                        if GetVehicleEngineHealth(veh)>-3999.9 then
                            SetVehicleEngineHealth(veh,-3999.99)
                        end
                    else --25%
                        rand=400+(rand&255)
                        if GetVehicleEngineHealth(veh)>rand then
                            if (rand%10)==0 then
                                SetVehicleEngineHealth(veh,rand-.1)
                            else
                                --SetVehicleUndriveable(veh,true)
                                SetEntityRenderScorched(veh,true)
                                --SetEntityInvincible(veh,true)
                                DecorSetBool(veh,"scorched",true)
                                SetVehicleEngineHealth(veh,-3999.99)
                            end
                        end
                        rand=(rand&31)*0.3225--+5.0
                        SetVehicleFuelLevel(veh,rand)
                        DecorSetFloat(veh,"zm_fuel",rand)
                    end
                    SetVehicleEngineOn(veh, false, true, false)
                    --SetVehicleHandbrake(veh,true)
                    SetVehicleHalt(veh, 0.1, 1, false);
                    DecorSetBool(veh,"post_apoc_car",true)
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
            else
                if not DecorExistOn(veh,"post_apoc_car") then
                    if GetIsVehicleEngineRunning(veh) then
                        SetEntityAsMissionEntity(veh)
                        DeleteEntity(veh)
                    else
                        DecorSetBool(veh,"post_apoc_car",true)
                    end
                end
                
            end
            local vpos=GetEntityCoords(veh)
            if player_peds==nil then player_peds=get_player_peds() end
            if dist_to_closest_point(player_peds,vpos)>90000.0 then
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

Citizen.CreateThread(function()
    local color={}
    color.bkg=20
    color.bar=150
    color.barlight=200
    color.bardark=50
    while true do Wait(0)
        local myped=PlayerPedId()
        -- DrawRect(0.9,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200) -- health bkg
        -- DrawRect(0.9,0.9+0.000975*0.5*(100-player.health),0.004,0.000975*player.health,color.bar,color.bar,color.bar,200) -- health bar
        -- --DrawRect(0.902,0.9,0.0005,0.0975,color.barlight,color.barlight,color.barlight,200) -- health light
        -- --DrawRect(0.898,0.9,0.0005,0.0975,color.bardark,color.bardark,color.bardark,200) -- health dark
        if not disablehud then
            local fuel
            if IsPedInAnyVehicle(myped) then
                DrawRect(0.925,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200)
                local veh=GetVehiclePedIsUsing(myped)
                if DecorExistOn(veh,"zm_fuel") then
                    fuel=DecorGetFloat(veh,"zm_fuel")
                else
                    fuel=GetVehicleFuelLevel(veh)
                end
                --WriteHint("fuel is "..fuel)
                if fuel>5 then fuel=fuel-5 end
                fuel=fuel*1.333333333
                DrawRect(0.925,0.9+0.000975*0.5*(100-fuel),0.004,0.000975*fuel,color.bar,color.bar,color.bar,200) --
            end
            -- --DrawRect(0.927,0.9,0.0005,0.0975,color.barlight,color.barlight,color.barlight,200)
            -- --DrawRect(0.923,0.9,0.0005,0.0975,color.bardark,color.bardark,color.bardark,200)
        
            DrawRect(0.95,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200) -- hydration bkg
            DrawRect(0.95,0.9+0.000975*0.5*(100-player.hydration),0.004,0.000975*player.hydration,color.bar,color.bar,color.bar,200) -- hydration bar
            
            DrawRect(0.975,0.9,0.005,0.1,color.bkg,color.bkg,color.bkg,200) -- saturation bkg
            DrawRect(0.975,0.9+0.000975*0.5*(100-player.saturation),0.004,0.000975*player.saturation,color.bar,color.bar,color.bar,200) -- saturation bar
        
            if HasStreamedTextureDictLoaded("lsm") then
                -- DrawSprite("lsm", "heart", 0.9,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
                if fuel~=nil then
                    DrawSprite("lsm", "fuelmeter", 0.925,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
                end
                DrawSprite("lsm", "hydration", 0.950,0.975,0.0166666667,0.025,0.0, 255, 255, 255, 255)
                DrawSprite("lsm", "saturation", 0.975,0.975,0.0166666667,0.0296296296,0.0, 255, 255, 255, 255)
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
                            if inventory[i].item=="brasscatcher" and player.brasscatcher then r_color=50 g_color=150 end
                            if inventory[i].item=="radio" and player.radio then r_color=50 g_color=150 end
                            if inventory[i].item=="bodyarmor" and player.bodyarmor then r_color=50 g_color=150 end
                            local s=player.suit
                            if s then
                            if inventory[i].item=="clothes_"..s and player.suit==s then r_color=50 g_color=150 end
                            end
                            local x=(inventory.total+1-i-i)*.025*temp_scale+.5
                            DrawSprite("lsm", inventory[i].item, x,0.90+0.02,
                            inv_sml_x*temp_scale,
                            inv_sml_y*temp_scale,
                            0.0, r_color,g_color, 255, highlight)
                            
                            SetTextCentre(true)
                            WriteText(7,inventory[i].amount,0.5*temp_scale,160,160,160,highlight,x,0.93+0.02)
                            
                            name=inventory[i].item
                            if name~=nil then
                                SetTextCentre(true)
                                WriteText(7,(item_names[name] or name),0.2*temp_scale,160,160,160,highlight,x,0.85+0.02)
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
                            WriteText(7,inventory[i].amount,0.75*temp_scale,255,255,255,highlight,x,0.945)
                            
                            name=inventory[i].item
                            if name~=nil then
                                SetTextCentre(true)
                                WriteText(7,(item_names[name] or name),0.35*temp_scale,255,255,255,highlight,x,0.825)
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
            if true then
                if HasStreamedTextureDictLoaded("lsm") then
                    DrawSprite("lsm","backpack",.65,.5,0.25,0.7,0.0, 255, 255, 255, 255)
                else
                    RequestStreamedTextureDict("lsm")
                end
                
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
                
                WriteText(2,"~c~Alignment ~s~"..relationship_name[GetPedRelationshipGroupHash(myped)],inventory_font_size,255,255,255,255,inventory_up_x_left,inventory_up_y)
                SetTextRightJustify(true)
                SetTextWrap(inventory_up_x_left,inventory_up_x_right)
                local g_b=255
                if (player.weight>player.maxweight) then g_b=100 end
                WriteText(4,"~c~WEIGHT ~s~"..tostring(player.weight).."~c~/"..tostring(player.maxweight).." KG",inventory_font_size,255,g_b,g_b,255,inventory_up_x_right,inventory_up_y)
                
                local curitem=inventory.current
                
                DrawSprite("lsm", "selected_item", inventory_grid_desc_pos_x,inventory_grid_desc_pos_y,inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
                if inventory[curitem] then
                    WriteText(2,item_names[inventory[curitem].item],inventory_font_size,255,255,255,255,inventory_down_x_left,inventory_down_y_name)
                    SetTextWrap(inventory_down_x_left,inventory_down_x_right)
                    WriteText(4,item_descriptions[inventory[curitem].item],inventory_font_size,155,155,155,155,inventory_down_x_left,inventory_down_y_desc)
                    DrawSprite("lsm", inventory[curitem].item, inventory_grid_desc_pos_x,inventory_grid_desc_pos_y,inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
                else
                    WriteText(2,"Empty",inventory_font_size,255,255,255,255,inventory_down_x_left,inventory_down_y_name)
                    SetTextWrap(inventory_down_x_left,inventory_down_x_right)
                    WriteText(2,"You have nothing in your inventory",inventory_font_size,155,155,155,155,inventory_down_x_left,inventory_down_y_desc)
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
                        or inventory[i].item=="brasscatcher" and player.brasscatcher
                        or inventory[i].item=="radio" and player.radio
                        or inventory[i].item=="bodyarmor" and player.bodyarmor
                        then 
                            sprite="selected_equipped_item" 
                        end
                        local s=player.suit
                        if s then
                            if inventory[i].item=="clothes_"..s and player.suit==s then 
                                sprite="selected_equipped_item"
                            end
                        end
                    else 
                        sprite="item" 
                        if player.hat==inventory[i].item 
                        or player.mask==inventory[i].item 
                        or inventory[i].item=="brasscatcher" and player.brasscatcher
                        or inventory[i].item=="radio" and player.radio
                        or inventory[i].item=="bodyarmor" and player.bodyarmor
                        then 
                            sprite="equipped_item" 
                        end
                        local s=player.suit
                        if s then
                            if inventory[i].item=="clothes_"..s and player.suit==s then 
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
                    
                    DrawSprite("lsm", inventory[i].item, 
                    x,
                    y,
                    inv_new.item_scl_x,inv_new.item_scl_y,0.0,255,255,255,255)
                    
                    SetTextRightJustify(true)
                    SetTextWrap(
                    x-(inv_new.item_scl_x/2),
                    x+(inv_new.item_scl_x/2)-0.001)
                    WriteText(2,inventory[i].amount,inventory_font_size,255,255,255,255,
                    (inventory_grid_left+(inv_new.item_scl_x/2))+(((inv_i-1)%inventory.rows)*inventory_grid_dist_x),
                    inventory_grid_up+(math.floor((inv_i-1)/inventory.rows)*inventory_grid_dist_y)+0.01
                    )
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
                    WriteText(4,"Scavenger",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
                elseif GetPedRelationshipGroupHash(myped)==GetHashKey("MARAUDER") then
                    WriteText(4,"Marauder",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
                elseif GetPedRelationshipGroupHash(myped)==GetHashKey("SURVIVOR") then
                    WriteText(4,"Survivor",0.5,155,155,155,255,pos_x-((scale_x/2)-0.045),pos_y-0.04-(scale_y*.5))
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
                    DrawSprite("lsm","backpack",.65,.5,0.25,0.7,0.0, 255, 255, 255, 255)
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
                                DrawSprite("lsm", inventory[i].item, x,y,
                                inv_sml_x,
                                inv_sml_y,
                                0.0, 
                                r_color, 
                                g_color, 
                                255, 
                                255)
                                
                                SetTextCentre(true)
                                WriteText(4,inventory[i].amount,0.5,100,100,100,255,x,y+0.025)
                            
                                SetTextCentre(true)
                                WriteText(4,(item_names[name] or name),0.4,100,100,100,255,x,y-0.06)
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
                                DrawSprite("lsm", inventory[i].item, x,y,
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
                                    DrawSprite("lsm", inventory[i].item, desc_tex_x,desc_tex_y,
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
                                WriteText(4,inventory[i].amount,0.5,255,255,255,255,x,y+0.025)
                            
                                SetTextCentre(true)
                                WriteText(4,(item_names[name] or name),0.4,255,255,255,255,x,y-0.06)
                            end
                        end
                    end
                end
            end
        end
    end
end)

--suits managment
Citizen.CreateThread(function()
    while true do Wait(0)
        local myped=PlayerPedId()
        if player.suit~=nil then
            if player.suit=="explorer" then
                local myhealth=GetEntityHealth(myped)
                if myhealth<150 then
                    SetEntityHealth(myped,myhealth+1)
                    Wait(3000)
                end
            elseif player.suit=="mercenary" then
                -- local clipset="clipset@move@trash_fast_turn"
                -- RequestClipSet(clipset)
                -- SetPedMovementClipset(pped,clipset ,1.0)
                --ResetPlayerStamina(PlayerId())
                SetPlayerSprint(PlayerId(),false)
                SetPlayerMeleeWeaponDefenseModifier(PlayerId(),1.2+0.1)
                SetPlayerWeaponDefenseModifier(PlayerId(),0.7+0.1)
            elseif player.suit=="banditmercenary" then
                SetPlayerSprint(PlayerId(),false)
                SetPlayerMeleeWeaponDefenseModifier(PlayerId(),0.9+0.1)
                SetPlayerWeaponDefenseModifier(PlayerId(),0.7+0.1)
            elseif player.suit=="banditgoon" then
                SetPlayerSprint(PlayerId(),true)
                SetPlayerMeleeWeaponDefenseModifier(PlayerId(),0.75+0.1)
                SetPlayerWeaponDefenseModifier(PlayerId(),0.9+0.1)
            elseif player.suit=="dawn" then
                SetPlayerSprint(PlayerId(),true)
                SetPlayerMeleeWeaponDefenseModifier(PlayerId(),0.4+0.1)
                SetPlayerWeaponDefenseModifier(PlayerId(),0.9+0.1)
            else
                SetPlayerSprint(PlayerId(),true)
                SetPlayerMeleeWeaponDefenseModifier(PlayerId(),0.9+0.1)
                SetPlayerWeaponDefenseModifier(PlayerId(),0.9+0.1)
                Wait(3000)
            end
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
        local sumweight=0.0
        if inventory.total>0 then
            for i=1,inventory.total do
                local item_weight=item_weight[inventory[i].item]
                if item_weight then
                    sumweight=sumweight+(item_weight*inventory[i].amount)
                end
            end
            player.weight=sumweight
        else
            player.weight=0.0
        end
    end
end)

--stats management
Citizen.CreateThread(function()
    local oldhealth=0
    while true do Wait(1500)
        
        local pped=PlayerPedId()
        --WriteText(7,tonumber(GetPlayerSprintStaminaRemaining(PlayerId())),0.4,255,255,255,255,0.5,0.5) 
        if player.hydration>=0.01 then
            player.hydration=player.hydration-0.105
            if (player.weight>player.maxweight) then
                player.hydration=player.hydration-0.210
            end
        else
            SetEntityHealth(pped,GetEntityHealth(pped)-1)
            -- SetPlayerSprint(PlayerId(),true)
            -- if GetPlayerSprintStaminaRemaining(PlayerId())>0.01 then
                -- RestorePlayerStamina(PlayerId(),1.0)
                -- player.hydration=player.hydration-0.2
            -- end
        -- else
            -- SetPlayerSprint(PlayerId(),false)
        end
        if player.saturation>=0.01 then
            player.saturation=player.saturation-0.06
            if (player.weight>player.maxweight) then
                player.saturation=player.saturation-0.12
            end
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
            player.drunk=player.drunk-0.03
            SetGameplayCamShakeAmplitude(player.drunk)
        end
        if player.bleeding>0 then
            SetEntityHealth(pped,GetEntityHealth(pped)-player.bleeding)
            RequestClipSet("move_injured_generic")
            SetPedMovementClipset(pped,"move_injured_generic" ,1.0)
            --SetPedStrafeClipset(pped,"move_injured_generic")
        else
            ResetPedMovementClipset(pped,1.0)
            --ResetPedStrafeClipset(pped)
        end
        if oldhealth-health>5 then
            player.bleeding=player.bleeding+1
        end
        oldhealth=health
        -- if player.bleeding>0 then
            -- if player.hydration>0.01 then
                -- player.hydration=player.hydration-0.1
            -- end
            -- if player.blood>0.01 then
                -- player.blood=player.blood-player.bleeding*0.15
            -- end
        -- elseif player.hydration>0.0001 then
            -- if player.hydration>0.01 then
                -- player.hydration=player.hydration-0.1
            -- end
            -- if player.blood<100.01 then
                -- player.blood=player.blood+0.1
            -- end
        -- end
        -- if player.blood<=0.01 then
            -- SetEntityHealth(pped,GetEntityHealth(pped)-5)
        -- end
        
        check_clothes(pped)
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
            if DecorExistOn(pveh,"scorched") or not DecorExistOn(pveh,"zm_fuel") then
                SetVehicleFuelLevel(pveh,0.0)
                --DecorSetFloat(pveh,"zm_fuel",0.0)
            elseif DecorGetFloat(pveh,"zm_fuel")>5.0 then
                local fuel=(DecorGetFloat(pveh,"zm_fuel")-(0.004*GetVehicleCurrentRpm(pveh))) --0.005
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
        if player.radio and not IsPedDeadOrDying(myped) then
            if get_inventory_item_slot("radio") then
                NetworkSetTalkerProximity(math.random(7000,12000)+0.1)
            else
                NetworkSetTalkerProximity(50.0)
                player.radio=false
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
    if true then --load quests
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
                        local dist=#(mypos-npcpos)
                        if dist<3 then
                            local talking=false
                            local headshot
                            if not disablehud then
                                WriteHint("~c~Press ~g~E ~c~to talk")
                                local not_on_screen,x,y=N_0xf9904d11f1acbec3(npcpos.x,npcpos.y,npcpos.z+1.0)
                                if not not_on_screen then
                                    SetTextCentre(true)
                                    WriteText(2,"~g~E ~s~to talk",0.3,255,255,255,200,x,y)
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
                                dist=#(mypos-npcpos)
                                if dist>3 then
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
                                                    WriteNotification("Retrieve ~y~"..(item_names[v.i] or v.i))
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
                                                            WriteText(2,"~g~E ~s~to search for ~b~"..item_names[v.i],0.3,255,255,255,200,x,y)
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
                                                                        WriteNotification("Return ~y~"..(item_names[v.i] or v.i).." ~s~to ~g~"..(v.zone and v.zone.name or "base"))
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
                                                    WriteNotification("Retrieve ~y~"..(item_names[v.i] or v.i))
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
                                                        WriteNotification("Retrieve ~y~~a~",(item_names[v.i] or v.i))
                                                        SetBlipColour(AddBlipForEntity(veh),5)
                                                        --,47)
                                                        NetworkRequestControlOfEntity(veh)
                                                        while not NetworkHasControlOfEntity(veh) do
                                                            WriteHint("debug: trying to mark target")
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
                                        WriteNotification("There is no car, I should return to ~g~~a~ ~s~and report about it",(v.zone and v.zone.name or "base"))
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
                                    WriteHint("~c~Search the area for car")
                                end
                            end
                        end
                    end
                else
                    WriteHint("~r~ERROR! ~s~Quest type "..v.t.." is ~r~not implemented!")
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


local prop_mb_crate_01a=GetHashKey("prop_mb_crate_01a")
local ammo_types={
ammo=218444191,
pistolammo=1950175060,
shotgunammo=-1878508229,
heavyrifleammo=1285032059,
flaregunammo=1173416293,
}
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
    local function try_to_load_garage()
        if vehiclesave==nil or vehiclesave.model==nil then
            local kvp_car_model=GetResourceKvpInt("garage_1_model")
            if kvp_car_model~=nil and kvp_car_model~=0 then
                vehiclesave={}
                vehiclesave.model=kvp_car_model
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
        end
    end
    while true do Wait(0)
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
        if true then
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
                    local dist=#(mypos-npcpos)
                    if dist<3 then
                        local talking=false
                        local headshot
                        if not disablehud then
                            WriteHint("~c~Press ~g~E ~c~to talk")
                            local not_on_screen,x,y=N_0xf9904d11f1acbec3(npcpos.x,npcpos.y,npcpos.z+1.0)
                            if not not_on_screen then
                                SetTextCentre(true)
                                WriteText(2,"~g~E ~s~to talk",0.3,255,255,255,200,x,y)
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
                            dist=#(mypos-npcpos)
                            if dist>3 then
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
        
        
        
        if IsControlJustPressed(0,86) then
            --print("e pressed")
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
            local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
            if IsPedInAnyVehicle(pped) then 
                if zone~=nil and not zone.raided and zone.vehpos~=nil and in_radius(mypos,zone.vehpos,5) then
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
                        DrawRect(0.25,0.65,0.2,0.6,0,0,0,175)
                        DrawRect(0.25,0.40,0.2,0.1,0,150,200,255) --blue header
                        SetTextCentre(true)
                        WriteText(7,"Vehicle modification",1.0,255,255,255,255,0.25,0.375)
                        
                        local txt_pos=0.428+0.025
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
                                    WriteTextNoOutline(4,current.." / "..variations.." >",0.35,0,0,0,alpha,0.285,txt_pos) --chosen line text
                                    --WriteTextNoOutline(4,"E "..texture.." / "..textures,0.35,0,0,0,alpha,0.315,0.428+.025+i*.025) --chosen line text
                                else
                                    WriteTextNoOutline(2,component_name[i],0.35,255,255,255,alpha,0.16,txt_pos) --not chosen line text
                                    --if (variations~=0) then current=current+1 end
                                    WriteTextNoOutline(4,current.." / "..variations,0.35,255,255,255,alpha,0.285,txt_pos) --not chosen line text
                                end
                                txt_pos=txt_pos+0.025
                            end
                        end
                        
                    end
                end
                if zone~=nil and not zone.raided and zone.garagepos~=nil and in_radius(mypos,zone.garagepos,5) then
                    if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
                        try_to_load_garage()
                        if vehiclesave~=nil and vehiclesave.model~=nil then
                            WriteNotification("You already have ~g~"..GetDisplayNameFromVehicleModel(vehiclesave.model).." ~s~in garage.")
                        else
                            -- place in garage
                            local flags=0
                            local myped=PlayerPedId()
                            local myveh=GetVehiclePedIsIn(myped)
                            vehiclesave={
                            model=GetEntityModel(myveh),
                            enginehp=GetVehicleEngineHealth(myveh),
                            fuellevel=GetVehicleFuelLevel(myveh),
                            }
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
                    else
                        WriteNotification("You cannot use enemy garages.")
                    end
                end
            elseif zone~=nil and not zone.raided and zone.garagepos~=nil and in_radius(mypos,zone.garagepos,5) then
                -- load car from garage
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
                    try_to_load_garage()
                    if vehiclesave~=nil and vehiclesave.model~=nil then
                        local vs=vehiclesave
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
                            local myveh=CreateVehicle(vs.model, mypos.x, mypos.y, mypos.z, zone.garagepos.angle, true, false)
                            if myveh~=0 then
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
                                WriteNotification("Can't spawn vehicle, try again.")
                            end
                        else
                            WriteNotification("You don't have anything in your garage.")
                        end
                    else
                        WriteNotification("You don't have anything in your garage.")
                    end
                else
                    WriteNotification("You cannot use enemy garages.")
                end
            elseif zone~=nil and not zone.raided and zone.vehpos~=nil and in_radius(mypos,zone.vehpos,5) then
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
                            WriteNotification("Your ~r~inventory is full~s~, you can't take anything.")
                        end
                    end
                else
                    WriteNotification("You cannot receive new free provision yet.")
                end
            elseif zone~=nil and not zone.raided and zone.tradepos~=nil and in_radius(mypos,zone.tradepos,5) then
                --trade
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
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
                        if IsControlJustPressed(0,177) or not in_radius(mypos,zone.tradepos,3) then
                            break
                        elseif IsControlJustPressed(0,173) then --down
                            if current_trade<#zone.trade then
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
                                current_trade=#zone.trade
                                scroll=current_trade-maxtradesinmenu+1
                            end
                        elseif IsControlJustPressed(0,86) then --e veh horn
                            --print(zone.trade[current_trade][4].." you have:"..youhaveamount_price)
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
                        DrawSprite("lsm","Notebook",.35,.5,0.25,0.7,0.0, 255, 255, 255, 255)
                        DrawSprite("lsm","trading_icon",0.296,0.1945,0.017,0.03,0.0, 255, 255, 255, 255)
                        WriteTextNoOutline(2,"Trading post",0.4,0,0,0,255,0.307,0.18)
                        WriteTextNoOutline(2,"Item",0.3,0,0,0,255,0.290,0.24)
                        WriteTextNoOutline(2,"Price",0.3,0,0,0,255,0.40,0.24)
                        
                        local price_items_x=0.410
                        local trade_button_x=0.445
                        local trade_arrow_x=trade_button_x-0.06
                        
                        DrawRect(trade_scroll_bkg_x,trade_scroll_bkg_y,trade_scroll_bkg_size_x,trade_scroll_bkg_size_y,0,0,0,175)
                        
                        local totalscrolls=#zone.trade-maxtradesinmenu
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
                        
                        for i=scroll,math.min(scroll+(maxtradesinmenu-1),#zone.trade) do
                            local y=(i+i-#zone.trade-scroll-scroll)*.04+0.70
                                DrawSprite("lsm", zone.trade[i][1],0.305,y,(inv_new.item_scl_x)*0.875,(inv_new.item_scl_y)*0.875,0.0, 255, 255, 255, 255)
                                SetTextWrap(0.325,trade_arrow_x-0.005)
                                WriteTextNoOutline(2,item_names[zone.trade[i][1]],0.3,0,0,0,255,0.325,y-0.01)
                                SetTextCentre(true)
                                WriteTextNoOutline(2,"x "..zone.trade[i][2],0.25,0,0,0,255,0.305,y+0.02)
                                
                                DrawSprite("lsm", zone.trade[i][3],price_items_x,y,(inv_new.item_scl_x)*0.875,(inv_new.item_scl_y)*0.875,0.0, 255, 255, 255, 255)
                                SetTextCentre(true)
                                WriteTextNoOutline(2,"x "..zone.trade[i][4],0.25,0,0,0,255,price_items_x,y+0.02)
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
                elseif GetRelationshipBetweenGroups(myfaction,zone.relationship)~=5 then
                    WriteNotification("You need to be in this faction in order to trade.")
                elseif GetRelationshipBetweenGroups(myfaction,zone.relationship)==5 then
                    --zone.raided=true
                    --TriggerServerEvent("zoneraided",zone.tradepos.x,zone.tradepos.y,zone.tradepos.z,zone.name,zone.trade,zone.relationship)
                    WriteNotification("You need to be in this faction in order to trade.")
                    
                    Wait(300)
                end
            elseif zone~=nil and not zone.raided and zone.ransack~=nil and in_radius(mypos,zone.ransack,1) then 
                if (GetRelationshipBetweenGroups(myfaction,zone.relationship)<=4) then
                    WriteNotification("This is base warehouse. Become enemy with faction to start raid.")
                else
                    WriteNotification("You started safezone raid.")
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
                                        WriteText(4,zone.quests.novice..zone.quests[questid].text,0.4,255,255,255,255,0.27,0.35)
                                    else
                                        WriteText(4,zone.quests.join_text..zone.quests[questid].text,0.4,255,255,255,255,0.27,0.35)
                                    end
                                    WriteText(4,"Required items:",0.4,255,255,255,255,0.27,0.6)
                                    SetTextWrap(0.27,0.73)  
                                    SetTextRightJustify(true)
                                    WriteText(4,"Reward:",0.4,255,255,255,255,0.73,0.6)
                                    for i=1,#zone.quests[questid].items_reward,2 do
                                        SetTextWrap(0.27,0.73)  
                                        SetTextRightJustify(true)
                                        WriteText(2,"~g~"..zone.quests[questid].items_reward[i].." ~s~x"..zone.quests[questid].items_reward[i+1],0.3,255,255,255,255,0.73,0.62+(i*0.01))
                                    end
                                    if do_we_have_all_that(zone.quests[questid].items_required) then
                                        WriteText(4,"Press ~g~E ~s~to give required items.",0.4,255,255,255,255,0.27,0.8)
                                        if IsControlJustPressed(0,86) then
                                            remove_all_that(zone.quests[questid].items_required)
                                            Wait(0)
                                            WriteNotification("~g~You've finished quest.")
                                            player.reputation=player.reputation+zone.quests[questid].rep_bonus
                                            SetResourceKvpInt("reputation",player.reputation)
                                            WriteNotification("Reputation ~g~+"..zone.quests[questid].rep_bonus)
                                            if can_fit_all_into_inventory(zone.quests[questid].items_reward) then
                                                give_all_to_inventory(zone.quests[questid].items_reward)
                                            end
                                            if myfaction~=zone.relationship then
                                                SetPedRelationshipGroupHash(myped,zone.relationship)
                                                myfaction=GetPedRelationshipGroupHash(myped)
                                                WriteNotification("~g~You've joined "..relationship_names[zone.relationship])
                                            end
                                            questid=math.random(1,#zone.quests)
                                        end
                                    else
                                        WriteText(4,"You don't have required items.",0.4,255,255,255,255,0.27,0.8)
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
                                            WriteText(4,item_names[item].." x"..zone.quests[questid].items_required[i+1],0.4,color,color,color,255,.27+i*0.04,.75)
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
                                WriteText(4,"You need to have "..zone.join_faction.rep_amount-player.reputation.." more reputation.",0.4,255,255,255,255,0.35,0.35)
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
                        local enough=do_we_have_all_that(zone.crafts[current_menu][3])
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
                            if give_item_to_inventory(zone.crafts[current_menu][1],zone.crafts[current_menu][2]) then
                                remove_all_that(zone.crafts[current_menu][3])
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
                        local txt=zone.crafts[i][1]
                        if not do_we_have_all_that(zone.crafts[i][3]) then
                            txt="~c~"..txt
                        end
                        if zone.crafts[i][2]~=1 then
                            txt=txt.." ~c~x"..zone.crafts[i][2]
                        end
                        if i==current_menu then
                            WriteTextNoOutline(2,txt,0.35,0,0,0,255,0.16,0.428+i*.025) --chosen line text
                        else
                            WriteTextNoOutline(2,txt,0.35,255,255,255,255,0.16,0.428+i*.025) --not chosen line text
                        end
                    end
                    local item,have,need
                    for i=1,#zone.crafts[current_menu][3],2 do
                        item=zone.crafts[current_menu][3][i]
                        have=get_inventroy_item_amount(item)
                        need=zone.crafts[current_menu][3][i+1]
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
                    elseif inventory[inventory.current].item=="gasoline" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
                            local vehclass=GetVehicleClass(pveh)
                            if vehclass~=15 and vehclass~=16 then
                                if GetPedInVehicleSeat(pveh,-1)==pped then
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
                                else
                                    WriteNotification("You must be in driver seat to refuel vehicle.")
                                end
                            else
                                WriteNotification("You need aircraft fuel for that vehicle.")
                            end
                        end
                    elseif inventory[inventory.current].item=="aircraftfuel" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
                            local vehclass=GetVehicleClass(pveh)
                            if vehclass==15 or vehclass==16 then
                                if GetPedInVehicleSeat(pveh,-1)==pped then
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
                                else
                                    WriteNotification("You must be in driver seat to refuel vehicle.")
                                end
                            else
                                WriteNotification("This fuel can be used only in aircraft vehicles.")
                            end
                        end
                    elseif inventory[inventory.current].item=="engineparts" then
                        if IsPedInAnyVehicle(pped) then
                            local pveh=GetVehiclePedIsIn(pped)
                            if GetPedInVehicleSeat(pveh,-1)==pped then
                                if NetworkHasControlOfEntity(pveh) then
                                    if GetVehicleEngineHealth(pveh)<1000.0 then
                                        SetVehicleEngineHealth(pveh,GetVehicleEngineHealth(pveh)+100.0)
                                        inventory[inventory.current].amount=inventory[inventory.current].amount-1
                                        check_inv_slot_for_zero_amount()
                                    else
                                        WriteNotification("Vehicle engine is in perfect condition.")
                                    end
                                else
                                    NetworkRequestControlOfEntity(pveh)
                                end
                            else
                                WriteNotification("You must be in driver seat to repair vehicle.")
                            end
                        end
                    elseif inventory[inventory.current].item=="ammo" then --rifle
                        give_ammo(pped,218444191)
                    elseif inventory[inventory.current].item=="pistolammo" then
                        give_ammo(pped,1950175060)
                    elseif inventory[inventory.current].item=="shotgunammo" then
                        give_ammo(pped,-1878508229)
                    elseif inventory[inventory.current].item=="heavyrifleammo" then
                        give_ammo(pped,1285032059)
                    elseif inventory[inventory.current].item=="flaregunammo" then
                        give_ammo(pped,1173416293)
                    elseif inventory[inventory.current].item=="smgammo" then
                        give_ammo(pped,1820140472)
                    elseif inventory[inventory.current].item=="mgammo" then
                        give_ammo(pped,1788949567)
                    elseif inventory[inventory.current].item=="launchergrenade" then
                        give_ammo(pped,1003267566)
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
                    elseif inventory[inventory.current].item=="cowboyhat" then
                        if player.hat=="cowboyhat" then 
                            player.hat=nil
                        else
                            player.hat="cowboyhat"
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
                    elseif inventory[inventory.current].item=="rags" then
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
                            WriteNotification("You need bodyarmor to insert armor plate in.")
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
                            player.suit="standard"
                        else
                            player.suit="marauder"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_scavenger" then
                        if player.suit=="scavenger" then
                            player.suit="standard"
                        else
                            player.suit="scavenger"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_banditauthority" then
                        if player.suit=="banditauthority" then
                            player.suit="standard"
                        else
                            player.suit="banditauthority"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_dawn" then
                        if player.suit=="dawn" then
                            player.suit="standard"
                        else
                            player.suit="dawn"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_camouflage" then
                        if player.suit=="camouflage" then
                            player.suit="standard"
                        else
                            player.suit="camouflage"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_offdutysheriff" then
                        if player.suit=="offdutysheriff" then
                            player.suit="standard"
                        else
                            player.suit="offdutysheriff"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_explorer" then
                        if player.suit=="explorer" then
                            player.suit="standard"
                        else
                            player.suit="explorer"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_mercenary" then
                        if player.suit=="mercenary" then
                            player.suit="standard"
                        else
                            player.suit="mercenary"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_banditgoon" then
                        if player.suit=="banditgoon" then
                            player.suit="standard"
                        else
                            player.suit="banditgoon"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_police" then
                        if player.suit=="police" then
                            player.suit="standard"
                        else
                            player.suit="police"
                        end
                        check_clothes(pped)
                    elseif inventory[inventory.current].item=="clothes_banditmercenary" then
                        if player.suit=="banditmercenary" then
                            player.suit="standard"
                        else
                            player.suit="banditmercenary"
                        end
                        check_clothes(pped)
                    elseif weapon_upgrades[inventory[inventory.current].item] then
                        if use_weapon_upgrade(inventory[inventory.current].item) then
                            inventory[inventory.current].amount=inventory[inventory.current].amount-1
                            check_inv_slot_for_zero_amount()
                        end
                    end
                end
                inventory.highlight=500
            elseif IsControlJustPressed(0,214) then --INPUT_FRONTEND_DELETE
                if not IsPedInAnyVehicle(pped) and inventory.highlight>0 and inventory[inventory.current]~=nil and inventory[inventory.current].amount>0 then
                    if inventory.mode then inventory.highlight=0 end
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
        else--if inventory.mode then
            if IsControlJustPressed(0,191) then
                inventory.highlight=500
            elseif IsControlJustPressed(0,177) then
                inventory.highlight=0
            end
        end
    end
end)






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
    local ransackblip
    local joinfactionblip
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
            if oldzone~=nil and oldzone.name~=nil then
                WriteNotification("You left "..oldzone.name..".")
                --print("you exited zone")
                --DisplayRadar(true)
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
                        SetBlipColour(traderblip,2)
                        if enemybase then SetBlipColour(traderblip,55) end
                    end
                end
                if zone.ransack~=nil and not zone.raided then
                    if ransackblip~=nil then
                        SetBlipCoords(ransackblip,zone.ransack.x,zone.ransack.y,zone.ransack.z)
                    else
                        ransackblip=AddBlipForCoord(zone.ransack.x,zone.ransack.y,zone.ransack.z)
                        SetBlipSprite(ransackblip,478)
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
                        SetBlipColour(joinfactionblip,67)
                        if enemybase then SetBlipColour(joinfactionblip,55) end
                    end
                end
                if zone.vehpos~=nil and not zone.raided then
                    if vehblip~=nil then
                        SetBlipCoords(vehblip,zone.vehpos.x,zone.vehpos.y,zone.vehpos.z)
                    else
                        vehblip=AddBlipForCoord(zone.vehpos.x,zone.vehpos.y,zone.vehpos.z)
                        SetBlipSprite(vehblip,225)
                        SetBlipColour(vehblip,3)
                        if enemybase then SetBlipColour(vehblip,55) end
                    end
                end
                if zone.garagepos~=nil and not zone.raided then
                    if garageblip~=nil then
                        SetBlipCoords(garageblip,zone.garagepos.x,zone.garagepos.y,zone.garagepos.z)
                    else
                        garageblip=AddBlipForCoord(zone.garagepos.x,zone.garagepos.y,zone.garagepos.z)
                        SetBlipSprite(garageblip,357)
                        SetBlipColour(garageblip,4)
                        if enemybase then SetBlipColour(garageblip,55) end
                    end
                end
                if zone.craftpos~=nil then
                    if craftblip~=nil then
                        SetBlipCoords(craftblip,zone.craftpos.x,zone.craftpos.y,zone.craftpos.z)
                    else
                        craftblip=AddBlipForCoord(zone.craftpos.x,zone.craftpos.y,zone.craftpos.z)
                        SetBlipSprite(craftblip,402)
                        SetBlipColour(craftblip,44)
                        --if enemybase then SetBlipColour(craftblip,55) end
                    end
                end
                if zone.clothespos~=nil and not zone.raided then
                    if clothesblip~=nil then
                        SetBlipCoords(clothesblip,zone.clothespos.x,zone.clothespos.y,zone.clothespos.z)
                    else
                        clothesblip=AddBlipForCoord(zone.clothespos.x,zone.clothespos.y,zone.clothespos.z)
                        SetBlipSprite(clothesblip,366)
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
                        SetBlipColour(provisionblip,5)
                        if enemybase then SetBlipColour(provisionblip,55) end
                    end
                end
                if zone.name~=nil then
                    WriteNotification("You entered "..zone.name..".")
                    --print("you entered zone")
                    FlashMinimapDisplay()
                    if lsm_random_spawn==0 and zone.spawnpos.x and zone.spawnpos.y and zone.spawnpos.z then
                        WriteNotification("Now you respawn at "..zone.name..".")
                        SetResourceKvpFloat("x",zone.spawnpos.x)
                        SetResourceKvpFloat("y",zone.spawnpos.y)
                        SetResourceKvpFloat("z",zone.spawnpos.z)
                        
                        SetResourceKvpInt("pedmodel",GetEntityModel(myped))
                    end
                end
            else
                if traderblip~=nil then
                    RemoveBlip(traderblip)
                    traderblip=nil
                end
                if ransackblip~=nil then
                    RemoveBlip(ransackblip)
                    ransackblip=nil
                end
                if joinfactionblip~=nil then
                    RemoveBlip(joinfactionblip)
                    joinfactionblip=nil
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
                if zone.garagepos~=nil and not zone.raided and not enemybase then
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
                if zone.tradepos~=nil and not zone.raided and not enemybase then
                    DrawMarker(29, zone.tradepos.x, zone.tradepos.y, zone.tradepos.z, 
                    0.0, 0.0, 0.0, --dir
                    0.0, 0.0, 0.0, --rot
                    1.0, 1.0, 1.0, --scl
                    100, 255, 100, 200, 
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
            end
        end
        oldzone=zone
    end
end)

Citizen.CreateThread(function()
    SetAllRandomPedsFlee(PlayerId(),false)
    
    _,survivor_hash=AddRelationshipGroup("SURVIVOR")
    _,bandit_hash=AddRelationshipGroup("BANDIT")
    _,government_hash=AddRelationshipGroup("GOVERNMENT")
    _,raider_hash=AddRelationshipGroup("RAIDER")
    _,neutral_hash=AddRelationshipGroup("NEUTRAL")
    _,dawn_hash=AddRelationshipGroup("DAWN")
    _,marauder_hash=AddRelationshipGroup("MARAUDER")
    
    -- 5 shoot on sight
    -- 4 shoot when shoulder them or aim or shoot
    -- 3 shoot when shoulder them or aim or shoot
    -- 2 shoot when shoulder them or aim or shoot
    -- 1 nothing
    -- 0 nothing
    
    -------------------
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
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(0, GetHashKey("BANDIT"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("BANDIT"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(3, GetHashKey("BANDIT"), GetHashKey("MARAUDER"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(0, GetHashKey("GOVERNMENT"), GetHashKey("COP"))
    SetRelationshipBetweenGroups(0, GetHashKey("COP"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(0, GetHashKey("GOVERNMENT"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(3, GetHashKey("GOVERNMENT"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(4, GetHashKey("GOVERNMENT"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(3, GetHashKey("GOVERNMENT"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("GOVERNMENT"), GetHashKey("MARAUDER"))
    
    
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
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(0, GetHashKey("MERC"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("COP"))
    SetRelationshipBetweenGroups(5, GetHashKey("COP"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("MERC"), GetHashKey("MARAUDER"))
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("NEUTRAL"), GetHashKey("NEUTRAL"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(4, GetHashKey("NEUTRAL"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(3, GetHashKey("NEUTRAL"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(3, GetHashKey("NEUTRAL"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("NEUTRAL"), GetHashKey("MARAUDER"))
    
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
    
    SetRelationshipBetweenGroups(5, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("AGGRESSIVE_INVESTIGATE"))
    SetRelationshipBetweenGroups(1, GetHashKey("MARAUDER"), GetHashKey("MARAUDER"))
    SetRelationshipBetweenGroups(3, GetHashKey("MARAUDER"), GetHashKey("BANDIT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("GOVERNMENT"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("RAIDER"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("MERC"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("SURVIVOR"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("DAWN"))
    SetRelationshipBetweenGroups(5, GetHashKey("MARAUDER"), GetHashKey("NEUTRAL"))
   
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
        if GetPedType(ped)==6 then --cops
            DecorSetBool(ped,"raider",true)
        elseif IsPedHuman(ped) then
            zone=is_in_safe_zone(zpos.x,zpos.y,zpos.z)
            if zone==nil or zone.relationship==nil then
                if IsPedInAnyHeli(ped) or IsPedInAnyPlane(ped) or math.random(1,20)==1 and false then --loners
                    DecorSetBool(ped,"raider",true)
                    if IsPedUsingAnyScenario(ped) then ClearPedTasksImmediately(ped) end
                    SetPedRelationshipGroupHash(ped,GetHashKey("RAIDER"))
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
                    GiveWeaponToPed(ped, weaponsarray[randomweapon], math.random(1,5000), false, true)
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
                    elseif zone.relationship==GetHashKey("GOVERNMENT") then
                        change_clothes(ped,suits.police)
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
                local weaponsarray=zone.weapons
                if weaponsarray then
                    local randomweapon=math.random(1,#weaponsarray)
                    GiveWeaponToPed(ped, weaponsarray[randomweapon], 5000, false, true)
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
                    if not IsPedAPlayer(ped) and not IsPedDeadOrDying(ped) and IsPedHuman(ped) then
                        zpos=GetEntityCoords(ped)
                        if DecorExistOn(ped,"zombie_type") then
                            if survivors==nil then get_survivors() end
                            zombie_attack()
                            RequestAnimSet(clipset.anim)
                            if HasAnimSetLoaded(clipset.anim) then
                                SetPedMovementClipset(ped,clipset.anim,clipset.speed)
                            end
                        elseif DecorExistOn(ped,"raider") then
                            --SetPedAccuracy(ped,0)
                            zone=is_in_safe_zone(zpos.x,zpos.y,zpos.z)
                            raider_think()
                        else
                           -- if DecorGetInt(ped,"zombie_type")~=4 then
                                zombie_init()
                           -- end
                        end
                    end
                else --light
                    if not IsPedAPlayer(ped) and IsPedHuman(ped) then
                        if not IsPedDeadOrDying(ped) then
                            if DecorExistOn(ped,"zombie_type") then
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
                                            ApplyDamageToPed(ped, healthdif*5, false);
                                            ApplyDamageToPed(ped, armordif*5, true);
                                            --print("damage dealt: "..healthdif.." "..armordif)
                                            local hp=GetEntityHealth(ped)
                                            DecorSetInt(ped,"zm_health",hp)
                                            DecorSetInt(ped,"zm_armor",GetPedArmour(ped))
                                            SetHighFallTask(ped, 100, -1, -1)
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
                                            if not IsEntityPlayingAnim(ped,dict,anim,3) then
                                                RequestAnimDict(dict)
                                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                                TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 0, 0.001, false, false, false)
                                            else
                                                 SetHighFallTask(ped, 5000, -1, -1)
                                                --SetPedToRagdoll(ped, 5000, 5000, 0, false, false, false);
                                            end
                                            DecorSetInt(ped,"zm_lastbone",bone)
                                            
                                            DecorSetInt(ped,"zm_health",health)
                                            DecorSetInt(ped,"zm_armor",armor)
                                        end
                                    else
                                        if DecorGetInt(ped,"zm_lastbone")~=bone then
                                            local dict="melee@small_wpn@streamed_core" 
                                            local anim="non_melee_damage_front"
                                            if not IsEntityPlayingAnim(ped,dict,anim,3) then
                                                RequestAnimDict(dict)
                                                while not HasAnimDictLoaded(dict) do Wait(0) end
                                                TaskPlayAnim(ped, dict, anim, 8.0, 1.0, -1, 0, 0.001, false, false, false)
                                            else
                                                 SetHighFallTask(ped, 100, -1, -1)
                                                --SetPedToRagdoll(ped, 5000, 5000, 0, false, false, false);
                                            end
                                            DecorSetInt(ped,"zm_lastbone",bone)
                                            
                                            DecorSetInt(ped,"zm_health",health)
                                            DecorSetInt(ped,"zm_armor",armor)
                                        end
                                        DecorSetInt(ped,"zm_health",health)
                                        DecorSetInt(ped,"zm_armor",armor)
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
                        if dist_to_closest_point(player_peds,zpos)>90000.0 then
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
        if DecorExistOn(veh,"scorched") then
            --WriteNotification("Nothing to salvage here.")
        elseif any_player_inside(veh) then
            WriteNotification("Cannot loot engine while someone is in car.")
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
                if      tier>98 then    chosentier=trunkrewards_tier6
                elseif  tier>93 then    chosentier=trunkrewards_tier5
                elseif  tier>84 then    chosentier=trunkrewards_tier4
                elseif  tier>68 then    chosentier=trunkrewards_tier3
                elseif  tier>43 then    chosentier=trunkrewards_tier2
                else                    chosentier=trunkrewards_tier1 end
                
                local reward=chosentier[random_number%#chosentier+1]
                local item=reward[1]
                local count=reward[2]
                if count<0 then count=math.random(1,-count) end
                
                if not DecorExistOn(veh,"item") then
                    DecorSetInt(veh,"item",item_name_to_index[item])
                    DecorSetInt(veh,"count",count)
                else
                    item=item_index_to_name[DecorGetInt(veh,"item")]
                    count=DecorGetInt(veh,"count")
                    if give_item_to_inventory(item,count) then
                        DecorSetBool(veh,"zm_looted",true)
                    end
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
        local vehclass=GetVehicleClass(veh)
        if liters>0 then
            if vehclass==15 or vehclass==16 then
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
            if not IsPedInAnyVehicle(pped) and not IsPedClimbing(pped) then
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
                            if      tier>88 then    chosentier=deadbodiesrewards_tier6
                            elseif  tier>73 then    chosentier=deadbodiesrewards_tier5
                            elseif  tier>44 then    chosentier=deadbodiesrewards_tier4
                            elseif  tier>28 then    chosentier=deadbodiesrewards_tier3
                            elseif  tier>3 then    chosentier=deadbodiesrewards_tier2
                            else                    chosentier=deadbodiesrewards_tier1 end
                            reward=chosentier[math.random(1,#chosentier)] 
                            if debug_mode then
                                WriteNotification("Debug random loot number is: "..tier)
                                print("Debug random loot number is: "..tier)
                            end
                        else --zombie loot
                            local tier=math.random(1,100)
                            local chosentier
                            if      tier>99 then        chosentier=deadbodiesrewards_tier4
                            elseif  tier>98 then        chosentier=deadbodiesrewards_tier3
                            elseif  tier>97 then        chosentier=deadbodiesrewards_tier2
                            else                    chosentier=deadbodiesrewards_tier1 end
                            reward=chosentier[math.random(1,#chosentier)] 
                            if debug_mode then
                                WriteNotification("Debug random loot number is: "..tier)
                                print("Debug random loot number is: "..tier)
                            end
                        end
                    end
                    --if reward~=nil then
                        if IsPedDeadOrDying(ped,true) then
                                local zpos=GetEntityCoords(ped)
                                local distance=#(mypos-zpos)
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
                if obj~=0 then --and not NetworkGetEntityIsNetworked(obj) then
                    local attached=GetEntityAttachedTo(obj)
                    if not IsEntityAPed(attached) or IsPedDeadOrDying(attached) then
                        if (v.solid or v.exp) and DecorExistOn(obj,"zm_looted") then
                            empty=true
                        elseif v.spoiled then
                            spoiled=true
                        else
                            local took_something=false
                            local local_spoiled=false
                            for i=1,5,2 do
                                if v[i]==nil then
                                    break
                                end
                                if (inventory_items_chances[v[i]]==nil) or (math.random(1,100)<inventory_items_chances[v[i]].chance) then
                                    print("trying to pickup "..v[i])
                                    if give_item_to_inventory(v[i],v[i+1]) then took_something=true end
                                else
                                    WriteNotification(inventory_items_chances[v[i]].text)
                                    local_spoiled=true
                                end
                            end
                            if took_something or local_spoiled then
                                local objpos=GetEntityCoords(obj)
                                looted_array[coords_to_dword(objpos.x,objpos.y,objpos.z)]=current_date
                                if v.exp then
                                    DecorSetBool(obj,"zm_looted",true)
                                    local objpos=GetEntityCoords(obj)
                                    AddExplosion(objpos.x, objpos.y, objpos.z, 16, 0.05, false, true, false, true)
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
            if model~=nil and not DecorExistOn(obj,"zm_looted")  then
                local pos=GetEntityCoords(obj)
                hash=coords_to_dword(pos.x,pos.y,pos.z)
                t=looted_array[hash]
                if t~=nil then
                    if current_date-t>respawn_time then
                        looted_array[hash]=nil
                    elseif model.exp then
                        DecorSetBool(obj,"zm_looted",true)
                        AddExplosion(pos.x, pos.y, pos.z, 16, 0.05, false, true, false, true)
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
AddEventHandler('updatesignal', function(id,x,y,z,b,m,r,t)
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
            else
                signal.relationship=GetHashKey("BANDIT")
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
            SetBlipSprite(signal.blip,b or 161)
            SetBlipColour(signal.blip,b and 4 or 2)
            SetBlipScale(signal.blip,0.65)
            SetBlipAsShortRange(signal.blip,true)
        else
            SetBlipCoords(signal.blip,x,y,0)
        end
        m=m or prop_mb_crate_01a
        signal.m=m
        RequestModel(m)
        if signal.object==nil then
            --print("Created Object")
            while not HasModelLoaded(m) do Wait(0) end
            signal.object=CreateObject(m, x, y, z, false, false, false)
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
            WriteHint("~c~Press ~s~ENTER ~c~to open inventory")
        else
            WriteHint("~c~Press ~s~BACKSPACE ~c~to close inventory")
            if inventory.total>0 then
                WriteHint("~c~Press ~s~ENTER ~c~to use item")
                WriteHint("~c~Press ~s~DELETE ~c~to drop item")
            end
        end
        if zone~=nil then
            if zone.craftpos~=nil and in_radius(mypos,zone.craftpos,1)
            or zone.clothespos~=nil and in_radius(mypos,zone.clothespos,1)
            or zone.tradepos~=nil and in_radius(mypos,zone.tradepos,1)
            or zone.changingroompos~=nil and in_radius(mypos,zone.changingroompos,1)
            or zone.garagepos~=nil and in_radius(mypos,zone.garagepos,1)
            or zone.vehpos~=nil and in_radius(mypos,zone.vehpos,1)
            then 
                WriteHint("~c~Press ~s~E ~c~to interact")
            end
            if zone.name~=nil then
                local rel=GetRelationshipBetweenGroups(GetPedRelationshipGroupHash(myped),zone.relationship)
                if rel==0 then
                    WriteHint("You're in ~g~FRIENDLY TERRITORY~s~.")
                elseif rel==5 then
                    WriteHint("You are in ~r~ENEMY TERRITORY~s~! Defend yourself!")
                else
                    WriteHint("You are in ~y~NEUTRAL TERRITORY~s~! Holster your weapons.")
                end
            end
        end
        if player.hydration<=0.1 then
            WriteHint("~s~You are dying of ~r~DEHYDRATION~s~! Drink something!")
        end
        if player.saturation<=0.1 then
            WriteHint("~s~You are dying of ~r~STARVATION~s~! Eat something!")
        end
        if player.weight>player.maxweight then
            WriteHint("~s~You are ~r~OVER ENCUMBERED~s~! Your HYDRATION and NOURISHMENT is now draining faster!")
        end
        if havetrailer then
            local trailermodel=GetEntityModel(trailer)
            if trailermodel==-730904777 or trailermodel==1956216962 or trailermodel==-1207431159 then
                if DecorExistOn(trailer,"gasoline") then
                    WriteHint({"~c~This trailer tank has ~o~~1~ gasoline",DecorGetInt(trailer,"gasoline")})
                else
                    WriteHint("~c~This trailer tank has ~o~no gasoline ~c~inside")
                end
            end
        end
        if IsPedInAnyVehicle(myped) then
            if GetVehicleFuelLevel(myveh)<7.1 then
                if GetVehicleFuelLevel(myveh)<1.1 then
                    WriteHint("~c~This vehicle is out of fuel")
                else
                    WriteHint("~c~Fuel level is low, use gasoline to refill vehicle")
                end
            end
        end
        if player.bleeding>0 then
            if player.bleeding==1 then
                WriteHint("You have ~r~1 BLEEDING WOUND~s~! Stop the bleeding with bandages, rags, or a medical kit!")
            else
                WriteHint("You have ~r~"..player.bleeding.." BLEEDING WOUNDS~s~! Stop the bleeding with bandages, rags, or a medical kit!")
            end
        end
        if player.blood<100.0 then
            WriteHint("~c~You've lost some blood and now dehydrating faster")
        end
    end
end)

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
                            WriteHint("~c~You cannot put gasoline in this trailer")
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
end)

-- Citizen.CreateThread(function()
    -- while true do Wait(0)
    -- end
-- end)

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
    { x=-1308.6551513672,y=-392.06604003906,z=36.695762634277,sprite=110}, --diagonal
    }
    -- for k,v in ipairs(map_icons) do        
        -- blip=AddBlipForCoord(v.x,v.y,v.z)
        -- SetBlipSprite(blip, v.sprite)
        -- SetBlipAsShortRange(blip,true)
        -- SetBlipColour(blip, 4)
        -- if v.name~=nil then
            -- SetBlipName(blip, v.name)
        -- end
    -- end
    for k,v in ipairs(safezones) do        
        v.bliphandler=AddBlipForCoord(v.x,v.y,v.z)
        SetBlipSprite(v.bliphandler, v.blip)
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

Citizen.CreateThread(function()
    while true do Wait(0)
        while not IsPedDeadOrDying(PlayerPedId()) do Wait(0) end
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
        for k,v in pairs(weapons) do
            local weapon_hash=GetHashKey("weapon_"..k)
            if not IsWeaponValid(weapon_hash) then
                weapon_hash=GetHashKey("gadget_"..k)
                if not IsWeaponValid(weapon_hash) then
                    weapon_hash=GetHashKey(k)
                    if not IsWeaponValid(weapon_hash) then
                        weapon_hash=nil
                    end
                end
            end
            if weapon_hash~=nil and HasPedGotWeapon(ped,weapon_hash) then
                total=total+1
                loot[k]=(loot[k] or 0)+1
                -- local found,clip=GetAmmoInClip(ped,weapon_hash)
                -- print("dropped "..k.." with "..(found and "true " or "false ")..clip)
                -- if found and clip>0 then
                    -- local ammo_type=GetPedAmmoTypeFromWeapon(ped,weapon_hash)
                    -- for ammo_name,ammo_type_hash in pairs(ammo_types) do
                        -- if ammo_type==ammo_type_hash then
                            -- loot[ammo_name]=(loot[ammo_name] or 0)+clip
                            -- break
                        -- end
                    -- end
                -- end
                -- RemoveWeaponFromPed(ped,weapon_hash)
            end
        end
        for k,v in pairs(ammo_types) do
            local ammo=GetPedAmmoByType(ped,v)
            if ammo>0 then
                total=total+1
                loot[k]=(loot[k] or 0)+ammo
            end
        end
        if total>0 then
            TriggerServerEvent("imdead",pos.x,pos.y,pos.z+1-h,loot)
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
        while IsPedDeadOrDying(PlayerPedId()) do Wait(0) end
    end
end)

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

Citizen.CreateThread(function()
    Wait(10000)
    local oldweapons=0
    --local totalweapons=0
    local hashsum=0
    local ammosum=0
    local oldammo=0
    local ammo=0
    local myped=PlayerPedId()
    for name,_ in pairs(weapons) do
        local hash=GetHashKey("weapon_"..name)
        if not IsWeaponValid(hash) then
            hash=GetHashKey("gadget_"..name)
            if not IsWeaponValid(hash) then
                hash=GetHashKey(name)
                if not IsWeaponValid(hash) then
                    hash=nil
                end
            end
        end
        if hash then
            weapons[name]=hash
            if GetResourceKvpInt(name)~=0 then
                GiveWeaponToPed(myped,hash,0,false,true)
                oldweapons=oldweapons~hash
                --totalweapons=totalweapons+1
            end
        end
    end
    for name,hash in pairs(ammo_types) do
        ammo=GetResourceKvpInt(name)
        SetPedAmmoByType(myped,hash,ammo)
        oldammo=oldammo+ammo
    end
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

local teleports={
{x=1717.3126220703,y=4791.8251953125,z=41.984027862549},--,angle=261.28918457031}, --north trading post
{x=1716.1958007813,y=4792.0146484375,z=41.983989715576},--,angle=80.689674377441},
}

Citizen.CreateThread(function()
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        for k,v in ipairs(teleports) do
            local dist=#(vector3(mypos.x,mypos.y,mypos.z)-vector3(v.x,v.y,v.z))
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
                            WriteHint("You have encountered a ~r~BANDIT ~s~patrol.")
                        elseif v.relationship==GetHashKey("SURVIVOR") then
                            WriteHint("You have encountered a ~y~SURVIVOR ~s~patrol.")
                        elseif v.relationship==GetHashKey("MERC") then
                            WriteHint("You have encountered a ~g~MERCENARY ~s~patrol.")
                        end
                        if not check_for_people_in_raid(v,v.relationship) then
                            local possible_bases={}
                            for _,base in pairs(safezones) do
                                if base.relationship==v.relationship then
                                    table.insert(possible_bases,base)
                                end
                            end
                            if 0<#possible_bases then
                                local base=possible_bases[math.random(1,#possible_bases)]
                                TriggerServerEvent("raid_killed",k,base.x,base.y,base.z)
                                SimpleNotification("Patrol has been ~r~eliminated~s~.")
                            end
                        end
                    end
                end
            end
        end
    end
end)



Citizen.CreateThread(function()
    while true do Wait(0)
        local myped=PlayerPedId()
        local myfaction=GetPedRelationshipGroupHash(myped)
        if player.reputation>-1 then
            if myfaction~=GetHashKey("NEUTRAL") then
                if myfaction==GetHashKey("MARAUDER") then
                    SetPedRelationshipGroupHash(myped,GetHashKey("NEUTRAL"))
                    FlashMinimapDisplay()
                    WriteText("You've become ~y~Scavenger~s~.")
                end
            end
        else
            if myfaction~=GetHashKey("MARAUDER") then
                if myfaction==GetHashKey("NEUTRAL") then
                    SetPedRelationshipGroupHash(myped,GetHashKey("MARAUDER"))
                    FlashMinimapDisplay()
                    WriteText("You've become ~o~Marauder~s~.")
                end
            end
        end
    end
end)


Citizen.CreateThread(function()
    local xxxxxxx=0.0
    
    local neutral={}
    neutral.r=255
    neutral.g=235
    neutral.b=100
    local friends={}
    friends.r=50
    friends.g=200
    friends.b=75
    local enemy={}
    enemy.r=200
    enemy.g=50
    enemy.b=50
    
    local r,g,b
    
    while true do Wait(0)
        local myped=PlayerPedId()
        local mypos=GetEntityCoords(myped)
        local zone=is_in_safe_zone(mypos.x,mypos.y,mypos.z)
        if zone and zone.relationship and not disablehud then
            local myrel=GetPedRelationshipGroupHash(myped)
            
            local relnumber=GetRelationshipBetweenGroups(myrel,zone.relationship)
            
            local chunk_x=0.049
            local chunk_y=0.008
        
        
            SetTextCentre(true)
            DrawRect(0.5,0.05,0.301,0.012,0,0,0,255) -- -0.00025 --black bar
            
            DrawRect(0.5-.125,0.05,chunk_x,chunk_y,50,50,50,255) --grey
            DrawRect(0.5-.075,0.05,chunk_x,chunk_y,50,50,50,255)
            DrawRect(0.5-.025,0.05,chunk_x,chunk_y,50,50,50,255)
            DrawRect(0.5+.025,0.05,chunk_x,chunk_y,50,50,50,255)
            DrawRect(0.5+.075,0.05,chunk_x,chunk_y,50,50,50,255)
            DrawRect(0.5+.125,0.05,chunk_x,chunk_y,50,50,50,255)
            
            if relnumber==0 then
                r=friends.r
                g=friends.g
                b=friends.b
                DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.025,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5+.025,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5+.075,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5+.125,0.05,chunk_x,chunk_y,r,g,b,255)
            elseif relnumber==1 then
                r=friends.r
                g=friends.g
                b=friends.b
                DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.025,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5+.025,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5+.075,0.05,chunk_x,chunk_y,r,g,b,255)
            elseif relnumber==2 then
                r=neutral.r
                g=neutral.g
                b=neutral.b
                DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.025,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5+.025,0.05,chunk_x,chunk_y,r,g,b,255)
            elseif relnumber==3 then
                r=neutral.r
                g=neutral.g
                b=neutral.b
                DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.025,0.05,chunk_x,chunk_y,r,g,b,255)
            elseif relnumber==4 then
                r=enemy.r
                g=enemy.g
                b=enemy.b
                DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
                DrawRect(0.5-.075,0.05,chunk_x,chunk_y,r,g,b,255)
            elseif relnumber==5 then
                r=enemy.r
                g=enemy.g
                b=enemy.b
                DrawRect(0.5-.125,0.05,chunk_x,chunk_y,r,g,b,255)
            end
            
            if zone.name then
                local newname=zone.name
                local firstchar=string.sub(newname,1,1)
                if firstchar=="~" then
                    newname=string.sub(newname,4)
                end
                WriteText(4,newname.." - "..relationship_names[zone.relationship],0.5,r,g,b,255,0.5,0.008) --base name
            end
            
            SetTextRightJustify(true)
            SetTextWrap(0.0,0.34)            
            WriteText(4,"Hostile",0.4,r,g,b,255,xxxxxxx,0.035) --My faction
            WriteText(4,"Friendly",0.4,r,g,b,255,0.66,0.035) --Their faction
            -- WriteText(4,relationship_names[myrel],0.4,r,g,b,255,xxxxxxx,0.035) --My faction
            -- WriteText(4,relationship_names[zone.relationship],0.4,r,g,b,255,0.66,0.035) --Their faction
            SetTextCentre(true)
            WriteText(4,relationship_names[relnumber],0.3,r,g,b,255,0.5,0.062) --status
        end
    end
end)

local function change_reputation(howmuch)
    SetResourceKvpInt("reputation",player.reputation+howmuch)
    player.reputation=player.reputation+howmuch
end

Citizen.CreateThread(function()
    local checkeddeadbodies={}
    local loop,handle,npc
    while true do Wait(0)
        local myped=PlayerPedId()
        handle,npc=FindFirstPed()
        loop=(handle~=-1)
        while loop do
            if IsPedDeadOrDying(npc) and DecorExistOn(npc,"raider") and GetPedSourceOfDeath(npc)==myped then
                if not checkeddeadbodies[npc] then
                    local gametimer=GetGameTimer()
                    checkeddeadbodies[npc]=gametimer
                    local theirfaction=GetPedRelationshipGroupHash(npc)
                    local myfaction=GetPedRelationshipGroupHash(myped)
                    if relationship_good_bad[theirfaction]=="bad" then
                        change_reputation(1)
                        WriteNotification("Reputation ~g~+1")
                    elseif relationship_good_bad[theirfaction]=="neutral" then
                        WriteNotification("You don't gain ~y~reputation ~s~for killing ~y~"..relationship_names[theirfaction])
                    elseif relationship_good_bad[theirfaction]=="good" then
                        change_reputation(-1)
                        WriteNotification("Reputation ~r~-1")
                    end
                end
            end
            loop,npc=FindNextPed(handle)
        end
        EndFindPed(handle)
    end
end)

-- Citizen.CreateThread(function()
    -- while true do Wait(0)
        -- local myped=PlayerPedId()
        -- local myplayer=PlayerId()
        -- local jumping=IsPedJumping(myped)
        -- local climbing=IsPedClimbing(myped)
        -- WriteHint("jumpimh: "..(jumping and "true" or "false"))
        -- WriteHint("climbing: "..(climbing and "true" or "false"))
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
