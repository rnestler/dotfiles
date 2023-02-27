#!/bin/bash

set -eo pipefail

current_workspace=$(swaymsg -t get_workspaces|jq '.[]|select(.focused) | .name')
laptop=eDP-1

case $1 in
    work)
        screen=$(swaymsg -t get_outputs --pretty|grep 'Unknown M44-DFHD-120'|cut -d' ' -f2)
        for i in 1 2; do
            swaymsg workspace $i && swaymsg "move workspace to output $laptop"; swaymsg workspace "$current_workspace"
        done
        for i in 3 4 5 6 7 8 9 10; do
            swaymsg workspace $i && swaymsg "move workspace to output $screen"; swaymsg workspace "$current_workspace"
        done
        ;;
    home)
        left=$(swaymsg -t get_outputs --pretty|grep 'Ancor Communications Inc ASUS MG279'|cut -d' ' -f2)
        right=$(swaymsg -t get_outputs --pretty|grep 'Unknown AORUS FI27Q 20430B002168'|cut -d' ' -f2)

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
