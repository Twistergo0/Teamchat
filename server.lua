-- Hol dir das ESX Objekt
ESX = exports["es_extended"]:getSharedObject()

-- Event um die Teamnachricht zu verarbeiten
RegisterNetEvent("sendTeamMessage")
AddEventHandler("sendTeamMessage", function(msg)
    -- Nur für Testzwecke (Test 2)
    print("Nachricht vom Client erhalten: " .. msg)
end)

-- Hol dir das ESX Objekt
ESX = exports["es_extended"]:getSharedObject()

-- Event um die Teamnachricht zu verarbeiten
RegisterNetEvent("sendTeamMessage")
AddEventHandler("sendTeamMessage", function(msg)
    local xPlayer = ESX.GetPlayerFromId(source)
    -- Überprüfe, ob der Spieler zur Admin-Gruppe gehört
    if xPlayer and xPlayer.getGroup() == 'admin' then
        -- Sende die Nachricht an alle Admin-Spieler
        for _, playerId in ipairs(GetPlayers()) do
            local targetPlayer = ESX.GetPlayerFromId(playerId)
            if targetPlayer and targetPlayer.getGroup() == 'admin' then
                local name = GetPlayerName(source)
                TriggerClientEvent("displayTeamMessage", targetPlayer.source, name .. ": " .. msg)
            end
        end
    else
        -- Sende eine Fehlermeldung an den Spieler, wenn er kein Admin ist
        TriggerClientEvent("chat:addMessage", source, { args = {"System", "Du bist nicht im Team!"} })
    end
end)

