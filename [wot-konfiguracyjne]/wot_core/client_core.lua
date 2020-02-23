


local screenW, screenH = guiGetScreenSize()

local originalGetPlayerCount = getPlayerCount -- Store the original getPlayerCount function to a variable

    function getPlayerCount()
        -- If originalGetPlayerCount is defined, that means that this function is executed serverside.
        -- The next line returns the result of the original function if it's defined. If not, it counts the number of player elements (to also work clientside).
        return originalGetPlayerCount and originalGetPlayerCount() or #getElementsByType("player")
    end



function count(count)
    dxDrawText("Aktywni gracze: "..tonumber(getPlayerCount()), screenW * 0.0007, screenH * 0.1602, screenW * 0.0978, screenH * 0.2318, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
end
addEventHandler("onClientRender", root, count)
