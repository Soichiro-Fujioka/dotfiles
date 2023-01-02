set fish_greeting ""

set -gx TERM xterm-256color

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
alias vim "nvim"
alias pip "pip3"

# Git
alias g='git'
alias gb='git branch'
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

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x NODEBREW_ROOT /opt/homebrew/bin/nodebrew

# homebrew
set -x PATH /opt/homebrew/bin $PATH
set -x PATH /opt/homebrew/sbin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
