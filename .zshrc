# Check .config/zsh/ folder for specific configurations
for f in $HOME/.config/zsh/*; do
   [ -f "$f" ] && source "$f"
done

export COREPACK_INTEGRITY_KEYS=0

GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export NOTES_DIR="$HOME/personal/vault"
alias nd="sh $HOME/open-daily-note.sh"
alias todo="grep -r \"#todo*\" $NOTES_DIR --no-filename"

. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"

# bun completions
[ -s "/Users/silval4/.bun/_bun" ] && source "/Users/silval4/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
