package.path = package.path .. ";data/scripts/lib/?.lua"
package.path = package.path .. ";data/scripts/server/?.lua"
require ("factions")
require ("stringutility")

function onStartUp()
    Server():registerCallback("onPlayerLogIn", "onPlayerLogIn")
    Server():registerCallback("onPlayerLogOff", "onPlayerLogOff")
    Galaxy():registerCallback("onPlayerCreated", "onPlayerCreated")
    Galaxy():registerCallback("onFactionCreated", "onFactionCreated")
end

function onShutDown()

end

function update(timeStep)
    local server = Server()

    local guardianRespawnTime = server:getValue("guardian_respawn_time")
    if guardianRespawnTime then

        guardianRespawnTime = guardianRespawnTime - timeStep;
        if guardianRespawnTime < 0 then
            guardianRespawnTime = nil
        end

        server:setValue("guardian_respawn_time", guardianRespawnTime)
    end

    local serverRuntime = server:getValue("online_time") or 0
    serverRuntime = serverRuntime + timeStep
    server:setValue("online_time", serverRuntime)

end

function onPlayerCreated(index)
    local player = Player(index)
    Server():broadcastChatMessage("Server", 0, "Player %s created!"%_t, player.name)
end

function onFactionCreated(index)

end

function onPlayerLogIn(playerIndex)
    local player = Player(playerIndex)
    Server():broadcastChatMessage("Server", 0, "Player %s joined the galaxy"%_t, player.name)
    player:sendChatMessage("MOTD", 2, "Welcome to XeroSpace Advanced! This server will be reset on 12/26 to add additional longevity mods. For more information, join the XeroSpace Discord! https://discordapp.com/invite/TzFW4wd"%_t);
	player:sendChatMessage("MOTD", 2, "Please let a Moderator or Streamer know if you encounter any bugs or other issues"%_t);
    player:addScriptOnce("headhunter.lua")
    player:addScriptOnce("eventscheduler.lua")
    player:addScriptOnce("story/spawnswoks.lua")
    player:addScriptOnce("story/spawnai.lua")
    player:addScriptOnce("story/spawnguardian.lua")
    player:addScriptOnce("story/spawnadventurer.lua")
    player:addScriptOnce("mods/oosp/scripts/player/oosproduction.lua")                            --oosp
    matchResources(player)
end

function onPlayerLogOff(playerIndex)
    local player = Player(playerIndex)
    Server():broadcastChatMessage("Server", 0, "Player %s left the galaxy"%_t, player.name)

end

--THE LINE BELOW IS NEEDED FOR ShipScriptLoader
local s, b = pcall(require, 'mods/ShipScriptLoader/scripts/server/server')
    if s then if b.onPlayerLogIn then local a = onPlayerLogIn; onPlayerLogIn = function(c) a(c); b.onPlayerLogIn(c); end end end
