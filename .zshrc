# Check .config/zsh/ folder for specific configurations
for f in $HOME/.config/zsh/*; do
   [ -f "$f" ] && source "$f"
done

. "$HOME/.local/bin/env"
