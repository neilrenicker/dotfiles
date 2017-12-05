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
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

## Install Vim plugins with Vundle

- Follow instructions to install [Vundle][]

## Set up key mapping:

Install these applications before proceeding:

- [Seil][] *remaps the caps lock key*
- [Karabiner][] *custom key mapping*

### Configure key mapping settings:

- Visit OS X Keyboard settings > Modifier Keys > Map `Caps Lock` to `No Action`
- In Seil Settings, turn on `Change the caps lock key`, and map it to keycode `80`
- Visit Karabiner settings > Misc & Uninstall > Open private.xml, and paste in
[this XML for mapping Caps Lock to Hyper on hold][] (and Escape on tap).
- Return to Karabiner settings > Change Key > Reload XML, and enable the checkboxes for your new custom `F19 to Hyper` binding.

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
[this XML for mapping Caps Lock to Hyper on hold]: https://gist.github.com/tinystride/ff59ef6b96f352f72541
[supported applications]: https://github.com/lra/mackup#supported-applications
[the mackup config docs]: https://github.com/lra/mackup/blob/master/doc/README.md
[Vundle]: https://github.com/VundleVim/Vundle.vim
