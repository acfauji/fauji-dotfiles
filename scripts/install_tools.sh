#!/usr/bin/env bash
# One-command installer for common security tools (Ubuntu/Debian).
set -euo pipefail

echo "[*] Updating package lists"
sudo apt update -qq

echo "[*] Installing core tools"
sudo apt install -y -qq \
    nmap \
    netcat-openbsd \
    dnsutils \
    whois \
    curl \
    wget \
    git \
    python3-pip \
    jq \
    ripgrep

echo "[*] Installing Python tools via pip"
pip3 install --user \
    shodan \
    theHarvester \
    sherlock-project \
    trufflehog3

echo "[+] Done. Tools installed:"
echo "    nmap, nc, dig, whois, curl, jq, rg"
echo "    shodan, theHarvester, sherlock, trufflehog3"
