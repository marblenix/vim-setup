" Plugin Settings
source $HOME/.config/nvim/plugin.vim

" Core
syntax enable on
filetype plugin indent on

if has("win32")
  behave mswin
  let $PATH="C:\\Program Files\\Git\\bin\\;".$PATH
endif

" Text & Color
set background=dark
set encoding=utf-8
set expandtab
set hlsearch
set shiftwidth=2
set softtabstop=2
set t_Co=256
set tabstop=2
set colorcolumn=80
colorscheme badwolf

" Functionality
let mapleader=','
set formatprg=par\ -w80req
set wildignore+=*.o,*.obj,.git,Library,*.pdf,*.lock,*\\doc\\*,*/doc/*,NTUSER*,ntuser*,.git*,AppData,.*

" Backups and Files
set backup
set swapfile
set undofile
set dir=$HOME/.config/nvim/session/
set undodir=$HOME/.config/nvim/session/undo/
set backupdir=$HOME/.config/nvim/session/backup/
set directory=$HOME/.config/nvim/session/swap/
set viminfo+=n$HOME/.config/nvim/session/viminfo

" Remaps
command! InsertISO8601 :normal a<c-r>=strftime('%Y-%m-%d')<cr>
inoremap <F1> <ESC>
inoremap <silent> <C-C> <Esc>
inoremap <leader>d <esc>:InsertISO8601<cr>a
nnoremap <leader>d :InsertISO8601<cr>
nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
nnoremap <silent> <C-S> :<C-u>update<CR>
nnoremap <leader>D :b#<bar>bd#<CR>
  " Switch to previous buffer and delete buffer switched away from; great for keeping splits open
nnoremap <silent> <leader>DD :exe ":profile start ~/vim_debug.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

" Auto-Commands
if has("autocmd")
  augroup vimrcEx
    autocmd!
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
      " When vim opens, go to last position that was edited.
  augroup END
endif
