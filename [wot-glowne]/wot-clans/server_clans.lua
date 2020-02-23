

local DB = exports['wot-db']

addEvent("uruchom:klany:S", true)
addEventHandler("uruchom:klany:S", getRootElement(), function()
    triggerClientEvent(client, "uruchom:klany", root)
    print("chuj2")
end)

addEvent("stworz:klan", true)
addEventHandler("stworz:klan", getRootElement(), function(nazwa, skrot)
    takePlayerMoney(client, 100000)
      dbExec(db, "INSERT into wot_clans SET Klan=?, Gracz=?, Stanowisko=?, skrot=?", nazwa, getElementData(client, "login"), "Lider", skrot)
      dbExec(db, "UPDATE wot_users SET Klan=?, skrotklanu=? WHERE login=?", nazwa, skrot, getElementData(client, "login"))
      dbExec(db, "INSERT into wot_clans_table SET nazwa=?, skrot=?, dowodca=?, srebro=?, waluta=?, obligacje=?, ludzie=?", nazwa, skrot, getPlayerName(client), "1000", "1000", "10", "1")
      local tekst = "Założyłeś klan"
      triggerClientEvent(client, "notyfi:true", root, tekst)
end)

addEvent("sprawdz:czy:gracz:wklanie", true)
addEventHandler("sprawdz:czy:gracz:wklanie", root, function()
    local r = DB:query("SELECT * from wot_clans WHERE Gracz=?", getPlayerName(client))
        sKlanP = r[1].Klan
        sStanowiskoP = r[1].Stanowisko
        setElementData(client, "klan",sKlanP)
        setElementData(client, "klan:stanowisko", sStanowiskoP)
        if getElementData(client, "klan:stanowisko") == "Dowodca" then 
         triggerClientEvent(client, "klan:panel", client)
        else 
            if getElementData(client, "klan:stanowisko")  then 
                triggerClientEvent(client, "klan:normal:panel", client)
            end 
        end 
end) 


addEvent("panel:uruchom", true)
addEventHandler("panel:uruchom", root, function()
    local r = DB:query("SELECT * from wot_clans_table WHERE dowodca=?",  getPlayerName(client))
        local klan = {}
       sSrebro =  r[1].srebro 
       sWaluta = r[1].waluta
       sObligacje = r[1].obligacje
       sLudzie = r[1].ludzie
       sNazwa = r[1].nazwa
       table.insert(klan, {sSrebro, sWaluta, sObligacje, sLudzie, sNazwa})
    triggerClientEvent(client, "uruchamiamy:panel",client,  klan)
end)

addEvent("panel:uruchom:s", true)
addEventHandler("panel:uruchom:s", root, function()
    local r = DB:query("SELECT * from wot_clans WHERE Gracz=?",  getPlayerName(client))
        local klanNonDowodca = {}
       sPensja =  r[1].pensja 
       sNazwa = r[1].Klan
       table.insert(klanNonDowodca, {sPensja, sNazwa})
       print("lul")
    triggerClientEvent(client, "uruchom:normal:panel", client,  klanNonDowodca)
end)



