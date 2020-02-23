



local drugieOk = {
    window1 = guiCreateWindow(0.23, 0.09, 0.44, 0.46, "Tworzenie klanu", true),
    label2 = guiCreateLabel(0.25, 0.17, 0.82, 0.09, "Nazwa ", true),
    label3 = guiCreateLabel(0.25, 0.31, 0.82, 0.09, "Tag (od 2 do 5 znaków)", true),
    label6 = guiCreateLabel(0.25, 0.42, 0.39, 0.09, "Pamiętaj, że tworząc klan, akceptujesz zasady klanów oraz musisz zapłacić 100.000 srebra.", true),
    button1 = guiCreateButton(0.26, 0.49, 0.10, 0.05, "Załóż klan", true),
    button2 = guiCreateButton(0.40, 0.49, 0.10, 0.05, "Wyłącz", true),
    edit1 = guiCreateEdit(0.24, 0.22, 0.42, 0.05, "", true),
    edit2 =  guiCreateEdit(0.24, 0.36, 0.42, 0.05, "", true),
}


guiSetVisible(drugieOk.window1, false)
                guiSetVisible(drugieOk.label2, false)
                guiSetVisible(drugieOk.label3, false)
                guiSetVisible(drugieOk.label4, false)
                guiSetVisible(drugieOk.label5, false)
                guiSetVisible(drugieOk.label6, false)
                guiSetVisible(drugieOk.button1, false)
                guiSetVisible(drugieOk.button2, false)
                guiSetVisible(drugieOk.edit1, false)
                guiSetVisible(drugieOk.edit2, false)
                guiSetVisible(drugieOk.edit3, false)
                guiSetVisible(drugieOk.edit4, false)


--- glowne okienko

local glowneOk = {
    windowobrazek = guiCreateWindow(0.38, 0.32, 0.21, 0.50, "Stwórz lub dołącz do klanu", true),
        


        button = guiCreateButton(0.43, 0.47, 0.10, 0.05, "Stwórz klan", true),


        button2 = guiCreateButton(0.43, 0.72, 0.10, 0.05, "Dołącz do klanu", true),


        tworzenielabel = guiCreateLabel(0.40, 0.36, 0.17, 0.10, "Chcesz rozpocząć przygodę w konkurencji? Jeśli odpowiedź na pytanie brzmi tak, kliknij przycisk poniżej, aby utworzyć swój klan.", true),
        


        dolaczenielabel = guiCreateLabel(0.41, 0.59, 0.17, 0.09, "Chcesz rozpocząć przygodę w konkurencji? Ale nie jesteś gotowy na stworzenie klanu? Dołącz do istniejącego klanu i walcz z nimi.", true),

            zamknij = guiCreateButton(0.38, 0.78, 0.08, 0.04, "Zamknij", true),


        }
guiWindowSetMovable(glowneOk.windowobrazek, false)
guiSetProperty(glowneOk.button, "AlwaysOnTop", "True")
guiSetProperty(glowneOk.button2, "AlwaysOnTop", "True")
guiSetProperty(glowneOk.tworzenielabel, "AlwaysOnTop", "True")
guiLabelSetHorizontalAlign(glowneOk.tworzenielabel, "left", true)
guiSetProperty(glowneOk.dolaczenielabel, "AlwaysOnTop", "True")
guiLabelSetHorizontalAlign(glowneOk.dolaczenielabel, "left", true)  
guiSetVisible(glowneOk.windowobrazek, false)
            guiSetVisible(glowneOk.button, false)
            guiSetVisible(glowneOk.button2, false)
            guiSetVisible(glowneOk.tworzenielabel, false)
            guiSetVisible(glowneOk.zamknij, false)
            guiSetVisible(glowneOk.dolaczenielabel, false)  
     
            guiWindowSetSizable(drugieOk.window1, false)
guiSetFont(drugieOk.label2, "default-bold-small")
guiSetProperty(drugieOk.label2, "AlwaysOnTop", "True")
guiSetFont(drugieOk.label3, "default-bold-small")
guiSetProperty(drugieOk.label3, "AlwaysOnTop", "True")
guiSetFont(drugieOk.label4, "default-bold-small")
guiSetProperty(drugieOk.label4, "AlwaysOnTop", "True")
guiSetFont(drugieOk.label5, "default-bold-small")
guiSetProperty(drugieOk.label5, "AlwaysOnTop", "True")
guiSetFont(drugieOk.label6, "default-bold-small")
guiSetProperty(drugieOk.label6, "AlwaysOnTop", "True")
guiSetProperty(drugieOk.button1, "AlwaysOnTop", "True")
guiSetProperty(drugieOk.button2, "AlwaysOnTop", "True")
guiSetProperty(drugieOk.edit1, "AlwaysOnTop", "True")
guiSetProperty(drugieOk.edit2, "AlwaysOnTop", "True")
guiSetProperty(drugieOk.edit3, "AlwaysOnTop", "True")
guiSetProperty(drugieOk.edit4, "AlwaysOnTop", "True")
guiLabelSetHorizontalAlign(drugieOk.label6, "left", true)

        function uruchomTworzenie(value)
            if value then 
                guiSetVisible(drugieOk.window1, true)
                guiSetVisible(drugieOk.label2, true)
                guiSetVisible(drugieOk.label3, true)
                guiSetVisible(drugieOk.label4, true)
                guiSetVisible(drugieOk.label5, true)
                guiSetVisible(drugieOk.label6, true)
                guiSetVisible(drugieOk.button1, true)
                guiSetVisible(drugieOk.button2, true)
                guiSetVisible(drugieOk.edit1, true)
                guiSetVisible(drugieOk.edit2, true)
                guiSetVisible(drugieOk.edit3, true)
                guiSetVisible(drugieOk.edit4, true)
                guiWindowSetMovable(drugieOk.window1, false)
            showCursor(true)
        else
            guiSetVisible(drugieOk.window1, false)
                guiSetVisible(drugieOk.label2, false)
                guiSetVisible(drugieOk.label3, false)
                guiSetVisible(drugieOk.label4, false)
                guiSetVisible(drugieOk.label5, false)
                guiSetVisible(drugieOk.label6, false)
                guiSetVisible(drugieOk.button1, false)
                guiSetVisible(drugieOk.button2, false)
                guiSetVisible(drugieOk.edit1, false)
                guiSetVisible(drugieOk.edit2, false)
                guiSetVisible(drugieOk.edit3, false)
                guiSetVisible(drugieOk.edit4, false)
            showCursor(false)
        end 
    end

    function uruchomPierwszeOkno(value)
        if value then 
            guiSetVisible(glowneOk.windowobrazek, true)
            guiSetVisible(glowneOk.button, true)
            guiSetVisible(glowneOk.button2, true)
            guiSetVisible(glowneOk.tworzenielabel, true)
            guiSetVisible(glowneOk.dolaczenielabel, true)
            guiSetVisible(glowneOk.zamknij, true)
            showCursor(true)
        else 
            guiSetVisible(glowneOk.windowobrazek, false)
            guiSetVisible(glowneOk.button, false)
            guiSetVisible(glowneOk.button2, false)
            guiSetVisible(glowneOk.tworzenielabel, false)
            guiSetVisible(glowneOk.dolaczenielabel, false)
            guiSetVisible(glowneOk.zamknij, false)
            showCursor(false)
        end 
    end

    --- glowmne funkcje

    addEvent("uruchom:klany", true)
    addEventHandler("uruchom:klany", root, function()
            triggerServerEvent("sprawdz:czy:gracz:wklanie", localPlayer)
    end)

    -- zamykanie

    function wylaczGlowneOk()
        if source ~= glowneOk.zamknij then return end 
        uruchomPierwszeOkno(false)
    end 
    addEventHandler("onClientGUIClick", root, wylaczGlowneOk)

    function wylaczDrugie()
        if source ~= drugieOk.button2 then return end 
         if getElementData(localPlayer, "skrot") then 
            cancelEvent()
         else 
        uruchomTworzenie(false)
    end
end
    addEventHandler("onClientGUIClick", root, wylaczDrugie)

    --- otwieranie tworzenia

    function otworzTworzenie()
        if source ~= glowneOk.button then return end 
        if getElementData(localPlayer, "skrot") then 
            cancelEvent()
         else 
        uruchomPierwszeOkno(false)
        uruchomTworzenie(true)
    end
end
    addEventHandler("onClientGUIClick", root, otworzTworzenie)


    --- tworzenie

    function tworzKlan()
        local nazwa = guiGetText(drugieOk.edit1)
        local skrot = guiGetText(drugieOk.edit2)
          if source ~= drugieOk.button1 then return end 
            if getPlayerMoney(localPlayer) > 100000 then 
                    triggerServerEvent("stworz:klan", resourceRoot, nazwa, skrot)
                end 
            end 
        addEventHandler("onClientGUIClick", root, tworzKlan)


        --- panel dowodcy 
        gridlist = {}
        window = {}
        button = {}
        label = {}
        local guiS = {}



addEvent("uruchamiamy:panel", true)
addEventHandler("uruchamiamy:panel", root, function(klan)
    for k = 1,5 do 
        window = guiCreateWindow(0.23, 0.11, 0.55, 0.72, "Panel dowódcy klanu "..klan[k][5], true)
        guiWindowSetMovable(window, false)
        guiWindowSetSizable(window, false)
        label1 = guiCreateLabel(0.03, 0.06, 0.70, 0.13, "Witaj dowódco! Tutaj możesz zarządzać swoim klanem, dodawać graczy, zmieniać pensje w srebrze za gry klanowe i tak dalej.. Srebro, waluta premium oraz obligacje które znajdziesz w informacjach o klanie będa używane do kupowania czołgów premium na użytek klanu. Takowe czołgi każdy członek klanu, będzie mógł wypożyczyć", true,window)
        guiSetFont(label1, "default-bold-small")
        guiLabelSetHorizontalAlign(label1, "left", true)
        label2 = guiCreateLabel(0.03, 0.47, 0.21, 0.06, "Zarządzaj graczami", true, window)
        guiSetFont(label2, "default-bold-small")
        guiLabelSetHorizontalAlign(label2, "left", true)
        gridlist = guiCreateGridList(0.02, 0.52, 0.32, 0.47, true, window)
        row = guiGridListAddRow(gridlist) 
        button1 = guiCreateButton(0.37, 0.53, 0.13, 0.07, "Dodaj gracza", true, window)
        button2 = guiCreateButton(0.37, 0.65, 0.13, 0.07, "Wyrzuć gracza", true, window)
        button3 = guiCreateButton(0.37, 0.77, 0.13, 0.07, "Zmień stanowisko", true, window)
        button4 = guiCreateButton(0.37, 0.87, 0.13, 0.07, "Zmień pensje", true, window)
        label1 = guiCreateLabel(0.72, 0.47, 0.21, 0.06, "Informacje o klanie", true, window)
        guiSetFont(label1, "default-bold-small")
        guiLabelSetHorizontalAlign(label1, "left", true)
        label2 = guiCreateLabel(0.68, 0.53, 0.27, 0.09, "Srebro:"..klan[k][1], true, window)
        guiSetFont(label2, "default-bold-small")
        label3 = guiCreateLabel(0.68, 0.63, 0.27, 0.09, "Waluta premium: "..klan[k][2], true, window)
        guiSetFont(label3, "default-bold-small")
        label4 = guiCreateLabel(0.68, 0.74, 0.27, 0.09, "Obligacje: "..klan[k][3], true, window)
        guiSetFont(label4, "default-bold-small")
        label6 = guiCreateLabel(0.68, 0.82, 0.27, 0.09, "Liczba członków w klanie: "..klan[k][4], true, window)
        guiSetFont(label6, "default-bold-small")
        button5 = guiCreateButton(0.04, 0.29, 0.20, 0.09, "Przejdź do zakupu", true, window)
            button5 = guiCreateButton(0.41, 0.29, 0.20, 0.09, "Przejdź do zakupu", true, window)
        guiSetProperty(button6, "AlwaysOnTop", "True")
        label7 = guiCreateLabel(0.43, 0.22, 0.31, 0.07, "Siedziba klanu", true, window)
        guiSetFont(label7, "default-bold-small")
        label8 = guiCreateLabel(0.04, 0.22, 0.31, 0.07, "Zakup czołgu premium na użytek klanu", true, window)
        guiSetFont(label8, "default-bold-small")  
         guiGridListAddColumn(gridlist, "Gracz", 0.2)
         guiGridListAddColumn(gridlist, "Stanowisko", 0.2)
         guiGridListAddColumn(gridlist, "Pensja", 0.2)
        
        
        guiSetVisible(window, true)
            end
            end)

        guiSetVisible(window, false)


        addEvent("klan:panel", true)
        addEventHandler("klan:panel", root, function()
            if getElementData(localPlayer, "klan:stanowisko") == "Dowodca" then 
                triggerServerEvent("panel:uruchom", localPlayer)
            end
        end)

        addEvent("klan:normal:panel", true)
        addEventHandler("klan:normal:panel", root, function()
            if getElementData(localPlayer, "klan:stanowisko") == "Szeregowy" or "Kapral" then 
                triggerServerEvent("panel:uruchom:s", localPlayer)
            end 
        end 
           -- else 


            GUIEditorS = {
                button = {},
                window = {},
                label = {}
            }
            

            addEvent("uruchom:normal:panel", true)
            addEventHandler("uruchom:normal:panel", root, function(klanNonDowodca)
                for k = 1,2 do 
                    GUIEditorS.window[1] = guiCreateWindow(0.30, 0.20, 0.45, 0.57, "Klan - "..klanNonDowodca[k][2], true)
                    guiWindowSetMovable(GUIEditorS.window[1], false)
                    guiWindowSetSizable(GUIEditorS.window[1], false)
            
                    GUIEditorS.label[2] = guiCreateLabel(0.04, 0.06, 0.94, 0.29, "Witaj w panelu klanu, możesz tutaj przejrzeć swój klan, a także zobaczyć swojego stanowisko, pensje i tak dalej. Za pomocą tego menu możesz przejść do wypożyczenia pojazdów premium klanu oraz przejść do twierdzy klanu.", true, GUIEditorS.window[1])
                    guiSetFont(GUIEditorS.label[2], "default-bold-small")
                    guiLabelSetHorizontalAlign(GUIEditorS.label[2], "left", true)
                    GUIEditorS.label[3] = guiCreateLabel(0.06, 0.28, 0.19, 0.29, "Twierdza klanu", true, GUIEditorS.window[1])
                    guiSetFont(GUIEditorS.label[3], "default-bold-small")
                    guiSetProperty(GUIEditorS.label[3], "AlwaysOnTop", "True")
                    guiLabelSetHorizontalAlign(GUIEditorS.label[3], "left", true)
                    GUIEditorS.label[4] = guiCreateLabel(0.32, 0.27, 0.18, 0.29, "Wypożyczenie pojazdu", true, GUIEditorS.window[1])
                    guiSetFont(GUIEditorS.label[4], "default-bold-small")
                    guiSetProperty(GUIEditorS.label[4], "AlwaysOnTop", "True")
                    guiLabelSetHorizontalAlign(GUIEditorS.label[4], "left", true)
                    GUIEditorS.button[6] = guiCreateButton(0.02, 0.36, 0.22, 0.09, "Twierdza klanu", true, GUIEditorS.window[1])
                    GUIEditorS.button[7] = guiCreateButton(0.29, 0.36, 0.22, 0.09, "Wypożyczenie pojazdu klanowego", true, GUIEditorS.window[1])
                    GUIEditorS.label[5] = guiCreateLabel(0.68, 0.58, 0.18, 0.29, "Twój klan: "..klanNonDowodca[k][2], true, GUIEditorS.window[1])
                    guiSetFont(GUIEditorS.label[5], "default-bold-small")
                    guiSetProperty(GUIEditorS.label[5], "AlwaysOnTop", "True")
                    guiLabelSetHorizontalAlign(GUIEditorS.label[5], "left", true)
                    GUIEditorS.label[6] = guiCreateLabel(0.68, 0.71, 0.18, 0.18, "Twoje stanowisko: "..getElementData(localPlayer, "klan:stanowisko"), true, GUIEditorS.window[1])
                    guiSetFont(GUIEditorS.label[6], "default-bold-small")
                    guiLabelSetHorizontalAlign(GUIEditorS.label[6], "left", true)
                    GUIEditorS.label[4] = guiCreateLabel(0.68, 0.87, 0.18, 0.18, "Twoje pensja za gry wojenne: "..klanNonDowodca[k][1], true, GUIEditorS.window[1])
                    guiSetFont(GUIEditorS.label[4], "default-bold-small")
                    guiSetProperty(GUIEditorS.label[4], "AlwaysOnTop", "True")
                    guiLabelSetHorizontalAlign(GUIEditorS.label[4], "left", true)
                    GUIEditorS.button[5] = guiCreateButton(0.05, 0.87, 0.19, 0.10, "Złóż aplikację o przyznanie wyższej rangi", true, GUIEditorS.window[1])
                    GUIEditorS.label[8] = guiCreateLabel(0.03, 0.61, 0.28, 0.21, "Chcesz dostać wyższą rangę w klanie? Myślisz, że się wyróźniasz? Złóż aplikację, podgląd statusu aplikacji znajdziesz na stronie, po złożeniu.", true, GUIEditorS.window[1])
                    guiSetFont(GUIEditorS.label[8], "default-bold-small")
                    guiLabelSetHorizontalAlign(GUIEditorS.label[8], "left", true)
                    GUIEditorS.button[9] = guiCreateButton(0.34, 0.87, 0.25, 0.10, "Wyłącz panel", true, GUIEditorS.window[1])    
                    guiSetVisible(GUIEditorS.window[1], true)
                end
            end)

            guiSetVisible(GUIEditorS.window[1], false)




        