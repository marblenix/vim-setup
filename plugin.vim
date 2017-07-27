" Vundle
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'w0rp/ale'
  Plugin 'keith/swift.vim'

  Plugin 'lilydjwg/colorizer'
  Plugin 'sjl/badwolf'

  Plugin 'roman/golden-ratio'
  Plugin 'ervandew/supertab'
  Plugin 'kien/ctrlp.vim'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-fugitive'

  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-rails'
call vundle#end()

" ale
" shellcheck -x follows sourced files. see `man shellcheck` for more.
let g:ale_sh_shellcheck_options="-x"
" For some reason not all linters are enabled by default. (swift, notably).
for f in split(glob('~/.vim/bundle/ale/ale_linters/*/*.vim'), '\n')
    exe 'source' f
endfor

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
