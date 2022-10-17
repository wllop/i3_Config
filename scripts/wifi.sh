#!/bin/bash
#Estado
nmcli dev status
#Listado Wifis
nmcli dev wifi list
#Creamos el perfil
read -p "Nombre Wifi:" wifi
read -p "Password:" -s pass
nmcli con add con-name wifi ifname wlp0s21f0u2 type wifi ssid $wifi
nmcli dev wifi connect WLAN_CR7V password wencescuca020177
nmcli con modify wifi wifi-sec.key-mgmt wpa-psk
nmcli con modify wifi wifi-sec.psk $pass
nmcli connection up $wifi 
#Verificamos
nmcli -p c
#nmcli -p con show wifi
