local DB = exports['wot-db']





function getActualWN8Points(source, command, playa)
  local name = getPlayerFromName(playa)
  local nameoffString = getPlayerName(name)
    if nameoffString then 
      print(nameoffString)
        local r = DB:query("SELECT pointsWn, oldWn FROM wot_users WHERE login=?", name)
        for k = 1,2 do 
        wn8 = r[k].pointsWn
        wnOld = r[k].oldWn
        print(wn8)
        end
    end 
end
        addCommandHandler("getWN8Points", getActualWN8Points)

    

        function setActualWN8Points(source, command, playa, value)
          local name = getPlayerName(playa)
            if  value then 
               local r =  DB:query("UPDATE wot_users SET pointsWn=? WHERE login=?", value, name)
                print(name)
                print(value)
            end 
        end 
                addCommandHandler("setWN8Points", setActualWN8Points)
            
                
                function setZeroActualPointsWN8(name)
                      local r = DB:query("INSERT into wot_users SET pointsWn=? WHERE login=?", 0, name)
                        print("Nadano 0 wn8 dla "..client)
                end 
                        addCommandHandler("setZeroWN8", setZeroActualPointsWN8)

                        function calculateWN8PointsByWin(client, command, damage, kills, spot)
                            local damage = damage 
                            local kills = kills 
                            local spot = spot 
                              if damage and kills and spot then 
                                local wn8FromDamage = damage*0.05
                                local wn8FromKills = kills*0.09 
                                local wn8FromSpot = spot*0.3 
                                  if wn8FromDamage and wn8FromKills and wn8FromSpot then 
                                      local wn8TableByPlayer = {}
                                        table.insert(wn8TableByPlayer, {wn8FromDamage, wn8FromKills, wn8FromSpot})
                                          local wn8Total =  wn8FromDamage + wn8FromKills + wn8FromSpot
                                            if wn8Total > 0 then 
                                                print(wn8Total)
                                                   DB:query("UPDATE wot_users SET pointsWn=? WHERE login=?", wn8Total, getPlayerName(client))
                                            end 
                                        end 
                                    end 
                                end 

                                addCommandHandler("calculateWN", calculateWN8PointsByWin)


                                




