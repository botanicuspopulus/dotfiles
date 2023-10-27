#!/usr/bin/env bash

dir="$HOME/dotfiles/rofi/launcher"
theme='launcher-style'

## Run
rofi \
    -show drun \
    -theme "${dir}/${theme}.rasi"
