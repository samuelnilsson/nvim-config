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
Plug 'altercation/vim-colors-solarized'

"Auto completion engine
Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --tern-completer --omnisharp-completer'}

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
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-pug'
Plug 'adamclerk/vim-razor'
Plug 'gko/vim-coloresque'
Plug 'kchmck/vim-coffee-script'

"Typescript navigations and syntax checking
Plug 'Quramy/tsuquyomi'
if has("unix")
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
end
if has("win32")
  Plug 'Shougo/vimproc.vim', {'do' : 'mingw32-make -f make_mingw64.mak'}
end

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

"Omnisharp features for C#
if has("unix")
  Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && xbuild' }
end
if has("win32")
  Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && MSBuild.exe' }
end

"Needed for some plugins
Plug 'tpope/vim-dispatch'

"Align code
Plug 'godlygeek/tabular'

"Plugin for project specific settings
Plug 'embear/vim-localvimrc'

"Easy find and replace across multiple files
Plug 'mileszs/ack.vim'

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
set background=dark
colorscheme solarized

"GIT
"----------------------------------------------------------------------------

"Enable gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_async = 0

"SNIPPETS
"----------------------------------------------------------------------------

let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-r>"

"SYNTAX CHECKING
"----------------------------------------------------------------------------

let g:syntastic_javascript_checkers = ['eslint']
if has("unix")
  let g:syntastic_typescript_checkers = ['tslint', 'tsc']
end
if has("win32")
  let g:syntastic_typescript_checkers = ['tsuquyomi']
  let g:tsuquyomi_use_local_typescript = 0
end
let g:syntastic_aggregate_errors = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"INDENTATION
"----------------------------------------------------------------------------

filetype plugin indent on

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=none
hi IndentGuidesEven ctermbg=black
let g:indent_guides_enable_on_vim_startup = 1

"FUZZY SEARCH
"----------------------------------------------------------------------------

if has("unix")
  nnoremap <c-p> :FZF<cr>
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
