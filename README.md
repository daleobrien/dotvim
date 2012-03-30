# Vim settings

These are settings for ```vim``` which I mainly use for editing python code in.

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





