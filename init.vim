" Plugin Settings
exec "source " . stdpath('config') . "/plugin.vim"

" Core
syntax enable on
filetype plugin indent on

" Enable new neovim features
if has("nvim")
    " Requires >= 0.1.7 - :help icm
    set inccommand=nosplit
endif

" Text & Color
colorscheme $TERM_THEME
set background=light
set encoding=utf-8
set expandtab
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set t_Co=256
set list
set nowrap

" Statusline see ':tab help statusline'
set statusline=%f        " Path to the file
set statusline+=\        " Separator
set statusline+=%=       " Align rest of the statusline to the right
set statusline+=%m       " [+] = modified, [-] = not modifiable, '' = unmodified
set statusline+=[%l/%L]  " Current line/Total Lines
set statusline+=%y       " Filetype of the file
set statusline+=[%{&ff}] " UNIX/DOS line endings
set titlestring=NeoVIM\ -\ %f\ %m%r
set laststatus=2
set cmdheight=3

" Functionality
let mapleader=','
set formatprg=par\ -w80req " requires par
set mouse=a
set number
set regexpengine=1
set showcmd
set title
set wildignore+=*.o,*.obj,.git,Library,*.pdf,*.lock,NTUSER*,ntuser*,.git*,AppData,.*

" Backups and Files
" WARNING: can become very large over ~6 months of heavy use
set backup
set swapfile
set undofile
set dir=$HOME/.cache/nvim/session/
set undodir=$HOME/.cache/nvim/session/undo/
set backupdir=$HOME/.cache/nvim/session/backup/
set directory=$HOME/.cache/nvim/session/swap/
if has('nvim')
    set viminfo+=n$HOME/.cache/nvim/session/viminfo
endif

" Commands and functions
command! InsertISO8601 :normal a<c-r>=strftime('%F')<cr>
command! InsertFullISO8601 :normal a<c-r>=strftime('%FT%T%z')<cr>

function! FormatAndClean()
    %s/\s\+$//e
    retab
endfunction

function! FixIndentation()
    normal gg=G''
endfunction

" Remaps
inoremap <leader>d <esc>:InsertISO8601<cr>a
nnoremap <leader>d :InsertISO8601<cr>
nnoremap <cr> :nohlsearch<cr>:redraw!<cr>
inoremap <silent> <c-c> <esc>
nnoremap <silent> <c-s> :update<cr>

" Clean buffer
nnoremap <leader>f :call FormatAndClean()<cr>
nnoremap <leader>F :call FixIndentation()<cr>

" Yank entire file or visual selection into system clipboard (requires +clipboard)
nnoremap <leader>y :let save_pos = getpos('.')<cr>gg"+yG<cr>:call setpos('.', save_pos)<cr>
vnoremap <leader>y "+y<cr>

" Debug running vim instance
nnoremap <silent> <leader>dd :exe ":profile start ~/vim_debug.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>dq :exe ":profile pause"<cr>:noautocmd qall!<cr>

" Highlight on yank
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

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
