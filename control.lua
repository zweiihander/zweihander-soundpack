local function play_intro_sound(event)
    -- check if sound has already been played and if not play it
    if storage.zweihander_intro_played then return end
    storage.zweihander_intro_played = true;

    local player = game.get_player(event.player_index)
    if player then
        player.play_sound { path = "zweihander-new-game-sound" }
    end
end

local function on_player_created(event)
    -- check if the player is in freeplay and if they've disabled the crashsite cutscene to play game start sound correctly
    local in_freeplay = remote.interfaces["freeplay"] and not remote.call("freeplay", "get_disable_crashsite")
    if not in_freeplay then
        play_intro_sound(event)
    end
end

-- The game start sound will probably be triggered by one of these events... Probably
script.on_event(defines.events.on_player_created, on_player_created)
script.on_event(defines.events.on_cutscene_waypoint_reached, play_intro_sound)
script.on_event(defines.events.on_cutscene_cancelled, play_intro_sound)
