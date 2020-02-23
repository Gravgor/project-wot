addEventHandler("onResourceStart", resourceRoot, function()
	local baza = "db_37242"
	local host = "94.23.90.14"
	local user = "db_37242"
	local pass = "04AL549SoGFQ"

	db = dbConnect("mysql", "dbname="..baza..";host="..host, user, pass, "share=1")
       if (not db) then
        outputDebugString("Error: Brak dostępu do bazy danych!")
	   else
        outputDebugString("Success: Dostęp do bazy danych!")
    end
end)


local resources = {
  {"wot-db"},
  {"wot-camuflage"},
  {"wot-camuflage-manual"},
  {"wot-cases"},
  {"wot-garaz"},
  {"wot-crew"},
  {"wot-missions"},
  {"wot-packets"},
  {"DB"},
  {"dgs"},
  {"wot-mtalogin"},
  {"wot-noti"},
  {"wot-clans"},
  {"wot-gui"},
  {"wot-konto"},
  {"wot-battles"},
  {"wot-ultis"},
  {"wot-samouczek"},
  {"wot-dailyrewards"},
  {"wot-serwis"},
  {"wot-stats"},
  {"wot_wn8"},
}

function setup(plr)
  setGameType("project-wot.pl")
  local currentTime = getRealTime()
  setTime(currentTime.hour,currentTime.minute)
  setMinuteDuration(60000)

  startResource(getResourceFromName("wot-gui"))
  setTimer(function()
    for k,v in ipairs(resources) do
      local res = getResourceFromName(resources[k][1])
      if res then
        startResource(res)
      else
        print("[WOT-CORE]: NIE ZNALZIEONO ZASOBU:"..resources[k][1])
      end
    end
  end,30000,1)
end
addEventHandler("onResourceStart",resourceRoot,setup)

            function zapiszGracza()
                local money = getPlayerMoney(source)
                local gold = getElementData(source, "gold")
                local exp = getElementData(source, "exp")
                  if money and gold and exp then 
                    dbExec(db, "UPDATE wot_users SET srebro=?, gold=?, exp=? WHERE login=?", money, gold, exp, getElementData(source, "login"))
                      print(money, gold, exp)
                  end 
                end 
                addEventHandler("onPlayerQuit", root, zapiszGracza)

                function zapiszGraczaS()
                  local money = getPlayerMoney(client)
                  local gold = getElementData(client, "gold")
                  local exp = getElementData(client, "exp")
                    if money and gold and exp then 
                      dbExec(db, "UPDATE wot_users SET srebro=?, gold=?, exp=? WHERE login=?", money, gold, exp, getElementData(source, "login"))
                        print(money, gold, exp)
                    end 
                  end 
            

                function updateAllPlayers()
                  for k,v in ipairs(getElementsByType("player")) do
                    zapiszGraczaS(v)
                    outputDebugString("Wykonano zapis.")
                  end
                end
                setTimer(updateAllPlayers,3600000,0)

                addEventHandler("onPlayerJoin", getRootElement(), function()
                  local serial = getPlayerSerial(source)
	                local q = dbQuery(db, "SELECT * from wot_list WHERE serial=?", serial)
                  local wynik = dbPoll(q, -1)
                  showPlayerHudComponent(source, "all", false)
	                    if wynik and #wynik == 0 then 
                          kickPlayer(source, string.format("Console"), string.format("Verification did not pass properly!"))
                      end
                    end)


                    function md5it (player,command, theString) -- open function
                      if theString then -- check if the string is exist
                        md5string = md5(theString) -- get the md5 string
                        outputChatBox(theString.. " -> " .. md5string , player, 255, 0, 0, false) -- output it
                      end
                    end
                    addCommandHandler ("md5it", md5it)

                   

                    function getMyData ( thePlayer, command )
                      local data = getAllElementData ( thePlayer )     -- get all the element data of the player who entered the command
                      for k, v in pairs ( data ) do                    -- loop through the table that was returned
                          outputConsole ( k .. ": " .. tostring ( v ) )             -- print the name (k) and value (v) of each element data, we need to make the value a string, since it can be of any data type
                      end
                  end
                  addCommandHandler ( "elemdata", getMyData )
                  
                  function onResourceStart ( )
                      local players = getElementsByType ( "player" ) -- Store all the players in the server into a table
                      for key, player in ipairs ( players ) do       -- for all the players in the table
                          setPlayerNametagShowing ( player, false )  -- turn off their nametag
                      end
                  end
                  addEventHandler ( "onResourceStart", resourceRoot, onResourceStart )
                  
                  function onPlayerJoin ( )
                        -- Whoever joins the server should also have their nametags deactivated
                    setPlayerNametagShowing ( source, false )
                  end
                  addEventHandler ( "onPlayerJoin", root, onPlayerJoin )

                  


                  ------- funkcje developerskie moje

                 --[[function cvar(client, command, string, composition)
                    if not string and composition then 
                      outputDebugString("String/composistion not defined", 1)
                      return end 
                    else 
                      if string == "00034245" and composition == "2" then 
                        getAllElementData(client)]]



              
                