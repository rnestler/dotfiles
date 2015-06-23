#!/bin/bash


IN="eDP1"
EXT="HDMI1"

export DISPLAY=:0

if [ $USER == roughl ]; then
	if (xrandr | grep "$EXT disconnected"); then
		xrandr --output $EXT --off --output $IN --auto
	else
		xrandr --output $IN --off --output $EXT --auto
	fi
else
	su roughl -c "$0"
fi

