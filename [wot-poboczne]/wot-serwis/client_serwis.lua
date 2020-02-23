local gui = {
    glowny_window = guiCreateWindow(0.33, 0.26, 0.30, 0.34, "Vehicle management", true),



    button_glowny = guiCreateButton(0.36, 0.30, 0.25, 0.05, "Napraw i uzupełnij amunicje", true),
  


    amunicjatekst = guiCreateLabel(0.46, 0.39, 0.24, 0.04, "Amunicja", true),



    pp_text = guiCreateLabel(0.36, 0.43, 0.03, 0.10, "PP - liczbe amunicji, wpisz poniżej", true),



    apcr_text = guiCreateLabel(0.45, 0.43, 0.03, 0.10, "APCR - liczbe amunicji, wpisz poniżejw", true),



    he_text = guiCreateLabel(0.54, 0.43, 0.03, 0.10, "HE - liczbe amunicji, wpisz poniżej", true),
  

    pp_edit = guiCreateEdit(0.36, 0.54, 0.04, 0.04, "", true),



    apcr_edit = guiCreateEdit(0.45, 0.54, 0.04, 0.04, "", true),



    he_edit = guiCreateEdit(0.54, 0.54, 0.04, 0.04, "", true),

    wylacz_button = guiCreateButton(0.60, 0.55, 0.03, 0.05, "Close", true),

}

---- variables

guiSetProperty(gui.he_edit, "AlwaysOnTop", "True")
guiSetProperty(gui.apcr_edit, "AlwaysOnTop", "True")
guiSetProperty(gui.pp_edit, "AlwaysOnTop", "True")
guiSetProperty(gui.he_text, "AlwaysOnTop", "True")
    guiLabelSetHorizontalAlign(gui.he_text, "left", true)
    guiSetProperty(gui.apcr_text, "AlwaysOnTop", "True")
    guiLabelSetHorizontalAlign(gui.apcr_text, "left", true)
    guiSetProperty(gui.pp_text, "AlwaysOnTop", "True")
    guiLabelSetHorizontalAlign(gui.pp_text, "left", true)
    guiSetProperty(gui.amunicjatekst, "AlwaysOnTop", "True")
    guiSetProperty(gui.button_glowny, "AlwaysOnTop", "True")
    guiWindowSetMovable(gui.glowny_window, false)
    guiWindowSetSizable(gui.glowny_window, false)
    guiSetVisible(gui.he_edit, false)
    guiSetVisible(gui.apcr_edit, false)
    guiSetVisible(gui.pp_edit, false)
    guiSetVisible(gui.he_text, false)
    guiSetVisible(gui.apcr_text, false)
    guiSetVisible(gui.pp_text, false)
    guiSetVisible(gui.amunicjatekst, false)
    guiSetVisible(gui.button_glowny, false)
    guiSetVisible(gui.glowny_window, false)
    guiSetVisible(gui.wylacz_button, false)
    guiSetProperty(gui.wylacz_button, "AlwaysOnTop", "True")

    --- variables end

    --- pokazywanie po danym evencie

    function pokazWindowa(value)
        if value then 
            showCursor(true)
            guiSetVisible(gui.he_edit, true)
            guiSetVisible(gui.apcr_edit, true)
            guiSetVisible(gui.pp_edit, true)
            guiSetVisible(gui.he_text, true)
            guiSetVisible(gui.apcr_text, true)
            guiSetVisible(gui.pp_text, true)
            guiSetVisible(gui.amunicjatekst, true)
            guiSetVisible(gui.button_glowny, true)
            guiSetVisible(gui.glowny_window, true)
            guiSetVisible(gui.wylacz_button, true)
        else 
            showCursor(false)
            guiSetVisible(gui.he_edit, false)
            guiSetVisible(gui.apcr_edit, false)
            guiSetVisible(gui.pp_edit, false)
            guiSetVisible(gui.he_text, false)
            guiSetVisible(gui.apcr_text, false)
            guiSetVisible(gui.pp_text, false)
            guiSetVisible(gui.amunicjatekst, false)
            guiSetVisible(gui.button_glowny, false)
            guiSetVisible(gui.glowny_window, false)
            guiSetVisible(gui.wylacz_button, false)
        end 
    end

    --- pokazywanie

    addEvent("pokaz:gui", true)
    addEventHandler("pokaz:gui", getRootElement(), function()
        pokazWindowa(true)
    end)

    function off()
        if source ~= gui.wylacz_button then return end 
          pokazWindowa(false)
    end 
    addEventHandler("onClientGUIClick", root, off)


    function getTankState()
        local tank = getPedOccupiedVehicle(localPlayer)
        local twojPojazd = getElementData(veh, "name")
           if getElementData(localPlayer, "veh:destroyed") == "1" then 
              triggerEvent("notyfi:true", root, "Twój " ..twojPojazd.. " jest zniszczony, napraw go!")
           end 
        end 
        
          