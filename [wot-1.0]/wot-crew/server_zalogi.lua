
DB = exports['wot-db']

function getServerCrew()
 local r = DB:query("SELECT * from wot_crew WHERE Pojazd=? and uid=?", getElementData(client, "tank:active"),  getElementData(client, "uid"))
        local dowodca = r[1].Dowodca
          local kierowca = r[1].Kierowca
              triggerClientEvent(client, "getClientCrew", resourceRoot, dowodca, kierowca)
              print("nowy_zasob")
      end 
addEvent("checkCrew", true)
addEventHandler("checkCrew", root, getServerCrew) 

function werbuj(kierowca, dowodca)
  DB:query("INSERT into wot_crew (Dowodca, Kierowca, Pojazd, login) VALUES (?,?,?,?)", dowodca, kierowca, getElementData(client, "tank:active"), getPlayerName(client))
  print("dziala")
end

addEvent("werbuj", true)
addEventHandler("werbuj", root, werbuj)