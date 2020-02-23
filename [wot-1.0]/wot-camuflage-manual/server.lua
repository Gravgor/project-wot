function paintjob (plr)
        local vehicle = getPedOccupiedVehicle(plr)
        local modelID = getElementModel(vehicle)
        if (vehicle) then
        local tuning_paintjob = getElementData(vehicle, "tuning.paintjob")
            if (tuning_paintjob == true) then 
            outputChatBox( "Pojazd już posiada PaintJoba!", plr)
            else
                triggerClientEvent(root, 'nadaj:PaintJob', root, vehicle)
                setElementData(vehicle, 'tuning.paintjob', true)
            end
        end
    end
addCommandHandler('pj', paintjob)