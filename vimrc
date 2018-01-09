syntax on " 语法高亮

" common set
set noundofile
set nobackup
set noswapfile
set encoding=utf-8
set autoread
set autowrite
set fileformats=unix,dos,mac
set backspace=indent,eol,start whichwrap+=<,>,[,]  " 允许退格键的使用
" {{{Vundle start
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'kien/ctrlp.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" {{NERDTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
" }}NERDtree
" {{NERDtree git
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}NERDtree git

colorscheme wombat

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}} Vundle end

"" hlsearch set
set incsearch             " 搜索时逐个高亮搜索词
"set highlight             "
set ignorecase smartcase  " 搜索时忽略大小写 smartcase
"" 表示有一个以上大写字母时对大小写敏感
set laststatus=2          " 总是显示状态行
set hlsearch              " 搜索时高亮被显示的文本
set noerrorbells          "
set showcmd               " 在状态栏显示目前所执行的指令
set showmode              " 在状态栏显示目前的MODE
set cursorline            " 高亮当前行
set completeopt-=preview
set rnu                   " 在每行前显示相对于光标所在的行的行号
set numberwidth=2         " 行数使用的最小列数
set number                " 显示行数

" set listchars=trail:·,tab:>-
set listchars=trail:░,tab:>-
set list

set ruler                 " 打开状态栏标尺
set softtabstop=4         " 使得按退格键可以一次删除4个空格

set cc=120                " 代码行数不要超过80列,
set scrolloff=3           " 光标移动到buffer的顶部和底部时保持3行距离
set autoindent            " 继承前一行的缩进方式，特别适用于多行注释
set smartindent           " 智能缩进

set tabstop=4             " 制表符长度
set softtabstop=4         " 统一缩进为4
set shiftwidth=4          "

set expandtab             " 制表符翻译为空格
if exists('$TMUX')
  set term=screen-256color
endif
