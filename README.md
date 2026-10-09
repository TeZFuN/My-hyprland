```markdown
# My-hyprland

Персональная конфигурация Hyprland с настройками Waybar, шейдерами и скриптами автозапуска.

## 📋 Требования

Для корректной работы данной конфигурации необходимы следующие компоненты:

### Основные зависимости

| Пакет | Назначение |
|---|---|
| `hyprland` | Тайловый композитор Wayland |
| `waybar` | Статус-бар |
| `kitty` | Терминальный эмулятор (по умолчанию) |
| `wofi` | Лаунчер приложений (меню) |
| `hyprshade` | Управление шейдерами (vibrance и др.) |
| `awww` | Демон обоев для Wayland |
| `pipewire` | Звуковой сервер |
| `pipewire-pulse` | PulseAudio-совместимый слой для PipeWire |
| `wireplumber` | Менеджер сессий PipeWire |
| `dbus` | Шина сообщений (для PipeWire) |

### Плагины и утилиты

- **Hyprlua** — плагин, позволяющий конфигурировать Hyprland через Lua. Данная конфигурация использует `hyprland.lua` вместо стандартного `hyprland.conf`.

### Шрифты

- **Geist Mono Nerd Font** — обязательный шрифт для корректного отображения иконок в Waybar.

Установка шрифта:
```bash
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/GeistMono.zip -o GeistMono.zip
mkdir -p ~/.local/share/fonts
unzip GeistMono.zip -d ~/.local/share/fonts/GeistMono
fc-cache -fv
```

### Темы оформления

- **cybr-hyprland** — тема для Hyprland.
- **cybr-waybar** — конфигурация Waybar на основе темы cybr.

### Переменные окружения

- `QT_QPA_PLATFORMTHEME=qt6ct` — для корректной работы Qt-приложений.

## 🚀 Установка

### 1. Клонирование репозитория

```bash
git clone https://github.com/TeZFuN/My-hyprland.git
cd My-hyprland
```

### 2. Установка зависимостей (Arch Linux)

```bash
sudo pacman -S --needed hyprland waybar kitty wofi hyprshade awww \
  pipewire pipewire-pulse wireplumber dbus qt6ct
```

> **Примечание:** `awww` может отсутствовать в официальных репозиториях. Проверьте AUR или альтернативные источники.

### 3. Установка плагина Hyprlua

Следуйте инструкциям из репозитория [Hyprlua](https://github.com/cacarico/Hyprlua) для сборки и установки плагина.

### 4. Копирование конфигураций

```bash
# Hyprland
cp -r hypr ~/.config/

# Waybar
cp -r waybar ~/.config/
```

### 5. Настройка Waybar

Убедитесь, что все скрипты исполняемы:
```bash
chmod +x ~/.config/waybar/scripts/*
```

Проверьте конфигурацию мониторов в `~/.config/waybar/config.jsonc` и раскомментируйте нужный блок (`BAR 2` для мультимониторных систем).

### 6. Автозапуск

Скрипт `start_audio.sh` автоматически запускает PipeWire, pipewire-pulse и wireplumber при старте сессии. Он уже прописан в `hyprland.lua`.

## 🖥️ Обзор конфигурации

### Hyprland (`hypr/hyprland.lua`)

- **Мониторы:** автоматическое определение с масштабом 1.2.
- **Терминал:** kitty.
- **Меню:** wofi.
- **Автозапуск:** скрипт звука, Waybar, Hyprshade (vibrance), dbus, awww с установкой обоев.
- **Раскладка:** us, ru с переключением по Alt+Shift.
- **Жесты:** свайп тремя пальцами для переключения рабочих столов.
- **Оформление:** градиентные границы, размытие, прозрачность, анимации.

### Waybar (`waybar/`)

- Специальный модуль управления яркостью мониторов через прокрутку (DDC/CI).
- Два профиля для одного и нескольких мониторов.
- Скрипты: `bright.sh`, `bright-status.sh`, `mediaplayer.py`.

## 📝 Примечания

- Конфигурация рассчитана в первую очередь на **Arch Linux** (используются команды `pacman`).
- Убедитесь, что ваша видеокарта поддерживает необходимые драйверы (Mesa, Vulkan).
- Для работы `awww` требуется композитор с поддержкой `wlr-layer-shell` (Hyprland совместим).
- Если Waybar не отображается или углы не скруглены, проверьте пути к SVG-файлам в `style.css`.

## 📄 Лицензия

Конфигурация предоставляется как есть, без каких-либо гарантий.
```

Этот README охватывает все зависимости, которые я смог выявить из файлов конфигурации, включая неочевидные (плагин Hyprlua, шрифт, темы). Если в репозитории появятся новые компоненты, README можно будет дополнить.
