syntax on
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'godlygeek/tabular' "Used by vim-markdown
Plugin 'plasticboy/vim-markdown'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim' " search filenames
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-endwise' " Adds 'end' and other things automatically in Ruby
Plugin 'tpope/vim-rails' " Navigation and rails, rake access
Plugin 'tomtom/tcomment_vim' " gc to toggle comments
Plugin 'tpope/vim-fugitive' " git
Plugin 'tpope/vim-surround' "
Plugin 'FelikZ/ctrlp-py-matcher' " faster matcher for ctrlp
Plugin 'bling/vim-airline' " status bar. show current branch, mode, tab, etc
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim' " Uses the Ag searcher to search like grep
Plugin 'ervandew/supertab'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript' " Better JS highlighting and indenting
Plugin 'Raimondi/delimitMate' " Autoclosing of quotes, parens, etc.
Plugin 'thoughtbot/vim-rspec'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/syntastic'
Plugin 'mtscout6/syntastic-local-eslint.vim' " Use local eslint install
Plugin 'ElmCast/elm-vim'
Plugin 'avh4/elm-format'
Plugin 'elixir-lang/vim-elixir'
call vundle#end()
filetype plugin indent on

" Use spacebar as leader
let mapleader="\<Space>"

" Strip trailing whitespaces on save
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" NERDTree
let NERDTreeHijackNetrw=1
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

" Reloading convenience commands
nnoremap <leader>so :source $MYVIMRC<cr>
nnoremap <leader>vi :e ~/.vimrc<cr>
nnoremap <leader>pi :PluginInstall<cr>:q<cr>

" Ctrl-p https://github.com/ctrlpvim/ctrlp.vim
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
endif

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

colorscheme monokai
set wildignore+=*/tmp*/,*.swp,*.zip,*.scssc,*/generated/*,*/images/*,*/rails-bundle.js*,*/public,*/node_modules/*,*/bower_components/*

" Text settings
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab
set nowrap
set textwidth=0 wrapmargin=0
set encoding=utf-8

set lazyredraw " When executing macros will wait to redraw until complete
set backspace=2 " make backspace work like most other apps
set showcmd

" Disable swap files
set noswapfile
set nobackup
set nowb

" Search case insensitivity
set ignorecase
set smartcase

" Highlight cursor line
set cursorline

set timeoutlen=400

" Show current file in bottom of window
set laststatus=2

" Allow opening new file without saving previous buffer
set hidden

" Disable folding on open
set nofoldenable

" Use :Ag for search
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
ca Ag Ag!

" Treat .hamlc files as .haml files
au BufRead,BufNewFile *.hamlc set ft=haml

" Show line numbers
set number

" Prompt reload if file has changed
au CursorHold * checktime

" Open buffers on the right and bottom
set splitright
set splitbelow

" Navigate between visible buffers with Ctrl + hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

let g:mustache_abbreviations = 1
let g:elm_format_autosave = 1

" Syntastic settings
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

" Style Syntastic signs
let g:syntastic_error_symbol = "☠"
let g:syntastic_warning_symbol = "⚠️"
let g:syntastic_style_warning_symbol = "⚠️"
let g:syntastic_style_error_symbol = "☢"
hi link SyntasticErrorSign SignColumn
hi link SyntasticWarningSign SignColumn

" Convert old-style Ruby hashes to new symbol-key hashes
command! -range=% ConvertHashes <line1>,<line2>s/:\(\w\+\)\ =>/\1:/g
