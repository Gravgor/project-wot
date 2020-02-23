--- zapraszanie


local gui = {
       window = guiCreateWindow(0.33, 0.21, 0.36, 0.35, "Inviting to the platoon", true),


        button = guiCreateButton(0.38, 0.47, 0.10, 0.05, "Confirm", true),


        button2 = guiCreateButton(0.57, 0.47, 0.10, 0.05, "Close", true),


        label = guiCreateLabel(0.37, 0.26, 0.29, 0.13, "Enter below the nickname of the player you want to invite to the platoon! You can invite one player!", true),

        gridlist = guiCreateGridList(0.36, 0.33, 0.30, 0.11, true),   
}

guiSetFont(gui.label, "default-bold-small")
        guiSetProperty(gui.label, "AlwaysOnTop", "True")
        guiLabelSetHorizontalAlign(gui.label, "left", true)
guiSetProperty(gui.button, "AlwaysOnTop", "True")
guiSetProperty(gui.button2, "AlwaysOnTop", "True")
guiSetProperty(gui.gridlist, "AlwaysOnTop", "True")
        guiWindowSetMovable(gui.window, false)
        guiWindowSetSizable(gui.window, false)
        guiSetVisible(gui.window, false)
        guiSetVisible(gui.button, false)
        guiSetVisible(gui.button2, false)
        guiSetVisible(gui.label, false)
        guiSetVisible(gui.gridlist, false)

        function showGUI1(value)
            if value then 
                guiSetVisible(gui.window, true)
                guiSetVisible(gui.button, true)
                guiSetVisible(gui.button2, true)
                guiSetVisible(gui.label, true)
                guiSetVisible(gui.gridlist, true)
                guiGridListAddColumn(gui.gridlist, "Player", 0.85)
            else 
                guiSetVisible(gui.window, false)
                guiSetVisible(gui.button, false)
                guiSetVisible(gui.button2, false)
                guiSetVisible(gui.label, false)
                guiSetVisible(gui.gridlist, false)
            end 
        end
        
        addEvent("wyswietl:gui:zaproszenia:pluton", true)
        addEventHandler("wyswietl:gui:zaproszenia:pluton", getRootElement(), function()
            showGUI1(true)
            showCursor(true)
            guiGridListClear( gui.gridlist)
            for i,v in ipairs(getElementsByType("player")) do

                local row = guiGridListAddRow(gui.gridlist)
                guiGridListSetItemText(gui.gridlist, row, 1, getPlayerName(v), false, false)
            end
        end)

        function clickedPlayer()
        if source ~= gui.button then return end 
            local row = guiGridListGetSelectedItem( gui.gridlist)
            if row ~= -1 then
                 local name = guiGridListGetItemText( gui.gridlist, row, 1 )
                 setElementData(localPlayer, "zaproszony", name)
            end 
        end  
        addEventHandler("onClientGUIClick", root, clickedPlayer)

        function sendToPlayer()
            if source ~= gui.button then return end 
            local nick = getElementData(localPlayer, "zaproszony")
              if nick then 
                showGUI1(false)
                showCursor(false)
                    triggerServerEvent("przeslano", localPlayer, nick)
              end 
            end
            addEventHandler("onClientGUIClick", root, sendToPlayer)



            function createGUI()

                    window = guiCreateWindow(0.00, 0.34, 0.17, 0.19, "Invitation", true)
        guiWindowSetMovable(window, false)
        guiWindowSetSizable(window, false)


        button = guiCreateButton(0.00, 0.48, 0.07, 0.04, "Confirm", true)
        guiSetProperty(button, "AlwaysOnTop", "True")


        button1 = guiCreateButton(0.10, 0.48, 0.07, 0.04, "Close", true)
        guiSetProperty(button1, "AlwaysOnTop", "True")


        label5 = guiCreateLabel(0.04, 0.40, 0.15, 0.08, "Inviter: none", true) 
        guiSetFont(label, "default-bold-small")
        guiSetProperty(label, "AlwaysOnTop", "True")    
                guiSetVisible(window, true)
                guiSetVisible(button, true)
                guiSetVisible(button1, true)
                guiSetVisible(label5, true)
showCursor(true)
            end



            addEvent("invite:gone", true)
            addEventHandler("invite:gone", root, 
             function(gracz, gracze, nick)
                
                createGUI()
                 setElementData(gracz, "zaproszenie:done", gracze)
                 guiSetText(label5, "Inviter: "..tostring(getElementData(gracz, "zaproszenie:done")).."")
                 setElementData(localPlayer, "graczMa", gracz)
                 setElementData(localPlayer, "dowodca", gracze)
                 setElementData(localPlayer, "zaproszony",  gracz)
                 setElementData(gracze, "dowodca", gracze)
                 setElementData(gracze, "graczMa", gracz)

             end 
            )

            function onZamknij()
                guiSetVisible(window, false)
                guiSetVisible(label5, false)
                guiSetVisible(button1, false)
                guiSetVisible(button, false)
                showCursor(false)
                end

                function onOdrzuc()
                    if source ~= button1 then return end 
                    local nick = getElementData(localPlayer,"graczMa")
                    onZamknij()
                    triggerServerEvent("odrzucono", localPlayer)
                    end
                    addEventHandler("onClientGUIClick", root,onOdrzuc)

                    function onPrzyjmij()
                        if source ~= button then return end 
                        local nick = getElementData(localPlayer,"dowodca")
                        onZamknij()
                        triggerServerEvent("przyjeto", resourceRoot, nick)
                        print("przyjeto")
                        end
                        addEventHandler("onClientGUIClick", root,onPrzyjmij)

                        function close()
                            if source ~= gui.button2 then return end 
                            showGUI1(false)
                        end
                        addEventHandler("onClientGUIClick", root, close)


                        --- gui plutonu

                        local guiPluton = {
                            pluton =  guiCreateWindow(0.84, 0.46, 0.17, 0.52, "Pluton", true),
                        
                        
                                button4 = guiCreateButton(0.84, 0.95, 0.06, 0.03, "Akceptuj", true),
                        
                        
                                opusc = guiCreateButton(0.94, 0.95, 0.06, 0.03, "Wyjdz", true),
                               
                        
                        
                                label1 = guiCreateLabel(0.85, 0.52, 0.14, 0.05, "Dowódca plutonu:", true),
                                
                        
                        
                                label = guiCreateLabel(0.85, 0.58, 0.14, 0.05, "Pojazd dowódcy:", true),
                        
                        
                                label2 =  guiCreateLabel(0.85, 0.64, 0.14, 0.05, "Drugi gracz:", true),

                        
                        
                                label4 = guiCreateLabel(0.85, 0.70, 0.08, 0.02, "Pojazd: ", true),

                                memo1 =  guiCreateMemo(0.85, 0.76, 0.14, 0.16, "\nBitwa losowa..", true),
                                
                        }

                function setOn(value)
                    if value then 
                                guiSetVisible(guiPluton.label, true)
                                guiSetVisible(guiPluton.label1, true)
                                guiSetVisible(guiPluton.label2, true)
                                guiSetVisible(guiPluton.label4, true)  
                                guiSetVisible(guiPluton.opusc, true)
                                guiSetVisible(guiPluton.button4, true)
                                guiSetVisible(guiPluton.pluton, true)  
                                guiSetVisible(guiPluton.memo1, true)    
                                showCursor(true)  
                    else 
                        guiSetVisible(guiPluton.label, false)
                                guiSetVisible(guiPluton.label1, false)
                                guiSetVisible(guiPluton.label2, false)
                                guiSetVisible(guiPluton.label4, false)  
                                guiSetVisible(guiPluton.opusc, false)
                                guiSetVisible(guiPluton.button4, false)
                                guiSetVisible(guiPluton.pluton, false) 
                                guiSetVisible(guiPluton.memo1, false)       
                                showCursor(false)  
                    end 
                end

                        guiSetVisible(guiPluton.pluton, false)
                        guiSetVisible(guiPluton.label, false)
                        guiSetVisible(guiPluton.label1, false)
                        guiSetVisible(guiPluton.label2, false)
                        guiSetVisible(guiPluton.label4, false)
                        guiSetVisible(guiPluton.opusc, false)
                        guiSetVisible(guiPluton.button4, false)
                        guiSetProperty(guiPluton.label4, "AlwaysOnTop", "True") 
                        guiSetProperty(guiPluton.label2, "AlwaysOnTop", "True")
                        guiSetProperty(guiPluton.label, "AlwaysOnTop", "True")
                        guiSetProperty(guiPluton.label1, "AlwaysOnTop", "True")
                        guiSetProperty(guiPluton.opusc, "AlwaysOnTop", "True")
                        guiWindowSetMovable(guiPluton.pluton, false)
                                guiWindowSetSizable(guiPluton.pluton, false)
                                guiSetVisible(guiPluton.memo1, false) 
                                guiSetProperty(guiPluton.memo1, "AlwaysOnTop", "True")
        guiMemoSetReadOnly(guiPluton.memo1, true)    


    local zatwierdzony = false
                        addEvent("pluton:przyjeto:drugigracz", true)
                        addEventHandler("pluton:przyjeto:drugigracz", getRootElement(), function()
                            print("wykonaned3")
                            local dowodca = getElementData(localPlayer, "dowodca") or "False"
                            local drugigracz  = getPlayerName(localPlayer)
                                setOn(true)
                                print("przechodz")
                                 guiSetText(guiPluton.label1, "Dowódca plutonu: "..tostring(dowodca).."")
                                 guiSetText(guiPluton.label2, "Drugi gracz: "..tostring(drugigracz).."")
                                 guiSetText(guiPluton.label, "Pojazd dowódcy: "..tostring(getElementData(localPlayer, "wybrany:pojazd") or "Brak").. "")
                                 guiSetText(guiPluton.label4, "Pojazd: "..tostring(getElementData(localPlayer, "wybrany:pojazd") or "Brak").. "")  
                            end)

                            addEvent("pluton:przyjeto:dowodca", true)
                            addEventHandler("pluton:przyjeto:dowodca", getRootElement(), function()
                                print("wykonaned3")
                                local dowodca = getPlayerName(localPlayer)
                                local drugigracz  = getElementData(localPlayer, "zaproszony") or "False"
                                    setOn(true)
                                    print("przechodz")
                                    guiSetText(guiPluton.label1, "Dowódca plutonu: "..tostring(dowodca).."")
                                    guiSetText(guiPluton.label2, "Drugi gracz: "..tostring(drugigracz).."")
                                    guiSetText(guiPluton.label, "Pojazd dowódcy: "..tostring(getElementData(localPlayer, "wybrany:pojazd") or "Brak").. "")
                                    guiSetText(guiPluton.label4, "Pojazd: "..tostring(getElementData(localPlayer, "wybrany:pojazd:drugigracz") or "Brak").. "")  
                                end)
    

                            function leavePluton() -- dowódca
                                if source ~= guiPluton.opusc then return end 
                                  setOn(false)
                                    outputChatBox("Opuściłeś pluton", 255, 255, 255)
                                    local drugigracz  = getElementData(localPlayer, "zaproszony") or "False"
                                      outputChatBox("Dowódca opuścił pluton, pluton anulowany", drugigracz, 255, 255, 255)
                                        setOn(drugigracz, false)
                            end 
                            addEventHandler("onClientGUIClick", root, leavePluton)

                            function leavePlutonPlayer() --player
                                if source ~= guiPluton.opusc then return end 
                                setOn(false)
                                outputChatBox("Opuściłeś pluton", 255, 255, 255)
                                  local dowodca = getElementData(localPlayer, "dowodca") or "False"
                                    outputChatBox("Drugi gracz opuścił pltuon, możesz zaprosić innego", dowodca, 255, 255, 255)
                                      setElementData(dowodca, "zaproszony", "Brak")
                                      setElementData(dowodca, "wybrany:pojazd:drugigracz", "Brak")
                            end 
                            addEventHandler("onClientGUIClick", root, leavePlutonPlayer)





