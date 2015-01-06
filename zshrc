# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Default user
DEFAULT_USER="neilrenicker"

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

# Jump to any project:
go() { cd ~/Projects/$1; }
_go() { _files -W ~/Projects -/; }
compdef _go go

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export PATH="$HOME/.bin:$PATH"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

export PATH="$PATH:/usr/local/lib/node_modules"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"

