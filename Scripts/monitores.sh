#!/bin/bash
sudo sysctl -w dev.i915.perf_stream_paranoid=0
export WINEDEBUG=-all
i=0
arr=($(xrandr |grep -w "connected"|tr -s " "|cut -d" " -f1))
#for monitor in $(xrandr |grep -w "connected"|tr -s " "|cut -d" " -f1); do
# echo $monitor
#done
#En casa tengo estos dispositivos:
# eDP-1 connected
# DP-2 connected
# HDMI-1-0 connected 
# Tengo que poner  DP-2 a la derecha de HDMI-1-0 y en la Escuela al revés.

if [ "${#arr[*]}" -eq 3 ];then #Pienso en ESAT
      xrandr --output ${arr[0]} --off
      xrandr --output ${arr[2]} --primary --auto
      if [ "${arr[1]}" == "DP-2" ];then
	xrandr --output ${arr[1]} --auto --rotate left --right-of ${arr[2]}
      else
      xrandr --output ${arr[1]} --auto --rotate left --left-of ${arr[2]}
      fi
elif [ "${#arr[*]}" -eq 1 ];then #Solo portatil 
      xrandr --output ${arr[0]} --primary --auto
else
      xrandr --output ${arr[0]} --primary --auto
      xrandr --output ${arr[1]} --same-as ${arr[0]} --auto
fi

