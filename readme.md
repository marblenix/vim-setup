Introduction
------------

My personal vim install with sane defaults and useful plugins.

Installation
------------

You have two choices for installing:

On clean installs it's best to run `bin/install.sh`.

Warning: this is destructive; make sure you have ~/.vim and ~/.vimrc backed up.

    curl -L "https://raw.githubusercontent.com/marblenix/vim-setup/master/bin/install.sh" | bash -

Alternatively, if you don't want to remember this url, you can use the following, which points to the same file.

    curl -L "bit.ly/marblenix-vim" | bash -
    
Otherwise you can manually install with the following depending on your environment:

1. Backup and remove `~/.vimrc` and `~/.vim`
2. `cd ; git clone https://github.com/marblenix/vim-setup ~/.vim`
3. `mkdir -p ~/.vim/bundle ~/.vim/session/{backup,swap,undo}`
4. `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
5. `vim +PluginInstall +qall`
6. `ln -s ~/.vim/vimrc ~/.vimrc`
7. optional: Install the-silver-searcher, par, and add bin/cm to $PATH
