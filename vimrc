" Vundle installs :PluginInstall
"
set nocompatible              " be iMproved, required
filetype off

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
Plugin 'scrooloose/nerdtree.git'

" Looks for syntatic errors
" Note: pip install flake8
" Note: pip install pylint
Plugin 'scrooloose/syntastic.git'
Plugin 'tell-k/vim-autopep8'

" color
Bundle 'altercation/vim-colors-solarized'

call vundle#end()

" my local settings
filetype plugin indent on

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


" auto

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

" remove trailing whitespace
autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

" show 80 column line
if exists('+colorcolumn')
    set colorcolumn=80
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
