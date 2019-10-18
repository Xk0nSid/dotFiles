#!/bin/bash

# Interfaces
eth=enp8s0
wifi=wlp9s0

# Echo the network label depending on network status
label="%{T4}"
# Ask to NetworkManager if we're online
nm-online -qt 10
if [ $? -eq 0 ]; then
    # Cable Network
    if [ $(cat /sys/class/net/$eth/carrier) == 1 ]; then
        # Cable connected
        label+="%{F#728cbb} "
    else
        # Cable disconnected
        # label+="%{F#de935f} "
        label+="%{F#d8000c} "
    fi

    # Wireless network
    if [ $(cat /sys/class/net/$wifi/carrier) == 1 ]; then
        # Wifi is connected
        label+="%{F#728cbb} "
    else
        # Wifi is disconnected
        label+="%{F#d8000c} "
    fi

    # Checks for OpenVPN and Wireguard
    if [ "$(pgrep openvpn)" ] || [ "$(pgrep wireguard)" ]; then
        # VPN is on
        label+="%{F#728cbb} "
    else
        # VPN is off
        label+="%{F#d8000c} "
    fi
else
    # Offline
    label+=""
fi
echo $label

