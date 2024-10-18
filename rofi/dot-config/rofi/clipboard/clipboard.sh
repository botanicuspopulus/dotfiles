#!/usr/bin/env bash

dir="$HOME/.config/rofi/clipboard"
theme='clipboard-style'

## Run
rofi \
    -show clipboard \
    -theme "${dir}/${theme}.rasi"
