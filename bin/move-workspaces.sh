#!/bin/bash

set -eo pipefail

current_workspace=$(swaymsg -t get_workspaces|jq '.[]|select(.focused) | .name')
laptop=eDP-1

case $1 in
    work)
        output=DP-4
        for i in 1 2; do
            swaymsg workspace $i && swaymsg "move workspace to output $laptop"; swaymsg workspace "$current_workspace"
        done
        for i in 3 4 5 6 7 8 9 10; do
            swaymsg workspace $i && swaymsg "move workspace to output $output"; swaymsg workspace "$current_workspace"
        done
        ;;
    home)
        left=DP-3
        right=DP-4

        for i in 1 2 3 4; do
            swaymsg workspace $i && swaymsg move workspace to output $left; swaymsg workspace "$current_workspace"
        done

        for i in 5 6 7 8; do
            swaymsg workspace $i && swaymsg move workspace to output $right; swaymsg workspace "$current_workspace"
        done
        for i in 9 10; do
            swaymsg workspace $i && swaymsg "move workspace to output $laptop"; swaymsg workspace "$current_workspace"
        done
        ;;
    *)
        echo "usage $0 [work|home]"
esac
