#!/bin/bash
cd ~/Pictures/Wallpapers
ls | rofi -dmenu -p "Wallpapers" -i |awk '{print ENVIRON["PWD"] "/" $1}' | xargs feh --bg-fill --randomize --recursive

