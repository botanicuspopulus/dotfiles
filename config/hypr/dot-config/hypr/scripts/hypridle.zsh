#!/usr/bin/env zsh

case $1 in
  status)
    sleep 1
    if pgrep -x "hypridle" >/dev/null; then
      echo '{"text": "RUNNING", "class": "active", "tooltip": "Screen locking active"}'
    else
      echo '{"text": "NOT RUNNING", "class": "notactive", "tooltip": "Screen locking deactivated"}'
    fi
    ;;
  toggle)
    if pgrep -x "hypridle" >/dev/null; then
      killall hypridle
    else
      hypridle
    fi
    ;;
  *);;
esac
