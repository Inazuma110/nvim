syntax on

filetype plugin indent on
" set sh=zsh
set t_Co=256
set sh=fish
set relativenumber
set number
set smartindent
set showmatch
set clipboard+=unnamedplus
set expandtab
set tabstop+=2
set shiftwidth=2
set autoindent
set encoding=UTF-8
set noswapfile
set shortmess-=S

" 行末の空白削除
autocmd BufWritePre * :%s/\s\+$//ge

autocmd FileType neosnippet setlocal noexpandtab

autocmd FileType vue syntax sync fromstart

command! Reboot source ~/.config/nvim/init.vim