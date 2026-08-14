-- Set player sounds (death, can't place, game win, etc)
local utility_sounds = data.raw["utility-sounds"]["default"]
if utility_sounds then
    utility_sounds.game_lost = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/game-lost/ack.ogg",                           volume = 0.8 },
            { filename = "__zweihander-soundpack__/sound/game-lost/cat-laugh-meme.ogg",                volume = 0.2 },
            { filename = "__zweihander-soundpack__/sound/game-lost/flashbang-gah-dayum.ogg",           volume = 1 },
            { filename = "__zweihander-soundpack__/sound/game-lost/they-ask-you-how-you-are-meme.ogg", volume = 1 },
            --{ filename = "__zweihander-soundpack__/sound/game-lost/angry-indian-scammer.ogg",       volume = 1 },
            { filename = "__zweihander-soundpack__/sound/game-lost/blyyaaaaaaaaaaaat.ogg",             volume = 0.7 },
            { filename = "__zweihander-soundpack__/sound/game-lost/keemstar-screaming.ogg",            volume = 0.4 },
            { filename = "__zweihander-soundpack__/sound/game-lost/sisyphus.ogg",                      volume = 1 },
            { filename = "__zweihander-soundpack__/sound/game-lost/bomboclat.ogg",                     volume = 1 },
            { filename = "__zweihander-soundpack__/sound/game-lost/emotional-damage.ogg",              volume = 1 },
            { filename = "__zweihander-soundpack__/sound/game-lost/sad-hamster.ogg",                   volume = 0.6 },
            { filename = "__zweihander-soundpack__/sound/game-lost/oh-hell-naw.ogg",                   volume = 1 },
            { filename = "__zweihander-soundpack__/sound/game-lost/spongebob-sound.ogg",               volume = 1 },
            { filename = "__zweihander-soundpack__/sound/game-lost/oh-no.ogg",                         volume = 1 },
        }
    }
    utility_sounds.game_won = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/game-won/i-just-hit-the-jackpot.ogg", volume = 0.5 },
        }
    }
    utility_sounds.cannot_build = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/cannot-build/incorrect.ogg", volume = 0.6 },
        }
    }
    --TODO: Add alert_destroyed sound
    --[[
    utility_sounds.alert_destroyed = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/cannot-build/extremely-loud-incorrect-buzzer.ogg", volume = 1 },

        }
    }
    ]]
    utility_sounds.new_objective = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/new-game/in-the-beginning.ogg", volume = 1 },
        }
    }
    utility_sounds.research_completed = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/research-completed/rizz.ogg", volume = 1 }
        }
    }
end

-- logistic bot sounds
local log_bot_sounds = data.raw["logistic-robot"]["logistic-robot"]
if log_bot_sounds then
    log_bot_sounds.working_sound = {
        variations = {
            --{ filename = "__zweihander-soundpack__/sound/bots/logistic-robots/blach.ogg", volume = 0.5 },
            { filename = "__zweihander-soundpack__/sound/bots/logistic-robots/eaah.ogg",  volume = 0.5 },
            { filename = "__zweihander-soundpack__/sound/bots/logistic-robots/ech.ogg",   volume = 0.5 },
            { filename = "__zweihander-soundpack__/sound/bots/logistic-robots/eyech.ogg", volume = 0.5 }
        }
    }
end

-- construction bot sounds
local con_bot_sounds = data.raw["construction-robot"]["construction-robot"]
if con_bot_sounds then
    con_bot_sounds.working_sound = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/bots/construction-robots/weeeeeeeeeeeeeeeeeee.ogg", volume = 0.5 }
        }
    }
end

-- custom sound prototype needed for sounds that require a script hook to fire
-- e.g new game started

data:extend({
    {
        type = "sound",
        name = "zweihander-new-game-sound",
        variations = {
            { filename = "__zweihander-soundpack__/sound/new-game/in-the-beginning.ogg", volume = 1 },
            { filename = "__zweihander-soundpack__/sound/new-game/home-depot.ogg",       volume = 1 },
        }
    }
})
