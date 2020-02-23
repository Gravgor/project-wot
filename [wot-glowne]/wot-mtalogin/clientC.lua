addEvent("event:przejsciowy", true)
addEventHandler("event:przejsciowy", getRootElement(), function()
    triggerServerEvent("getRewardDay", localPlayer)
end)