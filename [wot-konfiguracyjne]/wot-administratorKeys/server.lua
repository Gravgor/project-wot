function getInformation(thePlayer) --- funkcja jest na razie tylko na pokaz, w przyszłości będzie sama pobierac nazwe czołgu, pancerz ITD
	if getElementData(thePlayer, "player:admin") == true then
		triggerClientEvent(thePlayer, "wyswietl:stan", resourceRoot)
	else
		if not getElementData(thePlayer, "player:admin") == true then
			outputDebugString("Brak dostępu!")
		end
	end
end
	addCommandHandler("opis", getInformation)
