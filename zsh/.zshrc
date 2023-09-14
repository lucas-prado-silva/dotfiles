# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export OPENAI_API_KEY="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"

plugins=(
    git
)

# THFCK
eval $(thefuck --alias)

# Fast Node Manager
eval "$(fnm env --use-on-cd)"

# Aliases
alias t="tms"
alias tss="tms switch"

alias lg="lazygit"

alias fk="fuck"
alias bastion='ssh -t bastion "watch -n 60 ls"'

alias ta="tmux attach"
alias v="nvim"
alias vim="nvim"
alias zshr="exec zsh -l"

alias bi='brew install'
alias bic='brew install --cask'
alias bs='brew search'

alias deit='docker exec -it'
alias dc="docker-compose"
alias dcb="docker-compose build"
alias dce="docker-compose exec"
dcl() {
  docker logs -f $(dc ps -q $1)
}
alias dck="docker-compose kill"
alias dcrf="docker-compose rm -f"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"
alias dcd="docker-compose down"
alias dcr="docker-compose run --rm"
alias dcrs="docker-compose restart"

# see what is listening on a given port
port() {
  lsof -n -i:$1 | grep LISTEN
}

# kill what is listening on a given port
killport() {
  local pid=$(port $1 | awk '{print $2}')
  if [[ $pid ]]; then
    kill -9 $pid
  else
    echo "No process found on port ${1}"
  fi
}

# pls
alias pls='sudo $(fc -ln -1)'

# NVM settings 
export NVM_LAZY=1
export NVM_AUTOLOAD=1

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# USE nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# nvm with lazy loading
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use # This loads nvm
# alias node='unalias node ; unalias npm ; nvm use default ; node $@'
# alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Use exa instead of ls, if it exists
if type exa > /dev/null; then
  alias ls='exa'
elif ls --color -d . &>/dev/null 2>&1; then
  alias ls='ls --color=tty'
else
  alias ls='ls -G'
fi

eval "$(starship init zsh)"

# pnpm
# export PNPM_HOME="/Users/silval4/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
#
# eval "$(zellij setup --generate-auto-start zsh)" pnpm endeval "$(zellij setup --generate-auto-start zsh)"

# bun completions
[ -s "/Users/silval4/.bun/_bun" ] && source "/Users/silval4/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
