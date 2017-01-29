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
  Plugin 'chase/vim-ansible-yaml'
  Plugin 'roman/golden-ratio'
call vundle#end()

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Syntastic has a bug where it hangs on .java files in nvim
let g:syntastic_ignore_files = ['\m\c\.java$', '\m\c\.env$']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_html_tidy_ignore_errors = [
    \"trimming empty <i>",
    \"trimming empty <span>",
    \"<input> proprietary attribute \"autocomplete\"",
    \"proprietary attribute \"role\"",
    \"proprietary attribute \"hidden\""
    \ ]

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll|DS_Store|Trash)$',
      \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
      \ }

" vim-ansible-yaml
let g:ansible_options = {'ignore_blank_lines': 0}
