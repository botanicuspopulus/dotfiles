#!/usr/bin/env sh

killall -q wofi

while pgrep -x wofi >/dev/null; do sleep 1; done

wofi --show=drun --lines=5 --prompt="" --hide-scroll --insensitive --columns=2
