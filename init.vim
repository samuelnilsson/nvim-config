set runtimepath+=~/.vim

set encoding=utf-8
scriptencoding utf-8

"Set leader to use comma
let mapleader=','

"PLUGINS
"===============================================================================

"plugin-list
"-------------------------------------------------------------------------------
call plug#begin(stdpath('data') . '/plugged')

"Required for some async plugins when not using neovim
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif

"File explorer
Plug 'scrooloose/nerdtree'

"Git wrapper
Plug 'tpope/vim-fugitive'

"Color scheme
Plug 'chriskempson/base16-vim'

"Auto completion engine
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"Linting
Plug 'dense-analysis/ale'

"Code formatting
Plug 'editorconfig/editorconfig-vim'

"Extended status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Syntax files
Plug 'sheerun/vim-polyglot'

"C# language server
Plug 'OmniSharp/omnisharp-vim'

"File type icons
Plug 'ryanoasis/vim-devicons'

"Change surroundings in pairs
Plug 'tpope/vim-surround'

"Commenting
Plug 'scrooloose/nerdcommenter'

"Display tags in a window
Plug 'majutsushi/tagbar'

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

"README reload
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}

"Highlight matching characters
Plug 'andymass/vim-matchup'

"Automatic tab detection
Plug 'tpope/vim-sleuth'

"Automatically split single line into multiple
Plug 'AndrewRadev/splitjoin.vim'

call plug#end()

filetype plugin on
filetype indent plugin on
syntax enable

"plugin-fugitive
"-------------------------------------------------------------------------------
map gc :Gcommit -a<CR>
map ga :Git add -A<CR>
map gs :Gstatus<CR>
map gf :Gfetch<CR>
map gm :Gmerge<CR>
map gl :Git log<CR>
map gd :Gdiff<CR>
map gu :Gpush<CR>
map gp :Gpull<CR>

"plugin-tagbar
"-------------------------------------------------------------------------------
map <Leader>b :TagbarToggle<CR>

"plugin-coc
"-------------------------------------------------------------------------------
map <Leader>sf :CocList files<CR>
map <Leader>sw :CocList words<CR>
map <Leader>sg :CocList grep<CR>
map <Leader>ss :CocList symbols<CR>
map <Leader>se :CocList extensions<CR>
map <Leader>gc :CocList commits<CR>
map <Leader>gb :CocList branches<CR>
map <Leader>gs :CocList gstatus<CR>

map <Leader>ca :CocAction<CR>
map <Leader>rn <Plug>(coc-rename)
map <Leader>f <Plug>(coc-format-selected)
map <Leader>qf <Plug>(coc-fix-current)

map <Leader>gd <Plug>(coc-definition)
map <Leader>gt <Plug>(coc-type-definition)
map <Leader>gi <Plug>(coc-implementation)
map <Leader>gr <Plug>(coc-references)

"Show documentation in preview window
map <Leader>sd :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"plugin-ale
"-------------------------------------------------------------------------------
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \   'cs': ['OmniSharp'],
            \   'vim': ['vint'],
            \}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}

let g:ale_sign_warning = ''
let g:ale_sign_error = ''

let g:airline#extensions#ale#enabled = 1

"plugin-editorconfig
"-------------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"plugin-easyalign
"-------------------------------------------------------------------------------
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"plugin-airline
"-------------------------------------------------------------------------------
let g:airline_theme = 'base16_tomorrow'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.whitespace = ''
let g:airline_symbols.spell = '暈'
let g:airline_symbols.notexists = ' '
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#tabline#enabled = 1

"plugin-omnisharp
"-------------------------------------------------------------------------------
let g:OmniSharp_server_stdio = 1
if has("win32")
    let g:OmniSharp_server_path = 'C:/Users/samuel.nilsson/scoop/apps/omnisharp/current/OmniSharp.exe'
else

"plugin-nerdtree
"-------------------------------------------------------------------------------
map <Leader>t :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

"plugin-vim-session
"-------------------------------------------------------------------------------
let g:session_autoload = 0
let g:session_directory = stdpath('data') . '/session'

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
set fillchars=
set fillchars+=vert:▏

"Set column indicator at 81 columns
set colorcolumn=81

set pyxversion=3

"COLORS
"===============================================================================
set background=dark
let base16colorspace=256
colorscheme base16-tomorrow-night
hi Whitespace ctermfg=19 guifg=19
hi ColorColumn ctermbg=18 guibg=18
hi LineNr ctermbg=NONE guibg=NONE ctermfg=08 guifg=08
hi CursorLineNr ctermfg=02 guifg=02
hi DiffAdd ctermbg=NONE guibg=NONE ctermfg=10 guifg=10
hi DiffChange ctermbg=NONE guibg=NONE ctermfg=03 guifg=03
hi DiffDelete ctermbg=NONE guibg=NONE ctermfg=09 guifg=09
hi VertSplit ctermbg=NONE guibg=NONE
hi clear ALEErrorSign
hi clear ALEWarningSign
hi ALEError ctermbg=1 guibg=1 ctermfg=0 guifg=0
hi ALEWarning ctermbg=3 guibg=3 ctermfg=0 guifg=0
hi ALEErrorSign ctermfg=1 ctermbg=none guifg=1 guibg=none
hi ALEWarningSign ctermfg=3 ctermbg=none guifg=3 guibg=none

"SEARCH
"===============================================================================
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"INDENTATION
"===============================================================================
let g:sleuth_automatic = 0
if len(findfile('.editorconfig', '.;')) == 0
    autocmd VimEnter * Sleuth
endif

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

"MARKDOWN
"===============================================================================
let g:mkdp_browser = 'chromium'

let g:python_host_prog = 'C:/Users/samuel.nilsson/scoop/shims/python3.exe'

"CLIPBOARD
"===============================================================================

"always yank/paste to clipboard
set clipboard ^= unnamed,unnamedplus
