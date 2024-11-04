#!/bin/zsh

source "$HOME/bin/gradient_colors.sh"
source "$HOME/bin/util.sh"

export GREEN='#9ECE6A'
export YELLOW='#E0AF86'
export RED='#f7768E'
export WHITE='#C0CAF5'

export temperature_icons=("" "" "" "" "")
export utilization_icons=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

typeset -a temperature_gradient_colors
typeset -a utilization_gradient_colors

typeset -A gradient_colors

read -r temperature_gradient_colors <<< "$(gradient_colors $GREEN $RED ${#temperature_icons[@]})"
read -r utilization_gradient_colors <<< "$(gradient_colors $GREEN $RED ${#utilization_icons[@]})"

gradient_colors["temperature"]=$temperature_gradient_colors
gradient_colors["utilization"]=$utilization_gradient_colors

function get_temperature_color() {
  local temp=$1
  local min_temp=${2:-0}
  local max_temp=${3:-100}

  echo -e "$(get_color $temp $min_temp $max_temp "${gradient_colors["temperature"][@]}")"
}

function get_utilization_color() {
  local utilization=$1
  local min_utilization=${2:-0}
  local max_utilization=${3:-100}

  echo -e "$(get_color $utilization $min_utilization $max_utilization "${gradient_colors["utilization"][@]}")"
}
