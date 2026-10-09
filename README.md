```markdown
<div align="center">

# 🪟 My-hyprland

**Персональная конфигурация Hyprland с Waybar, шейдерами и Lua-конфигом**

[![Artix Linux](https://img.shields.io/badge/Artix_Linux-runit-10b981?style=for-the-badge&logo=artixlinux&logoColor=white)](https://artixlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-58e1ff?style=for-the-badge&logo=wayland&logoColor=white)](https://hyprland.org/)
[![Waybar](https://img.shields.io/badge/Waybar-Status_Bar-00b4ab?style=for-the-badge)](https://github.com/Alexays/Waybar)
[![License](https://img.shields.io/badge/License-As_Is-ff6b6b?style=for-the-badge)](#-лицензия)

<img src="https://raw.githubusercontent.com/TeZFuN/My-hyprland/main/preview.png" alt="preview" width="800"/>

</div>

---

## 📖 О проекте

Данная конфигурация создана и протестирована под **Artix Linux** с инициализацией **runit**. 
Все сервисы (PipeWire, WirePlumber, D-Bus) запускаются через `runit` либо вручную через скрипт автозапуска, 
встроенный в `hyprland.lua`.

> ⚠️ **Важно:** на systemd-дистрибутивах (Arch, EndeavourOS, CachyOS и т.д.) скрипт `start_audio.sh` 
> может конфликтовать с уже запущенными системными юнитами. Отключите соответствующие unit'ы или 
> закомментируйте автозапуск в `hyprland.lua`.

---

## ✨ Особенности

<table>
<tr>
<td width="50%">

### 🎨 Оформление
- Градиентные границы окон
- Размытие и прозрачность
- Плавные анимации
- Скруглённые углы

</td>
<td width="50%">

### ⚙️ Функционал
- Управление яркостью через DDC/CI
- Жесты тремя пальцами
- Раскладки `us` / `ru` (Alt+Shift)
- Медиаплеер в Waybar

</td>
</tr>
</table>

---

## 📦 Требования

### 🧩 Основные компоненты

<table>
<thead>
<tr>
<th align="left">Компонент</th>
<th align="left">Назначение</th>
<th align="center">Обязателен</th>
</tr>
</thead>
<tbody>
<tr><td><code>hyprland</code></td><td>Wayland-композитор</td><td align="center">✅</td></tr>
<tr><td><code>waybar</code></td><td>Статус-бар</td><td align="center">✅</td></tr>
<tr><td><code>kitty</code></td><td>Терминал по умолчанию</td><td align="center">✅</td></tr>
<tr><td><code>wofi</code></td><td>Лаунчер приложений</td><td align="center">✅</td></tr>
<tr><td><code>hyprshade</code></td><td>Управление шейдерами (vibrance)</td><td align="center">✅</td></tr>
<tr><td><code>awww</code></td><td>Демон обоев для Wayland</td><td align="center">✅</td></tr>
<tr><td><code>pipewire</code></td><td>Звуковой сервер</td><td align="center">✅</td></tr>
<tr><td><code>pipewire-pulse</code></td><td>PulseAudio-совместимость</td><td align="center">✅</td></tr>
<tr><td><code>wireplumber</code></td><td>Менеджер сессий PipeWire</td><td align="center">✅</td></tr>
<tr><td><code>dbus</code> / <code>dbus-runit</code></td><td>Шина сообщений</td><td align="center">✅</td></tr>
<tr><td><code>qt6ct</code></td><td>Тема для Qt6-приложений</td><td align="center">🟡</td></tr>
</tbody>
</table>

### 🔌 Плагины

| Плагин | Описание |
|---|---|
| **Hyprlua** | Позволяет писать конфиг Hyprland на **Lua**. Данная сборка использует `hyprland.lua` вместо стандартного `hyprland.conf`. |

### 🔤 Шрифты

- **Geist Mono Nerd Font** — критично для корректного отображения иконок Waybar.

<details>
<summary>📥 Установка шрифта (развернуть)</summary>

```bash
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/GeistMono.zip -o GeistMono.zip
mkdir -p ~/.local/share/fonts
unzip GeistMono.zip -d ~/.local/share/fonts/GeistMono
fc-cache -fv
```
</details>

### 🎭 Темы

- 🎨 [`cybr-hyprland`](https://github.com/cacarico) — оформление Hyprland
- 🎨 `cybr-waybar` — оформление статус-бара

---

## 🚀 Установка

### Шаг 1 — Клонирование

```bash
git clone https://github.com/TeZFuN/My-hyprland.git
cd My-hyprland
```

### Шаг 2 — Установка зависимостей

<details>
<summary><b>🐧 Artix Linux (рекомендуется)</b></summary>

```bash
sudo pacman -S --needed \
  hyprland waybar kitty wofi hyprshade awww \
  pipewire pipewire-pulse wireplumber dbus-runit qt6ct
```
</details>

<details>
<summary><b>🏹 Arch Linux</b></summary>

```bash
sudo pacman -S --needed \
  hyprland waybar kitty wofi hyprshade awww \
  pipewire pipewire-pulse wireplumber dbus qt6ct
```

> `awww` может отсутствовать в репозиториях — установите из AUR.
</details>

### Шаг 3 — Установка Hyprlua

Соберите и установите плагин по инструкции из репозитория [Hyprlua](https://github.com/cacarico/Hyprlua).

### Шаг 4 — Копирование конфигов

```bash
# Hyprland
cp -r hypr ~/.config/

# Waybar
cp -r waybar ~/.config/
```

### Шаг 5 — Права на скрипты

```bash
chmod +x ~/.config/waybar/scripts/*
chmod +x ~/.config/hypr/scripts/start_audio.sh
```

### Шаг 6 — Настройка мониторов

Откройте `~/.config/waybar/config.jsonc` и раскомментируйте нужный блок:

- `BAR 1` — один монитор
- `BAR 2` — несколько мониторов

---

## 🖥️ Обзор конфигурации

### 🌊 Hyprland (`hypr/hyprland.lua`)

| Параметр | Значение |
|---|---|
| Мониторы | Автоопределение, scale `1.2` |
| Терминал | `kitty` |
| Лаунчер | `wofi` |
| Раскладки | `us`, `ru` (переключение `Alt+Shift`) |
| Жесты | Свайп 3 пальцами → смена воркспейса |
| Автозапуск | `start_audio.sh`, Waybar, Hyprshade, D-Bus, awww |

### 📊 Waybar

- 🎚️ Модуль управления яркостью через **DDC/CI** (прокрутка колесом)
- 📁 Два профиля конфигурации (1 / N мониторов)
- 🐍 Скрипты: `bright.sh`, `bright-status.sh`, `mediaplayer.py`

---

## 🛠️ Устранение неполадок

<details>
<summary><b>Waybar не отображается / нет иконок</b></summary>

Проверьте, что шрифт **Geist Mono Nerd Font** установлен:
```bash
fc-list | grep -i "GeistMono"
```
</details>

<details>
<summary><b>Нет звука после запуска сессии</b></summary>

Убедитесь, что `start_audio.sh` исполняем и сервисы PipeWire не запущены через runit:
```bash
sv status pipewire wireplumber
```
</details>

<details>
<summary><b>Не работают обои (awww)</b></summary>

Проверьте, что `awww` запущен и Hyprland использует `wlr-layer-shell`:
```bash
pgrep -a awww
```
</details>

<details>
<summary><b>Ошибка Hyprlua при старте</b></summary>

Убедитесь, что плагин собран под **актуальную версию Hyprland** — API плагинов часто меняется.
</details>

---

## 📝 Заметки

> - ✅ Конфигурация ориентирована на **Artix Linux + runit**
> - ⚠️ На systemd-системах возможны конфликты сервисов
> - 🎮 Требуются рабочие драйверы Mesa / Vulkan
> - 🖼️ `awww` требует композитора с поддержкой `wlr-layer-shell`

---

## 📄 Лицензия

<div align="center">

Конфигурация предоставляется **как есть**, без каких-либо гарантий.

</div>

---

<div align="center">
<sub>Сделано с ❤️ для Artix Linux + Hyprland</sub>
</div>
```
