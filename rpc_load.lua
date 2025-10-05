	if rikky_parent_control == nil then
		local CPATH = {}
		local cpath = package.path .. ";"
		local n
		while(1)do
			n = cpath:find(";")
			if n then
				CPATH[#CPATH + 1] = cpath:sub(1, n - 1)
				cpath = cpath:sub(n + 1, #cpath)
			else
				break
			end
		end
		if not CPATH[2] then
			CPATH[2]=CPATH[1]:sub(1, CPATH[1]:find("\\Script\\")) .. "Script\\?.lua"
			package.path = package.path .. ";" .. CPATH[2]
		elseif not CPATH[2]:find("script\\?.lua") then
			CPATH[3]=CPATH[2]:sub(1, CPATH[2]:find("\\script\\")) .. "script\\?.lua"
			package.path = package.path .. ";" .. CPATH[3]
		end
		for i=1,#CPATH do
			debug_print(CPATH[i]:gsub("?", "rikky_parent_control"))
			local f=io.open(CPATH[i]:gsub("?", "rikky_parent_control"),"rb")
			if f then
				require("rikky_parent_control")
				f:close()
				break
			end
		end
	end
if rikky_parent_control == nil then
	debug_print("NO rikky_parent_control")
end