 function hex_to_rgb() {
  local hex=$1
  echo -e "$((16#${hex:1:2})) $((16#${hex:3:2})) $((16#${hex:5:2}))"
} 

function gradient_colors() {
  local start_color
  local end_color
  local steps
  local r_step
  local g_step
  local b_step
  local colors

  read -r -A start_color <<< "$(hex_to_rgb "${1:-#00FF00}")"
  read -r -A end_color <<< "$(hex_to_rgb "${2:-#FF0000}")"

  steps=$((${3:-10}))
  r_step=$(((end_color[1] - start_color[1]) / (steps - 1)))
  g_step=$(((end_color[2] - start_color[2]) / (steps - 1)))
  b_step=$(((end_color[3] - start_color[3]) / (steps - 1)))

  colors=()

  for ((i=0; i < steps; i++))
  do
    red_color=$((start_color[1] + i * r_step))
    green_color=$((start_color[2] + i * g_step))
    blue_color=$((start_color[3] + i * b_step))
    colors+=( "#$(printf "%02x%02x%02x" $red_color $green_color $blue_color)" ) 
  done

  echo -e "${colors[@]}"
}
