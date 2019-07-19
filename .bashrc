# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\[\033[1;33m\][\[\033[0m\]\[\033[1;31m\]\u\[\033[0m\]\[\033[1;35m\]@\[\033[0m\]\[\033[1;34m\]\h\[\033[0m\]\[\033[1;32m\] \W\[\033[0m\]\[\033[1;33m\]]\[\033[0m\]\[\033[1;33m\]\$ \[\033[0m\]"

(cat ~/.cache/wal/sequences &)
neofetch
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx 


set -o vi
alias cam='ffplay rtsp://admin:992025022@192.168.1.170:554'
alias xi='sudo xbps-install -S'
alias xr='sudo xbps-remove -R'
alias trans='transmission-remote'
alias hdd='sudo ntfs-3g /dev/sdb1 ~/USB/'
alias hdd='sudo ntfs-3g /dev/sdb1 ~/USB/'
