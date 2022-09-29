#!/bin/bash

pgrep -x picom > /dev/null || picom -b
pgrep -x fcitx > /dev/null || fcitx &
pgrep -x ulauncher > /dev/null || ulauncher --hide-window &

xbindkeys -p

/usr/bin/feh --randomize --bg-fill /home/tuka/Pictures/Wallpaper > /dev/null 2>&1
