🎮 Fivem-Standalone-nWeatherSync 🎮

nWeatherSync is a standalone FiveM resource that synchronizes the in-game GTA V weather with real-world weather conditions.

The resource periodically requests weather data from a compatible weather API and automatically applies the corresponding GTA weather type to all connected players.

## Features

* 🌍 Real-world weather synchronization
* ⛅ Automatic GTA weather mapping
* 🔄 Configurable update interval
* 🌐 Multi-language support (German and English)
* 🎮 Automatic synchronization for joining players
* ⚙️ Lightweight and framework-independent
* 📦 Standalone resource with no ESX or QBCore dependency

## Configuration

Configure the city, language and API endpoint directly in `config.lua`.

Example:

```lua
Config.City = "Los Angeles"
Config.Language = "en"
Config.ApiUrl = "http://127.0.0.1:3005/weather"
Config.UpdateInterval = 1800000
```

## Supported Weather Types

| API Weather Type | GTA Weather |
| ---------------- | ----------- |
| clear            | EXTRASUNNY  |
| clouds           | CLOUDS      |
| rain             | RAIN        |
| drizzle          | RAIN        |
| thunderstorm     | THUNDER     |
| snow             | XMAS        |
| mist             | FOGGY       |
| fog              | FOGGY       |

## Installation

1. Download or clone this repository.
2. Place the `nWeatherSync` folder inside your FiveM `resources` directory.
3. Configure the resource in `config.lua`.
4. Add the following line to your `server.cfg`:

```
ensure nWeatherSync
```

5. Make sure your weather API is running and reachable by the FiveM server.

## Requirements

* FiveM Server
* A compatible weather API endpoint returning JSON data

Example API response:

```json
{
    "city": "Los Angeles",
    "temperature": 27,
    "weatherType": "clear",
    "weather": "Sunny"
}
```

## Misc

Youtube Video: https://www.youtube.com/watch?v=wOOz96TZfL8

Support: https://discord.nemesus.de

Homepage: https://nemesus.de

☕ Want to support us? https://ko-fi.com/nemesustv ☕
