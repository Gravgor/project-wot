local screenW, screenH = guiGetScreenSize()
	 local nick = "blad"
	 local srebro = "bład"
	 local gold ="blad"
	 local administrator = "blad"

pokazGui2 = false
pokazGui = false

local gui = {
	     window = guiCreateWindow(766, 193, 266, 361, "Developer Panel", false),
			 button1 = guiCreateButton(797, 329, 74, 29, "Gram!", false, window),
			 button = guiCreateButton(908, 329, 74, 29, "Monitoruje!", false, window),
			 label = guiCreateLabel(814, 231, 192, 222, "Witamy Cię developerze, w wyborze systemu. Chcesz pograć czy przejść do systemu monitorującego?", false, window),
}


local gui2 = {
	    window1 = guiCreateWindow(255, 155, 425, 475, "Informacje o graczach.", false),


			 window2 = guiCreateWindow(680, 155, 465, 475, "Informacje o twoim koncie.", false),


			 window3 = guiCreateWindow(269, 194, 197, 209, "Wyszukaj konto gracza.", false),


			 window4 = guiCreateWindow(476, 194, 197, 209, "Nadaj rangę.", false),


			 window5 = guiCreateWindow(476, 413, 197, 209, "Przejdź na serwer testowy.", false),

			 window6 = guiCreateWindow(269, 411, 197, 209, "Obejrzyj gierkę.", false),


			 button1 = guiCreateButton(320, 338, 91, 31, "Wyszukaj!", false),


			 button2 = guiCreateButton(501, 572, 144, 29, "Przełącz!", false),


			 button3 = guiCreateButton(524, 359, 91, 31, "Nadaj", false),


			 button4 = guiCreateButton(294, 498, 132, 34, "Wylosuj gierkę", false),



			 checkbox1 = guiCreateCheckBox(493, 286, 163, 29, "Community Manager", true, false),


			 checkbox2 = guiCreateCheckBox(493, 320, 163, 29, "Support Team", false, false),


			 edit1 = guiCreateEdit(289, 249, 157, 28, "", false),


			 edit2 = guiCreateEdit(486, 248, 170, 29, "", false),
}




local label = {
           	 label1 = guiCreateLabel(841, 287, 209, 263, "Informacje o twoim koncie", false),
			 label2 = guiCreateLabel(841, 319, 152, 135, "Nick:" ..nick, false),
			 label3 = guiCreateLabel(841, 341, 132, 93, "Srebro:"..srebro, false),
			 label4 = guiCreateLabel(841, 361, 132, 93, "Gold:" ..gold, false),
			 label5 = guiCreateLabel(841, 383, 132, 93, "Administrator:" ..administrator, false),
			 label6 = guiCreateLabel(499, 449, 151, 100, "Będziesz mieć dostęp do niewydanych rzeczy!", false),
			 }



			 guiSetVisible(gui2.window1, false)
			 		guiSetVisible(gui2.window2, false)
			 		guiSetVisible(gui2.window3, false)
			 		guiSetVisible(gui2.window4, false)
			 		guiSetVisible(gui2.window5, false)
			 		guiSetVisible(gui2.window6, false)
			 		guiSetVisible(gui2.button3, false)
			 		guiSetVisible(gui2.button1, false)
			 		guiSetVisible(gui2.button2, false)
			 		guiSetVisible(gui2.button4, false)
			 		guiSetVisible(label.label1, false)
			 		guiSetVisible(label.label2, false)
			 		guiSetVisible(label.label3, false)
			 		guiSetVisible(label.label4, false)
			 		guiSetVisible(label.label5, false)
			 		guiSetVisible(label.label6, false)
			 		guiSetVisible(gui2.checkbox1, false)
			 		guiSetVisible(gui2.checkbox2, false)
			 		guiSetVisible(gui2.edit1, false)
			 		guiSetVisible(gui2.edit2, false)
			 		guiSetVisible(gui.window, false)
			 			guiSetVisible(gui.button1, false)
			 			guiSetVisible(gui.button, false)
			 			guiSetVisible(gui.label, false)


addEventHandler("onClientRender", root,
    function()
        dxDrawText("WOT-MTA dev-version 0.0.1", 0, 752, 107, 768, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
    end
)


addCommandHandler("dev", function()
	if getElementData(localPlayer, "player:admin") == true then
		local state=not guiGetVisible(gui.window)
			guiSetVisible(gui.window, true)
			guiSetVisible(gui.button1, true)
			guiSetVisible(gui.button, true)
			guiSetVisible(gui.label, true)
			guiLabelSetHorizontalAlign(gui.label, "left", true)
			guiWindowSetSizable(gui.window, false)
	    guiWindowSetMovable(gui.window, false)
			guiSetProperty(gui.window, "AlwaysOnTop", "false")
			guiSetProperty(gui.button1, "AlwaysOnTop", "true")
			guiSetProperty(gui.button, "AlwaysOnTop", "true")
			guiSetProperty(gui.label, "AlwaysOnTop", "true")
			setElementData(localPlayer, "player:gui", true)
			showCursor(true)
			if state then
					 pokazGui = true
			 else
					 pokazGui = false
			 end
	 end
end)


addEvent("wyswietl:stan", true)
addEventHandler("wyswietl:stan", getRootElement(), function()
	for _,vehicle in ipairs(getElementsByType("vehicle")) do
		local id = getElementModel(vehicle)
		local x,y,z = getElementPosition(id)
        local w,h = getScreenFromWorldPosition(x,y,z+0.3)
		local opis = getElementData(id, "vehicle:uszkodzenia")
		--if not getElementData(id, "vehicle:uszkodzenia") then
       -- local opis = "brak" then return end
		  if w and h then
				dxDrawText(opis, w, h, w, h, tocolor(255, 255, 255, 190), 1.0, "default", "center", "center")
				addEventHandler("onClientRender")
			end
		end
	end
)



addEvent("otworz:gui", true)
addEventHandler("otworz:gui", getRootElement(), function()
	if getElementData(localPlayer, "player:gui") == true then
		local state=not guiGetVisible(gui2.window)
		guiSetVisible(gui2.window1, true)
		guiSetVisible(gui2.window2, true)
		guiSetVisible(gui2.window3, true)
		guiSetVisible(gui2.window4, true)
		guiSetVisible(gui2.window5, true)
		guiSetVisible(gui2.window6, true)
		guiSetVisible(gui2.button3, true)
		guiSetVisible(gui2.button1, true)
		guiSetVisible(gui2.button2, true)
		guiSetVisible(gui2.button4, true)
		guiSetVisible(label.label1, true)
		guiSetVisible(label.label2, true)
		guiLabelSetHorizontalAlign(label.label2, "left", true)
		guiSetVisible(label.label3, true)
		guiSetVisible(label.label4, true)
		guiSetVisible(label.label5, true)
		guiLabelSetHorizontalAlign(label.label5, "left", true)
		guiSetVisible(label.label6, true)
		guiLabelSetHorizontalAlign(label.label6, "left", true)
		guiSetVisible(gui2.checkbox1, true)
		guiSetVisible(gui2.checkbox2, true)
		guiSetVisible(gui2.edit1, true)
		guiSetVisible(gui2.edit2, true)
		guiWindowSetMovable(gui2.window1, false)
		guiWindowSetMovable(gui2.window2, false)
		guiWindowSetMovable(gui2.window3, false)
		guiWindowSetMovable(gui2.window4, false)
		guiWindowSetMovable(gui2.window5, false)
		guiWindowSetMovable(gui2.window6, false)
		guiSetProperty(gui2.button1, "AlwaysOnTop", "true")
		guiSetProperty(gui2.button2, "AlwaysOnTop", "true")
		guiSetProperty(gui2.button3, "AlwaysOnTop", "true")
		guiSetProperty(gui2.button4, "AlwaysOnTop", "true")
		guiSetProperty(label.label1, "AlwaysOnTop", "true")
		guiSetProperty(label.label2, "AlwaysOnTop", "true")
		guiSetProperty(label.label3, "AlwaysOnTop", "true")
		guiSetProperty(label.label4, "AlwaysOnTop", "true")
		guiSetProperty(label.label5, "AlwaysOnTop", "true")
		guiSetProperty(label.label6, "AlwaysOnTop", "true")
		guiSetProperty(gui2.checkbox1, "AlwaysOnTop", "true")
		guiSetProperty(gui2.checkbox2, "AlwaysOnTop", "true")
		guiSetProperty(gui2.edit1, "AlwaysOnTop", "true")
		guiSetProperty(gui2.edit2, "AlwaysOnTop", "true")
		if state then
				 pokazGui2 = true
		 else
				 pokazGui2 = false
		 end
 end
end)


	addEventHandler("onClientClick", root, function(btn,state)
				if btn == "left" and state == "up" then
					if isMouseInPosition(908, 329, 74, 29) then
						triggerEvent("otworz:gui")
					end
				end
			end
			)




function isMouseInPosition(x,y,width,height)
		if not isCursorShowing() then return false end

		local sx,sy = guiGetScreenSize()
		local cx,cy = getCursorPosition()
		local cx,cy = (cx * sx), (cy * sy)
		if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
				return true
		else
				return false
		end
end
