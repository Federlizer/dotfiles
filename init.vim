""***************************************************
"" Setup vim-plug
""***************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

  autocmd VimEnter * PlugInstall
endif


""***************************************************
"" Extensions
""***************************************************

call plug#begin(expand('~/.config/nvim/plugged'))

"" linting
Plug 'dense-analysis/ale'
"" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['javascript', 'typescript', 'typescriptreact', 'python']}

"" javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

"" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

"" utils
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'jiangmiao/auto-pairs'

"" theme
Plug 'morhetz/gruvbox'

call plug#end()

""***************************************************
"" Plugin settings
""***************************************************

"" gruvbox
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_termcolors = 256
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_italicize_comments = 1
let g:gruvbox_italicize_strings = 1

"" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 0

"" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1

"" powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
else
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
endif


""***************************************************
"" Config
""***************************************************

"" required
filetype plugin indent on

"" theme
syntax on
set background=dark
silent! colorscheme gruvbox

"" help find stuff
set path+=**

"" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" tabs
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" gutter
set number
set norelativenumber
set cursorline

"" extra lines&rows when scrolling
set scrolloff=3
set sidescrolloff=3

"" activate status bar
set laststatus=2

"" searching (find and replace)
set ignorecase
set smartcase
set incsearch

"" windows configuration (not M$ windows)
set splitbelow
set splitright

set nowrap

""***************************************************
"" Mappings
""***************************************************

let mapleader=' '

inoremap jk <esc>
inoremap kj <esc>

"" clear search highlights
nnoremap <leader><Space> :nohlsearch<CR>

"" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

"" vimrc
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
