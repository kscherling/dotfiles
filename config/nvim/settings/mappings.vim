command! Q q
command! W w
command! Wq wq
command! Qa qa

" Use 0 to go to first character instead of beginning of line
nnoremap 0 ^

" Use ctrl-h/j/k/l to move between splits
nnoremap <C-h> <C-W><C-h>
nnoremap <C-j> <C-W><C-j>
nnoremap <C-k> <C-W><C-k>
nnoremap <C-l> <C-W><C-l>

nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>so :source $MYVIMRC<cr>

" Use tab for autocompletion
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
