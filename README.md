# Vim settings

These are settings for ```vim``` which I mainly use for editing python code in.  I've installed the following plugins

1. https://github.com/scrooloose/syntastic, highlights programming errors.  Might need to install some or all of pyflakes, pylint, flake8.
1. https://github.com/scrooloose/nerdcommenter
1. https://github.com/scrooloose/nerdtree, file browser
1. https://github.com/Valloric/YouCompleteMe, A code-completion engine for Vim
1. SirVer/ultisnips & honza/vim-snippets, Code snippets that work with YouCompleteMe
1. altercation/vim-colors-solarized, For some nice colours/colors

## Installation instructions

1. Backup
    You problably should back up your current settings some where and delete the current folder first, e.g.

    ```sh
    mv ~/.vim ~/.vim_back_up
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

    Compile "YouCompleteMe" without C-Language support

    ```    
    sudo yum -y install cmake
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh
    ```
