#!/bin/sh
#
# ~/.xinitrc
#

xrdb -merge ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

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

