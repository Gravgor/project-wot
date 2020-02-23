	function statsgui()
		dxDrawImage(387, 219, 592, 330, ":wot-stats/images/background.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawText("TOP 5 graczy z największą ilością zniszczeń, pod koniec tygodnia zawsze będą rozdawane nagrody!", 480, 218, 886, 294, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
		for k = 1,5 do
			local offset = (k-1)*40
			dxDrawText(kills[k][1], 521, 284+offset, 683, 324+offset, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
			dxDrawText(kills[k][2], 683, 284+offset, 845, 324+offset, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
			dxDrawImage(489, 288+offset, 32, 32, ":wot-garaz/ikonagolda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
	end
	statswindow = false

	addEvent("showServerStatsMenu",true)
	addEventHandler("showServerStatsMenu",root,function(flagstemp,killstemp)
		if statswindow == false then
			statswindow = true
			kills = killstemp
			flags = flagstemp
			addEventHandler("onClientRender",root,statsgui)
		else
			statswindow = false
			removeEventHandler("onClientRender",root,statsgui)
		end
	end)
	
	bindKey("f6","down",function()
		triggerServerEvent("onPlayerOpenStatsMenu",localPlayer)
	end)
	