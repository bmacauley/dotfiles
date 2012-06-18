" => Info {{{
"
" Name: .vimrc
" Author: Brian Macauley
" Version: 1 - 13/06/2011
"
" Sections:
" Environment

" Plugins:
""Plugin

" }}}


" => Environment {{{

"Basics
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim


"Windows compatible
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier. 
"if has('win32') || has('win64')
"    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
"endif
"
source $VIMRUNTIME/mswin.vim
behave mswin
"set shell=C:/cygwin/bin/bash

" file encoding detection
set fileencodings=utf-8,latin1

" setup Pathogen bundle support
filetype off

let g:pathogen_disabled = [ 'dbext', 'makegreen', 'command-t', 'taglist', 'xptemplate' , 'piv']  "disabled plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" vim configuration
"set guioptions-=T "disable tool bar

" Save Vim swp files to a temp directory
"silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
"silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'
"set backupdir=$TEMP//
"set directory=$TEMP//
silent execute '!mkdir .backup'
silent execute '!rm ~/.backup/* '
set backupdir=~/.backup//
set directory=~/.backup//





" first clear any existing autocommandse
autocmd!

" }}}


" => General {{{

filetype plugin indent on " Automatically detect file types
syntax on " syntax highlighting
colorscheme molokai

"set background=dark
"let g:solarized_termcolors = 256
"colorscheme solarized

set history=1000 " Store a ton of history (default is 20)
" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't
" remember marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input
" buffer
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100
set mouse=a " automatically enable mouse usage
set ttymouse=xterm
set shortmess+=filmnrxoOtT     " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd


" }}}


" => Vim User Interface{{{

set lines=55
set columns=110

if has('gui_win32')
    set guifont=Consolas:h10
    set guioptions+=b "set horizontal scrollbar on
    set guioptions-=m " Remove menu bar
    set guioptions-=T " Remove toolbar
endif

set ruler "display ruler
set number "display line numbers

"This setting prevents vi from making its annoying beeps when a command doesn't work. 
"Instead, it briefly flashes the screen -- much less annoying.
set vb t_vb=

"if has('cmdline_info')
"	set ruler                  	" show the ruler
"	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
"	set showcmd                " show partial commands in status line and
" selected characters/lines in visual mode
"endif


if has('statusline')
    set laststatus=2

	" Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
"    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
		"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full 
set wildmenu  " show list instead of just completing
set showmatch " show matching brackets
set incsearch " find as you type search
set hlsearch " highlight search terms
set ignorecase " case insensitive search
set smartcase " case sensitive when upper case present
set matchpairs+=<:> "have % bounce between angled brackets,etc
set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
set gdefault " the /g flag on :s substitutions by default
set backspace=indent,eol,start	" backspace for dummy
"set linespace=0 " No extra spaces between rows
set scrolljump=5 " lines to scroll when cursor leaves screen
set scrolloff=3 " minimum lines to keep above and below cursor
set foldenable  " auto fold code
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
set nospell spelllang=en_gb
setlocal nospell spelllang=en_gb
hi SpellBad     cterm=underline  ctermbg=235
" }}}


" =>  Formatting{{{

set nowrap " wrap long lines
set autoindent " indent at the same level of the previous line
set shiftwidth=4  " use indents of 4 spaces
set expandtab " tabs are spaces, not tabs
set tabstop=4 " an indentation every four columns
set softtabstop=4 " let backspace delete indent
hi ColorColumn ctermbg=236 guibg=lightgrey
" }}}


" => {{{Key mappings

"The default leader is '\', but many people prefer ',' as it's in a standard
"location
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = ","
"let g:mapleader = ","

 " Making it so ; works like : for commands. Saves typing and eliminates 
 " :W style typos due to lazy holding shift.
nnoremap ; :
"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>


" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Smart mappings on the command line
"home directory
cno $h e ~/  
"desktop
cno $d e ~/Desktop/
" current directory
cno $j e ./


" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


 " Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"spelling hortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" close buffers, but not the window or split window
map fc <Esc>:call CleanClose(1)

map fq <Esc>:call CleanClose(0)

function! CleanClose(tosave)
    if (a:tosave == 1)
            w!
        endif
        let todelbufNr = bufnr("%")
        let newbufNr = bufnr("#")
        if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
                exe "b".newbufNr
            else
                    bnext
                endif

                if (bufnr("%") == todelbufNr)
                        new
                    endif
                    exe "bd".todelbufNr
                endfunction


" }}}


" => {{{Plugins

" Ack {{{

let g:ackprg = 'ack-grep'

" }}}

"MiniBufExplorer {{{
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"}}}

" NerdTree {{{
" use F10 to toggle NERDTree
nnoremap <silent> <F10> :NERDTreeToggle<CR>
" }}}

" SuperTab {{{



" }}}

" SnipMate {{{



" }}}

" Tagbar {{{

" use F9 to toggle tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

"}}}

" Tasklist {{{

"change key map <leader> t conflicts with Command-T
map <Leader>ta <Plug>TaskList

" }}}

" Vim-Powerline{{{
let g:Powerline_symbols = 'compatible'
" }}}

"Yankring {{{
"

let g:yankring_replace_n_nkey = '<Leader>p'
let g:yankring_replace_n_pkey = '<Leader>n'
"}}}

" }}}

