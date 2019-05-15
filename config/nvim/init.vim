" if executable('pyenv')
" 	system('
" \ pyenv install 2.7.11
" \ pyenv install 3.4.4
" \
" \ pyenv virtualenv 2.7.11 neovim2
" \ pyenv virtualenv 3.4.4 neovim3
" \
" \ pyenv activate neovim2
" \ pip install neovim
" \
" \ pyenv activate neovim3
" \ pip install neovim
" ')
" 	let g:python_host_prog = system('
" \ pyenv activate neovim2
" \ pyenv which python
" ')
" 	let g:python3_host_prog = system('
" \ pyenv activate neovim3
" \ pyenv which python
" ')
" endif
"
if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif

for config_file in split(glob('~/.config/nvim/settings/**/*'), '\n')
  if filereadable(config_file)
    execute 'source' config_file
  endif
endfor
