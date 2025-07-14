#! /usr/bin/env zsh

function get_index() {
  local value=$1
  local min=$2
  local max=$3
  local count=$4

  local index=$(((value - min) * (count - 1) / (max - min) + 1))
  print "$index"
}
