package.path = package.path .. ";data/scripts/lib/?.lua"

require ("galaxy")

function execute(sender, commandName, ...)
	local player = Player(sender)
    local args = {...}

	if(#args == 0) then
		player:sendChatMessage("MOTD", ChatMessageType.Whisp, getHelp())
		return 0, "", ""
	end

	local line = ""
	for i=2,#args do
		line = line .. " " ..  args[i]
	end

	local option = args[1]

	if option == "help" then getHelp()
	--Set single line MOTD.
	elseif option == "set" then
		newLine(line)
	--Add a new line to MOTD,S set single line if none present.
	elseif option == "add" then
		addLine(line)
	elseif option == "remove" then
		removeLine()
	--Completely remove the MOTD
	elseif option == "clear" then
		clear()
		player:sendChatMessage("MOTD", ChatMessageType.Warning, "Do not forget to set a new MOTD.")
	--Send MOTD to caller.
elseif option == "test" then
	local lines = Server():getValue("motdLines")
	if(lines ~= nil) then
		for i=1,lines do
			if line ~= nil then
				player:sendChatMessage("MOTD", ChatMessageType.Whisp, getLine(i))
			end
		end
	end
--You dun
elseif option == "broadcast" then
	local lines = Server():getValue("motdLines")
	if(lines ~= nil) then
		for i=1,lines do
			if line ~= nil then
				Server():broadcastChatMessage("MOTD", ChatMessageType.Whisp, getLine(i))
			end
		end
	end
--You dun goofed, you need to get some help.
	else
		player:sendChatMessage("MOTD", ChatMessageType.Whisp, getHelp())
	end

	if(Server():getValue("motdLines") == nil ) then
		player:sendChatMessage("MOTD", ChatMessageType.Warning, "No MOTD has been configured.")
	end

    return 0, "", ""
end

--I would have absolutely loved to keep things simple and just use a table.
--But nope, avorion doesnt like that.
function addLine(line)
 	local lines = Server():getValue("motdLines")
	if lines == nil then lines = 0 end
	lines = lines + 1
	Server():setValue("motdLine" .. lines,line)

	--Only set after above was processed succesfully to avoid problems.
	 Server():setValue("motdLines",lines)
end

function removeLine()
 	local lines = Server():getValue("motdLines")

	Server():setValue("motdLine" .. lines,nil)

	lines = lines -1
	if(lines == 0) then lines = nil end
	--Only set after above was processed succesfully to avoid problems.
	 Server():setValue("motdLines",lines)

end

function getLine(i)
	local lines = Server():getValue("motdLines")
	local line
	if lines ~=  nil and lines >= i then
		line = Server():getValue("motdLine" .. i)
		if line ~= nil then
			return line
		end
	end
end

function newLine(line)
	clear()
	addLine(line)
end

--Remove all traces of the server variables.
function clear()
	local lines = Server():getValue("motdLines")
	if lines ~=  nil and lines > 0 then
		for i=1,lines do
			 Server():setValue("motdLine" .. i,nil)
		end
	end
	Server():setValue("motdLines",nil)
	print("motd cleared.")
end

function getDescription()
    return "Allows setting and modifying of the MOTD"
end

function getHelp()
    return "use 'motd set text' initially, 'motd add secondline' optionally, 'motd remove' to remove line, or 'motd clear' or 'motd test' to test, 'motd broadcast' to broadcast to players"
end
