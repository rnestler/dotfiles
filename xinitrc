#!/bin/sh
#
# ~/.xinitrc
#

xrdb -merge ~/.Xresources

case $1 in
gnome)
	exec gnome-session
	;;
xfce4)
	exec startxfce4
	;;
dwm)
	exec /usr/bin/dwm-session
	;;
*)
	export $(gnome-keyring-daemon -s -c pkcs11,secrets,ssh,gpg)
	exec awesome
	;;
esac

