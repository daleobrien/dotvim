" Vundle installs :PluginInstall
"
set nocompatible              " be iMproved, required
filetype off


if has("gui_running")
  set macligatures
  set guifont=Fira\ Code:h12
endif
 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" enable gist, :Gist -p    :Gist -l   https://github.com/mattn/gist-vim
" Plugin 'mattn/gist-vim'

" https://github.com/scrooloose/nerdcommenter   <leader>cc
Plugin 'scrooloose/nerdcommenter'

" Nice auto completion ...
Plugin 'Valloric/YouCompleteMe'

" snippets, more autocomplete, but with snippets ....
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" File fuzz, L9 needed \f  to open some files ...
"Plugin 'L9'
"Plugin 'FuzzyFinder'

" CNTL-P search
Plugin 'kien/ctrlp.vim'

" File tree
Plugin 'scrooloose/nerdtree.git'

" Looks for syntatic errors
" Note: pip install flake8
" Note: pip install pylint
Plugin 'scrooloose/syntastic.git'
" Plugin 'tell-k/vim-autopep8'

" Coffee
Plugin 'kchmck/vim-coffee-script'

" color
Bundle 'altercation/vim-colors-solarized'

" http://editorconfig.org , so we can use project editor settings universally
Plugin 'editorconfig/editorconfig-vim'

" JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

call vundle#end()

" my local settings
filetype plugin indent on
set clipboard=unnamed

" Python sytle spaces
set tabstop=4 shiftwidth=4 expandtab

 " so I don't need to presh SHIFT : to execute a command
nnoremap ; :

" Nerd tree:
"   toggle with CONTROL-n
map <c-n> :NERDTreeToggle<CR>
"   open browser upon start
autocmd vimenter * if !argc() | NERDTree | endif
"   close if nerdtree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"   wider (also mapped 'w' to auto resize, see /bundle/nerdtree/plugin/NERD_tree.vim 
let g:NERDTreeWinSize = 43
let NERDTreeIgnore = ['\.pyc$']
" also, press 'w' to auto resize

" Nerd comment
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" Snippet support  & auto complate
" YCM -> <c-n> & <c-p> to go through the list

let g:ycm_key_list_select_completion=[]  " prevent conflicts with Ultrasnips
let g:ycm_key_list_previous_completion=[]

let g:UltiSnipsExpandTrigger       = "<tab>"  "was <c-j>
let g:UltiSnipsJumpForwardTrigger  = '<tab>'  "was <c-j>
let g:UltiSnipsListSnippets        = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'


"set paste  " Can't use this, stops Ultrasnips from working
"
"
let g:syntastic_python_checkers = ['flake8']
let g:flake8_ignore="E125,E126,E127,E501"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" auto reload file if it's changed somehow
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END

autocmd FileType python setlocal ts=4 sw=4 sts=4 expandtab autoindent
autocmd FileType javascript,jsx,html,css setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd FileType sql setlocal ts=2 sw=2 sts=2 expandtab autoindent

" remove trailing whitespace
autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

" show 80 column line
if exists('+colorcolumn')
    set colorcolumn=80,130
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" display line numbers
set number

" colour settings
syntax enable
colorscheme solarized
"let g:solarized_termcolors=256
set background=dark
let g:solarized_visibility="high"
set listchars=tab:\ \
syntax on

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
