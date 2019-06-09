#!/bin/sh

VALUE=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ "$(cat /sys/class/power_supply/BAT0/status)" == "Discharging" ]]; then
    echo -n "#[fg=brightred]"
else
    echo -n "#[fg=brightgreen]"
fi

echo $VALUE%
