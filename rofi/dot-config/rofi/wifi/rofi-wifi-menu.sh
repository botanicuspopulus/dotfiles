#!/usr/bin/env bash

wireless_interfaces=$(nmcli device | awk '$2=="wifi" {print $1}')
wireless_interfaces_product=()
wired_interfaces=$(nmcli device | awk '$2=="ethernet" {print $1}')
wired_interfaces_product=()
wireless_int=0

function initialize() {
    for i in "${wireless_interfaces[@]}" 
    do
        wireless_interfaces_product+=("$nmcli -f general.product device show $i | awk '{print $2}')")
    done

    for i in "${wired_interfaces[@]}"
    do
        wired_interfaces_product+=("$nmcli -f general.product device show $i | awk '{print $2}')")
    done
    wireless_interfaces_state && ethernet_interface_state
}

function wireless_interface_state() {
    if [[ ${#wireless_interfaces[@]} -eq 0 ]]
    then
        active_ssid=$(nmcli device status | grep "^${wireless_interfaces[wireless_int]}." | awk '{print $4}')
        wifi_connection_state=$(nmcli device status | grep "^${wireless_interfaces[wireless_int]}." | awk '{print $3}')
        if [[ "$wifi_connection_state" == "unavailable" ]]
        then
            wifi_list="***Wi-Fi Disabled***"
            wifi_switch="~Wi-Fi On"
            options="${wifi_list}\n${wifi_switch}\n~Scan\n"
        elif [[ $wifi_connection_state =~ "connected" ]]
        then
            wifi_list=$(nmcli --fields SSID,SECURITY,BARS device wifi list ifname "${wireless_interfaces[wireless_int]}")
            list_wifi

            if [[ $active_ssid == "--" ]]
            then
                wifi_switch="~Scan\n~Manual/Hidden\n~Wi-Fi Off"
            else
                wifi_switch="~Scan\n~Disconnect\nManual/Hidden\n~Wi-Fi Off"
            fi

            options="${wifi_list}\n${wifi_switch}"
        fi
    fi
}


connected=$(nmcli --fields "WIFI" general)
if [[ "$connected" =~ "enabled" ]]; then
    toggle="Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
    toggle="Enable Wi-Fi"
fi

WIFI_LIST_THEME="$HOME/.config/rofi/wifi/wifi-menu-style.rasi"
PASSWORD_ENTRY_THEME="$HOME/.config/rofi/shared/password-entry-style.rasi"

rofi_cmd() {
    rofi -theme-str "listview {columns: 1; lines: 6;}" \
         -theme-str 'text-prompt-colon {str: "SSID";}' \
         -dmenu \
         -theme "$WIFI_LIST_THEME" \
         -markup-rows \
         -p "Wi-Fi SSID: "
}

rofi_passwd() {
    rofi -theme-str 'text-prompt-colon {str: "Password";}' \
         -dmenu \
         -theme "$PASSWORD_ENTRY_THEME" \
         -p "Password: "
}

wifi_list=$(nmcli --wait 1 --fields "IN-USE,SECURITY,SSID,BARS" device wifi list)
wifi_list=$(echo -e "$wifi_list" | sed '1d;
                                        s/\bWPA1\sWPA2\s\+/󰣯  /g;
                                        s/\bWPA2\s\+/󰌾  /g;
                                        s/\b--\s\+/󰌿  /g;
                                        s/^\*\s\+/󱘖  /g;
                                        s/^\s\+/   /g')
chosen_network=$(echo -e "$toggle\n$wifi_list" | rofi_cmd | awk -F' {2,}' '{print $3}')

if [[ -z $chosen_network ]]
then
    exit 0
fi

connected_network=$(nmcli --fields "NAME,TYPE" connection show --active | awk -F' {2,}' '/wifi/ {print $1}')

if [[ $chosen_network = "$connected_network" ]]
then
    notify-send "Already connected to $chosen_network"
    exit 0
else
    notify-send "Disconnecting from $connected_network"
    result=$(nmcli connection down "$connected_network" 2>&1)
    notify-send "$result"
fi

case $chosen_network in
    "Enable Wi-Fi")
        nmcli radio wifi on
        ;;
    "Disable Wi-Fi")
        nmcli radio wifi off
        ;;
    *)
        notify-send "Chosen network: $chosen_network"
        result=$(nmcli device wifi connect "$chosen_network" 2>&1)
        notify-send "$result"

        if echo "$result" | grep "successfully activated"
        then
            notify-send "Connection establish to $chosen_network"
        elif echo "$result" | grep "Secrets were required"
        then
            wifi_password=$(rofi_passwd)
            result=$(nmcli device wifi connect "$chosen_network" password "$wifi_password" name "$chosen_network" 2>&1)
            notify-send "$result"
        else
            notify-send "Fuck knows 🤷"
        fi
        ;;
esac
