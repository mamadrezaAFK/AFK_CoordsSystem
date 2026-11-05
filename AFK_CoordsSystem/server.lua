
-- (server.cfg: add_ace group.admin afkcoords.use allow)
local RESTRICTED = false

RegisterCommand('AFKCoords', function(src)
    if src == 0 then return end
    if RESTRICTED and not IsPlayerAceAllowed(src, 'afkcoords.use') then return end
    TriggerClientEvent('afkcoords:toggle', src)
end, false)
