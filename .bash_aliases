# --- Fauji dotfiles aliases ---

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../..'
alias ~='cd ~'

# Directory listing
alias l='ls -lah'
alias ld='ls -ld */'
alias tree='find . -print | sed -e "s;[^/]*/;|____;g;s;____|; |;g"'

# Git shortcuts
alias gs='git status -sb'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push origin'
alias gl='git log --oneline --graph --decorate -10'
alias gd='git diff'
alias gco='git checkout'

# Security shortcuts
alias recon='cd ~/security-toolkit/recon'
alias notes='cd ~/osint-notes/notes'

# System
alias update='sudo apt update && sudo apt upgrade -y'
alias ports='ss -tlnp'
alias myip='curl -s ifconfig.me'

# Docker
alias dps='docker ps -a'
alias dimg='docker images'
alias dstop='docker stop $(docker ps -q)'

# Quick PHP/Laravel (if applicable)
alias art='php artisan'
