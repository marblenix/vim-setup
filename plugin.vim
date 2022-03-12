if &compatible
  set nocompatible
endif

packadd vim-plug
call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'
Plug 'markcornick/vim-bats'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'junegunn/vim-plug', { 'type': 'opt' }
if has('mac')
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif
call plug#end()

" ale
let g:ale_sh_shellcheck_options="-x"
let g:ale_completion_enabled = 1

" commentary
autocmd FileType hugo setlocal commentstring={{/*\ %s\ */}}

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

" colorizer
set termguicolors
lua require 'colorizer'.setup()
