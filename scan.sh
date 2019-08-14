#!/bin/bash

if [ -z "$1" ]
then
  echo "Please enter an IP address or range"
  echo "Usage: recon_scan.sh 10.0.0.1-255"
  exit 1
fi

/bin/nmap -n -p 0-65535 $1
