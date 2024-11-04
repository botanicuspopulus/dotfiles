#!/bin/zsh

source "$HOME/bin/gradient_colors.sh"
source "$HOME/bin/util.sh"

typeset -gxr ICON_WIDTH=3

typeset -gxr GREEN='#9ECE6A'
typeset -gxr YELLOW='#E0AF86'
typeset -gxr BLUE='#7AA2F7'
typeset -gxr RED='#f7768E'
typeset -gxr WHITE='#C0CAF5'

typeset -gxar temperature_icons=("" "" "" "" "")
typeset -gxar utilization_icons=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

typeset -ir color_steps=20

typeset -ar temperature_gradient=( 
  $(calculate_gradient_colors $BLUE $GREEN $(( color_steps / 2 + 1 )))
  $(calculate_gradient_colors $GREEN $RED $(( color_steps / 2 + 1 )))
)
typeset -ar utilization_gradient=( $(calculate_gradient_colors $GREEN $RED ${#utilization_icons[@]}) )

function get_temperature_color() {
  local temp=$1
  local min_temp=${2:=0}
  local max_temp=${3:=100}

  local color_count=${#temperature_gradient[@]}
  local color=$(get_index $temp $min_temp $max_temp $color_count)

  print "${temperature_gradient[$color]}"
}

function get_temperature_icon() {
  local temp=$1
  local min_temp=${2:=0}
  local max_temp=${3:=100}

  local icon_count=${#temperature_icons[@]}
  local icon=$(get_index $temp $min_temp $max_temp $icon_count)

  print "${temperature_icons[$icon]}"
}

function get_utilization_color() {
  local utilization=${1:?No utilization provided}
  local min_utilization=${2:=0}
  local max_utilization=${3:=100}

  local color_count=${#utilization_gradient[@]}
  local color=$(get_index $utilization $min_utilization $max_utilization $color_count)

  print "${utilization_gradient[$color]}"
}

function get_utilization_icon() {
  local utilization=${1:?No utilization provided}
  local min_utilization=${2:=0}
  local max_utilization=${3:=100}

  local icon_count=${#utilization_icons[@]}
  local icon=$(get_index $utilization $min_utilization $max_utilization $icon_count)

  print "${utilization_icons[$icon]}"
}
