"
"set nocompatible               " be iMproved
 filetype off                   " required!


"au au SwapExists *.* let v:swapchoice = 'e'

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'
 
 "This plugin provides a tiny interface for sending commands from MacVim
 "to a separate iTerm or Terminal window without leaving MacVim.
 Bundle 'git://github.com/gcmt/tube.vim.git'

"Commenter - comment uncomment blocks of codes
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
 
"File Browser
Bundle 'git://github.com/scrooloose/nerdtree.git'
 
"Surround : parentheses, brackets, quotes, XML tags, and more.
Bundle 'git://github.com/tpope/vim-surround.git'
 
"Solarized Theme :)
Bundle 'git://github.com/altercation/vim-colors-solarized.git'

Bundle 'git://github.com/croaker/mustang-vim.git'

"Web Browser Reload for Mac
Bundle 'git://github.com/tell-k/vim-browsereload-mac.git'

"CSS Color
Bundle 'git://github.com/mybuddymichael/vim-css-color.git'

"SuperTab - Use <Tab> for all your insert completion needs (:help ins-completion)
Bundle 'git://github.com/ervandew/supertab.git'

"HTML5 omnicomplete and syntax
Bundle 'https://github.com/othree/html5.vim'

"MatchTag - The plugin highlights the matching HTML tag when the cursor is positioned on a tag.
Bundle 'git://github.com/gregsexton/MatchTag.git'

"Vim Shell - Improved integration between Vim and its environment (fullscreen, open URL, background command execution)
Bundle 'git://github.com/xolox/vim-shell.git'

"Official Mirror of UltiSnips trunk on LaunchPad. Send pull requests to SirVer/ultisnips! 
Bundle 'git://github.com/SirVer/ultisnips.git'

"Vim Powerline - Also one for unix https://github.com/Lokaltog/vim-powerline
Bundle 'git://github.com/Lokaltog/vim-powerline.git'

"Vim Shell
Bundle 'Shougo/vimproc'
Bundle 'git://github.com/Shougo/vimshell.git'

"http://www.vim.org/scripts/script.php?script_id=39
"
"
"Autocomplete and Snippets
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'

"Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=1000 "maximum number lines to save for undo on a buffer reload


 " original repos on github
Bundle 'beardedprojamz/vim-colors-blayden'
Bundle 'ujihisa/unite-colorscheme'
 "Bundle 'tpope/vim-fugitive'
 "Bundle 'Lokaltog/vim-easymotion'
 "Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 "Bundle 'FuzzyFinder'
 " non github repos
 "Bundle 'git://git.wincent.com/command-t.git'
 " ...
 "
 "
 "execute pathogen#infect()

filetype plugin indent on " required!

"autocmd VimEnter * NERDTree
set enc=utf-8		"UTF-8
syntax on		"Color syntax highlighting
colorscheme solarized "ir_black
"set t_Co=256
set background=dark
set gfn=Monaco:h12	"Set font to be 18pt Monaco
set spell
let g:cssColorVimDoNotMessMyUpdatetime = 1
set dir=~/.vim/swap "Change where the swap files are saved.
set nowrap		"No Wrapping
set hlsearch		"Highlight search
"set expandtab 	  	"Tabs are spaces, not tabs
set noexpandtab
set tabstop=4           "tell vim how many columns a tab counts for
"set softtabstop=8       " let backspace delete indent 
set shiftwidth=4        "to control how many columns text is indented with the reindent operations
set ignorecase		"Case insensitive search
set autoindent		"Indent at the same level of the previous line
filetype indent on
"set wildmenu		"Show list instead of just completing
"set wildmode=list:longest,full	"Command <Tab> completion, list matches, then longest common part, then all.
set scrolljump=5 	"Lines to scroll when cursor leaves screen
set scrolloff=3 	"Minimum lines to keep above and below cursor
set foldenable  	"Auto fold code
set foldmethod=manual	"Default is "manual" Could use indent
set number		"Line Numbering
setlocal spell spelllang=en_us "English spell checking
set ruler			"Turn on the ruler
filetype plugin on		"Omnicomplete
set ofu=syntaxcomplete#Complete
setlocal omnifunc=syntaxcomplete#Complete
set autochdir
autocmd Filetype perl setlocal omnifunc=syntaxcomplete#Complete
"set wildmode=longest,list,full
set wildmenu

"Auto closing an HTML tag
iabbrev </ </<C-X><C-O>
iabbrev <// </<C-X><C-O>


" PHP Generated Code Highlights (HTML & SQL)                                              
let php_sql_query=1                                                                                        
let php_htmlInStrings=1
 
"Key Maps
map <D-r> :SafariReload<Enter>
"imap <C-Space> <C-X><C-O>

"Remove GUI Fluff, if you would like
:set guioptions-=m	"remove menu bar
:set guioptions-=T	"remove toolbar
:set guioptions-=r	"remove right-hand scroll bar
:set guioptions-=b	"remove bottom scroll bar


"Auto append closing characters for brackets
"inoremap {      {}<left>
"inoremap {<cr>  {<cr>}<esc>o
"inoremap {{     {
"inoremap {}     {}

"Auto append closing characters for html <tags>
"inoremap <      <><left>
"inoremap <<cr>  <<cr>><esc>o
"inoremap <<     <
"inoremap <>     <>

"Safari shortcut style tabbing
inoremap <D-}> :tabn
inoremap <D-{> :tabp



source $HOME/.vim_aliases


au BufRead,BufNewFile *.go set filetype=go

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
:map - <C-W>-
:map + <C-W>+
:map <M-<> <C-W><
:map <M->> <C-W>>
