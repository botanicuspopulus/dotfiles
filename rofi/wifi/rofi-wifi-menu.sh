#!/usr/bin/env bash

THEME="$HOME/.config/rofi/wifi/wifi-menu-style.rasi"

wifi_list=$(nmcli --fields "SECURITY,SSID,BARS" device wifi list | sed 1d | sed 's/WPA1\sWPA2\s/󰣯 /g' | sed 's/WPA2\s*/󰌾  /g')

connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
  toggle="Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
  toggle="Enable Wi-Fi"
fi

rofi_cmd() {
  rofi -theme-str "listview {columns: 1; lines: 6; }" \
    -theme-str 'text-prompt-colon {str: "SSID";}' \
    -dmenu \
    -theme "$THEME" \
    -markup-rows \
    -p "Wi-Fi SSID: "
}

connected_network=$(nmcli connection show --active | head -n 1 | awk '/wifi/ {for(i=1;i<=NF-3;i++) printf $1" "; print ""}' | xargs)
notify-send "Connected: $connected_network"

chosen_network=$(echo -e "$toggle\n$wifi_list" | rofi_cmd | awk '{for(i=2;i<NF;i++) printf $i" "; print ""}' | xargs)
notify-send "Chosen: $chosen_network"

if [ "$chosen_network" = "" ]; then
  notify-send "No network selected"
  exit
elif [ "$chosen_network" = "$connected_network" ]; then
  notify-send "Already connected to $chosen_network"
  exit
elif [ "$chosen_network" = "Enable Wi-Fi" ]; then
  nmcli radio wifi on
elif [ "$chosen_network" = "Disable Wi-Fi" ]; then
  nmcli radio wifi off
else
  if [[ $(nmcli -g NAME connection | grep -w "$chosen_network") = "$chosen_network" ]]; then
    result=$(nmcli connection up id "$chosen_network")
    notify-send "$result"
    if echo "$result" | grep "successfully"; then
      notify-send "Connection Established to $chosen_network"
    elif echo "$result" | grep "Passwords or encryption keys are required"; then
      wifi_password=$(rofi -dmenu -p "Password: " )
      if nmcli device wifi connect "$chosen_network" password "$wifi_password";  then
        notify-send "Connection established to $chosen_network"
      else
        notify-send "Connection failed"
      fi
    fi
  else
    if [[ "$chosen_network" =~ "󰌾" ]]; then
      wifi_password=$(rofi -dmenu -p "Password: " )
    fi

    if nmcli device wifi connect "$chosen_network" password "$wifi_password";  then
      notify-send "Connection established to $chosen_network"
    else
      notify-send "Connection failed"
    fi
  fi
fi
