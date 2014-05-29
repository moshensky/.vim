set nocompatible              " be iMproved
set encoding=utf-8
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
"
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
"
" My bundles here:
" original repos on GitHub
Bundle 'marijnh/tern_for_vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'altercation/vim-colors-solarized'
"
"" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/kien/ctrlp.vim'

" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed."


" Colors
set t_Co=256
"set background=dark
set background=light
colorscheme solarized


" UltiSnips mapping
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-s>"


" EasyMotion
map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)


" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" Syntax Highlighting
syntax enable
syntax on
filetype plugin indent on


" Indentation
set autoindent
set copyindent
set smartindent


" Powerline
set laststatus=2
set noshowmode


" No tabs, all tab characters are 4 space characters
set tabstop=4
set shiftwidth=4
set expandtab


" Toggle paste mode (to paste properly indented text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>


" Change cursor based on vim mode
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
  
  " solid underscore
  "let &t_SI .= "\<Esc>[5 q"
  " solid block
  "let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif



set showcmd		"show (partial) command in status line
set showmatch		"show matching brackets


" Setting Search behaviour
set ignorecase		"do case insensitive matching
set smartcase		"do smart case matching
set incsearch		"show the pattern while typing
set hlsearch		"highlights searches
" Pressing \<space> clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR>


" Folding
set foldenable
"set foldcolumn=5
set foldmethod=syntax
"bind key 'space' to toggle fold open or closed
nnoremap <space> za


"turn of swap and backup files
set noswapfile
set nobackup
set nowb


"Redefine commands
"use jj to quickly escape to normal mode while typing
inoremap jj <ESC>:w<CR>


"press ; to issue commands in normal mode (no more shift holding)
nnoremap ; :


set langmap=Ч~,ЯQ,ВW,ЕE,РR,ТT,ЪY,УU,ИI,ОO,ПP,Ш{,Щ},АA,СS,ДD,ФF,ГG,ХH,ЙJ,КK,ЛL,ЗZ,ЬZ,ЦC,ЖV,БB,НN,МM,ч`,яq,вw,еe,рr,тt,ъy,уu,иi,оo,пp,ш[,щ],аa,сs,дd,фf,гg,хh,йj,кk,лl,зz,ьz,цc,жv,бb,нn,мm,ьx


" Enable code folding for JavaScript
au FileType javascript call JavaScriptFold()
