"get syntax highlighting
  syntax on
  set ai

" set my colorscheme to that of lilac 
  set sw=4
  set tw=1000
  set tabstop=4
  set smarttab
  set expandtab
  set wrapmargin=1000

  set hlsearch

" relative then normal numbers
  set number

" nnoremap <C-n> :call NumberToggle()<cr>

" autocmd FocusLost * :set number
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber
" autocmd CursorMoved * :set relativenumber

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

  iabbrev pdb; import pdb; pdb.set_trace()
  iabbrev rpdb2; import rpdb2; rpdb2.start_embedded_debugger('0000', fAllowRemote=True)

  "set list
  "set listchars=tab:»·,trail:·

  map <LEADER>F    :FufFile<CR>
  map <LEADER>f    :FufFileWithCurrentBufferDir<CR>
  map <LEADER>b    :FufBuffer<CR>
  map <LEADER>r    :FufRenewCache<CR>


  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle
  " required! 
  Bundle 'gmarik/vundle'

  " My Bundles here:
  "
  " original repos on github
  Bundle 'tpope/vim-fugitive'

  Bundle 'hallison/vim-markdown'
  " Bundle 'SuperTab'
 
  Bundle 'L9'

  Bundle 'FuzzyFinder'

  map <LEADER>F    :FufFile<CR>
  map <LEADER>f    :FufFileWithCurrentBufferDir<CR>
  map <LEADER>b    :FufBuffer<CR>
  map <LEADER>r    :FufRenewCache<CR>

 " HTML stuff
  Bundle 'mattn/zencoding-vim.git'
    
  Bundle 'scrooloose/nerdcommenter'
 " more nerd down ...

  Bundle 'ack.vim'
  Bundle 'leshill/vim-json'
  Bundle 'vim-ruby/vim-ruby'
  Bundle 'pangloss/vim-javascript'
  Bundle 'itspriddle/vim-jquery'
  Bundle 'Valloric/YouCompleteMe'

  " syntax and error stuff
  Bundle 'scrooloose/syntastic'
  let g:syntastic_mode_map = { 'mode': 'active',
                             \ 'active_filetypes': ['ruby', 'python','cpp'],
                             \ 'passive_filetypes': ['puppet'] }
  let g:syntastic_check_on_open=1
  let g:syntastic_enable_balloons=1
  let g:syntastic_quiet_warnings=1
  let g:syntastic_cpp_compiler_options = ' -std=c++0x'

  " Python stuff
  Bundle 'python.vim'

  Bundle 'django.vim'
  Bundle 'django_templates.vim'
  map <Leader>dt :VimDjangoCommandTTemplate<CR>
  map <Leader>da :VimDjangoCommandTApp<CR>

  " Bundle 'Python-Documentation'

  Bundle 'kien/ctrlp.vim'

  Bundle 'Gundo'
  nnoremap <F5> :GundoToggle<CR>

  " sql
  Bundle 'dbext.vim'
  "Bundle 'SQLComplete.vim'
  let g:sql_type_default = 'postgres' 
  Bundle 'psql.vim'

  " flake8 ...
  let g:flake8_ignore="E125,E126,E127"

  filetype plugin on

  if has("gui_running")
      colorscheme lucius
      set guioptions-=T  "remove toolbar
  endif

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

