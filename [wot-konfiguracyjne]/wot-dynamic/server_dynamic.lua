function getAcutalVehicle(client)
    local veh =  getPedOccupiedVehicle(client) 
      if veh then 
        local pojazd = getElementData(veh, "name")
        print(pojazd)
      else 
        if not pojazd then 
            print("ale oszukales system")
        end 
    end 
end

addCommandHandler("pojazd", getAcutalVehicle)

function setDynamicofT34(client)
    local veh =  getPedOccupiedVehicle(client) 
      if veh then 
        local pojazd = getElementData(veh, "name")
          if pojazd == "T34" then 
            setVehicleHandling(veh, "mass", 56000)
            setVehicleHandling(veh, "maxVelocity", 30)
            setVehicleHandling(veh, "engineAcceleration", 50)
            setVehicleHandling(veh, "brakeDeceleration", 0.2)
            setVehicleHandling(veh, "brakeBias", 1.0)
            print("gotowe")
          end 
        end 
    end
    addEventHandler("onPlayerVehicleEnter", getRootElement(), setDynamicofT34)
    addCommandHandler("ustawT34", setDynamicofT34)

    function setDynamicofT100(client)
        local veh =  getPedOccupiedVehicle(client) 
          if veh then 
            local pojazd = getElementData(veh, "name")
              if pojazd == "T-100LT" then 
                setVehicleHandling(veh, "mass", 7000)
                setVehicleHandling(veh, "maxVelocity", 95)
                setVehicleHandling(veh, "engineAcceleration", 800)
                setVehicleHandling(veh, "brakeDeceleration", 1.0)
                setVehicleHandling(veh, "brakeBias", 1.0)
                print("gotowe")
              end 
            end 
        end
        addEventHandler("onPlayerVehicleEnter", getRootElement(), setDynamicofT34)
        addCommandHandler("ustawT100", setDynamicofT100)
          