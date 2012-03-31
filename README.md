# Vim settings

These are settings for ```vim``` which I mainly use for editing python code in.  I've installed the following plugins

1. https://github.com/scrooloose/nerdtree 
1. https://github.com/scrooloose/syntastic, highlights programming errors
1. L9, which provides some utility functions and commands for programming in Vim
1. https://github.com/tpope/vim-fugitive, git support
1. https://github.com/hallison/vim-markdown, Markdown support
1. https://github.com/ervandew/supertab, Tab completion
1. FuzzyFinder
1. https://github.com/scrooloose/nerdcommenter
1. https://github.com/scrooloose/nerdtree, file browser support
1. https://github.com/kien/ctrlp.vim, opens files
1. https://github.com/leshill/vim-json, json support
1. https://github.com/vim-ruby/vim-ruby, Ruby
1. https://github.com/pangloss/vim-javascript, Javascript, well, because who doesn't love Javascript !
1. https://github.com/itspriddle/vim-jquery, Jquery support
1. https://github.com/ShowMarks
1. python.vim, Python
1. django.vim & django_templates.vim
1. Python-Documentation, e.g. 
1. Gundo, visualizing your undo tree to make usable

## Installation instructions

1. Backup
    You problably should back up your current settings some where and delete the current folder first, e.g.

    ```sh
    mv ~./vim ~/.vim_back_up
    ```

1. Download the code

    ```sh
    git clone git://github.com/daleobrien/dotvim.git ~/.vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    ```


1. Create a simlink, if it doesn't already exist

    ```sh
    ln -s ~/.vim/vimrc ~/.vimrc
    ```

1. Install 3rd party plugins
  
    Launch `vim`, then run `:BundleInstall`





