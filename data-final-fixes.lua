local utility_sounds = data.raw["utility-sounds"]["default"]
if utility_sounds then
    utility_sounds.game_lost = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/death/ack.ogg",                           volume = 0.8 },
            { filename = "__zweihander-soundpack__/sound/death/cat-laugh-meme.ogg",                volume = 0.2 },
            { filename = "__zweihander-soundpack__/sound/death/flashbang-gah-dayum.ogg",           volume = 1 },
            { filename = "__zweihander-soundpack__/sound/death/they-ask-you-how-you-are-meme.ogg", volume = 1 },
            --{ filename = "__zweihander-soundpack__/sound/death/angry-indian-scammer.ogg",       volume = 1 },
            { filename = "__zweihander-soundpack__/sound/death/blyyaaaaaaaaaaaat.ogg",             volume = 0.7 },
            { filename = "__zweihander-soundpack__/sound/death/keemstar-screaming.ogg",            volume = 0.4 },
            { filename = "__zweihander-soundpack__/sound/death/sisyphus.ogg",                      volume = 1 },
            { filename = "__zweihander-soundpack__/sound/death/bomboclat.ogg",                     volume = 1 },
            { filename = "__zweihander-soundpack__/sound/death/emotional-damage.ogg",              volume = 1 },
            { filename = "__zweihander-soundpack__/sound/death/sad-hamster.ogg",                   volume = 0.6 },
            { filename = "__zweihander-soundpack__/sound/death/oh-hell-naw.ogg",                   volume = 1 },
            { filename = "__zweihander-soundpack__/sound/death/spongebob-sound.ogg",               volume = 1 }
        }
    }
    utility_sounds.game_won = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/game-win/i-just-hit-the-jackpot.ogg", volume = 0.5 },
        }
    }
    utility_sounds.cannot_build = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/error/incorrect.ogg", volume = 0.6 },
        }
    }
    --[[
    utility_sounds.alert_destroyed = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/error/extremely-loud-incorrect-buzzer.ogg", volume = 1 },

        }
    }
    ]]
    utility_sounds.new_objective = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/new-objective/in-the-beginning.ogg", volume = 1 },
        }
    }
    utility_sounds.research_completed = {
        variations = {
            { filename = "__zweihander-soundpack__/sound/research-complete/rizz.ogg", volume = 1 }
        }
    }
end

-- biter attack/roar sounds
for _, biter_name in pairs({ "small-biter", "medium-biter", "big-biter", "behemoth-biter" }) do
    local biter = data.raw["unit"][biter_name]
    if biter and biter.attack_parameters then
        biter.attack_parameters.sound = {
            filename = "__zweihander-soundpack__/sound/biters/attack/weeeeeeeeeeeeeeeeeee.ogg",
            volume = 1
        }
    end
end

-- custom sound prototype needed for sounds that require a script hook to fire
-- e.g new game started

data:extend({
    {
        type = "sound",
        name = "zweihander-new-game-sound",
        variations = {
            { filename = "__zweihander-soundpack__/sound/new-objective/in-the-beginning.ogg", volume = 1 },
            { filename = "__zweihander-soundpack__/sound/new-objective/home-depot.ogg",        volume = 1 },
        }
    }
})
