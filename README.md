# Admin Panel for SM64 CoopDX

A controller-friendly admin panel mod for **Super Mario 64 CoopDX**.
Open it with `/admin panel` or the shortcut `/ap`. No mouse needed.

Languages: English (default) and Turkish. You can switch in the panel under *Settings and logs*.

## Features

- Bring everyone to you, or a single player
- Teleport to a player
- Spectate any player's camera (Left/Right to switch player)
- Freeze / unfreeze one player or everyone
- Mute / unmute players
- Invisibility, godmode, speed/jump boost, heal, kill
- Kick, ban and unban (see the note below)
- Moderator system (the host can promote players)
- Warp everyone to a level
- On-screen announcements: `/admin announce <message>`
- Action log and ban list

## Controls

| Action  | Button                        |
|---------|-------------------------------|
| Move    | Analog stick or D-Pad         |
| Confirm | A (jump)                      |
| Back / close | B (attack)               |

Holding a button counts as a single press.

## Commands

| Command | Description |
|---------|-------------|
| `/admin panel` or `/ap` | Open the panel |
| `/admin announce <message>` | Show an announcement to everyone |

Only the host and moderators can use them. A hint appears in chat when you join.

## Installation

1. Download this repository (or the latest release).
2. Put the `admin-panel` folder into your CoopDX `mods` folder.
   - Windows: `%appdata%/sm64coopdx/mods`
3. Start the game and enable **Admin Panel** in the mod list when hosting.

## Notes

- Kick/ban depends on what the Lua API of your CoopDX version provides. If it is not available, the panel tells you to use the built-in `/kick <name>` chat command instead.
- Bans are stored by player name.

## Credits

Made by [Lykos]. Feel free to open an issue or pull request.

## License

[MIT](LICENSE)
