local tekstury = {
    {"1", 25000},
    {"2", 25000},
    {"3", 25000},
    {"4", 25000},
    {"5", 25000},
    {"6", 25000},
    {"7", 25000},
    {"8", 25000},
    {"9", 25000},
    {"10", 25000},
    {"11", 25000},
    {"12", 25000},
}

kamuflazTekstura = {}

function kosztKamuflaz(str)
    for k, v in pairs(tekstury) do
		if str == v[1] then
			return v[2]
		end
	end
end

function render()
    dxDrawImage(screenW * 0.0000, screenH * 0.0625, screenW * 0.1360, screenH * 0.2292, ":wot-camuflage/files/kamuflazpustynny.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Wybór kamuflaża", (screenW * 0.3919) - 1, (screenH * 0.0417) - 1, (screenW * 0.8419) - 1, (screenH * 0.1380) - 1, tocolor(0, 0, 0, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawText("Wybór kamuflaża", (screenW * 0.3919) + 1, (screenH * 0.0417) - 1, (screenW * 0.8419) + 1, (screenH * 0.1380) - 1, tocolor(0, 0, 0, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawText("Wybór kamuflaża", (screenW * 0.3919) - 1, (screenH * 0.0417) + 1, (screenW * 0.8419) - 1, (screenH * 0.1380) + 1, tocolor(0, 0, 0, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawText("Wybór kamuflaża", (screenW * 0.3919) + 1, (screenH * 0.0417) + 1, (screenW * 0.8419) + 1, (screenH * 0.1380) + 1, tocolor(0, 0, 0, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawText("Wybór kamuflaża", screenW * 0.3919, screenH * 0.0417, screenW * 0.8419, screenH * 0.1380, tocolor(255, 255, 255, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawImage(screenW * 0.0000, screenH * 0.0625, screenW * 0.1360, screenH * 0.2292, ":wot-camuflage/files/kamuflazpustynny.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Wybór kamuflaża", (screenW * 0.3919) - 1, (screenH * 0.0417) - 1, (screenW * 0.8419) - 1, (screenH * 0.1380) - 1, tocolor(0, 0, 0, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawText("Wybór kamuflaża", (screenW * 0.3919) + 1, (screenH * 0.0417) - 1, (screenW * 0.8419) + 1, (screenH * 0.1380) - 1, tocolor(0, 0, 0, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawText("Wybór kamuflaża", (screenW * 0.3919) - 1, (screenH * 0.0417) + 1, (screenW * 0.8419) - 1, (screenH * 0.1380) + 1, tocolor(0, 0, 0, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawText("Wybór kamuflaża", (screenW * 0.3919) + 1, (screenH * 0.0417) + 1, (screenW * 0.8419) + 1, (screenH * 0.1380) + 1, tocolor(0, 0, 0, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
        dxDrawText("Wybór kamuflaża", screenW * 0.3919, screenH * 0.0417, screenW * 0.8419, screenH * 0.1380, tocolor(255, 255, 255, 255), 4.00, "sans", "left", "top", true, false, false, true, false)
    end