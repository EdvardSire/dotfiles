#!/bin/bash

function get_layout() {
  # kb=$(setxkbmap -query | grep layout | awk '{print $2}') 
  # kb=$(swaymsg -t get_inputs | )
  num=$(swaymsg -t get_inputs | grep xkb_active_layout_index | head -n1 | awk '{print $2}' | sed 's/,//')
  case $num in
    0) echo 'US';;
    1) echo 'NO';; 
    *) echo 'Broken';;
  esac
}

function get_date() { date +"%Y-%m-%d %A, Week %V %H:%M:%S"; }

function get_power() { cat /sys/class/power_supply/macsmc-battery/capacity; }

function get_wifi() {
  status=$(nmcli general | awk 'FNR == 2 {print}' | awk '{print $1}' | sed 's/\n//')
  if [[ "$status" =~ ^con ]]; then 
    wifi="$(nmcli | head -n1 | awk '{ print $4}')"
    echo $wifi
  else
    echo $status
  fi 
}

function get_brightness() {
  cat /sys/class/backlight/apple-panel-bl/brightness
}

echo "$(get_power)% | "$(get_brightness)" | $(get_layout) | $(get_wifi) | $(get_date)"

if [ $(($(get_power))) == 15 ]; then
  swaynag -m "Low battery"
fi
