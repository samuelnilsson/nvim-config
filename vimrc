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

"Auto completion engine
if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'mhartington/nvim-typescript'
  Plug 'carlitux/deoplete-ternjs'
elseif has('lua')
  Plug 'Shougo/neocomplete.vim'
else
  Plug 'ajh17/VimCompletesMe'
endif

"Extended status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"File icons
if has("unix")
  Plug 'ryanoasis/vim-devicons'
endif

"Indentation lines
Plug 'nathanaelkane/vim-indent-guides'

"Syntax checking
Plug 'scrooloose/syntastic'

"Highlighting for different languages
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'groenewege/vim-less'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'OrangeT/vim-csharp'
Plug 'gko/vim-coloresque'
Plug 'kchmck/vim-coffee-script'

"Typescript navigations and syntax checking
Plug 'Quramy/tsuquyomi'
if has("unix")
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
endif
if has("win32")
  Plug 'Shougo/vimproc.vim', {'do' : 'mingw32-make -f make_mingw64.mak'}
endif

"Change surroundings in pairs
Plug 'tpope/vim-surround'

"Commenting
Plug 'scrooloose/nerdcommenter'

"Display tags in a window
Plug 'majutsushi/tagbar'

"Show git diff in file
Plug 'airblade/vim-gitgutter'

"Expand abbreviations
Plug 'mattn/emmet-vim'

"Collection of snippets
Plug 'honza/vim-snippets'

"Multicursor in Sublime Text style
Plug 'terryma/vim-multiple-cursors'

"Snippets
Plug 'SirVer/ultisnips'

"Auto insert closing characters
Plug 'jiangmiao/auto-pairs'

"Fast motions
Plug 'easymotion/vim-easymotion'

"Needed for some plugins
Plug 'tpope/vim-dispatch'

"Align code
Plug 'godlygeek/tabular'

"Plugin for project specific settings
Plug 'embear/vim-localvimrc'

"Easy find and replace across multiple files
Plug 'mileszs/ack.vim'

"For 'distraction-free' writing of non-code documents
Plug 'junegunn/goyo.vim'

"Built in shell
Plug 'Shougo/vimshell.vim'

"Run scripts from within vim
Plug 'thinca/vim-quickrun'

"Golang support
Plug 'fatih/vim-go'

"Add indent lines
Plug 'Yggdroot/indentLine'

"Auto completion for node
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

"Generate JsDoc comments
Plug 'heavenshell/vim-jsdoc'

"Automatic tab insertion on newline
Plug 'Raimondi/delimitMate'

"Autoformat code
Plug 'Chiel92/vim-autoformat'

call plug#end()

"GENERAL SETTINGS
"----------------------------------------------------------------------------

"Enable line numbers
set number
"Enable relative line numbers
set relativenumber

"Set leader to use comma
let mapleader=","

"Set line at 80 characters
let &colorcolumn=join(range(81,999),",")

"ICONS
"----------------------------------------------------------------------------

set encoding=utf8

"COLORS
"----------------------------------------------------------------------------

syntax enable
set termguicolors
set background=dark
colorscheme base16-default-dark

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

"SYNTAX CHECKING
"----------------------------------------------------------------------------

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint', 'tsc']
if has("win32")
  let g:tsuquyomi_use_local_typescript = 0
endif

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"INDENTATION
"----------------------------------------------------------------------------

filetype plugin on

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=none
hi IndentGuidesEven ctermbg=black
let g:indent_guides_enable_on_vim_startup = 1

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

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
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

"Typescript
let g:tagbar_type_typescript = {
      \ 'ctagstype': 'typescript',
      \ 'kinds': [
      \ 'c:classes',
      \ 'n:modules',
      \ 'f:functions',
      \ 'v:variables',
      \ 'v:varlambdas',
      \ 'm:members',
      \ 'i:interfaces',
      \ 'e:enums',
      \ ]
      \ }

"CUSTOM COMMANDS
"----------------------------------------------------------------------------

"Format JSON
nmap =j :%!python -m json.tool<CR>

"AUTOCOMPLETION
"----------------------------------------------------------------------------

if has('nvim')
  filetype plugin indent on
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
elseif has('lua')
  set nocompatible
  set completeopt+=menuone
  set rtp+=~/work/neocomplete.vim/
  set rtp+=~/work/vimproc.vim/
  set rtp+=~/.cache/neobundle/tsuquyomi/

  filetype plugin indent on
  let g:neocomplete#enable_at_startup = 1
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'

  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
else
  autocmd FileType html,javascript,typescript,css,less let b:vcm_tab_complete = 'omni'
endif

"SEARCH
"----------------------------------------------------------------------------

set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"SYNTAX MODIFICATIONS
"----------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.ts   set syntax=tssql

"NERDTREE
"----------------------------------------------------------------------------

"Do not open automatically
let g:nerdtree_tabs_open_on_gui_startup = 0
