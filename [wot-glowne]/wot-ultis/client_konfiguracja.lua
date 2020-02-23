angle =  nil
tick = getTickCount() 
duration = 0
timeRemaining = 0
local screenW, screenH = guiGetScreenSize()
hitvector = nil
damage = 0
damageNew = 0

-- onVehicleWeaponFire
armedVehicles = {[425]=true, [520]=true, [476]=true, [447]=true, [430]=true, [432]=true, [464]=true, [407]=true, [601]=true}
function vehicleWeaponFire(key, keyState, vehicleFireType)
	local vehModel = getElementModel(getPedOccupiedVehicle(localPlayer))
	if (armedVehicles[vehModel]) then
		triggerEvent("onClientVehicleWeaponFire", localPlayer, vehicleFireType, vehModel)
	end
end
bindKey("vehicle_fire", "down", vehicleWeaponFire, "primary")
bindKey("vehicle_secondary_fire", "down", vehicleWeaponFire, "secondary")


	
-- gasienice
function trackDestroyed(element)
	if getElementModel(element) == 409 and getElementData(source,"track") then
		local track = getElementData(source,"track")
		local tank =  getElementAttachedTo(source)
		local player = getVehicleOccupant(tank)
		if player then
			triggerServerEvent("sendNotification",player,"Uszkodzono "..track.." gąsienice")
			print("Uszkodzono "..track.." gąsienice")
		end
		if isElementFrozen(tank) then return end
		
		setElementFrozen(tank,true)
			
		setTimer(function(tank)
			local player = getVehicleOccupant(tank)
			if player then
				triggerServerEvent("sendNotification",player,"Naprawiono gąsienice")
				setElementData(element,"trackstatus",1)
			end
			setElementFrozen(tank,false)
		end,10000,1,tank)
	end
end
	function drawTextOnWorldPosition(text, vecPosition)
    local x, y = getScreenFromWorldPosition(vecPosition)

    if x and y then
        dxDrawText(text, x, y, nil, nil, 0xFFFFFFFF, 2.0, "default-bold", "center", "center")
    end
end


  -- xd
function drawDebugBoundingBox()
for i,v in ipairs(getElementsByType("vehicle")) do 
	if getElementModel(v) == 432 then
	local vehicle = v
	if vehicle and getElementModel(vehicle) == 432 then
		local minX, minY, minZ, maxX, maxY, maxZ = vehicle:getBoundingBox()
		local vehicleMatrix = vehicle.matrix

		local a = vehicleMatrix:transformPosition(Vector3(minX, minY, maxZ))
		drawTextOnWorldPosition("a", a)
		local b = vehicleMatrix:transformPosition(Vector3(maxX, minY, maxZ))
		drawTextOnWorldPosition("b", b)
		local c = vehicleMatrix:transformPosition(Vector3(minX, maxY, maxZ))
		drawTextOnWorldPosition("c", c)
		local d = vehicleMatrix:transformPosition(Vector3(maxX, maxY, maxZ))
		drawTextOnWorldPosition("d", d)
		local a2 = vehicleMatrix:transformPosition(Vector3(minX, minY, minZ))
		drawTextOnWorldPosition("a2", a2)
		local b2 = vehicleMatrix:transformPosition(Vector3(maxX, minY, minZ))
		drawTextOnWorldPosition("b2", b2)
		local c2 = vehicleMatrix:transformPosition(Vector3(minX, maxY, minZ))
		drawTextOnWorldPosition("c2", c2)
		local d2 = vehicleMatrix:transformPosition(Vector3(maxX, maxY, minZ))
		drawTextOnWorldPosition("d2", d2)
		
		

		dxDrawLine3D(c, d, 0xFFFF0000, 1.0)
		dxDrawLine3D(a, b, 0xFFFF0000, 1.0)
		dxDrawLine3D(c, a, 0xFFFF0000, 1.0)
		dxDrawLine3D(d, b, 0xFFFF0000, 1.0)
		dxDrawLine3D(a, d, 0xFFFF0000, 1.0)
		dxDrawLine3D(b, c, 0xFFFF0000, 1.0)
		
		dxDrawLine3D(c2, d2, 0xFFFF0000, 1.0)
		dxDrawLine3D(a2, b2, 0xFFFF0000, 1.0)
		dxDrawLine3D(c2, a2, 0xFFFF0000, 1.0)
		dxDrawLine3D(d2, b2, 0xFFFF0000, 1.0)
		dxDrawLine3D(a2, d2, 0xFFFF0000, 1.0)
		dxDrawLine3D(b2, c2, 0xFFFF0000, 1.0)
		
		dxDrawLine3D(a, a2, 0xFFFF0000, 1.0)
		dxDrawLine3D(b, b2, 0xFFFF0000, 1.0)
		dxDrawLine3D(c, c2, 0xFFFF0000, 1.0)
		dxDrawLine3D(d, d2, 0xFFFF0000, 1.0)
		
		dxDrawLine3D(a, b2, 0xFFFF0000, 1.0)
		dxDrawLine3D(a, c2, 0xFFFF0000, 1.0)
		dxDrawLine3D(a2, b, 0xFFFF0000, 1.0)
		dxDrawLine3D(a2, c, 0xFFFF0000, 1.0)
		dxDrawLine3D(d, b2, 0xFFFF0000, 1.0)
		dxDrawLine3D(d, c2, 0xFFFF0000, 1.0)
		dxDrawLine3D(d2, b, 0xFFFF0000, 1.0)
		dxDrawLine3D(d2, c, 0xFFFF0000, 1.0)
		

	end
end 
end
end

addCommandHandler("hitboxDebug",function()
	addEventHandler("onClientRender",root,drawDebugBoundingBox)
end)

function drawhit()
	drawTextOnWorldPosition(hitvector:getX()..","..hitvector:getY()..","..hitvector:getZ(), hitvector)
end
-- Strzelanko
function tankFire()
	local tank = getPedOccupiedVehicle(source)
	local reloading = getElementData(tank,"reloading")
	if not reloading then 
		local bulletdmg = getElementData(tank,"bulletdmg") or 50
	
		local tx,ty,tz = getElementPosition(tank)
		local trx,try,trz = getElementRotation(tank)
		local bx,by,bz = getVehicleComponentPosition(tank, "misc_a" ) 
		local x,y,z =  tx+bx,ty+by,tz+bz
		local rx,ry,rz = getVehicleComponentRotation(tank, "misc_a" ) 
		local brx,bry,brz = getVehicleComponentRotation(tank,"misc_b")
		local uncertainty = getElementData(tank,"uncertainty") or 0.1
	
		local rrz=math.rad(rz+trz)
		local rry=math.rad(ry+try)
		local rrx=math.rad(brx+trx)
		local ex= x + (100 * math.sin(-rrz)) + uncertainty
		local ey= y + (100 * math.cos(-rrz)) + uncertainty
		local ez= z + (100 * math.tan(rrx)) + uncertainty
	
		local hit,hitx,hity,hitz,element = processLineOfSight(x,y,z,ex,ey,ez,true,true,true,true,false,false,false,false,tank,false,true)
		local vx,vy,vz = getElementPosition(element)
		hitvector = Vector3(hitx,hity,hitz)
		addEventHandler("onClientRender",root,drawhit)

		
		local minX, minY, minZ, maxX, maxY, maxZ = element:getBoundingBox()
		
		local vehicleMatrix = element.matrix
		
		local a = vehicleMatrix:transformPosition(Vector3(minX, minY, maxZ))
		local c = vehicleMatrix:transformPosition(Vector3(minX, maxY, maxZ))
		
		local d = vehicleMatrix:transformPosition(Vector3(maxX, maxY, maxZ))
		local b = vehicleMatrix:transformPosition(Vector3(maxX, minY, maxZ))
		
		
		local a2 = vehicleMatrix:transformPosition(Vector3(minX, minY, minZ))
		
		local b2 = vehicleMatrix:transformPosition(Vector3(maxX, minY, minZ))
		
		local d2 = vehicleMatrix:transformPosition(Vector3(maxX, maxY, minZ))
		local c2 = vehicleMatrix:transformPosition(Vector3(minX, minY, minZ))
		
		local defmatrix = Matrix.create(Vector3(0,0,0),Vector3(0,0,0))
		local da = Vector3(vx,vy,vz) - Vector3(minX,minY,maxZ)
		local db2 = Vector3(vx,vy,vz) - Vector3(maxX,minY,minZ)
		local shotVector = Vector3(hitx,hity,hitz) - Vector3(vx,vy,vz)
		local fixedShotVector = vehicleMatrix:transformPosition(shotVector)
		
		print(fixedShotVector:getX()..","..fixedShotVector:getY()..","..fixedShotVector:getZ())
		print(da:getX()..","..da:getY()..","..da:getZ())
		
		
		
		
		playSound("shot.mp3")
		setElementData(tank,"reloading",true)
		local reloadtime = getElementData(tank,"reloadtime") or 5
		local apL = getElementData(tank, "apL") or 0 
		local apcrL = getElementData(tank, "apcrL") or 0 
		local heatL = getElementData(tank, "heatL") or 0 
		setElementData(getPedOccupiedVehicle(localPlayer), "damageGiven", getElementData(getPedOccupiedVehicle(localPlayer), "bulletdmg"))
    damageNew = damage + 125
		setTimer(setElementData,reloadtime*1000,1,tank,"reloading",false)
		tick = getTickCount()
		duration = reloadtime * 1000
		if not hit then
			print(miss)
			if apL == 0 then 
				print("Brak amunicji!")
				  if apcrL == 0 then 
					print("Brak amunicji!")
					  if heatL == 0 then 
						print("brak")

		else
			if apL or apcrL or heatL == 0 then 
				return end 

			triggerServerEvent("syncEffect",root,"explosion_door",100,hitx,hity,hitz)
			if element and getElementModel(element) == 432 then
				local currenthp = getElementData(element,"health") or 100
				setElementData(element,"health",currenthp-bulletdmg)
					if getElementData(element,"health") <= 0 and not getElementData(element,"destroyed") then
					local dx,dy,dz=getElementPosition(element)
					triggerServerEvent("destroyTank",root,element)
					triggerServerEvent("syncEffect",root,"explosion_large",10000,dx,dy,dz)
					print("wyjebalo go w kosmos")
				end
			elseif element and getElementModel(element) == 409 then
				local status = getElementData(element,"trackstatus")
				if status == 0 then
					setElementData(element,"trackstatus",math.random(1,2))
				elseif status == 1 then
					setElementData(element,"trackstatus",2)
				elseif status == 2 then
					return
				end
				if getElementData(element,"trackstatus") == 2 then
					trackDestroyed(element)
				end
			end
		end
	end
end
end
end 
end

--eventy
		
addEvent("onClientVehicleWeaponFire", false)
addEventHandler("onClientVehicleWeaponFire", root, tankFire)
addEventHandler("onClientResourceStart",root,function()
toggleControl("vehicle_fire",false)
toggleControl("vehicle_secondary_fire",false)
end)

addEvent("createEffect",true)
addEventHandler("createEffect",root,function(effectname,t,x,y,z)
	local eff = createEffect(effectname,x,y,z,0,0,0,800,false)
	setTimer (function()
		setEffectDensity(eff,0)
		destroyElement(eff)
	end, t, 1, eff) 
end)


function checkGunStatus(tank)
	if getElementData(tank,"reloading") then
		return tocolor(255, 153, 0,255)
	else
		return tocolor(0,100,0,255)
	end
end
function drawCrosshair()
	local tank = getPedOccupiedVehicle(localPlayer)
	if getElementModel(tank) == 432 then 
		local tx,ty,tz = getElementPosition(tank)
		local trx,try,trz = getElementRotation(tank)
		local bx,by,bz = getVehicleComponentPosition(tank, "misc_a" ) 
		local x,y,z =  tx+bx,ty+by,tz+bz
		local rx,ry,rz = getVehicleComponentRotation(tank, "misc_a" ) 
		local brx,bry,brz = getVehicleComponentRotation(tank,"misc_b")
		local uncertainty = getElementData(tank,"uncertainty") or 0.1
	
		local rrz=math.rad(rz+trz)
		local rry=math.rad(ry+try)
		local rrx=math.rad(brx+trx)
		local ex= x + (100 * math.sin(-rrz))
		local ey= y + (100 * math.cos(-rrz))
		local ez= z + (100 * math.tan(rrx))
	
		local hit,hitx,hity,hitz,element = processLineOfSight(x,y,z,ex,ey,ez,true,true,true,true,false,false,false,false,tank,false,true)
		local color = checkGunStatus(tank)
		local progress = ((getTickCount() - tick)/duration) 
        local angle,_,_ = interpolateBetween(0, 0, 0, 180, 0, 0, progress, "Linear") 
		if not hitx then
			local posX,posY=getScreenFromWorldPosition(ex,ey,ez)
			if posX and posY then
				dxDrawCircle(posX,posY,15,0,360,tocolor(0,0,0),tocolor(0,0,0,0),256)
				dxDrawCircle(posX,posY,15,90,-angle+90,color,tocolor(0,0,0,0),256)
				dxDrawCircle(posX,posY,15,90,angle+90,color,tocolor(0,0,0,0),256)
			end
		else
			local posX,posY=getScreenFromWorldPosition(hitx,hity,hitz)
			if posX and posY then
				dxDrawCircle(posX,posY,15,0,360,tocolor(0,0,0),tocolor(0,0,0,0),256)
				dxDrawCircle(posX,posY,15,90,-angle+90,color,tocolor(0,0,0,0),256)
				dxDrawCircle(posX,posY,15,90,angle+90,color,tocolor(0,0,0,0),256)
			end
		end
	end
end
addEventHandler("onClientRender",root,drawCrosshair)


function getAmunition()
	local tank = getPedOccupiedVehicle(localPlayer)
	if getElementModel(tank) == 432 then 
	 local apL = getElementData(tank, "apL") or "0"
	 local apcrL = getElementData(tank, "apcrL") or "0"
	 local heatL = getElementData(tank, "heatL") or "0"
end 
end

function apL()
	local tank = getPedOccupiedVehicle(localPlayer)
	if getElementData(tank, "apL") then 
		setElementData(tank, "bulletdmg", "150")
		setElementData(tank, "reloading", "10")
	end 
end 

function apcrL()
	local tank = getPedOccupiedVehicle(localPlayer)
	if getElementData(tank, "apcrL") then 
		setElementData(tank, "bulletdmg", "200")
		setElementData(tank, "reloading", "9")
	end 
end 

function heatL()
	local tank = getPedOccupiedVehicle(localPlayer)
	if getElementData(tank, "apcrL") then 
		setElementData(tank, "bulletdmg", "300")
		setElementData(tank, "reloading", "12")
	end 
end 




function drawAmunition()
	local tank = getPedOccupiedVehicle(localPlayer)
	if getElementModel(tank) == 432 then 
		if getElementData(localPlayer, "tank:active") == true then 
		dxDrawImage(screenW * 0.3669, screenH * 0.8568, screenW * 0.1074, screenH * 0.1901, ":wot-garaz/kwadratpodczolgi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.4272, screenH * 0.8568, screenW * 0.1074, screenH * 0.1901, ":wot-garaz/kwadratpodczolgi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.4860, screenH * 0.8568, screenW * 0.1074, screenH * 0.1901, ":wot-garaz/kwadratpodczolgi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("AP", screenW * 0.4154, screenH * 0.8568, screenW * 0.4574, screenH * 0.8880, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("APCR", screenW * 0.4669, screenH * 0.8568, screenW * 0.5088, screenH * 0.8880, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
		dxDrawText("HEAT", screenW * 0.5272, screenH * 0.8568, screenW * 0.5691, screenH * 0.8880, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
		dxDrawImage(screenW * 0.3669, screenH * 0.8568, screenW * 0.1074, screenH * 0.1901, ":wot-garaz/kwadratpodczolgi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.4272, screenH * 0.8568, screenW * 0.1074, screenH * 0.1901, ":wot-garaz/kwadratpodczolgi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.4860, screenH * 0.8568, screenW * 0.1074, screenH * 0.1901, ":wot-garaz/kwadratpodczolgi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("AP - 1", screenW * 0.4154, screenH * 0.8568, screenW * 0.4574, screenH * 0.8880, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("APCR - 2", screenW * 0.4669, screenH * 0.8568, screenW * 0.5088, screenH * 0.8880, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("HEAT - 3", screenW * 0.5272, screenH * 0.8568, screenW * 0.5691, screenH * 0.8880, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText(tonumber(getElementData(tank, "apL") or "0"), screenW * 0.4154, screenH * 0.9245, screenW * 0.4559, screenH * 0.9948, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText(tonumber(getElementData(tank, "apcrL") or "0"), screenW * 0.4743, screenH * 0.9245, screenW * 0.5147, screenH * 0.9948, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText(tonumber(getElementData(tank, "heatL") or "0"),  screenW * 0.5346, screenH * 0.9245, screenW * 0.5750, screenH * 0.9948, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
	end 
end 
end

addEventHandler("onClientRender", root, drawAmunition)


addEvent("setCzolg", true)
addEventHandler("setCzolg", getRootElement(), function(model, dmg, pz, reloadtime, penetrationAPCR, penetrationAP, exp, active)
	rhino = createVehicle(432,-2422.31738, -608.37939, 132.56250)
	setElementData(rhino,"bulletdmg",dmg)
	setElementData(rhino,"maxhealth",pz)
	setElementData(rhino,"health", pz)
	setElementData(rhino,"uncertainty",0.1)
	setElementData(rhino,"reloadtime",reloadtime)
	setElementData(rhino,"name", model)
	setElementData(rhino,"penetrationAPCR", penetrationAPCR)
	setElementData(rhino,"penetrationAP", penetrationAP)
	setElementData(localPlayer, "tank:active", active)
	setElementData(localPlayer, "player:active:tank:exp", exp)
	track1 = createVehicle(409,0,0,0,0,0,0)
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
	attachElements(track2,rhino,1.3,0,-0.2,180,0,0)
	warpPedIntoVehicle(plr,rhino)
	triggerServerEvent(localPlayer, "checkCrew")
end)

function drawStats()
	local tank = getPedOccupiedVehicle(localPlayer)
	if getElementModel(tank) == 432 then 
	dxDrawText("Damage: "..tonumber(damageNew), screenW * 0.2890, screenH * 0.8490, screenW * 0.5360, screenH * 0.8880, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", true, true, false, false, false)
	dxDrawText("Zniszczenia: "..tonumber(getElementData(getPedOccupiedVehicle(localPlayer), "tanksPof")) or "0", screenW * 0.2890, screenH * 0.9102, screenW * 0.5360, screenH * 0.9492, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", true, true, false, false, false)
	dxDrawText("Wykryte pojazdy: "..tonumber(getElementData(getPedOccupiedVehicle(localPlayer), "wykrycia")) or "0", screenW * 0.2890, screenH * 0.9622, screenW * 0.5360, screenH * 1.0013, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", true, true, false, false, false)
	end 
end
addEventHandler("onClientRender", root, drawStats)