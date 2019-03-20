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
	call dein#add('Shougo/defx.nvim')

	"Git wrapper
	call dein#add('tpope/vim-fugitive')

	"Fuzzy search
	call dein#add('Shougo/denite.nvim')

	"Color scheme
	call dein#add('chriskempson/base16-vim')
	call dein#add('lifepillar/vim-solarized8')

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
	call dein#add('itchyny/lightline.vim')

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

"plugin-lightline
"-------------------------------------------------------------------------------
let g:lightline = {
			\	'colorscheme': 'solarized',
			\	'active': {
			\	  'left':[ [ 'mode', 'paste' ],
			\			   [ 'gitbranch', 'readonly', 'filename', 'modified' ]
			\	  ]
			\	},
			\	'component_function': {
			\	  'gitbranch': 'fugitive#head',
			\	  'filetype': 'MyFiletype',
			\	  'fileformat': 'MyFileformat',
			\	}
			\ }
let g:lightline.separator = {
			\	'left': '', 'right': ''
			\}
let g:lightline.subseparator = {
			\	'left': '', 'right': ''
			\}

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"plugin-defx
"-------------------------------------------------------------------------------
map <Leader>t :Defx<CR>
augroup filetype_defx
	autocmd!
	autocmd FileType defx call s:defx_my_settings()
augroup END
function! s:defx_my_settings() abort
	" Define mappings
	nnoremap <silent><buffer><expr> l
				\ defx#do_action('open')
	nnoremap <silent><buffer><expr> y
				\ defx#do_action('copy')
	nnoremap <silent><buffer><expr> m
				\ defx#do_action('move')
	nnoremap <silent><buffer><expr> p
				\ defx#do_action('paste')
	nnoremap <silent><buffer><expr> o
				\ defx#do_action('open')
	nnoremap <silent><buffer><expr> v
				\ defx#do_action('open', 'vsplit')
	nnoremap <silent><buffer><expr> P
				\ defx#do_action('open', 'pedit')
	nnoremap <silent><buffer><expr> z
				\ defx#do_action('open_or_close_tree')
	nnoremap <silent><buffer><expr> N
				\ defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> n
				\ defx#do_action('new_file')
	nnoremap <silent><buffer><expr> s
				\ defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> d
				\ defx#do_action('remove')
	nnoremap <silent><buffer><expr> r
				\ defx#do_action('rename')
	nnoremap <silent><buffer><expr> !
				\ defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> yy
				\ defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> i
				\ defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> .
				\ defx#do_action('repeat')
	nnoremap <silent><buffer><expr> h
				\ defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> q
				\ defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space>
				\ defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> *
				\ defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> j
				\ line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k
				\ line('.') == 1 ? 'G' : 'k'
	nnoremap <silent><buffer><expr> R
				\ defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g>
				\ defx#do_action('print')
	nnoremap <silent><buffer><expr> cd
				\ defx#do_action('change_vim_cwd')
endfunction

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
let g:solarized_use16 = 1
colorscheme solarized8

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
