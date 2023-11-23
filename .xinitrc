[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && eval $(/usr/bin/dbus-launch --exit-with-session --sh-syntax)
dbus-update-activation-environment --verbose --all


/home/khassanove/.screenlayout/res.sh &
/home/khassanove/Documents/dwm_status.sh &
feh --bg-scale /home/khassanove/Pictures/debian.jpg &
dunst &
pa-applet &
flameshot &
exec dwm
