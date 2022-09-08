#!/bin/bash

pgrep -x picom > /dev/null || picom -b
pgrep -x fcitx > /dev/null || fcitx &
pgrep -x ulauncher > /dev/null || ulauncher &

xbindkeys -p

/usr/bin/feh --randomize --bg-fill /home/tuka/Wallpaper > /dev/null 2>&1
