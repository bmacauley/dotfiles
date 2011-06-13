" .vimrc - vim configuration file
" Author: Brian Macauley
" 


set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set shell=C:/cygwin/bin/bash

" file encoding detection
set fileencodings=utf-8,latin1

" vim configuration
"set guioptions-=T "disable tool bar

set nobackup

" Save Vim swp files to a temp directory
"silent execute '!mkdir "'.$VIMRUNTIME.'/temp"'
"silent execute '!del "'.$VIMRUNTIME.'/temp/*~"'
set backupdir=$TEMP//
set directory=$TEMP//



" first clear any existing autocommands:
autocmd!

" ###############	Terminal Settings	#################
"
"
set guifont=Consolas:h10
set lines=55
set co=110

"set horizontal scrollbar on
set guioptions+=b

" Remove menu bar
set guioptions-=m

" Remove toolbar
set guioptions-=T


filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()






"
filetype plugin indent on

colorscheme molokai

" sparkup config
let g:sparkup='C:/Users/bmacauley/vimfiles/ftplugin/html/sparkup.py'



" diff configuration

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" ###############	User Interface		#################

"display ruler
set ruler


"display line numbers
set number


" have syntax highlighting in terminals which can display colours:
  syntax on


" have fifty lines of command-line (etc) history:
set history=50 
"This setting prevents vi from making its annoying beeps when a command doesn't work. 
"Instead, it briefly flashes the screen -- much less annoying.
set vb t_vb=

" remember all of these between sessions, but only 10 search terms; also
" remember info for 10 files, but never any on removable disks, don't
" remember marks in files, don't rehighlight old search patterns, and only save up to
" 100 lines of registers; including @10 in there should restrict input
" buffer
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100


" have command-line completion <Tab> (for filenames, help topics, option
" names)first list the available options and complete the longest common part,
" then have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full


" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r


" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd


" have the mouse enabled all the time:
set mouse=a

 

" ###############	Text Formatting- General	#################

" don't make it look like there are line breaks where there aren't:
set nowrap


" ###############	Text Formatting- General	#################

" enable filetype detection:
filetype on

" show matching brackets
set showmatch

" Automatically save before commands like :next and :make
"set autowrite	



" ###############	Search & Replace	#################

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault



" ###############	Spelling		#################

" define `Ispell' language and personal dictionary, used in several places
" below:
let IspellLang = 'british'
let PersonalDict = '~/.ispell_' . IspellLang



" ###############	Keystrokes- Moving around 		#################

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" page down with <Space> (like in `Lynx', `Mutt', `Pine', `Netscape Navigator',
" `SLRN', `Less', and `More'); page up with - (like in `Lynx', `Mutt', `Pine'),
" or <BkSpc> (like in `Netscape Navigator'):
noremap <Space> <PageDown>
noremap <BS> <PageUp>
noremap - <PageUp>
" [<Space> by default is like l, <BkSpc> like h, and - like k.]

" scroll the window (but leaving the cursor in the same place) by a couple of
" lines up/down with <Ins>/<Del> (like in `Lynx'):
"noremap <Ins> 2<C-Y>
"noremap <Del> 2<C-E>
" [<Ins> by default is like i, and <Del> like x.]

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

" have % bounce between angled brackets, as well as t'other kinds:
" 
set matchpairs+=<:>

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F0> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>



" ###############	Keystrokes- formatting		#################

" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$



" ###############	Keystrokes- toggles		#################

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>
" [<Ctrl>+V <Tab> still inserts an actual tab character.]

" abbreviations:
iabbrev lfpg Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch



