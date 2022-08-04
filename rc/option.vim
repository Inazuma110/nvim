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
set mouse+=a
" set winblend=5
set wildmode=longest:full,full
set helplang=ja,en
set termguicolors
set pumblend=10
set winblend=20
" highlight NormalFloat guifg=#edf0f5 guibg=#ff0000

" 行末の空白削除
autocmd BufWritePre * :%s/\s\+$//ge
autocmd FileType neosnippet setlocal noexpandtab
autocmd FileType vue syntax sync fromstart
" autocmd BufWritePost *.tex :mklatex
autocmd FileType markdown set conceallevel=0
autocmd FileType help set conceallevel=0
autocmd BufNewFile,BufRead *.jl set filetype=julia
autocmd BufNewFile,BufRead *.tex set filetype=tex
autocmd BufNewFile,BufRead *.hp set filetype=homeposition
autocmd BufNewFile,BufRead *.txt set filetype=help

" after/ftplugin/help.vim
" if &l:buftype !=# 'help'
"   setlocal list tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab textwidth=78
"   if exists('+colorcolumn')
"     setlocal colorcolumn=+1
"   endif
"   if has('conceal')
"     setlocal conceallevel=0
"   endif
" endif

if executable('fcitx')
  augroup fcitx_autodisable
    autocmd!
    autocmd InsertLeave * call system('fcitx-remote -c')
  augroup END
endif

if has("persistent_undo")
  set undodir=$HOME/.undodir
  set undofile
endif

command! Reboot source ~/.config/nvim/init.vim

colorscheme tender
