#!/bin/sh

VALUE=$(cpupower frequency-info -f | tail -n 1)
if [[ "${#VALUE}" == "6" ]]; then
    MHZ=$(echo $VALUE/1000 | bc -l | cut -b 1-3)
    echo $MHZ MHz
else
    GHZ=$(echo $VALUE/1000/1000 | bc -l | cut -b 1-4)
    echo $GHZ GHz
fi
