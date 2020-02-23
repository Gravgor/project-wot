	local temptable = {
	{"Zabij gravgora",1,1},
	{"Zniszcz 200 czołgów",100,200}
	},
	
	function questygui()
		local offset = selected*69
		dxDrawImage(461, 99, 445, 570, ":wot-misje/images/background.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		for k = 1,#temptable do
			dxDrawText("Nazwa osiągniecia", 576, 138+offset, 700, 160, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
			dxDrawRectangle(493, 138+offset, 69, 65, tocolor(22, 22, 22, 255), false)
			dxDrawLine(576, 181+offset, 736, 181, tocolor(22, 22, 22, 255), 5, false)
			dxDrawLine(576, 181+offset, 720, 181, tocolor(53, 254, 0, 255), 5, false)
		end
	end
	
	bindKey("f5","down",function()
		addEventHandler("onClientRender",root,questygui)
	end)