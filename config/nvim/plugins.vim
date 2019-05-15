call plug#begin('~/.config/nvim/plugged')
" Language pack that includes most languages
Plug 'sheerun/vim-polyglot'

" JavaScript
Plug 'moll/vim-node', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'js', 'jsx'] }
Plug 'neoclide/vim-jsx-improve', { 'for': ['javascript', 'js', 'jsx'] }
Plug '1995eaton/vim-better-javascript-completion', { 'for': ['javascript', 'js', 'jsx'] }

" Typescript
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript'] }
Plug 'mhartington/nvim-typescript', { 'for': ['typescript'] }

" GraphQL
Plug 'jparise/vim-graphql'

" Ruby
Plug 'tpope/vim-endwise' " Adds 'end' and other things automatically in Ruby

" Text

" Tests

" Happiness
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim' " gc to toggle comments
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Syntax colors
Plug 'kristijanhusak/vim-hybrid-material'

call plug#end()
