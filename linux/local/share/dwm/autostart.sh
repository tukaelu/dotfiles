#!/bin/bash

pgrep -x picom > /dev/null || picom -b
pgrep -x fcitx > /dev/null || fcitx &
pgrep -x ulauncher > /dev/null || ulauncher --hide-window &

/usr/bin/feh --randomize --bg-fill /home/tuka/Pictures/Wallpaper > /dev/null 2>&1

xbindkeys -p

xautolock -time 25 -locker slock &
