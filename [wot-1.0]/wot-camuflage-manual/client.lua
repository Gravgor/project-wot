local Pojazdy = {}

function nadaj_paintjobs(vehicle)
    Pojazdy[vehicle] = dxCreateShader('paintjob.fx', 0, 0, false, 'vehicle');
    local textureElement = dxCreateTexture('img.png');

    if (Pojazdy[vehicle] and textureElement) then
        dxSetShaderValue(Pojazdy[vehicle], 'gTexture', textureElement);
        engineApplyShaderToWorldTexture(Pojazdy[vehicle], "vehiclegrunge256", vehicle);
    end
end
addEvent('nadaj:PaintJob', true)
addEventHandler('nadaj:PaintJob', root, nadaj_paintjobs)