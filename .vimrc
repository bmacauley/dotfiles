" => Info {{{
"
" Name: .vimrc
" Author: Brian Macauley
" Version: 2 - 04/04/2015

" }}}


" => Environment {{{

"Basics
set nocompatible

" file encoding detection
set fileencodings=utf-8,latin1

" =============================================================
"  Vim plugins
" =============================================================
" setup Vundle bundle support
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


"Molokai colour scheme
Plugin 'tomasr/molokai'

"Solarized colour scheme
Plugin 'altercation/vim-colors-solarized'

"Fugitive git tools
"https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" vim-gitgutter - git diff in the vim gutter
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

"Gist - access github gists
"http://vimawesome.com/plugin/gist-vim
Plugin 'mattn/gist-vim'

"vim airline addon - powerline clone - vimscript
Plugin 'bling/vim-airline'
"https://github.com/bling/vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1 
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
"buggy iterm2 patched font handling, turn off airline separators 
"in terminal vim
if &term == 'xterm-256color'
    let g:airline_left_sep=''
    let g:airline_right_sep=''
endif

" vim powerline - python
"Plugin 'powerline/powerline'
"let g:Powerline_symbols = 'fancy'

" Minibufexplorer - buffer explorer
"Plugin 'fholgado/minibufexpl.vim'
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" simplefold - space-optimized, configurable folds
" https://github.com/vim-scripts/simplefold
Plugin 'vim-scripts/simplefold' 

" l9 - provides some utility functions and commands for programming in Vim
" https://github.com/vim-scripts/L9
Plugin 'vim-scripts/L9'

" vim-webapi - interface to web API's eg Github/Gist
" https://github.com/mattn/webapi-vim
Plugin 'mattn/webapi-vim'


" supertab - perform all inserts operations with tab
" https://github.com/ervandew/supertab
Plugin 'ervandew/supertab'

"NERDTree file manager
Plugin 'scrooloose/nerdtree'
"https://github.com/scrooloose/nerdtree
" use F10 to toggle NERDTree
nnoremap <silent> <F10> :NERDTreeToggle<CR>

" NERDCommenter - intensely orgasmic commenting
" https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdcommenter'

"the silver searcher - ag
"https://github.com/rking/ag.vim
Plugin 'rking/ag.vim'

"Ctrl-p - fuzzy search
"https://github.com/kien/ctrlp.vim
Plugin 'kien/ctrlp.vim'

" Syntastic - syntax checking
" https://github.com/scrooloose/syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_open=0
let g:syntastic_python_checker="flake8"

" tagbar - class outline viewer
" http://majutsushi.github.io/tagbar/
" requires ctags to be installed
Plugin 'majutsushi/tagbar'
" use F9 to toggle tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>

" Ultisnips - snippet manager
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

" Unite  ...and create interfaces...universal search tool
" https://github.com/Shougo/unite.vim
Plugin 'Shougo/unite.vim'

" surround - quoting/parethesizing made simple
" https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'

" vim-repeat - enable repeating supported plugin maps with .
" https://github.com/tpope/vim-repeat
Plugin 'tpope/vim-repeat'

" vim-unimpaired - pairs of handy bracket mappings
" https://github.com/tpope/vim-unimpaired
Plugin 'tpope/vim-unimpaired'


" yankring - Maintains a history of previous yanks, changes and deletes
" https://github.com/vim-scripts/YankRing.vim
Plugin 'vim-scripts/YankRing.vim'
let g:yankring_replace_n_nkey = '<Leader>p'
let g:yankring_replace_n_pkey = '<Leader>n'

" gundo - visualize your Vim undo tree.
" https://github.com/sjl/gundo.vim
Plugin 'sjl/gundo.vim'

" python mode
" https://github.com/klen/python-mode
Plugin 'klen/python-mode'
" Python-mode
" Activate rope
" Keys
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

"python_editing
" https://github.com/vim-scripts/Efficient-python-folding
Plugin 'vim-scripts/Efficient-python-folding'

" Jedi-vim - jedi autocompletion library
" https://github.com/davidhalter/jedi-vim 
Plugin 'davidhalter/jedi-vim'

" vim-autoclose - enable an auto-close chars feature
" https://github.com/Townk/vim-autoclose
Plugin 'Townk/vim-autoclose'

"YouCompleteMe - fast, as-you-type, fuzzy-search code completion engine for Vim
" integrates with Ultisnips and jedi-vim
"http://valloric.github.io/YouCompleteMe/
"Plugin 'Valloric/YouCompleteMe'

" vim-tabular - Vim script for text filtering and alignment
" https://github.com/godlygeek/tabular
Plugin 'godlygeek/tabular'

" vim-markdown - 
" http://plasticboy.com/markdown-vim-mode/
Plugin 'plasticboy/vim-markdown'

" Emmet - HTML and CSS hi-speed coding
" http://mattn.github.io/emmet-vim/
Plugin 'mattn/emmet-vim'

" vim-sparkup - parser for a condensed HTML format
" https://github.com/rstacruz/sparkup
Plugin 'rstacruz/sparkup'

"vim-javascript - improved Javascript indentation and syntax support in Vim
" https://github.com/pangloss/vim-javascript
Plugin 'pangloss/vim-javascript'

" vim-coffeescript - CoffeeScript support
" https://github.com/kchmck/vim-coffee-script
Plugin 'kchmck/vim-coffee-script'

" vim-angular - AngularJS with Vim
" https://github.com/burnettk/vim-angular
Plugin 'burnettk/vim-angular'

" grails-vim - Grails project support
" https://github.com/NathanNeff/grails-vim
Plugin 'NathanNeff/grails-vim'

" rails - Ruby on Rails power tools
" https://github.com/tpope/vim-rails
Plugin 'tpope/vim-rails'

" vim-django -  django things in vim
" http://cwood.github.io/vim-django/
Plugin 'cwood/vim-django'

" vim-go - 
" https://github.com/fatih/vim-go
Plugin 'fatih/vim-go'
let $GOPATH = "$HOME/go/bin"
let $GOROOT = "/usr/local/Cellar/go/1.4.2/libexec"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-less - vim syntax for LESS (dynamic CSS)
" https://github.com/groenewege/vim-less
Plugin 'groenewege/vim-less'

" indentLine - display the indention levels with thin vertical lines
" https://github.com/Yggdroot/indentLine
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
" indent chars: ¦ │
let g:indentLine_char = '¦'
let g:indentLine_color_term = 238

" tasklist - Eclipse like task list
" https://github.com/vim-scripts/TaskList.vim
Plugin 'vim-scripts/TaskList.vim'
map <Leader>ta <Plug>TaskList

" vim-jsx - React JSX syntax highlighting and indenting
" https://github.com/mxw/vim-jsx
Plugin 'mxw/vim-jsx'

"html5 - 
"https://github.com/othree/html5.vim
Plugin 'othree/html5.vim'



call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" vim configuration
"set guioptions-=T "disable tool bar

" Save Vim swp files to a temp directory
"silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
"silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'
"set backupdir=$TEMP//
"set directory=$TEMP//
silent execute '!mkdir ~/.backup'
silent execute '!rm ~/.backup/* '
set backupdir=~/.backup//
set directory=~/.backup//





" first clear any existing autocommandse
autocmd!

" }}}


" => General {{{

filetype plugin indent on " Automatically detect file types
syntax enable " syntax highlighting
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
set ttymouse=xterm2
set shortmess+=filmnrxoOtT     " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd


" }}}


" => Vim User Interface{{{

set lines=55
set columns=110
"Macvim font
set guifont=Inconsolata\ for\ Powerline:h14

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

" Vim statusline config...if not using powerline/airline
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
" set fold code "python-fold config
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


" move between window splits
" move up
map <C-j> <C-W>j
" move down
map <C-k> <C-W>k
" move left
map <C-h> <C-W>h
" move right
map <C-l> <C-W>l


 " Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

"Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"spelling shortcuts using <leader>
"move to next misspelled word
map <leader>sn ]s
" move to previous misspelled word
map <leader>sp [s
" add word under the cursor as a good word to the spellfile
map <leader>sa zg
" suggest correctly spelled words for word under cursor
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





" }}}


