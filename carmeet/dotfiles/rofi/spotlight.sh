#!/usr/bin/env bash

input=$(rofi -dmenu -p "Spotlight")

[[ -z "$input" ]] && exit

# Quick calculator mode
if [[ "$input" == =* ]]; then
  expr="${input:1}"
  if result=$(echo "$expr" | bc -l 2>/dev/null); then
    [[ -n "$result" ]] && notify-send "Result" "$expr = $result" || notify-send "Error" "Empty result"
  else
    notify-send "Error" "Invalid expression"
  fi
  exit
fi

# Search for matching files (you can adjust folders)
file=$(find ~/Documents ~/Downloads ~/Desktop ~/ -type f -iname "*$input*" 2>/dev/null | rofi -dmenu -p "Open File")

[[ -z "$file" ]] && exit

# Get extension (lowercase)
ext="${file##*.}"
ext="${ext,,}"  # Lowercase

# Determine which app to use
case "$ext" in
  pdf)
    app="evince"
    ;;
  docx)
    app="onlyoffice"
    ;;
  jpg|jpeg|png|webp|gif|bmp)
    app="shotwell"
    ;;
  mp4|mkv|webm|mp3|wav|flac|ogg)
    app="vlc"
    ;;
  txt|html|py|java)
    app="code"
    ;;
  *)
    app=""  # fallback to xdg-open
    ;;
esac

if [[ -n "$app" ]]; then
    setsid "$app" "$file" >/dev/null 2>&1 &
else
    setsid xdg-open "$file" >/dev/null 2>&1 &
fi
