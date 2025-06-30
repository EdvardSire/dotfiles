#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <uplink-interface> <dronelink-interface>"
    exit 1
fi

UPLINK=$1
DRONELINK=$2

echo "Enabling IP forwarding..."
sudo sysctl -w net.ipv4.ip_forward=1

echo "Setting up NAT masquerading on $UPLINK..."
sudo iptables -t nat -A POSTROUTING -o "$UPLINK" -j MASQUERADE

echo "Allowing traffic from $DRONELINK to $UPLINK..."
sudo iptables -A FORWARD -i "$DRONELINK" -o "$UPLINK" -j ACCEPT

echo "Allowing return traffic from $UPLINK to $DRONELINK..."
sudo iptables -A FORWARD -i "$UPLINK" -o "$DRONELINK" -m state --state RELATED,ESTABLISHED -j ACCEPT
