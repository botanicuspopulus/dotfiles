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

wifi_list=$(nmcli -fields "SECURITY,SSID,BARS" device wifi list | sed '1d; s/^WPA1\sWPA2\s\+/󰣯 /g; s/^WPA2\s\+/󰌾 /g; s/^--\s\+/󰌿 /g')

connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="Enable Wi-Fi"
fi

THEME="$HOME/.config/rofi/wifi/wifi-menu-style.rasi"

rofi_cmd() {
	rofi -theme-str "listview {columns: 1; lines: 6;}" \
		-theme-str 'text-prompt-colon {str: "SSID";}' \
		-dmenu \
		-theme "$THEME" \
		-markup-rows \
		-p "Wi-Fi SSID: "
}

rofi_passwd() {
	rofi -theme-str 'text-prompt-colon {str: "Password";}' \
		-dmenu \
		-theme "$THEME" \
		-p "Password: "
}

connected_network=$(nmcli connection show --active | awk '/wifi/ {print $1}')
chosen_network=$(echo -e "$toggle\n$wifi_list" | rofi_cmd | awk '{print $2}')
notify-send "$chosen_network"

case $chosen_network in
	"Enable Wi-Fi")
		nmcli radio wifi on
		;;
	"Disable Wi-Fi")
		nmcli radio wifi off
		;;
	"$connected_network")
		notify-send "Already connected to $connected_network"
		;;
	*)
		if [[ $(nmcli -g NAME connection | grep -w "$chosen_network") = "$chosen_network" ]]
		then
			result=$(nmcli connection up id "$chosen_network" 2>/dev/null)
			notify-send "$result"
			if echo "$result" | grep "successfully"
			then
				notify-send "Connection establish to $chosen_network"
			elif echo "$result" | grep "Passwords or encryption keys are required"
			then
				wifi_password=$(rofi_passwd)
				if nmcli device wifi connect "$chosen_network" password "$wifi_password";  then
					notify-send "Connection established to $chosen_network"
				else
					notify-send "Connection failed"
				fi
			else
				notify-send "Fuck knows 🤷"
			fi
		else
			notify-send "No network selected"
		fi
		;;
esac
