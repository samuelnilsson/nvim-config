set encoding=utf8
scriptencoding utf-8

"Set leader to use comma
let mapleader=','

"PLUGINS
"===============================================================================

"plugin-dein-load
"-------------------------------------------------------------------------------
if has('win32') && has('nvim')
	set runtimepath^=~\AppData\Local\nvim\dein\repos\github.com\Shougo\dein.vim
	let deindir = '~\AppData\Local\nvim\dein'
elseif has('win32')
	set runtimepath^=~\.cache\dein\repos\github.com\Shougo\dein.vim
	let deindir = '~\.cache\dein'
else
	set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
	let deindir = '~/.cache/dein'
endif

"plugin-list
"-------------------------------------------------------------------------------
if dein#load_state(deindir)
	if has('win32') && has('nvim')
		call dein#begin('~/AppData/Local/nvim/dein/', [expand('<sfile>')])
		call dein#add('~/AppData/Local/nvim/dein/repos/github.com/Shougo/dein.vim')
	else
		call dein#begin('~/.cache/dein', [expand('<sfile>')])
		call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
	endif

	"Required for some async plugins when not using neovim
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif

	"File explorer
	call dein#add('scrooloose/nerdtree')

	"Git wrapper
	call dein#add('tpope/vim-fugitive')

	"Fuzzy search
	call dein#add('Shougo/denite.nvim')

	"Color scheme
	call dein#add('chriskempson/base16-vim')

	"Auto completion engine
	call dein#add('Shougo/deoplete.nvim')

	"Auto completion sources
	if has('nvim')
		call dein#add('mhartington/nvim-typescript', {'build': 'sh ./install.sh && npm install -g typescript'})
	else
		call dein#add('Quramy/tsuquyomi')
		call dein#add('rudism/deoplete-tsuquyomi')
	endif
	call dein#add('carlitux/deoplete-ternjs', {'build': 'npm install -g tern'})
	call dein#add('zchee/deoplete-jedi')
	call dein#add('Shougo/neco-vim')
	call dein#add('othree/html5.vim')

	"Extended status line
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')

	"Linting
	call dein#add('w0rp/ale', {'build': 'npm install -g ' .
				\ 'eslint babel-eslint tslint htmlhint typescript prettier ' .
				\ 'stylelint stylelint-config-recommended && ' .
				\ 'pip install --user vim-vint'
				\ })

	"Syntax files
	call dein#add('HerringtonDarkholme/yats.vim')
	call dein#add('othree/yajs.vim')
	call dein#add('groenewege/vim-less')
	call dein#add('elzr/vim-json')
	call dein#add('digitaltoad/vim-pug')
	call dein#add('gko/vim-coloresque')
	call dein#add('chrisbra/Colorizer')
	call dein#add('kchmck/vim-coffee-script')
	call dein#add('stanangeloff/php.vim')
	call dein#add('2072/PHP-Indenting-for-VIm')
	call dein#add('cakebaker/scss-syntax.vim')

	"Change surroundings in pairs
	call dein#add('tpope/vim-surround')

	"Commenting
	call dein#add('scrooloose/nerdcommenter')

	"Display tags in a window
	call dein#add('majutsushi/tagbar')

	"Display git diff in file
	call dein#add('airblade/vim-gitgutter')

	"Expand abbreviations
	call dein#add('mattn/emmet-vim')

	"Multicursor in Sublime Text style
	call dein#add('terryma/vim-multiple-cursors')

	"Snippets
	call dein#add('honza/vim-snippets')
	call dein#add('SirVer/ultisnips')

	"Auto insert closing characters
	call dein#add('jiangmiao/auto-pairs')

	"Fast motions
	call dein#add('easymotion/vim-easymotion')

	"For 'distraction-free' writing of non-code documents
	call dein#add('junegunn/goyo.vim')

	"Golang support
	call dein#add('fatih/vim-go')

	"CS support
	call dein#add('OmniSharp/omnisharp-vim')

	"JS specific features
	call dein#add('ternjs/tern_for_vim', {'build': 'npm install'})

	"Generate JsDoc comments
	call dein#add('heavenshell/vim-jsdoc')

	"Automatic tab insertion on newline
	call dein#add('Raimondi/delimitMate')

	"Easy alignment
	call dein#add('junegunn/vim-easy-align')

	"Start screen
	call dein#add('mhinz/vim-startify')

	"Session management
	call dein#add('xolox/vim-misc')
	call dein#add('xolox/vim-session')

	"Icons
	call dein#add('ryanoasis/vim-devicons')

	call dein#end()
	call dein#save_state()
endif

filetype plugin on
filetype plugin indent on
syntax enable

"plugin-dein
"-------------------------------------------------------------------------------
if dein#check_install()
	call dein#install()
endif

fun DeinClean()
	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
	echo 'Done!'
endf

command DeinUpdate call dein#update()
command DeinClean call DeinClean()
command DeinInstall call dein#install()

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

call denite#custom#var('file_rec', 'command',
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
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme = 'base16_tomorrow'

"plugin-nerdtree
"-------------------------------------------------------------------------------
map <Leader>t :NERDTreeToggle<CR>

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

"Set line at 80 characters
let &colorcolumn=join(range(81,999),',')

"Always use clipboard
if !has('win32')
	set clipboard+=unnamedplus
endif

"Enable project specific vimrc files
set exrc

"Fold method
setlocal foldmethod=syntax

"COLORS
"===============================================================================
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow-night

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
