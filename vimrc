set rtp+=~/.vim

set encoding=utf-8
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
if has('win32')
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.cmd'}
else
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
endif

"Extended status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Syntax files
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'groenewege/vim-less'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
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

"plugin-easyalign
"-------------------------------------------------------------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"plugin-airline
"-------------------------------------------------------------------------------
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = '🔒'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_theme = 'base16_tomorrow'

"plugin-nerdtree
"-------------------------------------------------------------------------------
map <Leader>t :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

"plugin-vim-session
"-------------------------------------------------------------------------------
let g:session_autoload = 0
if has('win32')
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
set listchars+=tab:▏\ ,trail:·,space:·

"Set column indicator at 81 columns
set colorcolumn=81

"COLORS
"===============================================================================
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow-night
hi Whitespace ctermfg=19 guifg=19
hi ColorColumn ctermbg=18 guibg=18

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
