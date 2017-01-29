" Plugin Settings
source $HOME/.config/nvim/plugin.vim

" Core
syntax enable on
filetype plugin indent on

" Make vim more tolerable on windows.
if has("win32")
    behave mswin
    let $PATH="C:\\Program Files\\Git\\bin\\;".$PATH
endif

" Enable new neovim features
if has("nvim")
    " Requires >= 0.1.7 - :help icm
    set inccommand=nosplit
endif

" Text & Color
set background=dark
set encoding=utf-8
set expandtab
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set t_Co=256
set colorcolumn=80
set list
set nowrap
colorscheme badwolf

" Functionality
let mapleader=','
set formatprg=par\ -w80req " requires par
set wildignore+=*.o,*.obj,.git,Library,*.pdf,*.lock,NTUSER*,ntuser*,.git*,AppData,.*
set showcmd

" Backups and Files
" Warning: can become very large over ~6 months of heavy use
set backup
set swapfile
set undofile
set dir=$HOME/.cache/nvim/session/
set undodir=$HOME/.cache/nvim/session/undo/
set backupdir=$HOME/.cache/nvim/session/backup/
set directory=$HOME/.cache/nvim/session/swap/
set viminfo+=n$HOME/.cache/nvim/session/viminfo

" Remaps
command! InsertISO8601 :normal a<c-r>=strftime('%Y-%m-%d')<cr>
inoremap <leader>d <esc>:InsertISO8601<cr>a
nnoremap <leader>d :InsertISO8601<cr>
nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
inoremap <F1> <ESC>
inoremap <silent> <c-c> <esc>
nnoremap <silent> <c-s> :update<cr>
" Re tab entire file
nnoremap <leader>f :retab<cr>:let save_pos = getpos(".")<cr>ggVG=<cr>:call setpos('.', save_pos)<cr>:nohlsearch<cr>:redraw!<cr>
" Yank entire file or visual selection into system clipboard (requires +clipboard)
nnoremap <leader>y :let save_pos = getpos(".")<cr>gg"+yG<cr>:call setpos('.', save_pos)<cr>
vnoremap <leader>y "+y<cr>
" Switch to previous buffer and delete buffer switched away from; great for keeping splits open
nnoremap <leader>D :b#<bar>bd#<cr>
nnoremap <silent> <leader>DD :exe ":profile start ~/vim_debug.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

" Auto-Commands
if has("autocmd")
    augroup vimrcEx
        autocmd!
        " When vim opens, go to last position that was edited.
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
        " Auto resize when terminal is resized
        autocmd VimResized * wincmd =
    augroup END
endif
