# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
DEFAULT_USER="$USER"
ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git rbenv)
source "$ZSH/oh-my-zsh.sh"

# --- Navigation ---
# Jump to any project: go <name>
go() { cd ~/Code/$1; }
_go() { _files -W ~/Code -/; }
compdef _go go

# --- Aliases ---
[[ -f ~/.aliases ]] && source ~/.aliases

# --- PATH ---
# Core: user bins, Homebrew, local bin
export PATH="$HOME/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"
# Language/tooling
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:/usr/local/lib/node_modules"

# --- Language / tooling ---
eval "$(rbenv init - zsh --no-rehash)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"