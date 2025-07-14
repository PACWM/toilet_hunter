# 🚽 Toilet Trouble: The Last Dash - Game Design Document

## 📝 Game Overview
**Title:** Toilet Trouble: The Last Dash  
**Description:** You've had too much coffee. The nearest restroom is only *60 seconds* away, but the path is full of banana peels, rolling shopping carts, and toddlers with water guns. Reach it before your bladder meter overflows!

---

## 🎮 Core Game Mechanics
- **Bladder Meter**: Fills over time. If full → Game Over.
- **Obstacles**: Colliding with banana peels, carts, or toddlers slows you down.
- **Timer**: 60 seconds to reach the restroom.
- **Movement**: Side-scroller or top-down runner.
- **Dash**: Temporary burst of speed with cooldown.

---

## 🛠️ Godot Systems & Nodes
| Feature            | Node Type / System |
|--------------------|---------------------|
| Player Movement    | `CharacterBody2D` or `KinematicBody2D` |
| Obstacles          | `StaticBody2D`, `RigidBody2D`, or `Area2D` with scripts |
| Bladder Meter      | `ProgressBar` controlled in `_process()` or via `Timer` |
| UI / HUD           | `CanvasLayer`, `Label`, `ProgressBar`, `TextureButton` |
| Timer              | `Timer` node for 60s countdown |
| Game Over Screen   | `Popup`, `Control`, or separate scene |

---

## 🎬 Scene Structure
- `Main.tscn`: World, camera, spawner, player, HUD.
- `Player.tscn`: Handles input, animation, dash.
- `HUD.tscn`: Displays bladder, time, messages.
- `Obstacle_*.tscn`: Banana, cart, toddler (independent scenes).
- `GameOver.tscn`: Retry/Quit interface.

---

## 🎨 Assets Needed
- Player sprites: walk, dash, panic animation
- Obstacle sprites: banana peel, shopping cart, toddler
- Background tileset
- Restroom / toilet goal sprite
- UI: progress bar, fonts, buttons
- SFX: slipping, peeing panic, toilet flush, dash whoosh

---

## 📜 Script To-Do List
- [ ] `Player.gd`: Movement + dash logic
- [ ] `Obstacle.gd`: Collision and slowdown logic
- [ ] `GameManager.gd`: Timer, bladder, win/lose state
- [ ] Spawner for obstacles
- [ ] Audio and animation triggers
- [ ] UI logic for timer and bladder bar

---

## ✅ MVP Checklist
- [x] Player moves left/right
- [x] Bladder meter increases over time
- [x] Timer counts down from 60
- [x] Obstacles slow player on contact
- [x] Toilet goal ends game successfully
- [x] Lose if bladder fills or time runs out

---

## ✨ Optional Polish Ideas
- Particle effects on slip and dash
- Funny voice lines ("I can't hold it!")
- Randomized level generation
- Power-ups: Coffee boosts, “Toddler Shield” umbrella

---

## LET'S GOOOO 🚽💨

> *Note: Place this markdown file in your Godot project folder (like `docs/toilet_trouble_gdd.md`) and open it in the script editor for an easy reference.*
