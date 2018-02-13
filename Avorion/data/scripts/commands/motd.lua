package.path = package.path .. ";data/scripts/lib/?.lua"

require ("galaxy")

function execute(sender, commandName, ...)
	local player = Player(sender)
	local lines = Server():getValue("motdLines")

	if(lines ~= nil) then
			lines = tonumber(lines)
		for i=1,lines do
				line = Server():getValue("motdLine" .. i)
				if line ~= nil then
					 player:sendChatMessage("MOTD", ChatMessageType.Whisp, line)
				end
		end
	else
		player:sendChatMessage("Default MOTD", ChatMessageType.Whisp, "Welcome to the server."%_t);
	end

end
