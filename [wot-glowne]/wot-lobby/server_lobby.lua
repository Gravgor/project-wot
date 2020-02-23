



local exp = getElementData(client, "expFromBattle")
local doubleexp = exp * 2
local DB = exports['wot-db']

addEvent("getDoubleExp", true)
addEventHandler("getDoubleExp", getRootElement(), function(client)
    if battle == win then 
        if getElementData(client, "doubleexp") == true then 
            local doubleexp = setElementData(client, "exp", exp*2)
              print(doubleexp)
                    local r = DB:query("UPDATE wot_users SET exp=?", doubleexp)
                      triggerClientEvent(client, "openBattleResults", client, doubleexp) --- do dodania w wot_battles
                      end 
                    end 
            end
        )




addEvent("odrzucono",true)
addEventHandler("odrzucono",root, 
	function(nick, plr)
		local gracz = getPlayerName(name)
		local plr = invite[source][1]
		outputChatBox("Gracz"..gracz.." odrzuca zaproszenie", plr, 255,255,255,true)
		invite[source] = nil
	end
)

addEvent("przyjeto", true)
addEventHandler("przyjeto", root, 
  function(nick, plr)
    local nick = getPlayerName(name)
    local plr = invite[source][1]
    outputChatBox("Gracz" ..gracz.. "przyjął zaproszenie", plr, 255, 255, 255, true)
    invite[source] = nil
  end
)


