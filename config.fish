# Disable default greeting
set fish_greeting

# Setup starship shell prompt
starship init fish | source

# list files
alias ll='exa --long --icons'
alias la='exa --all --long --icons'
alias tree="exa --icons --tree -I '__pycache__|.git|venv|node_modules|*.egg-info'"
