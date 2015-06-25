# A little baby dotfiles repo

*This is just the beginning.*

Managed with [rcm][]

## Installation on a fresh machine

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

## Features

- Editor: [vim][] and [atom][]
- Shell: [zsh][]
- Source Control: [git][]

[rcm]: https://github.com/thoughtbot/rcm
[vim]: http://www.vim.org
[atom]: http://atom.io
[zsh]: http://www.zsh.org
[git]: http://git-scm.com
