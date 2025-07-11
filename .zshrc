####################################################
# Functions
###################################################
port() {
  lsof -n -i:$1 | grep LISTEN
}

killport() {
  local pid=$(port $1 | awk '{print $2}')
  if [[ $pid ]]; then
    kill -9 $pid
  else
    echo "No process found on port ${1}"
  fi
}

####################################################
# Editor
###################################################
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

####################################################
# Tmux Options
###################################################
set -o vi

####################################################
# Atuin
###################################################
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

####################################################
# Git
###################################################
alias ggg='git add -A && git commit --amend --no-edit && git push --force-with-lease'
alias gcm="git checkout master"
alias gco="git checkout"
alias gl="git pull"
alias gc="git commit"
alias gp="git push"
alias gb="git branch"
alias g="git"

####################################################
# Aliases
###################################################
alias v="nvim"
alias lg="lazygit"
alias ..="cd .."
alias ...="cd .. & cd .."
alias cat="bat"

####################################################
# Air
###################################################
alias air='~/go/bin/air'
export GOPATH=$HOME/xxxxx
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin #Confirm this line in your .profile and make sure to source the .profile if you add it!!!

####################################################
# PNPM
###################################################
export COREPACK_INTEGRITY_KEYS=0
export PNPM_HOME="/Users/silval4/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

####################################################
# FNM
###################################################
eval "$(fnm env)"

####################################################
# Bun
###################################################
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

####################################################
# Go
###################################################
GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

####################################################
# Env
###################################################
. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"

####################################################
# Zoxide
###################################################
eval "$(zoxide init zsh)"

####################################################
# Startship Prompt
###################################################
eval "$(starship init zsh)"

####################################################
# Ruby Version Manager
###################################################
export PATH="$PATH:$HOME/.rvm/bin"
