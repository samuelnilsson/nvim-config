"PLUGINS
"----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

"Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

"Git wrapper
Plug 'tpope/vim-fugitive'

"Fuzzy file search
if has("unix")
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif

if has("win32")
	Plug 'ctrlpvim/ctrlp.vim'
endif

"Color scheme
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-solarized8'

"Auto completion engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
if has("win32")
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

"Auto completion sources
if has("nvim")
	Plug 'mhartington/nvim-typescript'
else
	Plug 'Quramy/tsuquyomi'
	Plug 'rudism/deoplete-tsuquyomi'
endif
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'

"Extended status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Syntax checking
Plug 'w0rp/ale'

"Highlighting for different languages
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'groenewege/vim-less'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'gko/vim-coloresque'
Plug 'chrisbra/Colorizer'
Plug 'kchmck/vim-coffee-script'
Plug 'stanangeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'cakebaker/scss-syntax.vim'

"Change surroundings in pairs
Plug 'tpope/vim-surround'

"Commenting
Plug 'scrooloose/nerdcommenter'

"Display tags in a window
Plug 'majutsushi/tagbar'

if !has("win32")
	"Show git diff in file
	Plug 'airblade/vim-gitgutter'
endif

"Expand abbreviations
Plug 'mattn/emmet-vim'

"Multicursor in Sublime Text style
Plug 'terryma/vim-multiple-cursors'

"Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

"Auto insert closing characters
Plug 'jiangmiao/auto-pairs'

"Fast motions
Plug 'easymotion/vim-easymotion'

"Easy find and replace across multiple files
Plug 'eugen0329/vim-esearch'

"For 'distraction-free' writing of non-code documents
Plug 'junegunn/goyo.vim'

"Golang support
Plug 'fatih/vim-go'

"CS support
Plug 'OmniSharp/omnisharp-vim'

"Add indent lines
Plug 'Yggdroot/indentLine'

"Auto completion for node
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

"Generate JsDoc comments
Plug 'heavenshell/vim-jsdoc'

"Automatic tab insertion on newline
Plug 'Raimondi/delimitMate'

"Automatically detect indentation style
Plug 'tpope/vim-sleuth'

"Easy alignment
Plug 'junegunn/vim-easy-align'

call plug#end()

"GENERAL SETTINGS
"----------------------------------------------------------------------------

filetype plugin on

"Enable line numbers
set number
"Enable relative line numbers
set relativenumber

"Set leader to use comma
let mapleader=","

"Set line at 80 characters
let &colorcolumn=join(range(81,999),",")

"Convenient remap of copying from and to clipboard
map <Leader>y "*y
map <Leader>p "*p

"Enable project specific vimrc files
set exrc

"ICONS
"----------------------------------------------------------------------------

set encoding=utf8

"COLORS
"----------------------------------------------------------------------------

syntax enable
set background=dark
let g:solarized_use16 = 1
colorscheme solarized8

"GIT
"----------------------------------------------------------------------------

"Enable gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_async = 0
set updatetime=250

"SNIPPETS
"----------------------------------------------------------------------------

let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-r>"

"FOLDING
"----------------------------------------------------------------------------
setlocal foldmethod=syntax

"FUZZY SEARCH
"----------------------------------------------------------------------------

if has("unix")
	nnoremap <c-p> :FZF<cr>
	if executable('ag')
		let $FZF_DEFAULT_COMMAND = 'ag -g ""'
	endif
endif
if has("win32")
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
endif

"WINDOWS SPECIFIC
"----------------------------------------------------------------------------
if has("win32")
	set backspace=indent,eol,start
endif

"TAGBAR
"----------------------------------------------------------------------------

"Map to F8 key
nmap <F8> :TagbarToggle<CR>

"AUTOCOMPLETION
"----------------------------------------------------------------------------

let g:deoplete#enable_at_startup = 1

if has("win32")
	let g:python3_host_prog='C:/Python37/python3.exe'
	let g:python_host_prog='C:/Python27/python2.exe'
	if !has("nvim")
		let g:tsuquyomi_use_local_typescript = 0
		let g:tsuquyomi_use_dev_node_module = 0
	endif
endif

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

call deoplete#custom#option('sources', {
			\ '_': ['ultisnips', 'around', 'buffer', 'file'],
			\ 'html': ['omni', 'ultisnips', 'around', 'buffer', 'file'],
			\ 'cs': ['omni', 'ultisnips', 'around', 'buffer', 'file'],
			\ 'javascript': ['tern', 'ultisnips', 'file'],
			\ 'vim': ['ultisnips', 'around', 'buffer', 'file'],
			\ 'typescript': ['typescript', 'ultisnips', 'file'],
			\ })

call deoplete#custom#var('omni', 'input_patterns', {
			\ 'cs': '[^. *\t]\.\w*',
			\})

"SEARCH
"----------------------------------------------------------------------------

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Ctrlp ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"NERDTREE
"----------------------------------------------------------------------------

"Do not open automatically
let g:nerdtree_tabs_open_on_gui_startup = 0

"LINTER
"----------------------------------------------------------------------------
let g:ale_fix_on_save = 1

"INDENTATION
"----------------------------------------------------------------------------
set tabstop=4

set secure
