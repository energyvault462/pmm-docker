#! /bin/bash

/sbin/apcupsd
sleep 15

/go/bin/proxmox-monitor -ip=$PVE_IP -port=$PVE_PORT -mac=$PVE_MAC -up=$PMM_UP -down=$PMM_DOWN -user=$PVE_USER
