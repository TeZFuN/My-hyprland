#!/bin/bash
sleep 3   # ждём, пока сессия полностью поднимется (чтобы dbus и окружение были готовы)

# Убиваем возможные остатки
pkill -f pipewire 2>/dev/null
pkill -f wireplumber 2>/dev/null
pulseaudio -k 2>/dev/null

# Удаляем блокировки
rm -f /run/user/1000/pipewire-0.lock
rm -f /run/user/1000/pulse/native

# Запускаем с полными путями (на всякий случай)
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
