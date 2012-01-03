#!/bin/sh
#
# ~/.xinitrc
#

DEFAULT_SESSION=awesome

case $1 in
gnome)
	exec gnome-session
	;;
xfce4)
	exec startxfce4
	;;
*)
	export $(gnome-keyring-daemon -s -c pkcs11,secrets,ssh,gpg)
	exec $DEFAULT_SESSION
	;;
esac

