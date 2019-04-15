set encoding=utf8
scriptencoding utf-8

"Set leader to use comma
let mapleader=','

"PLUGINS
"===============================================================================

"plugin-list
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

"Required for some async plugins when not using neovim
if !has('nvim')
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

"File explorer
Plug 'scrooloose/nerdtree'

"Git wrapper
Plug 'tpope/vim-fugitive'

"Fuzzy search
Plug 'Shougo/denite.nvim'

"Color scheme
Plug 'chriskempson/base16-vim'

"Auto completion engine
Plug 'Shougo/deoplete.nvim'

"Auto completion sources
if has('nvim')
	Plug 'mhartington/nvim-typescript', {'do': 'sh ./install.sh && npm install -g typescript'}
else
	Plug 'Quramy/tsuquyomi'
	Plug 'rudism/deoplete-tsuquyomi'
endif
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'othree/html5.vim'

"Extended status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Linting
Plug 'w0rp/ale', {'do': 'npm install -g
			\ eslint babel-eslint tslint htmlhint typescript prettier
			\ stylelint stylelint-config-recommended &&
			\ pip install --user vim-vint'
			\ }

"Syntax files
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

"Display git diff in file
Plug 'airblade/vim-gitgutter'

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

"For 'distraction-free' writing of non-code documents
Plug 'junegunn/goyo.vim'

"Golang support
Plug 'fatih/vim-go'

"CS support
Plug 'OmniSharp/omnisharp-vim'

"JS specific features
Plug 'ternjs/tern_for_vim', {'build': 'npm install'}

"Generate JsDoc comments
Plug 'heavenshell/vim-jsdoc'

"Automatic tab insertion on newline
Plug 'Raimondi/delimitMate'

"Easy alignment
Plug 'junegunn/vim-easy-align'

"Start screen
Plug 'mhinz/vim-startify'

"Session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

call plug#end()

filetype plugin on
filetype plugin indent on
syntax enable

"plugin-gitgutter
"-------------------------------------------------------------------------------
let g:gitgutter_enabled = 1
let g:gitgutter_async = 1
set updatetime=200

"plugin-tagbar
"-------------------------------------------------------------------------------
map <Leader>b :TagbarToggle<CR>

"plugin-deoplete
"-------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
			\ '_': ['ultisnips', 'around', 'buffer', 'file'],
			\ 'cs': ['omni', 'ultisnips', 'around', 'buffer', 'file'],
			\ 'css': ['omni', 'ultisnips', 'around', 'buffer', 'file'],
			\ 'javascript': ['tern', 'ultisnips', 'file'],
			\ 'less': ['omni', 'ultisnips', 'around', 'buffer', 'file'],
			\ 'sass': ['omni', 'ultisnips', 'around', 'buffer', 'file'],
			\ 'scss': ['omni', 'ultisnips', 'around', 'buffer', 'file'],
			\ 'typescript': ['typescript', 'ultisnips', 'file'],
			\ 'vim': ['vim', 'ultisnips', 'around', 'buffer', 'file'],
			\ })

call deoplete#custom#option('omni_patterns', {
			\ 'html': ['<[^>^\/]*', '</[a-zA-Z0-9-]*'],
			\})

call deoplete#custom#source('omni', 'functions', {
			\ 'css': 'csscomplete#CompleteCSS',
			\ 'less': 'csscomplete#CompleteCSS',
			\ 'sass': 'csscomplete#CompleteCSS',
			\ 'scss': 'csscomplete#CompleteCSS',
			\ })

call deoplete#custom#var('omni', 'input_patterns', {
			\ 'cs': '[^. *\t]\.\w*',
			\ 'css': '[^;:\t {}\n!][-\w]*',
			\ 'less': '[^;:\t {}\n!][-\w]*',
			\ 'sass': '[^;:\t {}\n!][-\w]*',
			\ 'scss': '[^;:\t {}\n!][-\w]*',
			\})

"plugin-denite
"-------------------------------------------------------------------------------
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')

map <Leader>sf :Denite file/rec<CR>
map <Leader>sl :Denite line<CR>
map <Leader>sg :DeniteProjectDir -buffer-name=grep grep:::!<CR>

call denite#custom#var('file/rec', 'command',
			\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
			\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

"plugin-ale
"-------------------------------------------------------------------------------
let g:ale_fix_on_save = 1

"plugin-easyalign
"-------------------------------------------------------------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"plugin-airline
"-------------------------------------------------------------------------------
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme = 'base16_tomorrow'

"plugin-nerdtree
"-------------------------------------------------------------------------------
map <Leader>t :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

"plugin-vim-session
"-------------------------------------------------------------------------------
let g:session_autoload = 0
if has('nvim')
	let g:session_directory = '~/AppData/Local/nvim-data/session'
endif

"plugin-ultisnips
"-------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<C-l>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

"plugin-nvim-typescript
"-------------------------------------------------------------------------------
let g:nvim_typescript#diagnostics_enable = 0

"GENERAL
"===============================================================================

"Enable line numbers
set number
"Enable relative line numbers
set relativenumber
"Enable cursorline
set cursorline

"Always use clipboard
if !has('win32')
	set clipboard+=unnamedplus
endif

"Enable project specific vimrc files
set exrc

"Fold method
setlocal foldmethod=syntax

"Hide tildes for blank lines
augroup highlight
	autocmd VimEnter,BufReadPre,FileReadPre * highlight NonText ctermfg=black ctermbg=black
augroup END

"Set list characters
set list
set listchars=
set listchars+=tab:▶\ 
set listchars+=trail:·
set listchars+=space:·

"COLORS
"===============================================================================
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow-night
hi Whitespace ctermfg=19 guifg=19

"WINDOWS SPECIFIC
"===============================================================================
if has('win32')
	set backspace=indent,eol,start
	let g:python3_host_prog='C:/Python37/python3.exe'
	let g:python_host_prog='C:/Python27/python2.exe'
endif

"SEARCH
"===============================================================================
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"INDENTATION
"===============================================================================
set tabstop=4
set shiftwidth=4
set expandtab
set secure

"TERMINAL MODE
"===============================================================================
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
endif

"RESIZE
"===============================================================================
nnoremap <silent> <Leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent> <Leader>h+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>h- :exe "resize " . (winheight(0) * 2/3)<CR>

"GUI
"===============================================================================
if exists('g:GtkGuiLoaded')
	call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
	call rpcnotify(1, 'Gui', 'Font', 'Fira Code 11')
	call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
	" Fixes some windows performance issues
	if has('win32')
		let &cursorline=0
	endif
endif
