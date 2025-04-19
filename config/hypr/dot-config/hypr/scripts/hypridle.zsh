#!/usr/bin/env zsh

case $1 in
  status)
    sleep 1
    if pgrep -x "hypridle" >/dev/null; then
      echo '{"text": "RUNNING", "class": "active", "tooltip": "Screen locking active\nLeft: Deactivate"}'
    else
      echo '{"text": "NOT RUNNONG", "class": "notactive", "tooltip": "Screen locking deactivated\nLeft: Activate"}'
    fi
    ;;
  toggle)
    if pgrep -x "hypridle" >/dev/null; then
      killall hypridle
    else
      hypridle
    fi
  *);;
esac
