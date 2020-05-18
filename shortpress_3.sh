#!/bin/sh
#Set the SSID, Password and IP
IP=192.168.1.10         # Change this to the desired Bebop IP   
MASK=255.255.0.0

CONFIG='network={\n
        ssid="ice0nfire-5G" \n
        key_mgmt=NONE \n
}
'

bcmwl band a

#Connect to defined Network
BLDC_Test_Bench -M 2 >/dev/null
sleep 1 &&
mount -o remount,rw / &&
sleep 1 &&
echo -e $CONFIG > /etc/wpa_supplicant.conf &&
sleep 1 && 
ifconfig eth0 $IP netmask $MASK && 
sleep 1 &&
mount -o remount,rw / &&
sleep 1 &&
echo -e $CONFIG > /etc/wpa_supplicant.conf && 
sleep 1 && 
ifconfig eth0 $IP netmask $MASK && 
sleep 1 &&
wpa_supplicant -B -D wext -i eth0 -c /etc/wpa_supplicant.conf &&
sleep 1 &&
BLDC_Test_Bench -M 2 >/dev/null
sleep 1 &&
BLDC_Test_Bench -M 2 >/dev/null
# sleep 5 &&
