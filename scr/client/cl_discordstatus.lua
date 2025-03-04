Citizen.CreateThread(function()
    while true do
        local appId = Config.AppID
        local smallPicture = Config.SmallPicture.pictureName
        local bigPicture = Config.BigPicture.pictureName
        local playerId = GetPlayerServerId(PlayerId())
        local playerCount = #GetActivePlayers()
        
        SetDiscordAppId(appId)
        SetDiscordRichPresenceAssetSmall(smallPicture)
        SetDiscordRichPresenceAssetSmallText(Config.SmallPicture.pictureText)
        SetDiscordRichPresenceAsset(bigPicture)
        SetDiscordRichPresenceAssetText(Config.BigPicture.pictureText)
        
        if Config.ServerId.enabled then
            SetRichPresence(Config.ServerId.serverIdText .. playerId .. Config.PlayerLabel .. playerCount)
        else
            SetRichPresence(Config.PlayerLabel .. playerCount)
        end
        
        if Config.Buttons.list and #Config.Buttons.list > 0 then
            for index, button in ipairs(Config.Buttons.list) do
                SetDiscordRichPresenceAction(index - 1, button.text, button.url)
            end
        end
        
        Citizen.Wait(10000)
    end
end)
