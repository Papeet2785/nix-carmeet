#!/usr/bin/env bash

chosen=$(echo -e "Lock\nLogout\nShutdown\nReboot" | rofi -dmenu -i -p "Power")

case "$chosen" in
Lock)
  hyprlock
  ;;
Logout)
  pkill Hyprland
  ;;
Reboot)
  systemctl reboot
  ;;
Shutdown)
  systemctl poweroff
  ;;
esac
