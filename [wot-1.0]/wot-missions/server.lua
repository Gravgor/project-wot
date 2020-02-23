---- konfiguracja 

addEvent("triggerUruchom:Server", true)
addEventHandler("triggerUruchom:Server", getRootElement(), function()
 triggerClientEvent(client, "trigger:Client", client, resourceRoot)
end)



---- operation 