#!/bin/zsh

function get_index() {
    local temp=$1
    local steps=${4:=10}
    local min_temp=${2:=0}
    local max_temp=${3:=100}

    local step_size=$(( (max_temp - min_temp) / steps ))
    local index=$(( (temp - min_temp) / step_size + 1 ))

    print "$index"
}
