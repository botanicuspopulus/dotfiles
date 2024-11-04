#!/bin/zsh

function get_index() {
  local temp
  local min_temp
  local max_temp
  local steps
  local step_size
  local index

  temp=$1
  min_temp=$2
  max_temp=$3
  steps=$4

  step_size=$(( (max_temp - min_temp) / steps ))

  index=0 
  if (( temp > max_temp ))
  then
    index=-1
  else
    index=$(( (temp - min_temp) / step_size  + 1 ))
  fi

  if (( index > steps ))
  then
    index=$steps
  fi

  echo $index
}

function get_icon() {
  local temp
  local index
  local min_temp
  local max_temp
  local icons

  temp=$1
  min_temp=${2:-0}
  max_temp=${3:-100}

  read -r -A icons <<< "${4:-("   " "   " "   " "   " "   ")}"

  index=$(get_index $temp $min_temp $max_temp "${#icons[@]}")

  echo -e "${icons[index]}"
}

function get_color() {
    local temp
    local index
    local min_temp
    local max_temp
    local step_size
    local colors
    local steps

    temp=$1
    min_temp=${2:-0}
    max_temp=${3:-100}

    read -r -A colors <<< "${4:-"#00FF00 #FFFF00 #FF0000"}"

    index=$(get_index $temp $min_temp $max_temp "${#colors[@]}")

    echo "${colors[index]}"
}
