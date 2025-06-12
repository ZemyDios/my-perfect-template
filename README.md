# ZEN – Zemy’s Essential Nodework

**ZEN** is a modular scene architecture plugin for **Godot 4.4+**, built to streamline scene management in 2D and 3D projects(I plan to add many more features). It empowers developers with clean, extensible control over scene transitions, HUDs, overlays, and visual flow logic.

---

## 🚀 Key Features

### 🎭 Scene Handling
- 🧩 Built-in support for multiple scene types:
  - `main`, `hud`, `popup`, `overlay`
- 🧱 Clear separation of concerns:
  - `SceneManager`: handles logic and transitions
  - `SceneHandler`: handles node placement and disposal
- 🔐 Intelligent **scene disposal policy system** with automatic inference and customizable override:
  - `queue_free`, `hide`, `remove_child`, `persistent`

### 📦 SceneRegistry – Declarative Scene Catalog
- 🎯 Central registry for all scenes:
  - ID, path, type, transition, disposal policy, preload, context, flags
- 🔒 Prevents invalid paths or missing scenes
- 📖 One-liner usage: `SceneManager.change_to("level_1")`

### 🧠 Context & Declarative Flags
- 📥 **Context dictionary** for passing dynamic data between scenes (Need implementation)
- 🏷️ Built-in **scene behavior flags**, automatically interpreted by SceneManager:
  - `"pause": true` → pauses the game
  - `"hud": "level_ui"` → loads the specified HUD
  - Plan on adding more flags

### 🎨 Transitions System
- 🔄 Fully modular transition support via `TransitionRegistry` (Probably will move this to SceneRegistry)
- ✨ Predefined & custom transitions (fade, slide, etc.)
- 🧘 Integrated smoothly with the async scene flow

### 🧘 Developer UX
- ✅ No magic strings – constants provided via `SceneConstants`
- ⚙️ Easy to understand, you can learn basic usage with docs.
- 🧹 No need to manually call `queue_free()`
- 🔌 Easily extendable (audio manager, save system, etc.) (Future modules)

### 🔧 Clean Architecture
| Component            | Responsibility                         |
|----------------------|-----------------------------------------|
| `SceneManager`       | Flow control, context, transition logic |
| `SceneHandler`       | Node placement and management           |
| `SceneRegistry`      | Scene declarations and metadata         |
| `TransitionRegistry` | Visual transition storage and lookup    |

---

## 📎 Minimal Usage Example
```gdscript
# Register a new scene.
SceneRegistry.register_scene("main_menu", "res://scenes/ui/main_menu.tscn")

# Change to that scene.
SceneManager.change_to("main_menu")
```

```gdscript
# Register a new scene.
# This scene defines a transition to use and a hud that would be added when you change to the level scene.
SceneRegistry.register_scene(
  "level",
  "res://scenes/levels/level.tscn",
  {
    "transition": "fade",
    "flags": {"hud": "level_hud"},
  }
)
	

# Change to that scene.
# You change to the level with a transition and also add "level_hud" with just a line.
SceneManager.change_to("level")
```

Thanks to scene registration, that's **all you need**. HUDs, transitions, context – everything flows automatically.

---

## 🧪 Coming Soon
- Better flag system.
- Use previous scene metadata to enable more options.
- Unit tests and a real working demo scene.

---

## 🚀 Getting Started

1. Clone or download the repo.
2. Open in Godot 4.4+.
3. Enable the plugin in **Project > Project Settings > Plugins > ZEN**.
4. Press play and test the demo scenes.
5. Try replacing or adding new scenes in `SceneRegistry.gd`.

---

> 🧘 *ZEN doesn't just load scenes. ZEN understands them.*
