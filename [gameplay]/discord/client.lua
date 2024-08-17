Citizen.CreateThread(function()
    while true do
        local playerName  = GetPlayerName(PlayerId())
        local playerId = GetPlayerServerId(PlayerId())
        
        local appId = 1271818522539982939
        local smallPic = 'small'
        local bigPic = 'big'
        
        local playerCount = #GetActivePlayers()  -- Menghitung jumlah pemain aktif
        local maxPlayers = 15  -- Jumlah slot maksimal server
        
        SetDiscordAppId(appId)
        
        -- Menampilkan nama pengguna dan ID server di baris pertama, dan jumlah pemain di baris kedua
        SetRichPresence("Username: " .. playerName .. " | Server Id: " .. playerId .. "\nPlayers: " .. playerCount .. "/" .. maxPlayers)
        
        SetDiscordRichPresenceAsset(bigPic)
        SetDiscordRichPresenceAssetText('Big Text')
        
        SetDiscordRichPresenceAssetSmall(smallPic)
        SetDiscordRichPresenceAssetSmallText('Small Text')
        
        -- Set up tombol untuk bergabung ke Discord
        SetDiscordRichPresenceAction(0, "Join Discord", "https://discord.gg/EZaNFDdb58")
        
        Citizen.Wait(1000)
    end
end)
