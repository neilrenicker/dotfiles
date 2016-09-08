# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Prevent full username from displaying in path.
DEFAULT_USER="$USER"

# Theming: ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins 
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rbenv)

source $ZSH/oh-my-zsh.sh

# aws-cli autocompletion
source /usr/local/share/zsh/site-functions/_aws

# Jump to any project:
go() { cd ~/Code/$1; }
_go() { _files -W ~/Code -/; }
compdef _go go

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export PATH="$HOME/.bin:$PATH"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

export PATH="$PATH:/usr/local/lib/node_modules"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# path configuration for Postgres.app
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
