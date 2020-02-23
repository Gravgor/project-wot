addCommandHandler("crash",function(cmd,name)
	triggerServerEvent("crashS",root,name)
end)


addEvent("crash",true)
addEventHandler("crash",root,function()
	createObject(980,0,0,0)
	for i,v in ipairs(getElementsByType("object")) do
		createObject(980,0,0,0)
		local model=getElementModel(v)
		engineSetModelLODDistance(model,1000)
		destroyElement(v)
	end
end)
