DGS = exports.dgs

local screenW, screenH = guiGetScreenSize() ---- rendery
brakZalogi = true
function zalogaRenderBrak()
dxDrawImage(screenW * 0.0000, screenH * 0.7565, screenW * 0.2735, screenH * 0.0977, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
dxDrawImage(screenW * 0.0000, screenH * 0.8620, screenW * 0.2735, screenH * 0.0977, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
dxDrawText(tostring((getElementData(localPlayer, "dowodca_name")) or "Brak dowodcy"), screenW * 0.0000, screenH * 0.7695, screenW * 0.2051, screenH * 0.8281, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
dxDrawText(tostring((getElementData(localPlayer, "1_pe")) or "Brak perka"), screenW * 0.0022, screenH * 0.8255, screenW * 0.0301, screenH * 0.8490, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
dxDrawText(tostring((getElementData(localPlayer, "2_pe")) or "Brak perka"), screenW * 0.0875, screenH * 0.8255, screenW * 0.1154, screenH * 0.8490, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
dxDrawText(tostring((getElementData(localPlayer, "kierowca_name")) or "Brak kierowcy"), screenW * 0.0000, screenH * 0.8750, screenW * 0.2051, screenH * 0.9336, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
dxDrawText(tostring((getElementData(localPlayer, "1_pe")) or "Brak perka"), screenW * 0.0000, screenH * 0.9336, screenW * 0.0279, screenH * 0.9570, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
dxDrawText(tostring((getElementData(localPlayer, "2_pe")) or "Brak perka"), screenW * 0.0875, screenH * 0.9336, screenW * 0.1154, screenH * 0.9570, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
dxDrawImage(screenW * 0.2132, screenH * 0.7760, screenW * 0.0235, screenH * 0.0417, ":guieditor/images/plus.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
dxDrawImage(screenW * 0.2132, screenH * 0.8854, screenW * 0.0235, screenH * 0.0417, ":guieditor/images/plus.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

local re = {
    rekrutuj = guiCreateButton(0.18, 0.77, 0.08, 0.07, "", true),


    rekrutuj2 = guiCreateButton(0.18, 0.88, 0.08, 0.07, "", true),
}


addEvent("getClientCrew", true)
addEventHandler("getClientCrew", getRootElement(), function(dowodca, kierowca)
    setElementData(localPlayer, "dowodca_name", dowodca)
    setElementData(localPlayer, "kierowca_name", kierowca)
end)


addEvent("asek", true)
addEventHandler("asek", root, function()
    triggerServerEvent("checkCrew", localPlayer)
end)

function getIfLoggin()
        if brakZalogi == true then 
        addEventHandler("onClientRender", root, zalogaRenderBrak)
        guiSetVisible(re.rekrutuj, true)
        guiSetVisible(re.rekrutuj2, true)
        else 
            if brakZalogi == false then 
                addEventHandler("onClientRender", root, zalogaRender)
            end
        end
end

addEvent("pokaz:zalogi", true)
addEventHandler("pokaz:zalogi", root, getIfLoggin)

local okienkoRekru = {
    werbujkier = guiCreateButton(0.02, 0.70, 0.10, 0.04, "", true),
    werbujdow = guiCreateButton(0.13, 0.70, 0.10, 0.04, "", true),
    zamknij = guiCreateButton(0.27, 0.69, 0.10, 0.04, "", true),    
}



 
local edit1Dowodca = DGS:dgsCreateEdit(0.00, 0.50, 0.27, 0.05, "Wpisz imie i nazwisko", true,nil,tocolor(255,255,255,255),1,1,false,tocolor(0,0,0,0))
local edit2Kierowca = DGS:dgsCreateEdit(0.00, 0.63, 0.27, 0.05, "Wpisz imie i nazwisko", true,nil,tocolor(255,255,255,255),1,1,false,tocolor(0,0,0,0))
guiSetVisible(okienkoRekru.werbujkier, false)
        guiSetVisible(okienkoRekru.werbujdow, false)
        guiSetVisible(okienkoRekru.zamknij, false)
        DGS:dgsSetVisible(edit1Dowodca, false)
        DGS:dgsSetVisible(edit2Kierowca, false)
        guiSetVisible(re.rekrutuj, false)
        guiSetVisible(re.rekrutuj2, false)
        guiSetAlpha(okienkoRekru.werbujkier, 0.00)
        guiSetAlpha(okienkoRekru.werbujdow, 0.00)
        guiSetAlpha(okienkoRekru.zamknij, 0.00)
        guiSetAlpha(re.rekrutuj, 0.00)
        guiSetAlpha(re.rekrutuj2, 0.00)

function renderujOkienko()
    dxDrawImage(screenW * 0.0000, screenH * 0.2070, screenW * 0.3640, screenH * 0.5365, ":wot-garaz/wybrany.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Hej, czołgistio! Witaj w oknie rekrutacji załogi. Przyszedłeś tutaj, bo poszukujesz nowej załogi do twojego pojazdu? SUPER! Żeby otrzymać nowego dowódcę musisz kliknąć przycisk poniżej i napisem \"Rekrutuj dowódcę\". A jeśli chcesz zrekrutować kierowcę, musisz zrobić to samo tylko, że kliknąć przycisk z napisem \"Rekrutuj kierowcę\"", screenW * 0.0074, screenH * 0.2188, screenW * 0.3478, screenH * 0.3411, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, true, false, false, false)
        dxDrawText("Pojazd na którym będą służyć: "..tostring(getElementData(localPlayer, "tank:active")), screenW * 0.0037, screenH * 0.3945, screenW * 0.0728, screenH * 0.4336, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
        dxDrawText("Poniżej możesz skonfigurować imię i nazwisko dowódcy!", screenW * 0.0037, screenH * 0.4570, screenW * 0.3515, screenH * 0.5013, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
        dxDrawImage(screenW * 0.0022, screenH * 0.5000, screenW * 0.2750, screenH * 0.0547, ":wot-garaz/poletekstowe.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Poniżej możesz skonfigurować imię i nazwisko kierowcy!", screenW * 0.0074, screenH * 0.5768, screenW * 0.3551, screenH * 0.6211, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
        dxDrawImage(screenW * 0.0022, screenH * 0.6263, screenW * 0.2750, screenH * 0.0547, ":wot-garaz/poletekstowe.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.0191, screenH * 0.6862, screenW * 0.0956, screenH * 0.0573, ":wot-garaz/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.2662, screenH * 0.6862, screenW * 0.0956, screenH * 0.0573, ":wot-garaz/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Rekrutuj", screenW * 0.0265, screenH * 0.6940, screenW * 0.1088, screenH * 0.7305, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
        dxDrawText("Zamknij", screenW * 0.2750, screenH * 0.6953, screenW * 0.3493, screenH * 0.7148, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
        end

function showRekrutacja(value)
    if value then 
        addEventHandler("onClientRender", root, renderujOkienko)
        guiSetVisible(okienkoRekru.werbujkier, true)
        guiSetVisible(okienkoRekru.zamknij, true)
        DGS:dgsSetVisible(edit1Dowodca, true)
        DGS:dgsSetVisible(edit2Kierowca, true)
        guiSetVisible(re.rekrutuj, false)
        guiSetVisible(re.rekrutuj2, false)
    else
        removeEventHandler("onClientRender", root, renderujOkienko)
        guiSetVisible(okienkoRekru.werbujkier, false)
        guiSetVisible(okienkoRekru.zamknij, false)
        DGS:dgsSetVisible(edit1Dowodca, false)
        DGS:dgsSetVisible(edit2Kierowca, false)
        guiSetVisible(re.rekrutuj, false)
        guiSetVisible(re.rekrutuj2, false)
    end 
end

function openRekrutacja()
    if source ~= re.rekrutuj then return end 
    showRekrutacja(true)
end
addEventHandler("onClientGUIClick", root, openRekrutacja)

function rekrutuj()
    local kierowca = DGS:dgsGetText(edit2Kierowca)
    local dowodca = DGS:dgsGetText(edit1Dowodca)
    if source ~= okienkoRekru.werbujkier then return end
        print(kierowca)
        triggerServerEvent("werbuj", localPlayer, kierowca, dowodca)
    end 
addEventHandler("onClientGUIClick", root, rekrutuj)

function zamknij()
    if source ~= okienkoRekru.zamknij then return end 
    showRekrutacja(false)
end
addEventHandler("onClientGUIClick", root, zamknij)


