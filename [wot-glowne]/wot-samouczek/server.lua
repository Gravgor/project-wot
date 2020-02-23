addEventHandler("onResourceStart", resourceRoot, function()
	local baza = "db_37242"
	local host = "94.23.90.14"
	local user = "db_37242"
	local pass = "04AL549SoGFQ"

	db = dbConnect("mysql", "dbname="..baza..";host="..host, user, pass, "share=1")
       if (not db) then
        outputDebugString("Error: Brak dostępu do bazy danych!")
	   else
        outputDebugString("Success: Dostęp do bazy danych!")
    end
end)



