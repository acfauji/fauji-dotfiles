#!/usr/bin/env bash
# Check for pending security updates.
set -euo pipefail

echo "[*] Checking for security updates..."
sudo apt update -qq
COUNT=$(apt list --upgradable 2>/dev/null | tail -n +2 | wc -l)

if [ "$COUNT" -gt 0 ]; then
    echo "[!] $COUNT packages have updates available"
    apt list --upgradable 2>/dev/null | grep -i security || true
else
    echo "[+] System is up to date"
fi
