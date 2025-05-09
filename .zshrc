# Check .config/zsh/ folder for specific configurations
for f in $HOME/.config/zsh/*; do
   [ -f "$f" ] && source "$f"
done

# alias
alias gcm="git checkout master"
alias gco="git checkout"
alias gl="git pull"
alias gc="git commit"
alias gp="git push"

alias ..="cd .."
alias ...="cd .. & cd .."

# PNPM
export COREPACK_INTEGRITY_KEYS=0

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/Users/silval4/.bun/_bun" ] && source "/Users/silval4/.bun/_bun"

# GO path
GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# vault stuff
export NOTES_DIR="$HOME/personal/vault"
alias nd="sh $HOME/open-daily-note.sh"
alias todo="grep -r \"#todo*\" $NOTES_DIR --no-filename"

# env
. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"

