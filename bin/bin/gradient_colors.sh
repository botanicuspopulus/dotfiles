#!/bin/zsh

function hex_to_rgb() {
  local hex=$1
  typeset -i 10 red green blue
  red=$((16#${hex:1:2}))
  green=$((16#${hex:3:2}))
  blue=$((16#${hex:5:2}))
  print "$red $green $blue"
} 

function calculate_gradient_colors() {
  typeset -ar start_color=( $(hex_to_rgb "${1:=#00FF00}") )
  typeset -ar end_color=( $(hex_to_rgb "${2:=#FF0000}") )

  typeset -i red_color=${start_color[1]}
  typeset -i green_color=${start_color[2]}
  typeset -i blue_color=${start_color[3]}
  
  typeset -ir steps=$((${3:=10}))
  typeset -ir r_step=$(((end_color[1] - start_color[1]) / (steps - 1)))
  typeset -ir g_step=$(((end_color[2] - start_color[2]) / (steps - 1)))
  typeset -ir b_step=$(((end_color[3] - start_color[3]) / (steps - 1)))
  
  typeset -a colors

  for ((i=1; i <= steps; i++))
  do
    colors+=( "#$(( [##16] red_color ))$(( [##16] green_color ))$(( [##16] blue_color ))" )

    (( red_color += r_step ))
    (( green_color += g_step ))
    (( blue_color += b_step ))
  done

  print "${colors[@]}"
}
