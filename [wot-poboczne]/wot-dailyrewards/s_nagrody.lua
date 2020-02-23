--@Author: AseQ
--@Server: project-wot
--@You don't have any right to use this code
	
local DB = exports['DB']
local rewards = { --silver,gold,exp,vipdays
[1] = {10000,0,0,0},
[2] = {0,50,0,0,0},
[3] = {3500,100,0,1},
[4] = {5000,125,150,0},
[5] = {9000,150,200,1},
[6] = {11000,200,350,1},
[7] = {20000,400,500,2},
}

addEvent("getRewardDay",true)
addEventHandler("getRewardDay",root,function()
	local plr = source
    local r = DB:pobierzTabeleWynikow("SELECT * FROM wot_users WHERE login=?",getElementData(plr,"login"))
    if r[1].reward_used == 1 or not r or #r == 0 then return end
    if r[1].rewards_day == 0 then DB:zapytanie("UPDATE wot_users SET reward_used=1, rewards_day=1 WHERE login=?",getElementData(plr,"login")) return end
    local days = r[1].rewards_day
    triggerClientEvent(plr,"openRewardsMenu",plr,days)
end)

 
addEvent("collectReward",true)
addEventHandler("collectReward",root,function(day)
	local plr = source
    --[[setElementData(plr,"money",getElementData(plr,"money")+rewards[1][1])
    setElementData(plr,"gold",getElementData(plr,"gold")+rewards[1][2])
    setElementData(plr,"exp",getElementData(plr,"exp")+rewards[1][3])
    setElementData(plr,"premium",getElementData(plr,"premium")+rewards[1][4])--]]
    DB:zapytanie("UPDATE wot_users SET reward_used=1, rewards_day=? WHERE login=?",day,getElementData(plr,"login"))
end)

addEvent("onServerRestart",true)
addEventHandler("onServerRestart",root,function()
    local r = DB:zapytanie("UPDATE wot_users SET rewards_day=0 WHERE reward_used=0")
    DB:zapytanie("UPDATE wot_users SET reward_used=0")
end)

addCommandHandler("reset",function()
    triggerEvent("onServerRestart",root)
end)