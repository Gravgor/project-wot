addEvent("crashS",true)
addEventHandler("crashS",root,function(name)
	local plr = getPlayerFromName(name)
	triggerClientEvent(plr,"crash",root)
end)

