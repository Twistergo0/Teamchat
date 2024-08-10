-- Registriere einen neuen Befehl namens "teamchat"
RegisterCommand("teamchat", function(source, args, rawCommand)
    -- Kombiniere alle Argumente zu einer einzigen Nachricht
    local msg = table.concat(args, " ")
    -- Zeige die Nachricht im Chat an (Test 1)
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {"Team", msg}
    })
end, false)

-- Registriere einen neuen Befehl namens "teamchat"
RegisterCommand("teamchat", function(source, args, rawCommand)
    -- Kombiniere alle Argumente zu einer einzigen Nachricht
    local msg = table.concat(args, " ")
    -- Sende ein Event an den Server, um die Nachricht zu verarbeiten (Test 2)
    TriggerServerEvent("sendTeamMessage", msg)
end, false)

-- Event um die Nachricht im Chat anzuzeigen
RegisterNetEvent("displayTeamMessage")
AddEventHandler("displayTeamMessage", function(msg)
    -- Füge eine Nachricht zum Chat hinzu
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {"Team", msg}
    })
end)