export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    fnm
    thefuck
)

# THFCK
eval $(thefuck --alias)

# Fast Node Manager
eval "$(fnm env --use-on-cd)"

alias lg="lazygit"

alias fk="fuck"

alias v="nvim"
alias cat="bat"
alias vim="nvim"

alias zj="zellij"

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

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Use exa instead of ls, if it exists
# if type exa > /dev/null; then
#   alias ls='exa'
# elif ls --color -d . &>/dev/null 2>&1; then
#   alias ls='ls --color=tty'
# else
#   alias ls='ls -G'
# fi

alias air=~/.air
alias tt=~/tt.sh

eval "$(starship init zsh)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# ---- FZF -----
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

#######################
# Zoxide
#######################
eval "$(zoxide init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# pnpm
export PNPM_HOME="/Users/silval4/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

set -o vi
