"get syntax highlighting
  syntax on
  syntax enable
  set ai

  if has("gui_running")
      colorscheme lucius
      set guioptions-=T  "remove toolbar
  endif

  let g:solarized_termcolors=256
  colorscheme solarized
  set background=dark

  set sw=4
  set tw=1000
  set tabstop=4
  set smarttab
  set expandtab
  set wrapmargin=1000
  set hlsearch
  set tabpagemax=30

" Automatically remove white space upon save
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType c,cpp,python,ruby,java autocmd BufWritePre <buffer> :%s/\s\+$//e

"  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"  match OverLength /\%81v.\+/
  if exists('+colorcolumn')
    set colorcolumn=80
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif
  " set number
  set showmode
  set ic
  set mousef
  set autoread
  set wildmenu

  map <F2> :w<CR>
  map <LEADER>w :bwipeout!<CR>
  map <LEADER>w :close<CR>
  "imap <C-W> <C-o>:bwipeout!<CR>

  "function! CleverTab()
     "if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    "return "\<Tab>"
     "else
    "return "\<C-N>"
  "endfunction
  "inoremap <Tab> <C-R>=CleverTab()<CR>

  map <M-1> :tabn 1<cr>
  map <M-2> :tabn 2<cr>
  map <M-3> :tabn 3<cr>
  map <M-4> :tabn 4<cr>
  map <M-5> :tabn 5<cr>
  map <M-6> :tabn 6<cr>
  map <M-7> :tabn 7<cr>
  map <M-8> :tabn 8<cr>
  map <M-9> :tabn 9<cr>

  imap <M-1> <C-o>:tabn 1<cr>
  imap <M-2> <C-o>:tabn 2<cr>
  imap <M-3> <C-o>:tabn 3<cr>
  imap <M-4> <C-o>:tabn 4<cr>
  imap <M-5> <C-o>:tabn 5<cr>
  imap <M-6> <C-o>:tabn 6<cr>
  imap <M-7> <C-o>:tabn 7<cr>
  imap <M-8> <C-o>:tabn 8<cr>
  imap <M-9> <C-o>:tabn 9<cr>

  map <Tab> <C-W>w
  map \| :vsplit<cr>

  " shortcuts
  iabbrev pdb; import pdb; pdb.set_trace()
  iabbrev rpdb2; import rpdb2; rpdb2.start_embedded_debugger('0000', fAllowRemote=True)
  exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
  set list

  map <LEADER>F    :FufFile<CR>
  map <LEADER>f    :FufFileWithCurrentBufferDir<CR>
  map <LEADER>b    :FufBuffer<CR>
  map <LEADER>r    :FufRenewCache<CR>

  " so I don't need to presh SHIFT : to execute a command
  nnoremap ; :

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  Bundle 'scrooloose/nerdtree.git'
  " toggle with CONTROL-n
  map <C-n> :NERDTreeToggle<CR>
  " open browser upon start
  autocmd vimenter * if !argc() | NERDTree | endif
  " and close if nerdtree is the only window open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  let g:NERDTreeWinSize = 43

  " let Vundle manage Vundle
  " required!
  Bundle 'gmarik/vundle'
  Bundle 'bling/vim-airline'

  " My Bundles here:
  "
  " original repos on github
   Bundle 'tpope/vim-fugitive'

 " Bundle 'hallison/vim-markdown'
  " Bundle 'SuperTab'

  Bundle 'L9'

  Bundle 'FuzzyFinder'
  let g:airline_powerline_fonts = 1

  map <LEADER>F    :FufFile<CR>
  map <LEADER>f    :FufFileWithCurrentBufferDir<CR>
  map <LEADER>b    :FufBuffer<CR>
  map <LEADER>r    :FufRenewCache<CR>


  Bundle 'scrooloose/nerdcommenter'

 " Bundle 'ack.vim'
  " let g:indent_guides_autocmds_enabled = 1
  let g:indent_guides_start_level =  2
  let g:indent_guides_guide_size =  1
  let g:indent_guides_auto_colors = 1

  " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

  Bundle 'ack.vim'

  Bundle 'leshill/vim-json'
  " Bundle 'Valloric/YouCompleteMe'

  " javascript
  Bundle 'pangloss/vim-javascript'
  let g:javascript_enable_domhtmlcss=1

  " syntax and error stuff
  Bundle 'scrooloose/syntastic'
  let g:syntastic_mode_map = { 'mode': 'active',
                             \ 'active_filetypes': ['ruby', 'python','cpp'],
                             \ 'passive_filetypes': ['puppet'] }
  let g:syntastic_check_on_open=1
  let g:syntastic_enable_balloons=1
  let g:syntastic_quiet_messages = {'level': 'warnings'}
  let g:syntastic_cpp_compiler_options = ' -std=c++0x'

  " execute pathogen#infect()

  " Python stuff
  Bundle 'python.vim'

  Bundle 'django.vim'
  Bundle 'django_templates.vim'
  map <Leader>dt :VimDjangoCommandTTemplate<CR>
  map <Leader>da :VimDjangoCommandTApp<CR>

  " Bundle 'Python-Documentation'

  Bundle 'kien/ctrlp.vim'

 " Bundle 'Gundo'
  nnoremap <F5> :GundoToggle<CR>

  " sql
  "Bundle 'dbext.vim'
  let g:sql_type_default = 'postgres'
  Bundle 'psql.vim'
  Bundle 'itspriddle/vim-jquery'



  " flake8 ...
  let g:flake8_ignore="E125,E126,E127"

  filetype plugin on


function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    "     " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

 "au FileType python call TextEnableCodeSnip('sqlpostgres', "'''", "'''", 'SpecialComment')
 "
