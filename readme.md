Introduction
------------

My personal vim install with sane defaults and useful plugins.

Installation
------------

You have two choices for installing:

On clean installs it's best to run `bin/install.sh`.

*NOTE*: While this is not destructive, it is still a good idea to have ~/.vim and ~/.vimrc backed up.

    curl -sL "https://raw.githubusercontent.com/marblenix/vim-setup/master/bin/install.sh" | bash -

Alternatively, if you don't want to remember/type this url, you can use the following, which redirects to the same file.

    curl -sL "marblenix.com/vim.sh" | bash -
    
Otherwise you can manually install with the following depending on your environment:

1. Backup and remove `~/.vimrc` and `~/.vim`
2. `cd ; git clone https://github.com/marblenix/vim-setup ~/.vim`
3. `mkdir -p ~/.vim/bundle ~/.vim/session/{backup,swap,undo}`
4. `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
5. `vim +PluginInstall +qall`
6. `ln -s ~/.vim/vimrc ~/.vimrc`
7. optional: Install par

----

P.S. It is always a good idea to double check that the script you
download is the script you want to run. Feel free to expand on the
commands above by downloading the file first before running the shell
script.
