#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script is in bash (not posix shell), because the RANDOM variable
# we use is not defined in posix

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
    echo "Usage:
    $0 <dir containing images>"
    exit 1
fi

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=120
export SWWW_TRANSITION_STEP=20
export SWWW_TRANSITION=grow
export SWWW_TRANSITION_BEZIER=0.43,1.19,1.0,0.4
export SWWW_TRANSITION_DURATION=0.5

# This controls (in seconds) when to switch to the next image
INTERVAL=60

images=$(ls $1 | sort -R)

while true; do
    for filename in $images; do
        echo "Setting wallpaper: $1/$filename" 
        swww img --transition-pos top-right "$1/$filename"
        #swww img -o "HDMI-A-2" --transition-pos top-left "$filename"
        sleep $INTERVAL
    done
done

