" 取消兼容vi
set nocompatible              " be iMproved, required
filetype off                  " required
set ts=4
set sw=4
set bs=2

" 显示行号
set nu

" 搜索时忽略大小写
set ic

" 设置搜索结果全部高亮
"set hlsearch
let mapleader='\'

" 打开文件时跳转到上次编辑的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 打开语法高亮
syntax on

" 支持在其他三巨头文件中的js语法高亮
let javascript_enable_domhtmlcss = 1

" nerdtree配置，若vim打开文件夹则自动打开nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" nerdtree自动包含隐藏文件
let NERDTreeShowHidden=1

" mn打开nerdtree
map mn :NERDTreeToggle<CR>

" 关闭markdown块折叠
let g:vim_markdown_folding_disabled = 1

" vim中的剪切板重定向到系统剪切板
set clipboard=unnamed

" 启用鼠标控制光标
set mouse=a

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 来自GitHub的插件
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/loremipsum'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'posva/vim-vue'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rizzatti/dash.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub

" git repos on your local machine (i.e. when working on your own plugin)

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ycm配置
let g:ycm_seed_identifiers_with_syntax = 1
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=1    " 从第1个键入字符就开始罗列匹配项
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files= 1
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings = 1

let g:ycm_semantic_triggers = {
\'css': [ 're!^\s{4}', 're!:\s+', 're!^\t' ],
\'javascript': ['.'],
\'html': ['re!</'],
\'vue': ['re!</'],
\}

" 基本的vundle命令
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let Tlist_Show_One_File=1 " 只显示当前文件的列表
let Tlist_Exit_OnlyWindow=1 " 只存在Tag列表窗口时，自动关闭Tag列表窗口
let Tlist_File_Fold_Auto_Close=1 " 打开的其他文件的列表折叠
let Tlist_Show_Menu=1 " 显示Taglist菜单

" 将eslint设置为javascript的检查器
let g:syntastic_javascript_checkers = ['eslint']

" emmet 快捷键（设置为在normal下用tab）
let g:user_emmet_leader_key='<S-z>'

" 恐怖如斯的jk
inoremap jk <esc>

" 快捷键定义
nmap <S-w> :w<CR>
nmap <S-q> :q!<CR>
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" 保存文件时自动format
autocmd BufWritePre *.js,*html,*css :Autoformat<CR>

" html
autocmd filetype html nmap <tab> <S-z>,

" js
autocmd filetype js,html,css set ts=2 | set sw=2

" 设置高亮.vue文件
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
