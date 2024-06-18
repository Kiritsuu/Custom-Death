RegisterCommand("revive", function(source, args)
    permissionCheck(source, args)
end, false)

local sourcePlayer = source

RegisterServerEvent("CustomDeath:revivePlayerCheck")
RegisterServerEvent("CustomDeath:revivePlayerSuccessRelay")
RegisterServerEvent("CustomDeath:revivePlayerAliveRelay")
RegisterServerEvent("CustomDeath:permissionCheck")

AddEventHandler("CustomDeath:revivePlayerCheck", function(args)
    local playerName = GetPlayerName(args[1])
    sourcePlayer = source

	if playerName == nil then
		TriggerClientEvent("CustomDeath:revivePlayerNotFound", source, args[1])
	else
		TriggerClientEvent('CustomDeath:reviveExecute', args[1], playerName, GetPlayerName(source))
	end
end)

AddEventHandler("CustomDeath:revivePlayerSuccessRelay", function(playerName) -- Use playerId directly
    TriggerClientEvent("CustomDeath:revivePlayerSuccess", sourcePlayer, playerName) -- Directly use playerId here
end)

AddEventHandler("CustomDeath:revivePlayerAliveRelay", function(playerName) -- Use playerId directly
    TriggerClientEvent("CustomDeath:revivePlayerAlive", sourcePlayer, playerName) -- Directly use playerId here
end)

function permissionCheck(source, args)

    if IsPlayerAceAllowed(source, "CustomDeath.revive") then
        TriggerClientEvent("CustomDeath:revive", source, args)
    else
        TriggerClientEvent("CustomDeath:permission", source)
    end
end
