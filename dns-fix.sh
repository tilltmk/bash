#!/bin/bash
nmcli device mod wlan0 ipv4.ignore-auto-dns yes
nmcli device mod wlan0 ipv4.dns "8.8.8.8"
rm -rf /etc/resolv.conf
echo nameserver 8.8.8.8 >> /etc/resolv.conf
