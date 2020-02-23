sx, sy = guiGetScreenSize()
function scale_x(x)
    return math.floor((x / 1920) * sx)
end

function scale_y(y)
    return math.floor((y / 1080) * sy)
end
    notitable = {}
    images = {
        ["error"] = dxCreateTexture( "images/error.png","argb",false,"clamp"),
        ["success"] = dxCreateTexture( "images/success.png","argb",false,"clamp"),
        ["info"] = dxCreateTexture( "images/info.png","argb",false,"clamp"),
    }
    function drawNoti()
        for k = 1,#notitable do
            if getTickCount() > (notitable[k][3]+10000) then
                table.remove(notitable,k)
            end
            if #notitable == 0 then return end
            local offset = (k-1)*100
            dxDrawImage(scale_x(1550),scale_y(965-offset),scale_x(367),scale_y(110),images[notitable[k][2]])
            dxDrawText(notitable[k][1],scale_x(1920-317),scale_y(1075-offset),scale_x(1880),scale_y(965-offset),tocolor(255,255,255,255),1.0,"default", "center","center")
        end
    end
    addEventHandler("onClientRender",root,drawNoti)

    addEvent("createNoti",true)
    addEventHandler("createNoti",root,function(type,text)
        table.insert(notitable,{text,type,getTickCount()})
    end)