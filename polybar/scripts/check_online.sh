#!/bin/sh

# ping -c 1 8.8.8.8 > /dev/null 2>&1
wget --timeout=10 --spider www.google.com &> /dev/null

if [ $? -eq 0 ]; then
    echo "%{F#728cbb} "
else
    echo "%{F#d8000c} "
fi
