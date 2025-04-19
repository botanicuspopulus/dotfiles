#!/usr/bin/env zsh

HYPRGAMEMODE=${${(f)$(hyprctl getoption animations:enabled)}[(w)2]}

if (( HYPRGAMEMODE == 1 )); then
  hyprctl --batch "\
    keyword animations:enabled 0;\
    keyword decoration:shadow:enabled 0;\
    keyword decoration:blur:enabled 0;\
    keyword general:gaps_in 0;\
    keyword general:gaps_out 0;\
    keyword general:border_size 1;\
    keyword decoration:rounding 0"
  notify-send "Game Mode Activated"
  exit
fi

notify-send "Game Mode Deactivated"
hyprctl reload
