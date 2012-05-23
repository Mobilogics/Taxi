#!/bin/bash

#wait for camera device
while [ ! -e /dev/video0 ];do
	sleep 1
done

#wait for wifi
WLAN=`iwconfig | awk '{print $1}'| grep ^wlan[[:digit:]]`
WLAN=`expr $WLAN:'\(wlan)\'`

while [ -z $WLAN ];do
	sleep 1
	WLAN=`iwconfig | awk '{print $1}'| grep ^wlan[[:digit:]]`
	WLAN=`expr $WLAN:'\(wlan)\'`
done

#give all users access to video devices
chmod o+rw /dev/video*

#enable wifi ad-hoc mode for incoming connections
iwconfig wlan0 essid GGScope
iwconfig wlan0 mode ad-hoc
iwconfig wlan0 channel 7
ifconfig wlan0 192.168.66.166 netmask 255.255.255.0 broadcast 192.168.66.255
iwconfig wlan0 essid GGScope

#start the streamer
su `nohup /home/ubuntu/mjpg-streamer/start.sh > /home/ubuntu/mjpg-streamer/out.log 2>&1` ubuntu

#enable dhcp server
/etc/init.d/dhcp3-server start

