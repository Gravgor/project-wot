addEventHandler("onResourceStart", resourceRoot, function()
	local baza = "178.33.54.14"
	local host = "db_44129"
	local user = "db_44129"
	local pass = "kXCTAkAmziH3"

	db = dbConnect("mysql", "dbname="..baza..";host="..host, user, pass, "share=1")
       if (not db) then
        outputDebugString("Error: Brak dostępu do bazy danych!")
	   else
        outputDebugString("Success: Dostęp do bazy danych!")
    end
end)


DB = exports['wot-db']

--local ip_port1 = 123.123.123:123
--local ip_port2 = 123.123.123:123
--local ip_port3 = 123.123.123:123



--[[addEvent("zmien:serwer", true)
addEventHandler("zmien:serwer", getRootElement(), function()
	if getServerName() == "PL 1 - WOT MTA" then
		redirectPlayer(source, gettok(ip_port1,1,":"))
	elseif getServerName() == "PL 2 - WOT MTA" then
    redirectPlayer(source, gettok(ip_port2,1,":"))
	elseif getServerName() == "PL 3 - WOT MTA" then
		redirectPlayer(source, gettok(ip_port3,1,":"))
	end
end
end
end)]]







addEvent("check:player:in:database", true)
addEventHandler("check:player:in:database", getRootElement(), function(login, passwordWpisane)
	local serial = getPlayerSerial(client)
	local q = DB:query("SELECT * from wot_users WHERE login=? AND password=?", login, md5(passwordWpisane))
	  if q and #q > 0 then
			outputChatBox("hajs: "..q[1].srebro.." login: "..q[1].login.. " samouczek: "..q[1].samouczek.. " gold: "..q[1].gold.. " exp: "..q[1].exp, client)
			outputChatBox("Zalogowałeś się!", client, 255, 255, 255)
			setElementData(client, "login", q[1].login)
			setElementData(client, "loginStaly", q[1].login)
			setPlayerMoney(client, q[1].srebro)
	        setElementData(client, "samouczek", q[1].samouczek)
		    setElementData(client, "gold", q[1].gold)
		    setElementData(client, "exp", q[1].exp)
			setElementData(client, "premium", q[1].premium)
			setElementData(client, "skrot", q[1].skrotklanu)
			setElementData(client, "rejestracja", q[1].rejestracja)
			setElementData(client, "serial", serial)
			setPlayerName(client, login)
		  --triggerClientEvent(client, "pobierz:czolgi", root)
			--triggerClientEvent(client, "event:przejsciowy", resourceRoot)
			--triggerClientEvent(client, "pokaz:zalogi", client)

end 
end)


addEvent("autoryzacja:serial", true)
addEventHandler("autoryzacja:serial", getRootElement(), function()
	local login = getElementData(client, "login")
	local serial = getPlayerSerial(client)
	local r = DB:query("SELECT * from wot_list WHERE serial=?", serial)
	 if r and #r == 0 then 
		kickPlayer(client, string.format("Console"), string.format("Nie jesteś wpisany na whiteliste.!"))
	 else 
		if r and #r > 0 then 
			--triggerClientEvent(client, "trigger:off", resourceRoot)
			--triggerClientEvent(client, "ustaw:nick", root)
			print("2")
			--dbExec(db, "INSERT INTO wot_logs_serwer SET jakilog=?, co=?, kto=?", "Logowanie", "NULL", login)
		end 
	end 
end 
)
 


addEvent("kickuj:frajera:z:banem", true)
addEventHandler("kickuj:frajera:z:banem", getRootElement(), function(login)
	local q = DB:query("SELECT * from wot_bans WHERE login=?", login)
	if q and #q > 0 then 
	  kickPlayer(client, string.format(q[1].banujacy), string.format(q[1].powod)
	  end 
	end 
  end)

                  addEvent("ustaw:nickS", true)
				  addEventHandler("ustaw:nickS", getRootElement(), function()
					local nowyLogin =  "["..getElementData(client, "skrot").. "] "..getElementData(client, "login")
					setElementData(client, "login", nowyLogin)
					print("1")
                  end)
                  



---[[addEventHandler("onPlayerQuit",root,function(plr)
	---dbQuery(db, "UPDATE wot_users SET money=?, samouczek=?, gold=?, exp=? WHERE login=?", getPlayerMoney(plr), getElementData(plr, "samouczek"), getElementData(plr, "gold"), getElementData(plr, "exp"), getPlayerName(plr))
---end)




local czolg = {
	{-2422.31738, -608.37939, 132.56250}
}

---- samouyczek

addEvent("otworz:gui", true)
addEventHandler("otworz:gui", getRootElement(), function()
	triggerClientEvent(client, "open", resourceRoot)
end)


addEvent("samouczek", true)
addEventHandler("samouczek", getRootElement(), function()
 triggerClientEvent(client, "stworz:samouczek", resourceRoot)
 triggerClientEvent(client, "trigger", resourceRoot)
end)

addEvent("schowaj", true)
addEventHandler("schowaj", getRootElement(), function()
	triggerClientEvent(client, "wylacz")
end)


---- funkcje odpowiedzialne za pobór czołgów z bazy danych

addEvent("pobierz:Czolgi", true)
addEventHandler("pobierz:Czolgi", getRootElement(), function()
	local r = DB:query("SELECT model,pz,exp,czolg,uid FROM wot_tanks WHERE login=?", getElementData(client, "login"))
	for k = 1,5 do
		local czolgi = {}
		sCzolg = r[k].model 
		sPz = r[k].pz 
		sTier = r[k].czolg 
		sExp = r[k].exp 
		sUID = r[k].uid 
				table.insert(czolgi, {sCzolg, sPz, sTier, sExp, sUID})
				print("Model "..sCzolg.."Pz "..sPz.."Tier "..sTier.. "Exp "..sExp.."UID "..sUID)
				triggerClientEvent(client, "pokaz:czolgi", client, czolgi)
	end
end)


	addEvent("zatwierdz:pojazd", true)
	addEventHandler("zatwierdz:pojazd", getRootElement(), function()
		local r = DB:query("SELECT model,bulletdmg,pz,reloadtime,acpr,ap,exp from wot_tanks WHERE uid=?", getElementData(client, "uid"))
		print(getElementData(client, "uid"))
						local model = r[1].model
						local dmg =  r[1].bulletdmg
						local pz =  r[1].pz
						local reloadtime = r[1].reloadtime
						local penetrationAPCR = r[1].acpr
						local penetrationAP = r[1].ap
						local exp = r[1].exp
						local active = r[1].model
						setElementData(client, "active:tank", active)
						print("XD?????")
						  triggerClientEvent(client, "setCzolg", resourceRoot, model, dmg, pz, reloadtime, penetrationAPCR, penetrationAP, exp, active)
end)


----- triggery odpowiedzialne za kupna pojazdów

--[[addEvent("t26:buy", true)
addEventHandler("t26:buy", getRootElement(), function(login)
	if model == fromJSON("T26") then 
		outputChatBox("Posiadasz już ten pojazd! Przejdź do badania", client, 255, 255, 255)
		else
   local money = getPlayerMoney(client)
   local exp = getElementData(localPlayer, "expczolg")
	 if money > 5000 then 
		dbExec(db, "INSERT INTO wot_tanks SET login=?, id=?, model=?, pz=?, drzewko=?, czolg=?, dzialo=?, silnik=?, expczolg=?", login, math.random(0,9999), "T26", "150", "ZSSR", "1", "podstawowe", "podstawowy", "0")
		dbExec(db, "INSERT INTO wot_logs_serwer SET jakilog=?, co=?, kto=?", "Zakup", "T26", login)
		outputChatBox("Zakupiłeś T26!", client, 255, 255, 255)
		takePlayerMoney(tonumber(5000))
		setElementData(client, "expczolg", tonumber(exp) - 150)
		triggerClientEvent(client, "removeHandler", resourceRoot)
		exports.wotnotyfikacje:createPojazd(5) 
		else 
			if money < 5000 then 
				outputChatBox("Nie posiadasz wystarczającej liczby pieniędzy.", client, 255, 255, 255)
					end 
				end 
		end 
	)]]

	addEventHandler("onPlayerChat", getRootElement(), function(msg, type)
		if type == 0 then 
			cancelEvent()
		else 
			if type ==  1 then 
				cancelEvent()
			else 
				if type == 2 then 
					cancelEvent()
				end 
			end 
		end 
	end)

	addEvent("event:przejsciowy:2", true)
	addEventHandler("event:przejsciowy:2", getRootElement(), function()
		triggerClientEvent(client, "wyswietl:gui:zaproszenia:pluton", resourceRoot)
		print("don2")
	end)

	-- eventy z zepsutego server_lobby.lua


invite = {}
  function sends(nick)
    local gracz = getPlayerFromName(nick)
		invite[gracz] = {}
		invite[gracz] = {source}
		local gracze = getPlayerName(source)
    triggerClientEvent(gracz, "invite:gone", root, gracz, gracze, nick)
  end
    addEvent("przeslano", true)
    addEventHandler("przeslano", root, sends)

	addEvent("przyjeto", true)
	addEventHandler("przyjeto", getRootElement(), function(nick)
		local dowodca = getPlayerFromName(nick)
		triggerClientEvent(dowodca, "pluton:przyjeto:dowodca", resourceRoot)
		triggerClientEvent(client, "pluton:przyjeto:drugigracz", resourceRoot)
		print("wykonano2")
	end)

	addEvent("odrzucono", true)
	addEventHandler("odrzucono", getRootElement(), function(nick)	
		print("odrzucono")
	end)


	