"TODO:
"how to set font size
"hpw to set status line


"set NOCOMPATIBLE
set nocompatible


call pathogen#infect()
"call pathogen#Helptags


"set font and size
set guifont=Consolas


"color scheme evening or desert
colorscheme molokai "desert 
let g:molokai_original = 1 " 1 original, 0 dark background


"Syntax Highlighting
syntax enable
syntax on
filetype plugin indent on


"Identation
set autoindent
set copyindent
set smartindent

"toggle paste mode (to paste properly indented text)
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


"Adding menu items
amenu		Tabs.&Delete		:confirm tabclose<cr>
amenu		Tabs.&Alternate		:confirm tabn #<cr>
amenu		<silent>Tabs.&Next	:tabnext<cr>
amenu		<silent>Tabs.&Previous	:tabprevious<cr> 


"Adding Toolbar Icons
amenu icon=$VIM/vimfiles/bitmaps/test.bmp ToolBar.Bufferlist :buffers<cr>


"Adding Line Numbers
set number
set numberwidth=5
highlight LineNr guibg=#555555 guifg=#FFFFFF 


"show line and column markers
set cursorline
set cursorcolumn


set showcmd		"show (partial) command in status line
set showmatch		"show matching brackets


"Setting Search behaviour
set ignorecase		"do case insensiive matching
set smartcase		"do smart case matching
set incsearch		"show the pattern while typing
set hlsearch		"highlights searches
"Presing \<space> clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR>


"Folding
set foldenable
set foldcolumn=5
set foldmethod=syntax
"bind key 'space' to toggle fold open or closed
nnoremap <space> za


"turn of swap and backup files
set noswapfile
set nobackup
set nowb



"Redefine commands
"use jj to quickly escape to normal mode while typing
inoremap jj <ESC>
"press ; to issue commands in normal mode (no more shift holding)
nnoremap ; :


" Statusline (c) Winterdom
" http://winterdom.com/2007/06/vimstatusline
 
set ls=2 " Always show status line
if has('statusline')
   " Status line detail:
   " %f     file path
   " %y     file type between braces (if defined)
   " %([%R%M]%)   read-only, modified and modifiable flags between braces
   " %{'!'[&ff=='default_file_format']}
   "        shows a '!' if the file format is not the platform
   "        default
   " %{'$'[!&list]}  shows a '*' if in list mode
   " %{'~'[&pm=='']} shows a '~' if in patchmode
   " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
   "        only for debug : display the current syntax item name
   " %=     right-align following items
   " #%n    buffer number
   " %l/%L,%c%V   line number, total number of lines, and column number
   function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=buff:#%n line:%l/%L col:%c%V "
      else
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=buff:#%n line:%l/%L col%c%V "
      endif
   endfunc
   " Switch between the normal and vim-debug modes in the status line
   nmap _ds :call SetStatusLineStyle()<CR>
   call SetStatusLineStyle()
   " Window title
   if has('title')
      set titlestring=%t%(\ [%R%M]%)
   endif
endif




