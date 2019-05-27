if &compatible
  set nocompatible
endif

packadd vim-plug
call plug#begin()
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'roman/golden-ratio'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/vim-plug', { 'type': 'opt' }
call plug#end()

" ale
let g:ale_sh_shellcheck_options="-x"
let g:ale_completion_enabled = 1

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
