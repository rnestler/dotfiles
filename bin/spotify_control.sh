#!/bin/bash
acpi_listen | while IFS= read -r line; do
    echo $line
    if [[ "$line" == cd/next\ CDNEXT* ]] ; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
    elif [[ $line == cd/prev\ CDPREV* ]] ; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
    elif [[ $line == cd/play\ CDPLAY* ]] ; then
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
    fi
done
