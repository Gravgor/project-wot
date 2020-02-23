

local screenW, screenH = guiGetScreenSize()
addEventHandler("onClientRender", root,function()
	local tank = getPedOccupiedVehicle(localPlayer) or nil
	if tank and getElementModel(tank) == 432 then
		local hp = getElementData(tank,"health")
		local maxhp = getElementData(tank,"maxhealth")
		local tankname = getElementData(tank,"name")
		dxDrawImage(screenW * 0.0000, screenH * 0.6328, screenW * 0.2699, screenH * 0.3763, ":wot-garaz/gravgor.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(screenW * 0.0000, screenH * 0.6354, screenW * 0.2699, screenH * 0.0703, ":wot-garaz/pasek_do_HP.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(screenW * 0.0000, screenH * 0.6563, screenW * 0.2699*(hp/maxhp), screenH * 0.0430, ":wot-garaz/pasek_HP.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawText(getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x",""), screenW * 0.0044, screenH * 0.6354, screenW * 0.0522, screenH * 0.6523, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
		dxDrawText((tankname or "Rhino"), screenW * 0.2176, screenH * 0.6354, screenW * 0.2654, screenH * 0.6523, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
		dxDrawText("HP: "..hp.."/"..maxhp, screenW * 0.1154, screenH * 0.6693, screenW * 0.1632, screenH * 0.6862, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
		dxDrawImage(screenW * 0.0375, screenH * 0.9388, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/lorneta.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(screenW * 0.0706, screenH * 0.9388, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/kierownica.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(screenW * 0.1007, screenH * 0.9388, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/suchawkqi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(screenW * 0.1309, screenH * 0.9414, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/napuj.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
end)

