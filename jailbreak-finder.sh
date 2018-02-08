#!/bin/bash

clear
PLATFORM=`uname`
case ${PLATFORM} in
    Darwin*)
        wlanmax=$(ifconfig en0 | grep "inet " | cut -d' ' -f2 | awk '{print $1};' | awk -F. '{print $1"."$2"."$3".1/24"};')
        ;;
    *)
        wlanmax=$(ifconfig wlan0 | grep "inet addr:" | cut -d: -f2 | awk '{print $1};' | awk -F. '{print $1"."$2"."$3".1/24"};')
        ;;
esac
echo "Grabbing inet address..."
echo "Grabbing gatemask..."
nmap -sP $wlanmax | grep "Nmap scan report for" | awk '{system("ssh -t -t -o ConnectTimeout=5 root@"$5)};'
echo "Done"
