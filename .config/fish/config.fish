set fish_greeting ""

set -gx TERM xterm-256color
set -gx XDG_CONFIG_HOME ~/.config

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias vim nvim
alias pip pip3
alias cl clear

# Git
alias g='git'
alias gb='git branch'
alias gd='git diff'
alias gch='git checkout'
alias gco='git commit'
alias gcoa='git commit --amend'
alias gs='git status'
alias ga='git add'
alias gm='git merge'
alias gph='git push origin'
alias gpl='git pull origin'
alias glo='git log --oneline'
alias gfc='git fetch --all'
alias lg='lazygit'

set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"

# docker
set -x DOCKER_CONFIG $HOME/.docker

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

set -x TZ Asia/Tokyo

# Auto start/attach tmux on interactive shell
if status is-interactive
    if command -q tmux
        if not set -q TMUX
            exec tmux new-session -A -s main
        end
    end
end
