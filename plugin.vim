" minpac
packadd minpac
call minpac#init()
call minpac#add('w0rp/ale')
call minpac#add('chriskempson/base16-vim')
call minpac#add('roman/golden-ratio')
call minpac#add('kien/ctrlp.vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('artur-shaik/vim-javacomplete2')
call minpac#add('rust-lang/rust.vim')
call minpac#add('k-takata/minpac', {'type': 'opt'})

command! PluginInstallAndQuit call minpac#update('', {'do': 'quit'})
command! PluginInstall call minpac#update()
command! PluginUpdate call minpac#update()
command! PluginClean call minpac#clean()

" ale
let g:ale_sh_shellcheck_options="-x"
let g:ale_llvm_llc_options="-Weverything" "Does nothing, requires PR to ale project
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
