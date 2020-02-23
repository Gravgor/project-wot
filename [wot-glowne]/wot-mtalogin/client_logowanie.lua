
---- Garaz
--[[
function render()
end

--- funkcja odpowiedzialna za przejście do zaproszenia do plutonu
   function onClickOnPluton()
    if source ~= gui.bg_pluton then return end 
       triggerServerEvent("event:przejsciowy:2", resourceRoot)
       print("don1")
   end 
   addEventHandler("onClientGUIClick", root, onClickOnPluton)


   function onClickOnClans()
    if source ~= gui.klany then return end 
      triggerServerEvent("uruchom:klany:S", resourceRoot)
      print("huj")
   end 
   addEventHandler("onClientGUIClick", root, onClickOnClans)

   addEvent("ustaw:nick", true)
   addEventHandler("ustaw:nick", getRootElement(), function()
     triggerServerEvent("ustaw:nickS", root)
   end)


---- funckej odpowiedzialne za pobór czołgów z bazy


local czolg = guiGridListAddColumn(gui.gridlist, "Czołg", 0.2)
local pz = guiGridListAddColumn(gui.gridlist, "Pukty życia", 0.2)
local tier = guiGridListAddColumn(gui.gridlist, "Tier", 0.2)
local exp = guiGridListAddColumn(gui.gridlist, "Posiadany exp", 0.2)  
local uid = guiGridListAddColumn(gui.gridlist, "UID", 0.2)



addEvent("pobierz:czolgi", true)
addEventHandler("pobierz:czolgi", getRootElement(), function()
  triggerServerEvent("pobierz:Czolgi", localPlayer)
end)


addEvent("pokaz:czolgi", true)
addEventHandler("pokaz:czolgi", root, function(czolgi)  
  ---guiGridListClear(gui.gridlist)
    for k = 1,5 do 
    local row = guiGridListAddRow(gui.gridlist)
    guiGridListSetItemText(gui.gridlist, row, 1, czolgi[k][1], false, false)
    guiGridListSetItemText(gui.gridlist, row, 2, czolgi[k][2], false, false)
    guiGridListSetItemText(gui.gridlist, row, 3, czolgi[k][3], false, false)
    guiGridListSetItemText(gui.gridlist, row, 4,czolgi[k][4], false, false)
	guiGridListSetItemText(gui.gridlist, row, 5, czolgi[k][5], false, false)
  end     
  end)


  function wybranyPojazd()
    if source ~= gui.wybierz then return end 
      local row = guiGridListGetSelectedItem( gui.gridlist)
      if row ~= -1 then
        local uid = guiGridListGetItemText( gui.gridlist, row, 5 )
        setElementData(localPlayer, "uid", uid)
        triggerServerEvent("zatwierdz:pojazd", resourceRoot)
        print("udalosie")
      end 
    end 
    addEventHandler("onClientGUIClick", root, wybranyPojazd)





--- serwis tutaj 
function wlaczSerwis(button, state)
  if source ~= gui.serwis then return end 
      triggerServerEvent("pokaz:gui:client", resourceRoot)

  end
  addEventHandler("onClientGUIClick", root, wlaczSerwis)
]]
  

----- drzewko badan


--[[function badaniarender()
  dxDrawImage(screenW * 0.0853, screenH * -0.0260, screenW * 0.2000, screenH * 0.2214, ":wot-garaz/flaga1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.1294, screenH * 0.1927, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.1772, screenH * 0.2552, screenW * 0.1772, screenH * 0.3190, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.1294, screenH * 0.3060, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.1772, screenH * 0.3685, screenW * 0.1772, screenH * 0.4323, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.1294, screenH * 0.4245, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.1772, screenH * 0.4870, screenW * 0.1772, screenH * 0.5508, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.1294, screenH * 0.5378, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.1772, screenH * 0.6003, screenW * 0.1772, screenH * 0.6641, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.1294, screenH * 0.6510, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.1772, screenH * 0.7135, screenW * 0.1772, screenH * 0.7773, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.1294, screenH * 0.7643, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.1772, screenH * 0.8281, screenW * 0.1772, screenH * 0.8919, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.1294, screenH * 0.8789, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.3625, screenH * -0.0273, screenW * 0.2000, screenH * 0.2214, ":wot-garaz/flaga2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.4147, screenH * 0.1940, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.4662, screenH * 0.2565, screenW * 0.4662, screenH * 0.3203, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.4147, screenH * 0.3073, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.4662, screenH * 0.3698, screenW * 0.4662, screenH * 0.4336, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.4147, screenH * 0.4206, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.4662, screenH * 0.4831, screenW * 0.4662, screenH * 0.5469, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.4147, screenH * 0.5339, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.4662, screenH * 0.5964, screenW * 0.4662, screenH * 0.6602, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.4147, screenH * 0.6510, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.4662, screenH * 0.7135, screenW * 0.4662, screenH * 0.7773, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.4147, screenH * 0.7552, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.4662, screenH * 0.8177, screenW * 0.4662, screenH * 0.8815, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.4147, screenH * 0.8685, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.6360, screenH * -0.0260, screenW * 0.2000, screenH * 0.2214, ":wot-garaz/rosja.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.6846, screenH * 0.1940, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.7338, screenH * 0.2565, screenW * 0.7338, screenH * 0.3203, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.6846, screenH * 0.3008, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.7338, screenH * 0.3633, screenW * 0.7338, screenH * 0.4271, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.6846, screenH * 0.4141, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.7338, screenH * 0.4766, screenW * 0.7338, screenH * 0.5404, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.6846, screenH * 0.5339, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.7338, screenH * 0.5964, screenW * 0.7338, screenH * 0.6602, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.6846, screenH * 0.6510, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.7338, screenH * 0.7135, screenW * 0.7338, screenH * 0.7773, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.6846, screenH * 0.7643, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawLine(screenW * 0.7338, screenH * 0.8268, screenW * 0.7338, screenH * 0.8906, tocolor(255, 255, 255, 255), 1, false)
  dxDrawImage(screenW * 0.6846, screenH * 0.8685, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.1051, screenH * 0.1927, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("L-th I tier - kliknij mnie", screenW * 0.1779, screenH * 0.2096, screenW * 0.2213, screenH * 0.2552, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawImage(screenW * 0.1051, screenH * 0.3060, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.1051, screenH * 0.4245, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.1051, screenH * 0.5378, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.1051, screenH * 0.6510, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.1051, screenH * 0.7643, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.1051, screenH * 0.8789, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("Pz.kpfw 35(t)  - kliknij mnie", screenW * 0.1779, screenH * 0.3229, screenW * 0.2213, screenH * 0.3685, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("Pz.kpfw 38(t)  - kliknij mnie", screenW * 0.1772, screenH * 0.4375, screenW * 0.2206, screenH * 0.4831, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("Pz.kpfw IV H  - kliknij mnie", screenW * 0.1779, screenH * 0.5495, screenW * 0.2213, screenH * 0.5951, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("VK.30.01 P  - kliknij mnie", screenW * 0.1772, screenH * 0.6628, screenW * 0.2206, screenH * 0.7083, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("Tiger (P)  - kliknij mnie", screenW * 0.1779, screenH * 0.7773, screenW * 0.2213, screenH * 0.8229, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("VK.45.02 (P)  - kliknij mnie", screenW * 0.1779, screenH * 0.8919, screenW * 0.2213, screenH * 0.9375, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawImage(screenW * 0.3912, screenH * 0.1927, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.3912, screenH * 0.3060, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.3912, screenH * 0.4206, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.3912, screenH * 0.5339, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.3912, screenH * 0.6471, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.3912, screenH * 0.7513, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.3912, screenH * 0.8685, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("VK medium I - kliknij mnie", screenW * 0.4632, screenH * 0.2109, screenW * 0.5066, screenH * 0.2565, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("VK medium II - kliknij mnie", screenW * 0.4632, screenH * 0.3242, screenW * 0.5066, screenH * 0.3698, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("VK medium III - kliknij mnie", screenW * 0.4662, screenH * 0.4336, screenW * 0.5096, screenH * 0.4792, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("Matilda - kliknij mnie", screenW * 0.4662, screenH * 0.5456, screenW * 0.5096, screenH * 0.5911, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("Churchill I - kliknij mnie", screenW * 0.4662, screenH * 0.6641, screenW * 0.5096, screenH * 0.7096, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("Churchill VII - kliknij mnie", screenW * 0.4662, screenH * 0.7669, screenW * 0.5096, screenH * 0.8125, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("Carnarvon  - kliknij mnie", screenW * 0.4632, screenH * 0.8815, screenW * 0.5066, screenH * 0.9271, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawImage(screenW * 0.6610, screenH * 0.1940, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.6610, screenH * 0.3008, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.6610, screenH * 0.4141, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.6610, screenH * 0.5326, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.6610, screenH * 0.6471, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.6610, screenH * 0.7643, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(screenW * 0.6610, screenH * 0.8685, screenW * 0.0993, screenH * 0.0703, ":wot-garaz/czolgicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawText("MS-1 - kliknij mnie", screenW * 0.7331, screenH * 0.2109, screenW * 0.7765, screenH * 0.2565, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("T-26 - kliknij mnie", screenW * 0.7338, screenH * 0.3177, screenW * 0.7772, screenH * 0.3633, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("T-46 - kliknij mnie", screenW * 0.7338, screenH * 0.4310, screenW * 0.7772, screenH * 0.4766, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("T-28 - kliknij mnie", screenW * 0.7338, screenH * 0.5469, screenW * 0.7772, screenH * 0.5924, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("KV-1S - kliknij mnie", screenW * 0.7338, screenH * 0.6641, screenW * 0.7772, screenH * 0.7096, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("KV-85 - kliknij mnie", screenW * 0.7338, screenH * 0.7760, screenW * 0.7772, screenH * 0.8216, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  dxDrawText("IS-3 - kliknij mnie", screenW * 0.7338, screenH * 0.8815, screenW * 0.7772, screenH * 0.9271, tocolor(255, 255, 255, 255), 0.75, "default-bold", "left", "top", false, true, false, false, false)
  end
]]
