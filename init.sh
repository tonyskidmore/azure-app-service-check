#!/bin/bash
set -e

tcptraceroute -w 30 mcr.microsoft.com 443 > "$HOME/diags.txt"

openssl s_client -showcerts -verify 5 -connect mcr.microsoft.com:443 < /dev/null >> "$HOME/diags.txt"
grep "CN = " "$HOME/diags.txt" >> "$HOME/certs.txt"

echo "Starting SSH ..."
service ssh start

python3 app.py
