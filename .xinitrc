#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
exec xrdb .Xresources &

exec xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output DP2 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA1 --off &

exec /home/khassanove/status.sh &

exec wal -a90 -i /home/khassanove/Downloads/ca0lRWb-cool-anime-wallpapers.jpg &

exec compton &

exec dwm


# ...or the Window Manager of your choice
