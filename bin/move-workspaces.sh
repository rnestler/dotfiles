#!/bin/bash

left=DP-3
right=DP-4

current_workspace=5

for i in 1 2 3 4; do
	swaymsg workspace $i && swaymsg move workspace to output $left; swaymsg workspace $current_workspace
done

for i in 5 6 7 8; do
	swaymsg workspace $i && swaymsg move workspace to output $right; swaymsg workspace $current_workspace
done
