--@Author: AseQ
--@Server: project-wot
--@You don't have any right to use this code
local rewards = { --silver,gold,exp,vipdays
[1] = {10000,0,0,0},
[2] = {0,50,0,0,0},
[3] = {3500,100,0,1},
[4] = {5000,125,150,0},
[5] = {9000,150,200,1},
[6] = {11000,200,350,1},
[7] = {20000,400,500,2},
}

function rewards_gui()
    dxDrawImage(408, 225, 550, 318, "/images/background.png", 0, 0, 0, tocolor(4, 4, 4, 220), false)
    dxDrawImage(565, 433, 237, 110, "/images/button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Odbierz", 600, 470, 765, 505, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawImage(566, 367, 35, 35, "/images/ikonagolda.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(433, 367, 35, 35, "/images/ikonasrebra.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(814, 367, 35, 35, "/images/ikonaexpa.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(692, 367, 35, 35, "/images/ikonapremiumhop.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText(rewards[day][1], 472, 373, 525, 395, tocolor(255, 255, 255, 255), 1.40, "default", "left", "top", false, false, false, false, false)
    dxDrawText(rewards[day][2], 606, 373, 659, 395, tocolor(255, 255, 255, 255), 1.40, "default", "left", "top", false, false, false, false, false)
    dxDrawText(rewards[day][3], 733, 373, 786, 395, tocolor(255, 255, 255, 255), 1.40, "default", "left", "top", false, false, false, false, false)
    dxDrawText(rewards[day][4], 856, 373, 909, 395, tocolor(255, 255, 255, 255), 1.40, "default", "left", "top", false, false, false, false, false)
end
window = false

addEvent("openRewardsMenu",true)
addEventHandler("openRewardsMenu",root,function(a)
    day = tonumber(a)
    addEventHandler("onClientRender",root,rewards_gui)
    window = true
end)

    addEventHandler("onClientClick", root, function(btn, state)
    if btn == "left" and state == "down" then
            if  mysz (565, 433, 237, 110) and window == true then
                triggerServerEvent("collectReward",localPlayer,day)
				removeEventHandler("onClientRender",root,rewards_gui)
				window = false
				print("siema")
            end
        end
    end)
    
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