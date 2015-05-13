" This line must be the first line in the file
" to ensure all instances of <leader> are affected
let mapleader = ","

" Use ; for : to avoid using the Shift key
nnoremap ; :
vnoremap ; :

" Press Enter to save in normal mode
nnoremap <CR> :w<CR>

" A more accessible escape key.
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

" Yank text to the OS X clipboard
" From http://www.drbunsen.org/the-text-triumvirate/
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
" From http://www.drbunsen.org/the-text-triumvirate/
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap U <C-r>

" Force myself not to use arrow keys to navigate:
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
