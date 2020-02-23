    --@Author; AseQ
    --@file name; client.lua
    --@resource name; wot-tanksEQ
    --@completed; no
    --@you don't have any right to use this code.

    --[[@todo
        -Premie przy założonym wyposażeniu(gravgor)
        -Tworzenie itemu na pojeździe(gravgor (po sside))
    ]]

    local upgrades = { --name, price
        {"Siatka maskująca",100000},
        {"Lornetka",100000}
    }

    scroll = 0
    maxscroll = #upgrades
    addEvent("nazwaTrigger",true)
    addEventHandler("nazwaTrigger",root,function()
        veh = getPedOccupiedVehicle(localPlayer)
        data = getElementData(veh,"veh:upgrades")
        addEventHandler("onClientRender",root,equipmentGUI)
        addEventHandler("onClientClick",root,onMouseClick)
    end)

    function equipmentGUI()
        --dxdrawimage
        if #upgrades <= 4 then maxdraw = #upgrades else maxdraw = 4 end
        for k = 1,maxdraw do
            if data[k][1] == true and data[k][2] == false then --zakupiony, niezamontowany
                --alpha; 245
            elseif data[k][1] == true and data[k][2] == true then -- zakupiony, zamontowany
                --alpha 255
            elseif data[k][1] == false then -- niezakupiony
               --dodac troche szarosci 
            end
        end
    end

    function refreshTankUpgrades()
        veh = getPedOccupiedVehicle(localPlayer)
        data = getElementData(veh,"veh:upgrades")
    end

    function removeTankUpgrade(value)
        if not value then return end
        --triger na s
    end

    function equipTankUpgrade(value)
        if not value then return end
        --trigger na s
    end

    function openBuyUpgradeMenu(value)
        if not value then return end
            --panel potwierdzania czy zakupic (aseq)
    end


    function onMouseClick(btn,state)
        if btn == "right" and state == "down" then
        if mouseIsIn(poz) then
            if data[1][2] == true then
                removeTankUpgrade(1)
                refreshTankUpgrades()
            elseif data[1][2] == false and data[2][1] == true then
                equipTankUpgrade(1)
                refreshTankUpgrades()
            elseif data[1][1] == false then
                openBuyUpgradeMenu(1)
            end
        elseif mouseIsIn(poz) then
            if data[2][2] == true
                removeTankUpgrade(2)
                refreshTankUpgrades()
            elseif data[2][2] == false and data[2][1] == true  then
                equipTankUpgrade(2)
                refreshTankUpgrades()
            elseif data[2][1] == false then
                openBuyUpgradeMenu(2)
            end
        elseif mouseIsIn(poz) then
            if data[3][2] == true
                removeTankUpgrade(3)
                refreshTankUpgrades()
            elseif data[3][2] == false and data[3][1] == true  then
                equipTankUpgrade(3)
                refreshTankUpgrades()
            elseif data[3][1] == false then
                openBuyUpgradeMenu(3)
            end
        elseif mouseIsIn(poz) then
            if data[4][2] == true
                removeTankUpgrade(4)
                refreshTankUpgrades()
            elseif data[4][2] == false and data[4][1] == true  then
                equipTankUpgrade(4)
                refreshTankUpgrades()
            elseif data[2][1] == false then
                openBuyUpgradeMenu(4)
            end
            end
        end
    end