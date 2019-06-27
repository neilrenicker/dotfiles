# A little baby dotfiles repo

Managed with [rcm][]

## Installation on a fresh machine

Install these OS X applications before proceeding:

- [iTerm2][] *terminal emulator*
- [Atom][] *editor*

## First, install zsh and Homebrew

We'll use the [oh-my-zsh][] project for zsh and install Homebrew as well:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Dotfiles Installation:

Now clone this repo into `~/.dotfiles`, and install [rcm][]::

```
git clone https://github.com/tinystride/dotfiles .dotfiles
brew tap thoughtbot/formulae
brew install rcm
```

Install the .rcrc file so rcm has configuration to run:

```
rcup rcrc
```

Now do a dry run to see which files will be symlinked:

```
lsrc
```

If you're satisfied with the dry run, install the dotfiles on your system:

```
rcup
```

## Install brew casks

```
brew bundle install
```

## Install Vim plugins, nvm, and rvm

- Follow instructions to install [Vundle][]
- Follow instructions to install [nvm][]

## Set up key mapping:

Install these applications before proceeding:

- [Karabiner-Elements][] *custom key mapping*
- [Hammerspoon][]

### Configure key mapping settings:

- Karabiner-Elements > Simple Modifications > caps_lock to key f18
- Hammerspoon > Reload Config to load the config that was auto-installed
during dotfiles installation
- Key mapping setup should be complete!

### Personalize iTerm

- Follow instructions at <https://gist.github.com/kevin-smets/8568070> to complete setup for the Solarized color scheme witht the Meslo powerline font with Oh My Zsh.

## Adding new files to the project

```
mkrc ~/.filename
```

**Examples:**

```
mkrc ~/.vimrc
mkrc ~/.atom/config.cson  # Nested files also work
mkrc ~/.vim  # And entire directories work too
```

The specified file will be moved to the `~/.dotfiles` directory with the
dot prefix removed. The original file will be deleted,
then symlinked from `~/.dotfiles` back to its original location.
It will now stay in sync and be easily managed with source control.

## Features

- Editor: [vim][] and [atom][]
- Shell: [zsh][]
- Source Control: [git][]

[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
[rcm]: https://github.com/thoughtbot/rcm
[vim]: http://www.vim.org
[atom]: http://atom.io
[zsh]: http://www.zsh.org
[git]: http://git-scm.com
[iTerm2]: https://www.iterm2.com/
[Atom]: https://atom.io/
[Vundle]: https://github.com/VundleVim/Vundle.vim
[Karabiner-Elements]: https://github.com/tekezo/Karabiner-Elements
[Hammerspoon]: http://www.hammerspoon.org/
[nvm]: https://github.com/creationix/nvm
