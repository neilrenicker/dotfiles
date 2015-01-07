" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

set laststatus=2  " Always display the status line
set backspace=2 " Make backspace work like most other apps
set mouse=a

" Open NERDTree when vim opens
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Sourcing
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

source ~/.ignore.vim

" Softtabs, 2 spaces
set tabstop=2

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Force myself not to use arrow keys to navigate:
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Theming
syntax enable
set background=dark
colorscheme solarized
