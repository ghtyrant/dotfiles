#!/bin/bash

setxkbmap de &
feh --bg-fill ~/docs/Seafile/Main/wallpaper/firewatch_bluesky.png &
feh-blur --darken 0 -b 10 -d &
setxkbmap -layout de,us -model pc105 -variant nodeadkeys,altgr-intl -option grp:alt_shift_toggle
