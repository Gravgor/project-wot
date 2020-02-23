-- onVehicleWeaponFire
armedVehicles = {[425]=true, [520]=true, [476]=true, [447]=true, [430]=true, [432]=true, [464]=true, [407]=true, [601]=true}
function vehicleWeaponFire(thePresser, key, keyState, vehicleFireType)
	local vehModel = getElementModel(getPedOccupiedVehicle(thePresser))
	if (armedVehicles[vehModel]) then
		triggerEvent("onVehicleWeaponFire", thePresser, vehicleFireType, vehModel)
	end
end

function bindOnJoin()
	bindKey(source, "vehicle_fire", "down", vehicleWeaponFire, "primary")
	bindKey(source, "vehicle_secondary_fire", "down", vehicleWeaponFire, "secondary")
end
addEventHandler("onPlayerJoin", root, bindOnJoin)

function bindOnStart()
	for index, thePlayer in pairs(getElementsByType("player")) do
		bindKey(thePlayer, "vehicle_fire", "down", vehicleWeaponFire, "primary")
		bindKey(thePlayer, "vehicle_secondary_fire", "down", vehicleWeaponFire, "secondary")
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), bindOnStart)

addEvent("syncEffect",true)
addEventHandler("syncEffect",root,function(name,t,x,y,z)
	triggerClientEvent(root,"createEffect",root,name,t,x,y,z)
end)

addEvent("destroyTank",true)
addEventHandler("destroyTank",root,function(tank)
	blowVehicle(tank)
	setElementData(tank,"destroyed",true)
end)

function rhino(plr,cmd)
	local x,y,z = getElementPosition(plr)
	rhino = createVehicle(432,x+2,y,z+2)
	setElementData(rhino,"bulletdmg",125)
	setElementData(rhino,"maxhealth",1500)
	setElementData(rhino,"health", 1500)
	setElementData(rhino,"uncertainty",0.1)
	setElementData(rhino,"reloadtime",5)
	setElementData(rhino,"name", "T34")
	setElementData(rhino,"penetrationAPCR", "280")
	setElementData(rhino,"penetrationAP", "210")
	setElementData(plr, "tank:active", true)
	--[[track1 = createVehicle(409,0,0,0,0,0,0)
	track2 = createVehicle(409,0,0,0,0,0,0)
	setElementData(track1,"track","prawa")
	setElementData(track2,"track","lewa")
	setElementData(track1,"trackstatus",0)
	setElementData(track2,"trackstatus",0)
	setElementAlpha(track1,0)
	setElementAlpha(track2,0)
	setVehicleDamageProof(track1,true)
	setVehicleDamageProof(track2,true)
	attachElements(track1,rhino,-1.3,0,-0.2,180,0,0)
	attachElements(track2,rhino,1.3,0,-0.2,180,0,0)]]
	warpPedIntoVehicle(plr,rhino)
end


addCommandHandler("stworz",rhino)
