#!/usr/bin/env bash
# One-command SSH hardening for new servers.
set -euo pipefail

SSHD_CONFIG="/etc/ssh/sshd_config"

echo "[*] Backing up existing config"
cp "$SSHD_CONFIG" "${SSHD_CONFIG}.bak.$(date +%s)"

echo "[*] Applying hardening"
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' "$SSHD_CONFIG"
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' "$SSHD_CONFIG"
sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' "$SSHD_CONFIG"
sed -i 's/^#\?X11Forwarding.*/X11Forwarding no/' "$SSHD_CONFIG"
sed -i 's/^#\?MaxAuthTries.*/MaxAuthTries 3/' "$SSHD_CONFIG"

echo "[*] Validating config"
if sshd -t; then
    systemctl restart sshd
    echo "[+] SSH hardened and restarted"
else
    echo "[!] Invalid config — NOT restarting. Restore: cp ${SSHD_CONFIG}.bak.* ${SSHD_CONFIG}"
    exit 1
fi
