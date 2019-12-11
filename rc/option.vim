syntax on

filetype plugin indent on
set sh=zsh
" set sh=fish
set t_Co=256
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
set colorcolumn=80
set conceallevel=0
set pumblend=10
" set winblend=5
set helplang=ja,en
highlight NormalFloat guifg=#edf0f5 guibg=#ff0000

" 行末の空白削除
autocmd BufWritePre * :%s/\s\+$//ge
autocmd FileType neosnippet setlocal noexpandtab
autocmd FileType vue syntax sync fromstart
autocmd BufWritePost *.tex :make
autocmd FileType markdown set conceallevel=0
autocmd FileType help set conceallevel=0

if has("persistent_undo")
  set undodir=$HOME/.undodir
  set undofile
endif

command! Reboot source ~/.config/nvim/init.vim

" runtime macros/matchit.vim
" let b:match_words = '\<if\>:\<endif\>,<:>'
