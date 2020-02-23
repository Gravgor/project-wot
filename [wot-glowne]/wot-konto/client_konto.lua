local screenW, screenH = guiGetScreenSize()


local uruchomienie = {
    uruchomienie = guiCreateButton(0.01, 0.03, 0.13, 0.09, "", true),
    staty =  guiCreateButton(0.00, 0.32, 0.19, 0.11, "", true),
    changelog = guiCreateButton(0.00, 0.46, 0.19, 0.10, "", true),
    eventy = guiCreateButton(0.00, 0.61, 0.19, 0.09, "", true),
}

guiSetAlpha(uruchomienie.uruchomienie, 0.00)
guiSetVisible(uruchomienie.staty, false)
guiSetAlpha(uruchomienie.staty, 0.00)
guiSetVisible(uruchomienie.changelog, false)
guiSetAlpha(uruchomienie.changelog, 0.00)
guiSetVisible(uruchomienie.eventy, false)
guiSetAlpha(uruchomienie.eventy, 0.00)

okienko = false

function ustawieniaRender()
    dxDrawImage(screenW * 0.0000, screenH * 0.3151, screenW * 0.1963, screenH * 0.1016, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.0000, screenH * 0.4596, screenW * 0.1963, screenH * 0.1016, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.0000, screenH * 0.6146, screenW * 0.1963, screenH * 0.1016, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.0074, screenH * 0.3451, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonanazwykonta.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.0074, screenH * 0.4948, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonakonfiguracji.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(screenW * 0.0074, screenH * 0.6419, screenW * 0.0257, screenH * 0.0456, ":wot-garaz/ikonagolda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Statystyki twojego konta", screenW * 0.0493, screenH * 0.3555, screenW * 0.1831, screenH * 0.4036, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Changelog", screenW * 0.0463, screenH * 0.4922, screenW * 0.1801, screenH * 0.5404, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Nadchodzące eventy", screenW * 0.0456, screenH * 0.6419, screenW * 0.1794, screenH * 0.6901, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
end


staty = false 


function statyRender()
    dxDrawImage(screenW * 0.2228, screenH * 0.1888, screenW * 0.5478, screenH * 0.3568, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("0", screenW * 0.2669, screenH * 0.2357, screenW * 0.3390, screenH * 0.2956, tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Bitwy", screenW * 0.2625, screenH * 0.2826, screenW * 0.3647, screenH * 0.3229, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(getElementData(localPlayer, "procent_zwyciestw") or "0", screenW * 0.3574, screenH * 0.2357, screenW * 0.4294, screenH * 0.2956, tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Procent zwycięstw", screenW * 0.3500, screenH * 0.2826, screenW * 0.4522, screenH * 0.3229, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(getElementData(localPlayer, "procent_trafien") or "0", screenW * 0.2625, screenH * 0.3698, screenW * 0.3346, screenH * 0.4297, tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Trafienia", screenW * 0.2588, screenH * 0.4167, screenW * 0.3610, screenH * 0.4570, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(getElementData(localPlayer, "srednia_uszkodzen") or "0", screenW * 0.3537, screenH * 0.3698, screenW * 0.4257, screenH * 0.4297, tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Średnia uszkodzeń na bitwe", screenW * 0.3419, screenH * 0.4167, screenW * 0.4441, screenH * 0.4570, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(getElementData(localPlayer, "srednia_exp") or "0", screenW * 0.4919, screenH * 0.2357, screenW * 0.5640, screenH * 0.2956, tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Średnia ilość zdobytego expa", screenW * 0.4721, screenH * 0.2956, screenW * 0.5743, screenH * 0.3359, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(getElementData(localPlayer, "naj_pojazdow") or "0", screenW * 0.4949, screenH * 0.3568, screenW * 0.5669, screenH * 0.4167, tocolor(255, 255, 255, 255), 2.00, "default", "left", "top", false, false, false, false, false)
    dxDrawText("Największa ilość zniszczonych pojazdów", screenW * 0.4721, screenH * 0.4167, screenW * 0.5743, screenH * 0.4570, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    --dxDrawText("Rejestracja: "..getElementData(localPlayer, "rejestracja") or "false", screenW * 0.2235, screenH * 0.5130, screenW * 0.3272, screenH * 0.5456, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
   -- dxDrawText("Ostatni raz w bitwie: "..getElementData(localPlayer, "bitwa_ostatni") or "Nigdy", screenW * 0.3331, screenH * 0.5130, screenW * 0.4368, screenH * 0.5456, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Serial: "..getElementData(localPlayer, "serial"),  screenW * 0.2235, screenH * 0.5130, screenW * 0.3272, screenH * 0.5456, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("Nick: "..getPlayerName(localPlayer), screenW * 0.5743, screenH * 0.5130, screenW * 0.6779, screenH * 0.5456, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
end

changelog = false 

function changeLogRender()
  dxDrawImage(screenW * 0.7875, screenH * 0.4336, screenW * 0.2125, screenH * 0.4401, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("Changelog:", screenW * 0.7956, screenH * 0.4479, screenW * 0.9831, screenH * 0.4909, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
  dxDrawText("04.02.2019, 22:18 - nowy system wstawiania zmian przez strone", screenW * 0.7956, screenH * 0.5039, screenW * 0.9831, screenH * 0.5469, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, true, false, false, false)
end


eventy = false 


function eventsLogRender()
  dxDrawImage(screenW * 0.7875, screenH * 0.4336, screenW * 0.2125, screenH * 0.4401, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("Nadchodzące eventy:", screenW * 0.7956, screenH * 0.4479, screenW * 0.9831, screenH * 0.4909, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
  dxDrawText("01.04.2019 - otwarcie serwera", screenW * 0.7956, screenH * 0.5039, screenW * 0.9831, screenH * 0.5469, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, true, false, false, false)
end


------------------------- 

function openOrCloseWindow()
    if source ~= uruchomienie.uruchomienie then return end 
      if okienko == false then 
        addEventHandler("onClientRender", root, ustawieniaRender)
        guiSetVisible(uruchomienie.staty, true)
        guiSetVisible(uruchomienie.changelog, true)
        guiSetVisible(uruchomienie.eventy, true)
        okienko = true
      else 
        if okienko == true then 
        removeEventHandler("onClientRender", root, ustawieniaRender)
        okienko = false 
        guiSetVisible(uruchomienie.staty, false)
        guiSetVisible(uruchomienie.changelog, false)
        guiSetVisible(uruchomienie.eventy, false)
         if staty == true then 
          removeEventHandler("onClientRender", root, statyRender)
          staty = false
          return end 
          if changelog == true then 
            removeEventHandler("onClientRender", root, changeLogRender)    
            changelog = false 
          return end 
          if eventy == true then 
            removeEventHandler("onClientRender", root, eventsLogRender)
            eventy = false 
            return end
    end 
end
end
    addEventHandler("onClientGUIClick", root, openOrCloseWindow)

    function openOrCloseWindowChangelog()
        if source ~= uruchomienie.changelog then return end 
          if changelog == false then 
            addEventHandler("onClientRender", root, changeLogRender)
            changelog = true
          else 
            if changelog == true then 
              removeEventHandler("onClientRender", root, changeLogRender)
            changelog = false 
          end 
        end 
    end
        addEventHandler("onClientGUIClick", root, openOrCloseWindowChangelog)

        function openOrCloseWindowStats()
          if source ~= uruchomienie.staty then return end 
            if staty == false then 
              addEventHandler("onClientRender", root, statyRender)
              staty = true
            else 
              if staty == true then 
              removeEventHandler("onClientRender", root, statyRender)
              staty = false 
            end 
          end 
      end
          addEventHandler("onClientGUIClick", root, openOrCloseWindowStats)

          function openOrCloseWindowEvents()
            if source ~= uruchomienie.eventy then return end 
              if eventy == false then 
                addEventHandler("onClientRender", root, eventsLogRender)
                eventy = true
              else 
                if eventy == true then 
                removeEventHandler("onClientRender", root, eventsLogRender)
                eventy = false 
              end 
            end 
        end
            addEventHandler("onClientGUIClick", root, openOrCloseWindowEvents)


    
        
           