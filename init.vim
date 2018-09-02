" reset augroup
augroup MyAutoCmd
autocmd!
augroup END

if !&compatible
  set nocompatible
endif
" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
let s:toml_lazyfile = fnamemodify(expand('<sfile>'), ':h').'/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#load_toml(s:toml_lazyfile)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" py3 support
let g:python3_host_prog = '/usr/bin/python3'

syntax on

filetype plugin indent on
set sh=bash
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
"filetype plugin indent on


inoremap <silent> <unique> <Esc> <Esc>:set imsearch=0 iminsert=0<CR>
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" キーマップ
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>
inoremap <silent> jk <ESC>
inoremap <silent> ｊｋ <ESC>
inoremap <silent> kj <ESC>
inoremap <silent> ｋｊ <ESC>
inoremap <silent> kk <ESC>
inoremap <silent> っｋ <ESC>

nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
"nnoremap tn :<C-u>tabnew<CR>
"terminal key map
tnoremap <silent> <C-[> <C-\><C-n>

