# ZEN – Zemy’s Essential Nodework

**ZEN** is a modular, professional-grade scene architecture plugin for **Godot 4.4+**, built to streamline scene management in 2D and 3D projects. It empowers developers with clean, extensible control over scene transitions, HUDs, overlays, and visual flow logic.

---

## 🚀 Key Features

### 🎭 Professional Scene Handling
- 🔁 Fully **asynchronous scene switching** with native `await` support.
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
- 📥 **Context dictionary** for passing dynamic data between scenes
- 🏷️ Built-in **scene behavior flags**, automatically interpreted by SceneManager:
  - `"pause": true` → pauses the game
  - `"hud": "level_ui"` → loads the specified HUD
- 🎯 Scenes can optionally implement `set_context()` to receive this data

### 🎨 Transitions System
- 🔄 Fully modular transition support via `TransitionRegistry`
- ✨ Predefined & custom transitions (fade, slide, etc.)
- 🧘 Integrated smoothly with the async scene flow

### 🧘 Developer UX
- ✅ No more magic strings – constants provided via `SceneConstants`
- ⚙️ Automatic main + HUD loading
- 🧹 No need to manually call `queue_free()`
- 🔌 Easily extendable (audio manager, save system, etc.)

### 🔧 Clean Architecture
| Component            | Responsibility                         |
|----------------------|-----------------------------------------|
| `SceneManager`       | Flow control, context, transition logic |
| `SceneHandler`       | Node placement and layer management     |
| `SceneRegistry`      | Scene declarations and metadata         |
| `TransitionRegistry` | Visual transition storage and lookup    |

---

## 💡 Ideal For
- 2D and 3D games
- Scalable long-term projects
- Professional templates and tools
- Teams working with scene separation

---

## 📎 Minimal Usage Example
```gdscript
await SceneManager.change_to("main_menu")
```

Thanks to scene registration, that's **all you need**. HUDs, transitions, context – everything flows automatically.

---

## 🧪 Coming Soon
- Visual editor for drag-and-drop scene registration
- Debug overlay and live scene flow debugger
- Unit tests and a real working demo scene

---

> 🧘 *ZEN doesn't just load scenes. ZEN understands them.*
