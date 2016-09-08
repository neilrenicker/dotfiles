" This line must be the first line in the file
" to ensure all instances of <leader> are affected
let mapleader = ","

" Use ; for : to avoid using the Shift key
nnoremap ; :
vnoremap ; :

" Press Enter to save in normal mode
nnoremap <CR> :w<CR>

" Press Q to exit in normal mode
nnoremap Q :q<CR>

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

" ===============
" Bundle Mappings
" ===============

" CtrlP mappings
nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" NERDTree mappings
nnoremap <silent><leader>nn :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>:wincmd =<CR>

" NERDCommenter mappings
nnoremap <silent><leader>cc :NERDComMinimalComment<CR>:wincmd =<CR>

" Remap :Ag
nnoremap <leader>ag :Ag<space>

" Vim Fugitive mappings 
" From https://github.com/mutewinter/dot_vim/blob/master/vundle_plugins/vim-fugitive.vim
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" Exit a diff by closing the diff window
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
nnoremap <leader>gi :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1

