

local screenW, screenH = guiGetScreenSize()
addEventHandler("onClientRender", root,function()
	local tank = getPedOccupiedVehicle(localPlayer) or nil
	if tank and getElementModel(tank) == 432 then
		local penetrationap = "0"
		local penetrationapcr = "0"
		local hp = --[[getElementData(tank, "health")]] "3"
		local maxhp = --[[getElementData(tank, "maxhealth")]] "50"
		local tankname = --[[getElementData(tank,"name")]] "Brak"
		dxDrawImage(screenW * 0.0000, screenH * 0.8464, screenW * 0.2868, screenH * 0.1536, ":wot-garaz/gravgor.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.0000, screenH * 0.8828, screenW * 0.2868, screenH * 0.0339, ":wot-garaz/pasek_pod_HP.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.0015, screenH * 0.8867, screenW * 0.2853*((tonumber(getElementData(tank, "health")))/(tonumber(getElementData(tank, "maxhealth")))), screenH * 0.0247, ":wot-garaz/pasek_HP.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawText(getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x",""),  screenW * 0.2324, screenH * 0.8529, screenW * 0.2794, screenH * 0.8776, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
		dxDrawText((tostring(getElementData(tank, "name")) or "Rhino"), screenW * 0.0074, screenH * 0.8529, screenW * 0.0375, screenH * 0.8711, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
		dxDrawText("HP: "..tonumber(getElementData(tank, "health")).."/"..tonumber(getElementData(tank, "maxhealth")),  screenW * 0.1272, screenH * 0.8919, screenW * 0.4066, screenH * 0.9036, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Penetracja na podstawowej amunicji "..tonumber(getElementData(tank, "penetrationAP") or "0"), screenW * 0.0088, screenH * 0.9349, screenW * 0.2882, screenH * 0.9466, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Penetracja na ulepszonej amunicji "..tonumber(getElementData(tank, "penetrationAPCR") or "0"),  screenW * 0.0088, screenH * 0.9674, screenW * 0.2882, screenH * 0.9792, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
	end
end)

