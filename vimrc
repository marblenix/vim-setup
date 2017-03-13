" Plugin Settings
source $HOME/.vim/plugin.vim

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
colorscheme badwolf
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

" Statusline
set statusline=%f        " Path to the file
set statusline+=\        " Separator
set statusline+=%=       " Align rest of the statusline to the right
set statusline+=%m       " [+] = modified, [-] = not modifiable, '' = unmodified
set statusline+=[%l/%L]  " Current line/Total Lines
set statusline+=%y       " Filetype of the file
set statusline+=[%{&ff}] " UNIX/DOS line endings

" Functionality
let mapleader=','
set formatprg=par\ -w80req " requires par
set wildignore+=*.o,*.obj,.git,Library,*.pdf,*.lock,NTUSER*,ntuser*,.git*,AppData,.*
set showcmd
set title
set regexpengine=1

" Backups and Files
" WARNING: can become very large over ~6 months of heavy use
set backup
set swapfile
set undofile
set dir=$HOME/.vim/session/
set undodir=$HOME/.vim/session/undo/
set backupdir=$HOME/.vim/session/backup/
set directory=$HOME/.vim/session/swap/
set viminfo+=n$HOME/.vim/session/viminfo

" Commands and functions
command! InsertISO8601 :normal a<c-r>=strftime('%F')<cr>
command! InsertFullISO8601 :normal a<c-r>=strftime('%FT%T%z')<cr>

function! FormatAndClean()
    %s/\s\+$//e
    retab
endfunction

" Remaps
inoremap <leader>d <esc>:InsertISO8601<cr>a
nnoremap <leader>d :InsertISO8601<cr>
nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
inoremap <F1> <esc>
inoremap <silent> <c-c> <esc>
nnoremap <silent> <c-s> :update<cr>

" Clean buffer
nnoremap <leader>f :call FormatAndClean()<cr>
nnoremap <leader>F :let save_pos = getpos('.')<cr>gg=G<cr>:call setpos('.', save_pos)<cr>

" Yank entire file or visual selection into system clipboard (requires +clipboard)
nnoremap <leader>y :let save_pos = getpos('.')<cr>gg"+yG<cr>:call setpos('.', save_pos)<cr>
vnoremap <leader>y "+y<cr>

" Debug running vim instance
nnoremap <silent> <leader>dd :exe ":profile start ~/vim_debug.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>dq :exe ":profile pause"<cr>:noautocmd qall!<cr>

" Auto-Commands
if has("autocmd")
    augroup vimrcEx
        " autocmd!
        " When vim opens, go to last position that was edited.
        autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
        " Auto resize when terminal is resized
        autocmd VimResized * wincmd =
    augroup END
endif
