#!/bin/bash

MOUNTPOINT="/media/COWON J3"
DESTDIR="$MOUNTPOINT/Music/"
SOURCEDIR="/home/roughl/musik/mpd/"
LOGFILE="~/copy.log"
SYNC_COMMAND="rsync -av -u --no-g --delete"

if mount|grep -q "$MOUNTPOINT"; then
	echo "COWON angeschlossen"
else
	echo "COWON nicht angeschlossen"
	exit 1
fi

function sync()
{
	echo $1 #>> $LOGFILE
	$SYNC_COMMAND "$SOURCEDIR/$1" "$DESTDIR/" #>> $LOGFILE
	echo #>> $LOGFILE
}

echo $SOURCEDIR "->" $DESTDIR

sync "Air"
sync "Amy Macdonald"
sync "Blues Brothers"
sync "Böhse Onkelz"
sync "Capercaillie"
sync "Civilisation IV"
sync "dc Talk"
sync "Deep Blue Something"
sync "Deep Purple"
sync "Eduardo Gouveia"
sync "Enya"
sync "Hörbibel"
sync "Hillsong"
sync "Homies"
sync "In Extremo"
sync "Jasmine Kay"
sync "Jedi Mind Tricks"
sync "Klassik Lounge"
sync "Linkin Park"
sync "Manowar"
sync "Martin O'Donnell and Michael Salvatori"
sync "MCMarteens"
sync "Meshell Ndegeocello"
sync "Michaela Breuer"
sync "Oasis"
sync "Pink Floyd"
sync "Pink"
sync "Queen"
sync "Red Hot Chili Peppers"
sync "Sabaton"
sync "Schandmaul"
sync "Supertramp"
sync "The Beatles"
sync "The Blues Brothers"
sync "The Caesars"
sync "The Gone Jackals"
sync "The Killers"
sync "The Lord of the Rings"
sync "Uriah Heep"
sync "Van Halen"
sync "Victor Wooten"
sync "WHY_"

