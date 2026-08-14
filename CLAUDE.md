# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A Factorio 2.0 mod ("Zweihander Soundpack") that replaces vanilla sound effects — mostly death/win/lose sounds, bot working sounds, and a custom new-game jingle — with meme/joke audio clips. It's currently incomplete (per `readme.md`, mostly death sounds so far).

This is a data-only mod plus one tiny runtime script — there is no build system, package manager, linter, or test suite. "Testing" means loading the mod in Factorio and triggering the relevant event in-game. The only tooling present is `.luarc.json`, a Lua language server config that declares Factorio's engine globals (`data`, `script`, `game`, `defines`, `storage`, `remote`, `rendering`, etc.) so the Lua LSP doesn't flag them as undefined.

## Architecture

- **`info.json`** — mod metadata (name, version, `factorio_version`, dependencies on `base`/`space-age`). Bump `version` here when publishing.
- **`data-final-fixes.lua`** — the core of the mod. Runs in Factorio's data stage after all other mods have loaded, so it can safely overwrite prototypes:
  - Overrides fields on `data.raw["utility-sounds"]["default"]`: `game_lost`, `game_won`, `cannot_build`, `new_objective`, `research_completed`. Each is a `variations` array of `{ filename, volume }` entries — multiple variations per event is the norm, and Factorio picks one at random each time the event fires.
  - Overrides `working_sound` on `data.raw["logistic-robot"]["logistic-robot"]` and `data.raw["construction-robot"]["construction-robot"]`.
  - Defines a custom `sound`-type prototype, `zweihander-new-game-sound`, for sounds that must be triggered manually from `control.lua` rather than fired automatically by the engine.
  - Every `data.raw[...]` lookup is guarded with `if X then ... end` since the target prototype may not exist depending on the active mod/dependency set.
- **`control.lua`** — the only runtime script. Currently just fires `zweihander-new-game-sound` once per game via `player.play_sound`, hooked off `on_player_created` plus the crashsite-cutscene events (`on_cutscene_waypoint_reached`, `on_cutscene_cancelled`), with freeplay detection (checks `remote.call("freeplay", "get_disable_crashsite")`) and a `storage.zweihander_intro_played` guard so it never double-fires.
- **`rawsounds/`** — unprocessed source audio exactly as sourced (mixed mp3/ogg, arbitrary casing/spacing in filenames). Never referenced directly from Lua — treat as raw material only.
- **`sound/<category>/*.ogg`** — final, processed audio actually referenced by `data-final-fixes.lua`, organized into subfolders matching the utility-sound/category name it replaces (`game-lost/`, `game-won/`, `cannot-build/`, `new-game/`, `research-completed/`, `bots/`). All filenames use kebab-case.
- **`vanilla-sound-reference.txt`** — a hand-maintained cheat sheet of vanilla Factorio `data.raw` sound field paths (bot sounds, biter/spitter/worm sounds, player/character sounds, utility-sounds) with the corresponding `__base__`/`__core__` file paths. Check here first when adding a new sound replacement, before digging through Factorio's own source.

## Adding a new sound replacement

1. Drop the source clip into `rawsounds/`.
2. Convert/export it to `.ogg`, kebab-case the filename, and place it in the `sound/<category>/` folder matching the event it replaces (create a new category folder if it's a new kind of event).
3. Look up the target prototype/field in `vanilla-sound-reference.txt` (or Factorio's data.raw if not listed there).
4. Add a `{ filename = "__zweihander-soundpack__/sound/<category>/<name>.ogg", volume = <n> }` entry to the relevant `variations` array in `data-final-fixes.lua` — guard the parent `data.raw[...]` lookup with `if ... then ... end` if it's a new prototype family. Hand-tune `volume` (louder source clips generally get a lower volume value to balance against the rest).
5. If the sound needs to fire on a script event rather than an engine-triggered event, add a custom `sound` prototype in `data-final-fixes.lua` and wire it up from `control.lua` (following the `zweihander-new-game-sound` pattern).

A commented-out `variations` entry (e.g. `angry-indian-scammer.ogg` in `game_lost`) means that clip was tried and intentionally disabled — leave it commented unless asked to change it.
