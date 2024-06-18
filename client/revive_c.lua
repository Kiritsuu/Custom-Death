RegisterNetEvent("CustomDeath:revive")
RegisterNetEvent("CustomDeath:revivePlayerNotFound")
RegisterNetEvent("CustomDeath:revivePlayerSuccess")
RegisterNetEvent("CustomDeath:revivePlayerAlive")
RegisterNetEvent("CustomDeath:permission")

AddEventHandler("CustomDeath:revive", function(args)
    if args[1] == nil then
        exports['413x-notify']:Alert("warning", "Enter a PlayerID!", "Please enter a valid player ID", 5000)
    else 
        TriggerServerEvent("CustomDeath:revivePlayerCheck", args)
    end
end)

AddEventHandler("CustomDeath:revivePlayerNotFound", function(playerServerId)
    exports['413x-notify']:Alert("error", "Invalid PlayerID!", "Unable to find a player with the ID: " ..playerServerId, 5000)
end)

AddEventHandler("CustomDeath:revivePlayerSuccess", function(playerName)
    exports['413x-notify']:Alert("success", "Player revived!", playerName.. " has been revived!", 5000)
end)

AddEventHandler("CustomDeath:revivePlayerAlive", function(playerName)
    exports['413x-notify']:Alert("error", playerName.. " is Alive..", "Can't use necromancy on players who are already alive!", 5000)
end)


AddEventHandler("CustomDeath:permission", function(source)
    exports['413x-notify']:Alert("denied", "Access Prohibited!", "You do-not have the required permissions to run this command, please try again if you think this is a mistake.", 7000)
end)