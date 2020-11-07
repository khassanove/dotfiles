PATH="$PATH:/$HOME/.local/bin"

#if [ -z "${DISPLAY}" && "${XDG_VTNR}" -eq 1 ]; then
#
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
  fi

