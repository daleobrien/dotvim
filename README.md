## Vim settings

Just my VIM settings.

## Installation instructions

You problably should back up your current ~/.vim folder some where and delete the current folder first.

1. Download the code

```sh
git clone git://github.com/daleobrien/dotvim.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```


3. Create a simlink, if it doesn't already exist

```sh
ln -s ~/.vim/vimrc ~/.vimrc
```

4. Install 3rd party plugins

Launch `vim`, then run `:BundleInstall`





