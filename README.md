<div align="center">

  <h1>📍 AFK Coords System</h1>
  <p><strong>Minimal Black &amp; White Coordinates Tool for FiveM — Live Coords, 4-Format Copy &amp; Smart Teleport</strong></p>

  [![Website](https://img.shields.io/badge/Official_Website-mamadrezaafk.top-blue?style=for-the-badge&logo=googlechrome&logoColor=white)](https://mamadrezaafk.top)
  [![Discord](https://img.shields.io/badge/Discord-Join_Community-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/GY5mSJFg77)
  [![FiveM](https://img.shields.io/badge/Platform-FiveM-F40552.svg?style=for-the-badge)](https://fivem.net/)
  [![Lua](https://img.shields.io/badge/Lua-5.4-2C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
  [![UI](https://img.shields.io/badge/UI-NUI%20%2F%20Vanilla%20JS-black.svg?style=for-the-badge)]()
  [![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

  <p align="center">
    A lightweight, standalone <strong>developer utility</strong> that opens a clean monochrome menu with one command, shows your position in real time, copies it in the format you need, and teleports you to any pasted coordinates — commas or no commas.
  </p>

</div>

---

## ⚡ Overview

Anyone who builds FiveM resources knows the loop: stand somewhere, grab coordinates, reformat them for `vec3`, `vec4`, a table or JSON, paste them into a config, then teleport back to test. **AFK Coords System** turns that loop into a single menu.

No framework dependency, no database, no exports to wire up. Type `/AFKCoords`, click a row to copy, paste anything into the teleport box and go.

---

## ✨ Features

- **🎯 Live Coordinates:** `x`, `y`, `z` and `heading` update in real time while the menu is open.
- **📋 One-Click Copy in 4 Formats:**

  | Format | Output |
  |---|---|
  | `vec3` | `vec3(x, y, z)` |
  | `vec4` | `vec4(x, y, z, h)` |
  | Lua table | `{ x = 0.00, y = 0.00, z = 0.00, h = 0.00 }` |
  | JSON | `{"x": 0.00, "y": 0.00, "z": 0.00, "h": 0.00}` |

- **🧭 Smart Teleport Input:** Paste coordinates in almost any shape and the parser figures it out. Commas are optional.
  ```text
  -1037.2, -2737.5, 20.1
  -1037.2 -2737.5 20.1 90
  vec3(-1037.2, -2737.5, 20.1)
  vec4(-1037.2, -2737.5, 20.1, 90.0)
  { x = -1037.2, y = -2737.5, z = 20.1, h = 90.0 }
  {"x": -1037.2, "y": -2737.5, "z": 20.1, "h": 90.0}
  ```
  Persian and Arabic digits are normalized automatically.
- **🚗 Vehicle-Aware Teleport:** If you are driving, the vehicle goes with you.
- **🛬 Safe Landing:** Screen fade plus collision streaming at the destination, so you do not fall through the map.
- **✅ Live Validation:** The menu previews the parsed values and disables the button until at least `x`, `y`, `z` are found.
- **🔒 Optional Permission Lock:** Restrict the command to players with an ACE permission.
- **🪶 Zero Idle Cost:** The update loop only runs while the menu is open.
- **🌐 100% Standalone:** No ESX, QBCore or any other framework required.

---

## 📦 Installation

1. Download or clone this repository into your server's `resources` folder:
   ```bash
   cd resources
   git clone https://github.com/mamadrezaAFK/AFK_CoordsSystem.git AFK_Coords
   ```
2. Add it to your `server.cfg`:
   ```cfg
   ensure AFK_Coords
   ```
3. Restart the server (or run `refresh` and `ensure AFK_Coords`).

> The folder name is the resource name. If you keep the folder as `AFK_CoordsSystem`, use `ensure AFK_CoordsSystem` instead.

---

## 🎮 Usage

| Action | How |
|---|---|
| Open / close the menu | `/AFKCoords` |
| Close | `Esc` or the × button |
| Copy position | Click any format row |
| Teleport | Paste coordinates, press `Enter` or click **Teleport** |

---

## 🔐 Permissions

By default anyone can open the menu. To limit it to staff, open `server.lua` and set:

```lua
local RESTRICTED = true
```

Then grant access in `server.cfg`:

```cfg
add_ace group.admin afkcoords.use allow
```

---

## 📁 Project Structure

```text
AFK_Coords/
├── fxmanifest.lua
├── client.lua        # live coords loop, NUI callbacks, teleport logic
├── server.lua        # /AFKCoords command + optional ACE check
└── html/
    └── index.html    # black & white NUI (HTML, CSS and JS in one file)
```

---

## ⚠️ Notes

- **Anti-cheat and teleport detection:** Teleporting moves your entity instantly. If your server runs an anti-cheat or a custom distance check, whitelist the teleport or disable the check for authorized staff. Otherwise you may be flagged or kicked.
- **Interiors (MLO):** Teleporting inside an interior that is not streamed in yet can drop you under the map. Teleport near the entrance first, or verify the `z` value.
- **Staff only on live servers:** A free-teleport tool is a development and administration utility. Enable `RESTRICTED` on production.

---

## 🤝 Community &amp; Support

- 🌐 Website: [mamadrezaafk.top](https://mamadrezaafk.top)
- 💬 Discord: [discord.gg/GY5mSJFg77](https://discord.gg/GY5mSJFg77)
- 🐙 GitHub: [@mamadrezaAFK](https://github.com/mamadrezaAFK)

Issues and pull requests are welcome.

---

## 📄 License

Released under the [MIT License](LICENSE).

<div align="center">
  <sub>Built by <strong>AFK Development</strong></sub>
</div>
