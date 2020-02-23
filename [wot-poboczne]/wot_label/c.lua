
local sx,sy = guiGetScreenSize()
local x,y = sx-250,sy-30
local x2,y2 = sx-3,sy-12
local text = ""
local col = tocolor(255,255,255,255/2)
local screenW, screenH = guiGetScreenSize()

local date = "20.01.2019"
addEventHandler("onClientRender", root, function()
	dxDrawText("project-wot.pl #"..date.." #", screenW * 0.0132, screenH * 0.9766, screenW * 0.1140, screenH * 1.0182, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
end)
