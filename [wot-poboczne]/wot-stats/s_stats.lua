		
		addEvent("onPlayerOpenStatsMenu",true)
		addEventHandler("onPlayerOpenStatsMenu",root,function()
		local zniszczenia = {}
		local flagi = {}
			local r1 = exports['DB']:pobierzTabeleWynikow("SELECT * FROM wot_battles ORDER by zniszczenia DESC")
			local r2 = exports['DB']:pobierzTabeleWynikow("SELECT * FROM wot_battles ORDER by bazy DESC")
			print(#r1)
			for k = 1,5 do 
				table.insert(flagi,{r2[k].login,r2[k].bazy})
				table.insert(zniszczenia,{r1[k].login,r1[k].zniszczenia})
			end
			triggerClientEvent(client,"showServerStatsMenu",client,flagi,zniszczenia)
		end)

		
		