" Vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'ervandew/supertab'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-commentary'
  Plugin 'lilydjwg/colorizer'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-fugitive'
  Plugin 'sjl/badwolf'
  Plugin 'roman/golden-ratio'
call vundle#end()

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_tidy_ignore_errors = [
            \'plain text isn',
            \'escaping malformed URI reference',
            \'is not recognized!',
            \'discarding unexpected',
            \'trimming empty',
            \'inserting implicit',
            \'proprietary attribute'
            \]

" -- Syntastic has a bug where it hangs on .java files in nvim
" -- *-bats.sh files are for the BASH Automated Test System and cannot by
" checked by Syntastic. https://github.com/sstephenson/bats
let g:syntastic_ignore_files = [
            \'\m\c\.java$',
            \'\m\c\.env$',
            \'\m\c-bats.sh$'
            \]

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" The following only loads if you are not in a git repository due to g:ctrlp_user_command
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|DS_Store|Trash|gif|doc|docx|ico|jpg|lock|min.css|min.js|mp4|ogg|ogv|pdf|png|psd|svg|swf|ttf|webm|xls|xlsx)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
            \ }

" golden-ratio
" The following keeps the Syntastic window from changing size.
let g:golden_ratio_exclude_nonmodifiable = 1
