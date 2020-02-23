local gui = {
 wlaczenie =  guiCreateButton(0.14, 0.04, 0.11, 0.08, "", true),
 kup24 = guiCreateButton(0.33, 0.51, 0.05, 0.02, "", true),
 kup3d = guiCreateButton(0.46, 0.52, 0.05, 0.02, "", true),
 kup7d = guiCreateButton(0.58, 0.52, 0.05, 0.02, "", true),
 wylacz = guiCreateButton(0.69, 0.68, 0.04, 0.02, "", true),
}

function renderBackGround()
	dxDrawRectangle(screenW * 0.2926, screenH * 0.1758, screenW * 0.4426, screenH * 0.5443, tocolor(43, 39, 40, 202), false)
			dxDrawImage(screenW * 0.3316, screenH * 0.4010, screenW * 0.0353, screenH * 0.0547, ":wot-garaz/ikonagolda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("Premium 24H", screenW * 0.3213, screenH * 0.4622, screenW * 0.3824, screenH * 0.4857, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawText("250 sztuk złota", screenW * 0.3213, screenH * 0.4857, screenW * 0.3824, screenH * 0.5091, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawImage(screenW * 0.4632, screenH * 0.4063, screenW * 0.0353, screenH * 0.0547, ":wot-garaz/ikonagolda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("Kup", screenW * 0.3390, screenH * 0.5091, screenW * 0.4000, screenH * 0.5326, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawText("Premium 3d", screenW * 0.4559, screenH * 0.4661, screenW * 0.5169, screenH * 0.4896, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawText("750 sztuk złota", screenW * 0.4529, screenH * 0.4896, screenW * 0.5140, screenH * 0.5130, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawImage(screenW * 0.5890, screenH * 0.4010, screenW * 0.0353, screenH * 0.0547, ":wot-garaz/ikonagolda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			dxDrawText("Premium 7d", screenW * 0.5787, screenH * 0.4661, screenW * 0.6397, screenH * 0.4896, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawText("1250 sztuk złota", screenW * 0.5713, screenH * 0.4896, screenW * 0.6324, screenH * 0.5130, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawText("Kup", screenW * 0.4706, screenH * 0.5195, screenW * 0.5316, screenH * 0.5430, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawText("Kup", screenW * 0.5890, screenH * 0.5195, screenW * 0.6500, screenH * 0.5430, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
			dxDrawText("Wyjdź", screenW * 0.6985, screenH * 0.6836, screenW * 0.7596, screenH * 0.7070, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
		end


		function wlaczanie(hitPlayer, button, state)
			if hitPlayer ~= localPlayer then 
			if source ~= gui.wlaczenie then return end 
			addEventHandler("onClientRender", root, renderBackGround)
			guiSetVisible(gui.kup24, true)
			guiSetVisible(gui.kup3d, true)
			guiSetVisible(gui.kup7d, true)
			guiSetVisible(gui.wylacz, true)
	end 
end
addEventHandler("onClientGUIClick", root, wlaczenie)
		
		
		function 24d(button, state)
			if hitPlayer ~= localPlayer then 
			if source ~= gui.kup24 then return end 
			  triggerServerEvent(localPlayer, "24d", resourceRoot)
	end
end
	addEventHandler("onClientGUIClick", root, 24d)

	function 3d(button, state)
		if hitPlayer ~= localPlayer then 
		if source ~= gui.kup3d then return end 
		  triggerServerEvent(localPlayer, "3d", resourceRoot)
	end 
end
addEventHandler("onClientGUIClick", root, 3d)

function 7d(button, state)
	if hitPlayer ~= localPlayer then 
	if source ~= gui.kup7d then return end 
	  triggerServerEvent(localPlayer, "7d", resourceRoot)
end 
end
addEventHandler("onClientGUIClick", root, 7d)



function wylacz(button, state)
	if hitPlayer ~= localPlayer then 
	if source ~= gui.wylacz then return end 
	removeEventHandler("onClientRender", root, renderBackGround)
	guiSetVisible(gui.kup24, false)
	guiSetVisible(gui.kup3d, false)
	guiSetVisible(gui.kup7d, false)
	guiSetVisible(gui.wylacz, false)
end 
end 
addEventHandler("onClientGUIClick", root, wylacz)