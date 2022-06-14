#!/bin/bash
set -e

tcptraceroute mcr.microsoft.com 443 > /tcptraceroute.txt

echo "Starting SSH ..."
service ssh start

python3 app.py
