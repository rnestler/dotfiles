#!/bin/bash
set -e

function die {
	echo usage: $0 file command
	exit 1
}

[ -f "$1" ] || die

file="$1"
shift

### Set initial time of file
LTIME=$(stat -c %Z "$file")

while true; do
	ATIME=$(stat -c %Z "$file")

	if [[ "$ATIME" != "$LTIME" ]]; then
		echo $*
		$* || true
		LTIME=$ATIME
	fi
	sleep 1
done

