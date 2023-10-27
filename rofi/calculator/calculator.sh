#!/usr/bin/env bash

dir="$HOME/dotfiles/rofi/calculator"
theme='calculator-style'

## Run
rofi \
    -show calc \
    -theme "${dir}/${theme}.rasi"
