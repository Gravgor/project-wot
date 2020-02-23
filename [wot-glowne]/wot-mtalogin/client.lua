local screenW, screenH = guiGetScreenSize()
DGS = exports.dgs
local username = DGS:dgsCreateEdit(0.29, 0.68, 0.45, 0.08, "Wpisz login", true,nil,tocolor(255,255,255,255),1,1,false,tocolor(0,0,0,0))
local password = DGS:dgsCreateEdit(0.29, 0.78, 0.45, 0.08, "", true, nil, tocolor(255, 255, 255, 255), 1, 1, false, tocolor(0,0,0,0))
sw,sh = guiGetScreenSize() --The actual screen size



---Na początku będzie taki prelogin jak w world od tanks, czytaj - odtworzony filmik na początek przy logowaniu


--addEventHandler("onClientJoin", getRootElement(), function()
--if isTransferBoxActive() == true then
	--- Funkcja na odtworzenie filmiku
		-- triggerEvent(localPlayer, "trigger:gui")
	--  setElementData(localPlayer, "player:logging", true)
	--else
	--	if not getElementData(localPlayer, "player:logging") == true then
	--		cancelEvent(isTransferBoxActive)
	--	end
--	end
--	end
--)

requestBrowserDomains({ "naszastrona.pl" }) -- request browser domain
showCursor(true) -- show cursor
addEventHandler("onClientBrowserWhitelistChange", root,
 function(newDomains)
	 if newDomains[1] == "naszastrona.pl" then
		 local browser = createBrowser(1280, 720, false, false) -- create browser
		 loadBrowserURL(browser, "http://naszastrona.pl") -- load browser url
 end
end
)


--[[addEvent("faq", true)
addEventHandler("faq", getRootElement(), function()

--Let's create a new browser in local mode. We will not be able to load an external URL.
local webBrowser = createBrowser(screenWidth, screenHeight, true, false)

--This is the function to render the browser.
function webBrowserRender()
--Render the browser on the full size of the screen.
dxDrawImage(0, 0, screenWidth, screenHeight, webBrowser, 0, 0, 0, tocolor(255,255,255,255), true)
end

--The event onClientBrowserCreated will be triggered, after the browser has been initialized.
--After this event has been triggered, we will be able to load our URL and start drawing.
addEventHandler("onClientBrowserCreated", webBrowser,
function()
	--After the browser has been initialized, we can load our file.
	loadBrowserURL(webBrowser, "http://mta/local/html/site.html")
	--Now we can start to render the browser.
	addEventHandler("onClientRender", root, webBrowserRender)
end
)]]


---Dalsze funkcje od logowania
---Logowanie, przenoszenie na stronie aby zarejestrowa się
---Dalsza częsc po stronie serwera; serwer, mozliwosc loginu przez google, faq
---Evencik odpowiadający za wywietlanie aktualnej nazwy serwera, oraz możliwośc przejscia na inny serwer
addEventHandler("onClientResourceStart", resourceRoot, function()
showGUI(true)
fadeCamera(true)
end)
 
addEvent("trigger:off", true)
addEventHandler("trigger:off", getRootElement(), function()
showGUI(false)
showGaraz(true)
exports.wotloading:createLoading(5)
end)

addEvent("otworz", true)
addEventHandler("otworz", getRootElement(), function()
  showGUI(true)
end)

addEvent("trigger", true)
addEventHandler("trigger", getRootElement(), function()
showGaraz(false)
showSamouczekGUI(false)
end)

addEvent("trigger:on", true)
addEventHandler("trigger:on", getRootElement(), function()
showGarazSamouczek(true)
end)

addEvent("wylacz", true)
addEventHandler("wylacz", getRootElement(), function()
showGaraz(true)
showBadania(false)
end)

local guiPolandVersion = {
button1 = guiCreateButton(0.40, 0.90, 0.22, 0.07, "", true),
}

toggleControl("enter_exit",false)
local mm = {"mm1","mm2"}
local MM = math.random(#mm)

function dxRender()
  dxDrawImage(0,0,sw,sh, mm[MM]..".png")
  dxDrawImage(screenW * 0.3221, screenH * 0.3828, screenW * 0.3684, screenH * 0.3620, ":wot-garaz/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.2875, screenH * 0.6797, screenW * 0.4463, screenH * 0.0846, ":wot-garaz/poletekstowe.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.2875, screenH * 0.7773, screenW * 0.4463, screenH * 0.0846, ":wot-garaz/poletekstowe.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("Login", screenW * 0.2206, screenH * 0.7005, screenW * 0.3676, screenH * 0.7852, tocolor(127, 125, 129, 255), 2.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawText("Hasło", screenW * 0.2206, screenH * 0.7982, screenW * 0.3676, screenH * 0.8828, tocolor(127, 125, 129, 255), 2.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.3971, screenH * 0.8958, screenW * 0.2176, screenH * 0.0755, ":wot-garaz/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("Zaloguj się!", screenW * 0.4537, screenH * 0.9154, screenW * 0.6007, screenH * 1.0000, tocolor(127, 125, 129, 255), 2.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawText("Nie posiadasz konta? Zarejestruj się na forum - www.project-wot.pl", screenW * 0.3603, screenH * 0.8698, screenW * 0.7787, screenH * 0.8958, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
end

function renderblad()
  dxDrawText("Musisz uzupełnić oba pola, przed dojściem do rozgrywki!", (screenW * 0.1912) - 1, (screenH * 0.0924) - 1, (screenW * 0.6912) - 1, (screenH * 0.2161) - 1, tocolor(0, 0, 0, 255), 3.00, "default-bold", "left", "top", false, false, false, true, false)
    dxDrawText("Musisz uzupełnić oba pola, przed dojściem do rozgrywki!", (screenW * 0.1912) + 1, (screenH * 0.0924) - 1, (screenW * 0.6912) + 1, (screenH * 0.2161) - 1, tocolor(0, 0, 0, 255), 3.00, "default-bold", "left", "top", false, false, false, true, false)
    dxDrawText("Musisz uzupełnić oba pola, przed dojściem do rozgrywki!", (screenW * 0.1912) - 1, (screenH * 0.0924) + 1, (screenW * 0.6912) - 1, (screenH * 0.2161) + 1, tocolor(0, 0, 0, 255), 3.00, "default-bold", "left", "top", false, false, false, true, false)
    dxDrawText("Musisz uzupełnić oba pola, przed dojściem do rozgrywki!", (screenW * 0.1912) + 1, (screenH * 0.0924) + 1, (screenW * 0.6912) + 1, (screenH * 0.2161) + 1, tocolor(0, 0, 0, 255), 3.00, "default-bold", "left", "top", false, false, false, true, false)
    dxDrawText("Musisz uzupełnić oba pola, przed dojściem do rozgrywki!", screenW * 0.1912, screenH * 0.0924, screenW * 0.6912, screenH * 0.2161, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, true, false)
    end


function loginButton(button, state)
 local serial = getPlayerSerial(localPlayer)
 local login = DGS:dgsGetText(username)
 local passwordWpisane = DGS:dgsGetText(password)
  if login == nil and passwordWpisane == nil then 
    addEventHandler("onClientRender", root, renderblad)
      setTimer( function()
         removeEventHandler("onClientRender", root, renderblad)
      end, 10000, 1)
      cancelEvent()
    else 
					 if source ~= guiPolandVersion.button1 then return end
            triggerServerEvent("check:player:in:database", resourceRoot, login, passwordWpisane)
            triggerServerEvent("autoryzacja:serial", resourceRoot)
            triggerServerEvent("kickuj:frajera:z:banem", resourceRoot, login)
  end
end
addEventHandler("onClientGUIClick", root, loginButton)





function showGUI(value)
if value then
	showCursor(true)
	setPlayerHudComponentVisible("all", false)
	addEventHandler("onClientRender", root, dxRender)
	DGS:dgsSetVisible(username, true)
	DGS:dgsSetVisible(password, true)
	DGS:dgsEditSetMasked(password, true)
	guiSetVisible(guiPolandVersion.button1, true)
  guiSetVisible(guiPolandVersion.button2, true)
  local muzyczka = playSound("files/wot-main.mp3")
  setSoundVolume(muzyczka, 0.5)
  showChat(false)
else
	showCursor(false)
	setPlayerHudComponentVisible("all", false)
	removeEventHandler("onClientRender", root, dxRender)
	DGS:dgsSetVisible(username, false)
	DGS:dgsSetVisible(password, false)
	guiSetVisible(guiPolandVersion.button1, false)
  guiSetVisible(guiPolandVersion.button2, false)
  destroyElement(muzyczka)
end
end




--- shader 

--[[local isMRTEnabled = false
local wallShader = {}
local PWTimerUpdate = 110
local actKey = 'o']]

-----------------------------------------------------------------------------------
-- enable/disable
-----------------------------------------------------------------------------------
--[[function enablePedWall(isMRT)
	if isMRT and isPostAura then 
		myRT = dxCreateRenderTarget(scx, scy, true)
		myShader = dxCreateShader("fx/post_edge.fx")
		if not myRT or not myShader then 
			outputChatBox('PedWall: Out of memory!',255,0,0)
			isMRTEnabled = false
			return
		else
			outputDebugString('PedWall: Enabled MRT variant')
			dxSetShaderValue(myShader, "sTex0", myRT)
			dxSetShaderValue(myShader, "sRes", scx, scy)
			isMRTEnabled = true
		end
	else
		outputDebugString('PedWall: Enabled non MRT variant')
		isMRTEnabled = false
	end
	pwEffectEnabled = true
	enablePedWallTimer(isMRTEnabled)
	outputChatBox('PedWall turned on',255,128,0)
	outputChatBox('Press '..actKey..' for x-ray vision',255,128,0)
end

function disablePedWall()
	pwEffectEnabled = false
	disablePedWallTimer()
	if isElement(myRT) then
		destroyElement(myRT)
	end
	outputChatBox('PedWall turned off',255,128,0)
end]]






guiSetAlpha(guiPolandVersion.button1, 0.00)
guiSetAlpha(guiPolandVersion.button2, 0.00)

local sx, sy = guiGetScreenSize ()
function mysz (psx,psy,pssx,pssy,abx,aby)
  if not isCursorShowing() then return end
  cx,cy=getCursorPosition()
  cx,cy=cx*sx,cy*sy
      if cx >= psx and cx <= psx+pssx and cy >= psy and cy <= psy+pssy then
      return true,cx,cy
      else
      return false
  end
  end

--- wylaczanie
--- ms1

addEventHandler("onClientClick", root, function(btn, state)
  if btn == "left" and state == "down" then
    if mysz (112, 733, 383, 772) then 
      showMS1(false)
      print("siema")
    end 
  end
end)

--t26

addEventHandler("onClientClick", root, function(btn, state)
  if btn == "left" and state == "down" then
    if mysz (112, 733, 383, 772) then 
      showT26(false)
      print("siema")
    end 
  end
end)



---- Garaz
local screenW, screenH = guiGetScreenSize()


local gui = { 
        samouczek =  guiCreateButton(0.37, 0.15, 0.05, 0.02, "", true),
        badania = guiCreateButton(0.43, 0.15, 0.05, 0.02, "", true),
        sklep =  guiCreateButton(0.55, 0.15, 0.05, 0.02, "", true),
        serwis = guiCreateButton(0.40, 0.73, 0.06, 0.04, "Serwis", true),
        wyglad = guiCreateButton(0.53, 0.73, 0.06, 0.04, "Personalizacja", true),  
        misje =  guiCreateButton(0.48, 0.15, 0.05, 0.02, "", true),
        bg_badaj = guiCreateButton(0.88, 0.23, 0.09, 0.03, "Badaj", true)    
}

function render()
  dxDrawImage(screenW * 0.0000, screenH * -0.1484, screenW * 1.0000, screenH * 0.4414, ":wot-garaz/pasekgorny.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.0074, screenH * 0.0443, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonakonfiguracji.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText(tostring(getElementData(localPlayer, "login") or "NULL"), screenW * 0.0463, screenH * 0.0573, screenW * 0.1125, screenH * 0.1016, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.1199, screenH * 0.0443, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonagolda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("Premium" ..tonumber(getElementData(localPlayer, "premium") or "0").. "dni", screenW * 0.1632, screenH * 0.0573, screenW * 0.2243, screenH * 0.0990, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.3654, screenH * -0.0534, screenW * 0.2912, screenH * 0.2396, ":wot-garaz/WALCZ!.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("Stwórz swój pluton! Zagraj ze znajomymi! Przyciśnij mnie!", screenW * 0.3096, screenH * 0.0326, screenW * 0.4044, screenH * 0.0990, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("Tryb: Bitwa losowa", screenW * 0.6243, screenH * 0.0339, screenW * 0.7169, screenH * 0.0990, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawText("Bitwa!", screenW * 0.4757, screenH * 0.0404, screenW * 0.6566, screenH * 0.0990, tocolor(255, 255, 255, 255), 2.50, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.7471, screenH * 0.0339, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonasrebra.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText(tonumber(getPlayerMoney(localPlayer)), screenW * 0.7875, screenH * 0.0469, screenW * 0.8801, screenH * 0.1120, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.8287, screenH * 0.0339, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonagolda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText(tonumber(getElementData(localPlayer, "gold") or "0"), screenW * 0.8728, screenH * 0.0469, screenW * 0.9654, screenH * 0.1120, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.9132, screenH * 0.0339, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonaexpa.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText(tonumber(getElementData(localPlayer, "exp") or "0"),  screenW * 0.9544, screenH * 0.0469, screenW * 1.0471, screenH * 0.1120, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.3654, screenH * 0.1432, screenW * 0.2868, screenH * 0.0378, ":wot-garaz/pasek_pod_HP.png", 0, 0, 0, tocolor(255, 0, 0, 66), false)
  dxDrawText("Samouczek", 503, 116, 554, 127, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawText("Badania", screenW * 0.4353, screenH * 0.1523, screenW * 0.4728, screenH * 0.1667, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawText("Sklep", screenW * 0.4941, screenH * 0.1523, screenW * 0.5316, screenH * 0.1667, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawText("Kampanie", screenW * 0.5515, screenH * 0.1536, screenW * 0.5890, screenH * 0.1680, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.7824, screenH * 0.2044, screenW * 0.2176, screenH * 0.0820, ":wot-garaz/pasek_pod_HP.png", 0, 0, 0, tocolor(255, 0, 0, 125), false)
  dxDrawImage(screenW * 0.8081, screenH * 0.2174, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonaexpa.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText(tonumber(getElementData(localPlayer, "player:active:tank:exp")), screenW * 0.8426, screenH * 0.2305, screenW * 0.8610, screenH * 0.2565, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.7824, screenH * 0.2995, screenW * 0.2176, screenH * 0.1133, ":wot-garaz/pasek_pod_HP.png", 0, 0, 0, tocolor(255, 0, 0, 125), false)
  dxDrawImage(screenW * 0.7750, screenH * 0.3203, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText(tostring(getElementData(localPlayer, "player:active:tank") or "Brak aktywnego pojazdu!"), screenW * 0.8779, screenH * 0.3346, screenW * 0.9669, screenH * 0.3828, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
end


---- funckej odpowiedzialne za pobór czołgów z bazy


addEvent("pobierz:czolgi", true)
addEventHandler("pobierz:czolgi", getRootElement(), function()
  triggerServerEvent("pobierz:Czolgi", localPlayer)
end)


addEvent("pokaz:czolgi", true)
addEventHandler("pokaz:czolgi", getRootElement(), function(czolgi)
  for i,v in ipairs(czolgi) do 
      if v["model"] == "OBJ 705a" then 
        addEventHandler("onClientRender", root, function()
        dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end)
          setElementData(localPlayer, "player:active:tank", v["model"])
          setElementData(localPlayer, "player:active:tank:exp", v["exp"])
      else 
        if v["model"] == "MS1" then 
          addEventHandler("onClientRender", root, function()
            dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            end)
            setElementData(localPlayer, "player:active:tank", v["model"])
          setElementData(localPlayer, "player:active:tank:exp", v["exp"])
          else 
            if v["model"] == "T24" then 
              addEventHandler("onClientRender", root, function()
                dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                end)
                setElementData(localPlayer, "player:active:tank", v["model"])
              setElementData(localPlayer, "player:active:tank:exp", v["exp"])
              else 
                if v["model"] == "T46" then 
                  addEventHandler("onClientRender", root, function()
                    dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                    end)
                    setElementData(localPlayer, "player:active:tank", v["model"])
                  setElementData(localPlayer, "player:active:tank:exp", v["exp"])
                  else 
                    if v["model"] == "T28" then 
                      addEventHandler("onClientRender", root, function()
                        dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                        end)
                        setElementData(localPlayer, "player:active:tank", v["model"])
                      setElementData(localPlayer, "player:active:tank:exp", v["exp"])
                      else 
                        if v["model"] == "KV1" then 
                          addEventHandler("onClientRender", root, function()
                            dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                            end)
                            setElementData(localPlayer, "player:active:tank", v["model"])
                          setElementData(localPlayer, "player:active:tank:exp", v["exp"])
                          else 
                            if v["model"] == "KV1S" then 
                              addEventHandler("onClientRender", root, function()
                                dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                                end)
                                setElementData(localPlayer, "player:active:tank", v["model"])
                              setElementData(localPlayer, "player:active:tank:exp", v["exp"])
                              else 
                                if v["model"] == "KV85" then 
                                  addEventHandler("onClientRender", root, function()
                                    dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                                    end)
                                    setElementData(localPlayer, "player:active:tank", v["model"])
                                  setElementData(localPlayer, "player:active:tank:exp", v["exp"])
                                  else 
                                    if v["model"] == "T150" then 
                                      addEventHandler("onClientRender", root, function()
                                        dxDrawImage(screenW * 0.0787, screenH * 0.8112, screenW * 0.1632, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
                                        end)
                                        setElementData(localPlayer, "player:active:tank", v["model"])
                                      setElementData(localPlayer, "player:active:tank:exp", v["exp"])
      end 
    end 
  end 
end 
end 
end 
end 
end 
end 
end
  end)




-----

guiSetVisible(gui.misje, false)
guiSetVisible(gui.bg_badaj, false)

function showGaraz(value)
	if value then
		addEventHandler("onClientRender", root, render)
  setCameraMatrix(-2410.36011, -599.83459, 134.13739, -2429.59253, -621.47955, 133.22760)
    showCursor(true)
    guiSetVisible(gui.samouczek, true)
    guiSetVisible(gui.badania, true)
    guiSetVisible(gui.sklep, true)
    guiSetVisible(gui.misje, true)
    guiSetVisible(gui.serwis, true)
    guiSetVisible(gui.wyglad, true)
    guiSetVisible(gui.bg_badaj, true)
    local pojazdPrem=createVehicle(432, -2438.21582, -620.25208, 132.55531)
    setElementFrozen(pojazdPrem, true)
    if not getElementData(localPlayer, "player:active:tank") then return end
    local veh=createVehicle(432, -2422.31738, -608.37939, 132.56250)
    warpPedIntoVehicle(veh)
	else
		removeEventHandler("onClientRender", root,  render)
    showCursor(false)
    destroyElement(veh)
    guiSetVisible(gui.samouczek, false)
    guiSetVisible(gui.badania, false)
    guiSetVisible(gui.sklep, false)
    guiSetVisible(gui.serwis, false)
    guiSetVisible(gui.wyglad, false)
    guiSetVisible(gui.misje, false)
    guiSetVisible(gui.bg_badaj, false)
    guiSetVisible(bc.grid, false)
    guiSetVisible(bc.button, false)

	
end
end




bindKey("f1", "down", function()
  showBadania(false)
end)

addEvent("open", true)
addEventHandler("open", getRootElement(), function()
	showSamouczekGUI(true)
end)


function renderSamouczek()
    dxDrawImage(screenW * 0.1699, screenH * 0.0130, screenW * 0.5860, screenH * 0.8255, ":wot-garaz/tlopodczogi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  end




function wlaczSamouczek(button, state)
  if source ~= gui.samouczek then return end
  if getElementData(localPlayer, "samouczek") == "1" then return end
    outputChatBox("Ukończyłeś już samouczek", 255, 255, 255)
  triggerServerEvent("samouczek", resourceRoot)
end
addEventHandler("onClientGUIClick", root, wlaczSamouczek)

guiSetVisible(gui.samouczek, false)
guiSetVisible(gui.badania, false)
guiSetVisible(gui.sklep, false)
guiSetVisible(gui.serwis, false)
    guiSetVisible(gui.wyglad, false)
    guiSetAlpha(gui.samouczek, 0.00)
    guiSetAlpha(gui.badania, 0.00)
    guiSetAlpha(gui.sklep, 0.00)
    guiSetAlpha(gui.misje, 0.00)


function wlaczSerwis(button, state)
  if source ~= gui.serwis then return end 
      triggerServerEvent("pokaz:gui:client", resourceRoot)

  end
  addEventHandler("onClientGUIClick", root, wlaczSerwis)

  

----- drzewko badan


function renderBadania()
    dxDrawImage(screenW * 0.0074, screenH * 0.0208, screenW * 0.1478, screenH * 0.1393, ":wot-garaz/rosja.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Drzewko narodowe Rosja", screenW * 0.0191, screenH * 0.1602, screenW * 0.1824, screenH * 0.2083, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.4551, screenH * 0.0273, screenW * 0.1324, screenH * 0.1055, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.4331, screenH * 0.0625, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("MS-1 Tier I", screenW * 0.4662, screenH * 0.0430, screenW * 0.5706, screenH * 0.0625, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("", 706, 91, 706, 207, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
    dxDrawLine(screenW * 0.5199, screenH * 0.1172, screenW * 0.5184, screenH * 0.2760, tocolor(255, 255, 255, 255), 1, false)
    dxDrawImage(screenW * 0.4551, screenH * 0.2565, screenW * 0.1324, screenH * 0.1055, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.4331, screenH * 0.2891, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("T-26 Tier II", screenW * 0.4684, screenH * 0.2760, screenW * 0.5728, screenH * 0.2956, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)   
    dxDrawLine(screenW * 0.5154, screenH * 0.3490, screenW * 0.5147, screenH * 0.4089, tocolor(255, 255, 255, 255), 1, false)
    dxDrawImage(screenW * 0.4551, screenH * 0.3854, screenW * 0.1324, screenH * 0.1055, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)    dxDrawImage(screenW * 0.4331, screenH * 0.4219, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("T-46 Tier III", screenW * 0.4625, screenH * 0.3984, screenW * 0.5669, screenH * 0.4180, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawLine(screenW * 0.5191, screenH * 0.4922, screenW * 0.5184, screenH * 0.5521, tocolor(255, 255, 255, 255), 1, false)
    dxDrawImage(screenW * 0.4551, screenH * 0.5391, screenW * 0.1324, screenH * 0.1055, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.4331, screenH * 0.5742, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("T-28 Tier IV", screenW * 0.4625, screenH * 0.5547, screenW * 0.5669, screenH * 0.5742, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawLine(screenW * 0.5368, screenH * 0.6354, screenW * 0.5985, screenH * 0.6901, tocolor(255, 255, 255, 255), 1, false)
    dxDrawImage(screenW * 0.5801, screenH * 0.6771, screenW * 0.1324, screenH * 0.1055, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("KV-1 Tier V", screenW * 0.5912, screenH * 0.6901, screenW * 0.6956, screenH * 0.7096, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.5596, screenH * 0.7096, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)    dxDrawLine(screenW * 0.5110, screenH * 0.6341, screenW * 0.4515, screenH * 0.6966, tocolor(255, 255, 255, 255), 1, false)
    dxDrawImage(screenW * 0.3375, screenH * 0.6771, screenW * 0.1324, screenH * 0.1055, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("KV-1S Tier V", screenW * 0.3449, screenH * 0.6901, screenW * 0.4493, screenH * 0.7096, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.3191, screenH * 0.7096, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawLine(screenW * 0.3971, screenH * 0.7708, screenW * 0.3971, screenH * 0.8216, tocolor(255, 255, 255, 255), 1, false)
    dxDrawImage(screenW * 0.3375, screenH * 0.7930, screenW * 0.1324, screenH * 0.1055, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("KV-85 Tier VI", screenW * 0.3471, screenH * 0.8086, screenW * 0.4515, screenH * 0.8281, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.3162, screenH * 0.8216, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawLine(screenW * 0.6588, screenH * 0.7826, screenW * 0.6588, screenH * 0.8333, tocolor(255, 255, 255, 255), 1, false)
    dxDrawImage(screenW * 0.5838, screenH * 0.7956, screenW * 0.1324, screenH * 0.1055, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("T-150 Tier VI", screenW * 0.5949, screenH * 0.8138, screenW * 0.6993, screenH * 0.8333, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.5632, screenH * 0.8268, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Aby przejść do badań, kliknij dwa razy", screenW * 0.5154, screenH * 0.0456, screenW * 0.5765, screenH * 0.1159, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
        dxDrawText("Aby przejść do badań, kliknij dwa razy", screenW * 0.5154, screenH * 0.2747, screenW * 0.5765, screenH * 0.3451, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
        dxDrawText("Aby przejść do badań, kliknij dwa razy", screenW * 0.5154, screenH * 0.4010, screenW * 0.5765, screenH * 0.4714, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
        dxDrawText("Aby przejść do badań, kliknij dwa razy", screenW * 0.5154, screenH * 0.5560, screenW * 0.5765, screenH * 0.6263, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
        dxDrawText("Aby przejść do badań, kliknij dwa razy", screenW * 0.6412, screenH * 0.6927, screenW * 0.7022, screenH * 0.7630, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
        dxDrawText("Aby przejść do badań, kliknij dwa razy", screenW * 0.6485, screenH * 0.8112, screenW * 0.7096, screenH * 0.8815, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
        dxDrawText("Aby przejść do badań, kliknij dwa razy", screenW * 0.3993, screenH * 0.8112, screenW * 0.4603, screenH * 0.8815, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
        dxDrawText("Aby przejść do badań, kliknij dwa razy", screenW * 0.3993, screenH * 0.6927, screenW * 0.4603, screenH * 0.7630, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
  end


local buttonyDoZakupu = {
  MS1 = guiCreateButton(0.46, 0.05, 0.11, 0.07, "", true),
  T26 = guiCreateButton(0.46, 0.28, 0.11, 0.07, "", true),
  T46 = guiCreateButton(0.46, 0.40, 0.11, 0.07, "", true),
  T28 = guiCreateButton(0.46, 0.55, 0.11, 0.07, "", true),
  KV1 = guiCreateButton(0.59, 0.69, 0.11, 0.07, "", true), 
  KV1S = guiCreateButton(0.35, 0.69, 0.11, 0.07, "", true),
  T150 = guiCreateButton(0.59, 0.81, 0.11, 0.07, "", true),
  KV85 = guiCreateButton(0.35, 0.81, 0.11, 0.07, "", true),
}

guiSetAlpha(buttonyDoZakupu.MS1, 0.00)
guiSetAlpha(buttonyDoZakupu.T26, 0.00)
guiSetAlpha(buttonyDoZakupu.T46, 0.00)
guiSetAlpha(buttonyDoZakupu.T28, 0.00)
guiSetAlpha(buttonyDoZakupu.KV1, 0.00)
guiSetAlpha(buttonyDoZakupu.KV1S, 0.00)
guiSetAlpha(buttonyDoZakupu.T150, 0.00)
guiSetAlpha(buttonyDoZakupu.KV85, 0.00)
guiSetVisible(buttonyDoZakupu.MS1, false)
guiSetVisible(buttonyDoZakupu.T26, false)
guiSetVisible(buttonyDoZakupu.T46, false)
guiSetVisible(buttonyDoZakupu.T28, false)
guiSetVisible(buttonyDoZakupu.KV1, false)
guiSetVisible(buttonyDoZakupu.KV1S, false)
guiSetVisible(buttonyDoZakupu.T150, false)
guiSetVisible(buttonyDoZakupu.KV85, false)


function showBadania(value)
  if value then 
    addEventHandler("onClientRender", root, renderBadania)
    removeEventHandler("onClientRender", root, render)
    guiSetVisible(gui.samouczek, false)
  guiSetVisible(gui.badania, false)
  guiSetVisible(gui.sklep, false)
  guiSetVisible(gui.serwis, false)
    guiSetVisible(gui.wyglad, false)
    guiSetVisible(gui.misje, false)
  guiSetVisible(buttonyDoZakupu.MS1, true)
  guiSetVisible(buttonyDoZakupu.T26, true)
  guiSetVisible(buttonyDoZakupu.T46, true)
  guiSetVisible(buttonyDoZakupu.T28, true)
  guiSetVisible(buttonyDoZakupu.KV1, true)
  guiSetVisible(buttonyDoZakupu.KV1S, true)
  guiSetVisible(buttonyDoZakupu.T150, true)
  guiSetVisible(buttonyDoZakupu.KV85, true)
  else 
    addEventHandler("onClientRender", root, render)
    removeEventHandler("onClientRender", root, renderBadania)
    guiSetVisible(gui.samouczek, true)
  guiSetVisible(gui.badania, true)
  guiSetVisible(gui.sklep, true)
  guiSetVisible(gui.misje, true)
  guiSetVisible(gui.wyglad, true)
  guiSetVisible(gui.serwis, true)
  guiSetVisible(buttonyDoZakupu.MS1, false)
  guiSetVisible(buttonyDoZakupu.T26, false)
  guiSetVisible(buttonyDoZakupu.T46, false)
  guiSetVisible(buttonyDoZakupu.T28, false)
  guiSetVisible(buttonyDoZakupu.KV1, false)
  guiSetVisible(buttonyDoZakupu.KV1S, false)
  guiSetVisible(buttonyDoZakupu.T150, false)
  guiSetVisible(buttonyDoZakupu.KV85, false)
  end 
end 




function uruchom(button, state)
    if source ~= gui.badania then return end
    showBadania(true)
end 
addEventHandler("onClientGUIClick", root, uruchom)


local expczolg = getElementData(localPlayer, "expczolg") or "0 exp"

function msiRender()
  dxDrawImage(screenW * 0.2390, screenH * 0.3464, screenW * 0.1294, screenH * 0.1276, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.2176, screenH * 0.3906, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText(expczolg, screenW * 0.2926, screenH * 0.3919, screenW * 0.3478, screenH * 0.4479, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawLine(screenW * 0.3603, screenH * 0.4063, screenW * 0.4478, screenH * 0.3099, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.4404, screenH * 0.2539, screenW * 0.1294, screenH * 0.1276, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("MS-1 Tier I", screenW * 0.2596, screenH * 0.3685, screenW * 0.3478, screenH * 0.4036, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.4478, screenH * 0.2891, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
 dxDrawText("T 26 Tier II", screenW * 0.4522, screenH * 0.2708, screenW * 0.5493, screenH * 0.2943, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
dxDrawText("Kup/Zbadaj", screenW * 0.4500, screenH * 0.3424, screenW * 0.5566, screenH * 0.3594, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
dxDrawImage(screenW * 0.0000, screenH * 0.9297, screenW * 0.2176, screenH * 0.0755, ":wot-garaz/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
dxDrawText("Cofnij", 112, 733, 383, 772, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
end



---- MS1 
local buyButton = {
 t26 = guiCreateButton(0.45, 0.27, 0.10, 0.09, "", true),
 t26p = guiCreateButton(0.39, 0.91, 0.20, 0.08, "", true),
 t46 = guiCreateButton(0.51, 0.46, 0.11, 0.07, "", true),
 t46p = guiCreateButton(0.39, 0.91, 0.20, 0.08, "", true),
}

local guiCheck = {

  bezZ = guiCreateCheckBox(0.44, 0.81, 0.09, 0.02, "Zakup bez załogi", false, true),


  checkbox1 = guiCreateCheckBox(0.18, 0.72, 0.09, 0.02, "", false, true),


  checkbox2 = guiCreateCheckBox(0.45, 0.72, 0.09, 0.02, "", false, true),


  checkbox3 = guiCreateCheckBox(0.72, 0.72, 0.09, 0.02, "", false, true),


  checkbox = guiCreateCheckBox(0.14, 0.92, 0.09, 0.02, "Załaduj amunicję", false, true),
}

guiSetFont(guiCheck.checkbox, "default-bold-small")
guiSetFont(guiCheck.checkbox1, "default-bold-small")
guiSetFont(guiCheck.checkbox2, "default-bold-small")
guiSetFont(guiCheck.checkbox3, "default-bold-small")
guiSetFont(guiCheck.bezZ, "default-bold-small")


guiSetAlpha(buyButton.t26, 0.00)
guiSetVisible(buyButton.t26, false)
guiSetVisible(buyButton.t26p, false)
guiSetAlpha(buyButton.t26p, 0.00)
guiSetVisible(buyButton.t46, false)
guiSetVisible(buyButton.t46p, false)

guiSetVisible(guiCheck.bezZ, false)
guiSetVisible(guiCheck.checkbox1, false)
guiSetVisible(guiCheck.checkbox2, false)
guiSetVisible(guiCheck.checkbox3, false)
guiSetVisible(guiCheck.checkbox, false)

function showMS1(value)
  if value then 
    removeEventHandler("onClientRender", root, renderBadania)
    addEventHandler("onClientRender", root, msiRender)
    guiSetVisible(buttonyDoZakupu.MS1, false)
    guiSetVisible(buttonyDoZakupu.T26, false)
    guiSetVisible(buttonyDoZakupu.T46, false)
    guiSetVisible(buttonyDoZakupu.T28, false)
    guiSetVisible(buttonyDoZakupu.KV1, false)
    guiSetVisible(buttonyDoZakupu.KV1S, false)
    guiSetVisible(buttonyDoZakupu.T150, false)
    guiSetVisible(buttonyDoZakupu.KV85, false)
    guiSetVisible(buyButton.t26, true)
  else
    addEventHandler("onClientRender", root, renderBadania)
    removeEventHandler("onClientRender", root, msiRender)
    guiSetVisible(buttonyDoZakupu.MS1, true)
    guiSetVisible(buttonyDoZakupu.T26, true)
    guiSetVisible(buttonyDoZakupu.T46, true)
    guiSetVisible(buttonyDoZakupu.T28, true)
    guiSetVisible(buttonyDoZakupu.KV1, true)
    guiSetVisible(buttonyDoZakupu.KV1S, true)
    guiSetVisible(buttonyDoZakupu.T150, true)
    guiSetVisible(buttonyDoZakupu.KV85, true)
    guiSetVisible(buyButton.t26, false)
  end 
end 


function showCheckBox(value)
  if value then 
    guiSetVisible(guiCheck.bezZ, true)
guiSetVisible(guiCheck.checkbox1, true)
guiSetVisible(guiCheck.checkbox2, true)
guiSetVisible(guiCheck.checkbox3, true)
guiSetVisible(guiCheck.checkbox, true)
  else 
    guiSetVisible(guiCheck.bezZ, false)
guiSetVisible(guiCheck.checkbox1, false)
guiSetVisible(guiCheck.checkbox2, false)
guiSetVisible(guiCheck.checkbox3, false)
guiSetVisible(guiCheck.checkbox, false)
  end 
end 


function zacznijBadac(button, state)
 if source ~= buttonyDoZakupu.MS1 then return end 
 showMS1(true)
end 
  addEventHandler("onClientGUIClick", root, zacznijBadac)



  --- T26 
  
  function buyRender()
    dxDrawText("Konfiguracja  II  T26", screenW * 0.2904, screenH * 0.0130, screenW * 0.8676, screenH * 0.1354, tocolor(255, 255, 255, 255), 4.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.4912, screenH * 0.1237, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonasrebra.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("5 000", screenW * 0.5243, screenH * 0.1367, screenW * 0.6360, screenH * 0.1576, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * -0.0088, screenH * 0.1367, screenW * 0.4368, screenH * 0.7565, ":wot-garaz/tlopodczogi.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.4985, screenH * 0.1172, screenW * 0.4368, screenH * 0.7565, ":wot-garaz/tlopodczogi.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Standardowy koszt:", screenW * 0.3449, screenH * 0.1354, screenW * 0.4566, screenH * 0.1563, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.2515, screenH * 0.1367, screenW * 0.4368, screenH * 0.7565, ":wot-garaz/tlopodczogi.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("50%", screenW * 0.1603, screenH * 0.4167, screenW * 0.2515, screenH * 0.4844, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Podstawowe kursy załogi", screenW * 0.1603, screenH * 0.5404, screenW * 0.2404, screenH * 0.7188, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
    dxDrawText("75%", screenW * 0.4272, screenH * 0.4193, screenW * 0.5184, screenH * 0.4870, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Średnio-zaawansowe kursy załogi", screenW * 0.4309, screenH * 0.5313, screenW * 0.5110, screenH * 0.7096, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
    dxDrawText("100%", screenW * 0.6985, screenH * 0.4193, screenW * 0.7897, screenH * 0.4870, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Szkoła pancerna", screenW * 0.6985, screenH * 0.5260, screenW * 0.7787, screenH * 0.7044, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
    dxDrawImage(screenW * 0.0000, screenH * 0.7240, screenW * 1.0000, screenH * 0.4414, ":wot-garaz/pasekgorny.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * -0.0147, screenH * 0.8359, screenW * 0.1765, screenH * 0.1940, ":wot-garaz/ikonanaboji.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.3434, screenH * 0.8255, screenW * 0.2912, screenH * 0.2396, ":wot-garaz/WALCZ!.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("KUP!", screenW * 0.4625, screenH * 0.9219, screenW * 0.6551, screenH * 0.9779, tocolor(255, 255, 255, 255), 2.00, "default-bold", "left", "top", false, false, false, false, false)
end

function showBuyRender(value)
  if value then 
    addEventHandler("onClientRender", root, buyRender)
    guiSetVisible(buyButton.t26p, true)
  end 
end 


  function otworzBuy(button, state)
   if source ~= buyButton.t26 then return end 
   if model == fromJSON("T26") then 
    outputChatBox("Nie możesz zakupić tego pojazdu, ponieważ go posiadasz", 255, 255, 255)
    return end 
     showBuyRender(true)
     showCheckBox(true)
   end
  addEventHandler("onClientGUIClick", root, otworzBuy)


  function zakupButton(button, state)
    local login = getPlayerName(localPlayer)
    if source ~= buyButton.t26p then return end 
      triggerServerEvent("t26:buy", resourceRoot, login)
  end 
  addEventHandler("onClientGUIClick", root, zakupButton)


function t26Render()
  dxDrawImage(screenW * 0.2529, screenH * 0.4492, screenW * 0.1301, screenH * 0.0951, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("T-26 tier II", screenW * 0.3096, screenH * 0.4701, screenW * 0.3603, screenH * 0.4896, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.2346, screenH * 0.4622, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText(expczolg, screenW * 0.3096, screenH * 0.5026, screenW * 0.3603, screenH * 0.5221, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawLine(screenW * 0.3765, screenH * 0.4961, screenW * 0.5118, screenH * 0.4948, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.5044, screenH * 0.4492, screenW * 0.1301, screenH * 0.0951, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("T-46 tier III", screenW * 0.5507, screenH * 0.4688, screenW * 0.6015, screenH * 0.4883, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawImage(screenW * 0.4809, screenH * 0.4557, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.0000, screenH * 0.9297, screenW * 0.2176, screenH * 0.0755, ":wot-garaz/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("Cofnij", 112, 733, 383, 772, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawText("Kup/Zbadaj", screenW * 0.5221, screenH * 0.5130, screenW * 0.5728, screenH * 0.5326, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
end 




  function showT26(value)
    if value then 
      removeEventHandler("onClientRender", root, renderBadania)
      addEventHandler("onClientRender", root, t26Render)
      guiSetVisible(buttonyDoZakupu.MS1, false)
      guiSetVisible(buttonyDoZakupu.T26, false)
      guiSetVisible(buttonyDoZakupu.T46, false)
      guiSetVisible(buttonyDoZakupu.T28, false)
      guiSetVisible(buttonyDoZakupu.KV1, false)
      guiSetVisible(buttonyDoZakupu.KV1S, false)
      guiSetVisible(buttonyDoZakupu.T150, false)
      guiSetVisible(buttonyDoZakupu.KV85, false)
      guiSetVisible(buyButton.t46, true)
      guiSetAlpha(buyButton.t46, 0.00)
    else 
     addEventHandler("onClientRender", root, renderBadania)
      removeEventHandler("onClientRender", root, t26Render)
      guiSetVisible(buttonyDoZakupu.MS1, true)
      guiSetVisible(buttonyDoZakupu.T26, true)
      guiSetVisible(buttonyDoZakupu.T46, true)
      guiSetVisible(buttonyDoZakupu.T28, true)
      guiSetVisible(buttonyDoZakupu.KV1, true)
      guiSetVisible(buttonyDoZakupu.KV1S, true)
      guiSetVisible(buttonyDoZakupu.T150, true)
      guiSetVisible(buttonyDoZakupu.KV85, true)
      guiSetVisible(buyButton.t46, false)
    end 
  end 




  function buyRenderT46()
    dxDrawText("Konfiguracja  III  T46", screenW * 0.2904, screenH * 0.0130, screenW * 0.8676, screenH * 0.1354, tocolor(255, 255, 255, 255), 4.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.4912, screenH * 0.1237, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonasrebra.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("15 000", screenW * 0.5243, screenH * 0.1367, screenW * 0.6360, screenH * 0.1576, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * -0.0088, screenH * 0.1367, screenW * 0.4368, screenH * 0.7565, ":wot-garaz/tlopodczogi.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.4985, screenH * 0.1172, screenW * 0.4368, screenH * 0.7565, ":wot-garaz/tlopodczogi.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Standardowy koszt:", screenW * 0.3449, screenH * 0.1354, screenW * 0.4566, screenH * 0.1563, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.2515, screenH * 0.1367, screenW * 0.4368, screenH * 0.7565, ":wot-garaz/tlopodczogi.png", 90, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("50%", screenW * 0.1603, screenH * 0.4167, screenW * 0.2515, screenH * 0.4844, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Podstawowe kursy załogi", screenW * 0.1603, screenH * 0.5404, screenW * 0.2404, screenH * 0.7188, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
    dxDrawText("75%", screenW * 0.4272, screenH * 0.4193, screenW * 0.5184, screenH * 0.4870, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Średnio-zaawansowe kursy załogi", screenW * 0.4309, screenH * 0.5313, screenW * 0.5110, screenH * 0.7096, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
    dxDrawText("100%", screenW * 0.6985, screenH * 0.4193, screenW * 0.7897, screenH * 0.4870, tocolor(255, 255, 255, 255), 3.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Szkoła pancerna", screenW * 0.6985, screenH * 0.5260, screenW * 0.7787, screenH * 0.7044, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, true, false, false, false)
    dxDrawImage(screenW * 0.0000, screenH * 0.7240, screenW * 1.0000, screenH * 0.4414, ":wot-garaz/pasekgorny.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * -0.0147, screenH * 0.8359, screenW * 0.1765, screenH * 0.1940, ":wot-garaz/ikonanaboji.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.3434, screenH * 0.8255, screenW * 0.2912, screenH * 0.2396, ":wot-garaz/WALCZ!.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("KUP!", screenW * 0.4625, screenH * 0.9219, screenW * 0.6551, screenH * 0.9779, tocolor(255, 255, 255, 255), 2.00, "default-bold", "left", "top", false, false, false, false, false)
end

function showBuyT46(value)
  if value then 
    addEventHandler("onClientRender", root, buyRenderT46)
    showCheckBox(true)
   --- guiSetVisible(buyButton.t46p, true)
  end 
end 

  function badaniaT26(button, state)
    if source ~= buttonyDoZakupu.T26 then return end 
    showT26(true)
  end 
  addEventHandler("onClientGUIClick", root, badaniaT26)

  ---- ZMIANA WYŚWIETLANIA ZAKUPU

 ------ ZMIANA ZAPYTANIA, DOSTOSOWANIE DO AKTUALNEGO PANELU ZAKUPU POJAZDU


---- t46

function t46Render()
    dxDrawImage(screenW * 0.2529, screenH * 0.4492, screenW * 0.1301, screenH * 0.0951, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("T-46 tier III", screenW * 0.3096, screenH * 0.4701, screenW * 0.3603, screenH * 0.4896, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.2346, screenH * 0.4622, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText(expczolg, screenW * 0.3096, screenH * 0.5026, screenW * 0.3603, screenH * 0.5221, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawLine(screenW * 0.3765, screenH * 0.4961, screenW * 0.5118, screenH * 0.4948, tocolor(255, 255, 255, 255), 1, false)
    dxDrawImage(screenW * 0.5044, screenH * 0.4492, screenW * 0.1301, screenH * 0.0951, ":wot-garaz/czolg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("T-28 tier IV", screenW * 0.5507, screenH * 0.4688, screenW * 0.6015, screenH * 0.4883, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawImage(screenW * 0.4809, screenH * 0.4557, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Kup/Zbadaj", screenW * 0.5221, screenH * 0.5130, screenW * 0.5728, screenH * 0.5326, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
  end 


function otworzT46()
  if source ~= buttonyDoZakupu.T46 then return end 
  showT46(true)
end 
addEventHandler("onClientGUIClick", root, otworzT46)


  function showT46(value)
    if value then 
      removeEventHandler("onClientRender", root, renderBadania)
      addEventHandler("onClientRender", root, t46Render)
      guiSetVisible(buttonyDoZakupu.MS1, false)
      guiSetVisible(buttonyDoZakupu.T26, false)
      guiSetVisible(buttonyDoZakupu.T46, false)
      guiSetVisible(buttonyDoZakupu.T28, false)
      guiSetVisible(buttonyDoZakupu.KV1, false)
      guiSetVisible(buttonyDoZakupu.KV1S, false)
      guiSetVisible(buttonyDoZakupu.T150, false)
      guiSetVisible(buttonyDoZakupu.KV85, false)
      ----guiSetVisible(buyButton.t46, true)  podmiana na t28
      ---guiSetAlpha(buyButton.t46, 0.00)      podmiana na t28
    end 
  end 


  --- zakup T46, zapytanie do mysql t46



