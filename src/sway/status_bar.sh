#!/usr/bin/bash

date_fmt=$(date '+%H:%M:%S %d-%m-%Y')
bat_stat=$(cat /sys/class/power_supply/BAT0/status)

case $bat_stat in
    'Not charging')
        bat_stat='N' ;;
    'Discharging')
        bat_stat='D' ;;
    'Charging')
        bat_stat='C' ;;
    '*')
        bat_stat='NDC' ;;
esac

aud_vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{
    vol = $2 * 100 "%"
    if ($3 == "[MUTED]") vol = vol "M"
    print vol
}')
bat_cap=$(cat /sys/class/power_supply/BAT0/capacity)'%'
cpu_temp=$(awk '{print $1/1000 "°C"}' /sys/class/thermal/thermal_zone0/temp)

echo $aud_vol '|' $cpu_temp '|' $bat_stat '|' $bat_cap  '|' $date_fmt
