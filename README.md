# A little baby dotfiles repo

*This is just the beginning.*

Managed with [rcm][]

## Installation on a fresh machine

### Application Installation

Install these OS X applications before proceeding:

- [iTerm2][] *terminal emulator*
- [Atom][] *editor*
- [Seil][] *remaps the caps lock key*
- [Karabiner][] *custom key mapping*

### Dotfiles Installation:

After cloning the repo to `~/.dotfiles`, install [rcm][]:

```
brew tap thoughtbot/formulae
brew install rcm
```

Do a dry run to see which files will be symlinked:

```
lsrc
```

If you're satisfied with the dry run, install the dotfiles on your system:

```
rcup
```

## Set up key mapping:

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

[rcm]: https://github.com/thoughtbot/rcm
[vim]: http://www.vim.org
[atom]: http://atom.io
[zsh]: http://www.zsh.org
[git]: http://git-scm.com
[iTerm2]: https://www.iterm2.com/
[Atom]: https://atom.io/
[Seil]: https://pqrs.org/osx/karabiner/seil.html.en
[Karabiner]: https://pqrs.org/osx/karabiner/
[this XML for mapping Caps Lock to Hyper on hold]: https://gist.github.com/tinystride/ff59ef6b96f352f72541
