#!/usr/bin/env bash
# Bootstrap a Python virtualenv for security tooling.
set -euo pipefail

VENV_DIR="${1:-$HOME/venvs/secenv}"
echo "[*] Creating venv at $VENV_DIR"
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

pip install --upgrade pip
pip install \
    requests \
    beautifulsoup4 \
    colorama \
    tqdm \
    shodan

echo "[+] venv ready. Activate with: source $VENV_DIR/bin/activate"
