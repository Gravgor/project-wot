--- event który będzie pokazywać serwis

addEvent("pokaz:gui:client", true)
addEventHandler("pokaz:gui:client", getRootElement(), function()
    triggerClientEvent(client, "pokaz:gui", resourceRoot)
end)