" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

set laststatus=2  " Always display the status line
set backspace=2 " Make backspace work like most other apps
set mouse=a

" Searching
set hlsearch " Highlight search results

"================
" Bundle settings
"================

" Ignore files in NERDTree
let NERDTreeIgnore=['\.git$', 'node_modules$[[dir]]',
  \'bower_components$[[dir]]', '\.o&']

" NERDCommenter needs this
filetype plugin on

" Open NERDTree when vim opens
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeChDirMode = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1

" Turn on indent lines when vim opens
let g:indent_guides_enable_on_vim_startup = 1

" Better indent lines styles
let g:indent_guides_start_level = 2

" Trigger Emmet with the tab key
" https://github.com/mattn/emmet-vim/issues/168#issuecomment-28258900
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" All plugins are sourced with Vundle from this file.
source ~/.vimrc.bundles

" Ignore specific filetypes
source ~/.ignore.vim

" New commands
source ~/.commands.vim

" Custom mappings
source ~/.mappings.vim

" Color themes and font settings
source ~/.theme.vim
