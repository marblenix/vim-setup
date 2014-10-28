" Variables
let mapleader=','
let g:ackprg = 'ag --nogroup --nocolor --column' " requires the-silver-searcher

" Plug-ins (requires Vundle)
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'chriskempson/base16-vim'
Plugin 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/badwolf'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
call vundle#end()
syntax enable on
filetype plugin indent on

" Functionality
set modeline
set visualbell
set vb t_vb=   " disable bell
set encoding=utf-8
set nrformats=
set formatprg=par " requires par
set backspace=indent,eol,start
set pastetoggle=<Leader>p
set pumheight=8
set hidden
set wildignore+=*.o,*.obj,.git,Library,*.pdf
set hlsearch
set cursorline
set cindent
set smartindent
set autoindent
let g:syntastic_python_python_exec = 'python3'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|DS_Store|Trash)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

" Visual and Editing
set t_Co=256
set background=dark
set colorcolumn=79,80
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set laststatus=2
set nowrap
set lcs=tab:▸\ ,eol:¶
colorscheme badwolf

" Backups and Files
set backup
set undofile
set swapfile
set dir=$HOME/.vim/session/
set undodir=$HOME/.vim/session/undo/
set backupdir=$HOME/.vim/session/backup/
set directory=$HOME/.vim/session/swap/
set viminfo+=n$HOME/.vim/session/viminfo
set dictionary=/usr/share/dict/words

" Remaps
command! InsertISO8601 :normal a<c-r>=strftime('%Y-%m-%d')<cr>
inoremap <leader>d <esc>:InsertISO8601<cr>a
nnoremap <leader>d :InsertISO8601<cr>
nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
" The following requires the plugin 'majutsushi/tagbar' and exuberant ctags
nnoremap <F8> :TagbarToggle<cr>:redraw!<cr>
inoremap <C-c> <Esc>

" Auto-Commands
if has("autocmd")
  augroup vimrcEx
    autocmd!
    " When vim opens, go to last position that was edited.
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
    autocmd BufRead,BufNewFile *.rss     setfiletype xml
    autocmd BufRead,BufNewFile *.txt     setfiletype text
    autocmd BufRead,BufNewFile crontab.* setfiletype crontab
    autocmd FileType crontab set nobackup noswapfile noundofile expandtab
    autocmd FileType python  set ts=4 sts=4 sw=4 expandtab list
    autocmd FileType text    set tw=80 spell
    autocmd FileType bash,ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  augroup END
endif
