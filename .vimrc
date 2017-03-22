syntax on
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'tpope/vim-repeat'
Plugin 'ctrlpvim/ctrlp.vim' " search filenames
" Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'mxw/vim-jsx'
" Plugin 'mtscout6/vim-cjsx'
Plugin 'tpope/vim-endwise' " Adds 'end' and other things automatically in Ruby
" Plugin 'tpope/vim-rake'
" Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails' " Navigation and rails, rake access
Plugin 'tomtom/tcomment_vim' " gc to toggle comments
Plugin 'tpope/vim-fugitive' " git
Plugin 'tpope/vim-surround' "
Plugin 'FelikZ/ctrlp-py-matcher' " faster matcher for ctrlp
" Plugin 'christoomey/vim-tmux-navigator' " jump between tmux and vim panes the
Plugin 'bling/vim-airline' " status bar. show current branch, mode, tab, etc
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim' " Uses the Ag searcher to search like grep
Plugin 'ervandew/supertab'
" Plugin 'msanders/snipmate.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript' " Better JS highlighting and indenting
Plugin 'Raimondi/delimitMate' " Autoclosing of quotes, parens, etc.
"ePlugin 'skwp/greplace.vim' " Global search and replace
" Plugin 'dkprice/vim-easygrep' " Find and replace across multiple files
Plugin 'thoughtbot/vim-rspec'
" Plugin 'ngmy/vim-rubocop'
" Plugin 'wookiehangover/jshint.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim' " Use local eslint install
" Plugin 'lambdatoast/elm.vim'
Plugin 'ElmCast/elm-vim'
Plugin 'avh4/elm-format'
call vundle#end()
filetype plugin indent on
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
map <C-h> <C-w>h

map <C-j> <C-w>j

map <C-k> <C-w>k
map <C-l> <C-w>l
endif
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
let NERDTreeHijackNetrw=1
let mapleader="\<Space>"
let os=substitute(system('uname'), '\n', '', '')
let g:ScreenImpl='Tmux'
let g:ScreenShellTmuxInitArgs='-2'
let g:ScreenShellInitialFocus='shell'
let g:ScreenShellQuitOnVimExit = 0
" command -nargs=? -complete=shellcmd W :w | :call ScreenShellSend("load",'".@%."';")
map <Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :e<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>
map <F5> :ScreenShellVertical<CR>
nnoremap 0 ^
nnoremap <leader>, :e#<cr>
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>vi :e ~/.vimrc<cr>
nnoremap <leader>pi :PluginInstall<cr>:q<cr>
nnoremap <leader>o :CtrlP<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>c :TComment<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <C-s> :w<cr>
map - dd
imap ,, <ESC>
nmap ; :CtrlPBuffer<CR>
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
nnoremap <S-Up> <Esc>:m-2<CR>
nnoremap <S-Down> <Esc>:m+<CR>
nnoremap <leader>g :Ag <cword><cr>
noremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
imap <C-o> <esc>o
nnoremap <leader>s :%s/\<<C-r><C-w>\>/
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_match_window = 'results:100'
if has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_show_hidden = 1
if executable('ag')
  let g:ctrlp_user_command = 'ag %s --files-with-matches -g ""'
  set grepprg=ag
  let g:ctrlp_use_caching = 0
  nnoremap <Leader>gr :Ag <cword><cr>
  let g:AgSmartCase = 1
  " nnoremap <leader>g :Ag <cword><cr>:copenj
  " nnoremap <leader>g :exec 'Ag' expand('<cword>')<Cr>
endif
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
colorscheme monokai
set wildignore+=*/tmp*/,*.swp,*.zip,*.scssc
set wildignore+=*/generated/*,*/images/*,*/node_modules/*,tmp/,*/rails-bundle.js*,*/public
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab
set lazyredraw " When executing macros will wait to redraw until complete
set encoding=utf-8
set pastetoggle=<F2> " turn on and off paste mode (for indentation)
set t_ut=
set showcmd
set nowrap
set textwidth=0 wrapmargin=0
set noswapfile
set nobackup
set nowb
set backspace=2 " make backspace work like most other apps
set incsearch
set hlsearch
let g:ScreenShellGnuScreenVerticalSupport = 'native'
set ignorecase
set smartcase
set cursorline
set path+=lib/extras
set wildmenu
set wildmode=list:longest
set splitright
set splitbelow
set timeoutlen=400
set laststatus=2
set hidden
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
au BufRead,BufNewFile *.hamlc set ft=haml
set number
set autoread
au CursorHold * checktime
ca Ag Ag!
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:mustache_abbreviations = 1
let g:elm_format_autosave = 1

" Recommended Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic checkers config
let g:syntastic_ruby_checkers = ["rubocop"]
let g:syntastic_elm_checkers = ["elm_make"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_handlebars_checkers  = ['handlebars']
let g:syntastic_loc_list_height = 5
let g:syntastic_filetype_map = {
      \   'html.handlebars': 'handlebars',
      \   'hbs': 'handlebars',
      \ }

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*
