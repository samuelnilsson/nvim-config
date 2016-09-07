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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --omnisharp-completer'}

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

"Typescript syntax
Plug 'leafgarland/typescript-vim'

"Typescript navigations and syntax checking
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

"Change surroundings in pairs
Plug 'tpope/vim-surround'

"Commenting
Plug 'scrooloose/nerdcommenter'

"Display tags in a window
Plug 'majutsushi/tagbar'

"Show git diff in file
Plug 'airblade/vim-gitgutter'

"Improved sytax checking and highlighting for javascript
Plug 'pangloss/vim-javascript'

"Expand abbreviations
Plug 'mattn/emmet-vim'

"Collection of snippets
Plug 'honza/vim-snippets'

"Multicursor in Sublime Text style
Plug 'terryma/vim-multiple-cursors'

"Syntax highlighting for less
Plug 'groenewege/vim-less'

"Better json highlighting
Plug 'elzr/vim-json'

"Snippets
Plug 'SirVer/ultisnips'

"Auto insert closing characters
Plug 'jiangmiao/auto-pairs'

"Fast motions
Plug 'easymotion/vim-easymotion'

"Syntax for pug pug files
Plug 'digitaltoad/vim-pug'

"Omnisharp features for C#
if has("unix")
  Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && xbuild' }
end
if has("win32")
  Plug 'OmniSharp/omnisharp-vim', { 'do': 'cd server && msbuild' }
end

call plug#end()

"GENERAL SETTINGS
"----------------------------------------------------------------------------

"Enable line numbers
set number
"Enable relative line numbers
set relativenumber

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

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_typescript_checkers=['tsuquyomi']

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
  "Ignore files and folders in gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

"WINDOWS SPECIFIC
"----------------------------------------------------------------------------
if has("win32")
  set backspace=indent,eol,start
endif
