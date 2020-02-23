-- << 
-- 	 Autor : NyAngel 
--   Serwer : Project WOT
-- >> 



local sx, sy = guiGetScreenSize()


local infolist = {
	{"Aby zbadać nowy pojazd użyj przycisku badania"},
	{"Aby przejść samouczek kliknij Samouczek"},
	{"Twoja załoga musi coś jeść na polu bitwy! Dołóż im racje bojowe!"},
	{"Pamiętaj żeby zamontować różne zestawy naprawcze!"},
	{"Chcesz polepszyć osiągi załogi? Dodaj nowe wyposażenie do pojazdu!"},
}

local brak = {
	{"Brak wystarczającej kwoty!"}
}


local randomInfo 
local time  
local tick 

function drawLoading(progress) -- rysujemy
	dxDrawRectangle(sx * 0.3, sy * 0.7, sx * 0.4, sy * 0.1, tocolor(0, 0, 0, 200), false)
	dxDrawRectangle(sx * 0.3, sy * 0.8, (sx * 0.4) * progress/100, sy * 0.01, tocolor(255, 0, 0, 200), false)
	dxDrawText(infolist[randomInfo][1], sx * 0.3, sy * 0.7, sx * 0.3 + sx * 0.4, sy * 0.7 + sy * 0.1, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, true, true)
end

function checkDuration()
	if (getTickCount()-tick) > time then
		removeEventHandler("onClientRender", root, checkDuration)
	else
		local progress = interpolateBetween(0, 0, 0, 100, 0, 0, (getTickCount()-tick)/time, "Linear")
		drawLoading(progress)
	end
end



-- exports.loading:createLoading(czat trwania)



function createLoading(duration) -- wywałonie funckji <wartość wyraża się w sekundach>
	if duration then
		randomInfo = math.random(1, #infolist)
		tick = getTickCount()
		time = duration * 1000 
		addEventHandler("onClientRender", root, checkDuration)
	end
end

function createLoadingKwota(duration) -- wywałonie funckji <wartość wyraża się w sekundach>
	if duration then
		randomInfo = math.random(1, #brak)
		tick = getTickCount()
		time = duration * 1000 
		addEventHandler("onClientRender", root, checkDuration)
	end
end
