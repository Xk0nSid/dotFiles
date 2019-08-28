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
        label+=" "
    else
        # Cable disconnected
        label+="%{F#de935f} "
    fi

    # Wireless network
    if [ $(cat /sys/class/net/$wifi/carrier) == 1 ]; then
        # Wifi is connected
        label+=" "
    else
        # Wifi is disconnected
        label+="%{F#de935f} "
    fi

    # Checks for OpenVPN and Wireguard
    if [ "$(pgrep openvpn)" ] || [ "$(pgrep wireguard)" ]; then
        # VPN is on
        label+="%{F#e2e2e2} "
    else
        # VPN is off
        label+="%{F#de935f} "
    fi
else
    # Offline
    label+=""
fi
echo $label

