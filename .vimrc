set encoding=utf-8

" leader
let mapleader = ","

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
if filereadable(expand("~/.vim/russian_support.vim"))
  source ~/.vim/russian_support.vim
endif
if filereadable(expand("~/.vim/abbreviations"))
    source ~/.vim/abbreviations
endif

""" GENERAL SETTINGS
set nocompatible                " not compatible with vi
set modeline                    " read per-file settings
set autowrite
set autoread
set hidden                      " dont output buffer if switching to other buffer
                                " thus we dont save this file to edit other file
set mousehide                   " dont show mouse while entering text
set backspace=2                 " make backspace work as expected
set updatetime=300              " updatetime of 4000 is too long
set laststatus=2                " always show statusline

""" SEARCH
set incsearch                   " search while typing
set hlsearch                    " highlight search
set ignorecase                  " ignore case in searches
set smartcase                   " if search contains uppercase letter, use case-sensetive search
set sessionoptions=curdir,buffers,tabpages,help,resize,winsize " restore session

""" LINES
set number                      " set lines numbers
set relativenumber              " make numbers relative
set scrolloff=9                 " scroll if close to the beginning of the file or to the end
set cursorline                  " highlight a line under the cursor
""" TABS AND FOLDS
set foldmethod=indent           " equally indented lines are folded
set foldlevel=8                 " folding level
set expandtab                   " Use spaces instead of Tabs, insert a tab with Ctrl-V<Tab>
set shiftwidth=4                " Number of spaces to use for each step of (auto)indent.
set tabstop=4                   " Number of spaces a tab counts for
set autoindent                  " Copy indent from current line when starting a new line
                                " (typing <CR> in Insert mode or when using the o or O command)
set smarttab
set smartindent

""" SPLITS
set splitbelow
set splitright

""" VISUALS
set t_Co=256                    " 256 colors terminal
let &t_ut=''                    " https://sw.kovidgoyal.net/kitty/faq.html#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
set noeb novb t_vb= belloff=all " No bells and whistles... so annoying
" display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set guifont=IBM\ Plex\ Mono\ 14
" https://www.reddit.com/r/vim/comments/75zvux/why_is_vim_background_different_inside_tmux/
if exists('$TMUX')
    " :h xterm-true-color
    let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
    let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
endif
" Switch syntax highlighting on, when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax enable
endif
filetype plugin indent on

""" COLORS
set background=dark
let base16colorspace=256
set termguicolors
" snazzy, nord, iceberg
colors base16-tomorrow-night

""" BACKUP, SWAP, UNDO, etc.
set nobackup
set nowritebackup
set noswapfile                  " do not create swap files
" In case backup and swap options are on, don't store those files next to the file that is being edited.
set backupdir=~/.vim/tmp/backup,.
set directory=~/.vim/tmp/swap,.
" Enable persistent undo so that undo history persists across vim sessions
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let undoDir = expand(vimDir . '/tmp/undo')
    call system('mkdir -p ' . undoDir)
    let &undodir = undoDir
    set undolevels=1000
    set undoreload=10000
    set undofile
endif

""" WILD OPTIONS
set wildmenu
set wildignore+=*.pyc,*.dll,*.o,*.bak,*.exe,*.jpg,*.jpeg,*.sublime-project,*.sublime-workspace
set wildmode=list:longest,list:full

" :h tabstop
"There are four main ways to use tabs in Vim:
"1. Always keep 'tabstop' at 8, set 'softtabstop' and 'shiftwidth' to 4
   "(or 3 or whatever you prefer) and use 'noexpandtab'.  Then Vim
   "will use a mix of tabs and spaces, but typing <Tab> and <BS> will
   "behave like a tab appears every 4 (or 3) characters.
"2. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use
   "'expandtab'.  This way you will always insert spaces.  The
   "formatting will never be messed up when 'tabstop' is changed.
"3. Set 'tabstop' and 'shiftwidth' to whatever you prefer and use a
   "|modeline| to set these values when editing the file again.  Only
   "works when using Vim to edit the file.
"4. Always set 'tabstop' and 'shiftwidth' to the same value, and
   "'noexpandtab'.  This should then work (for initial indents only)
   "for any tabstop setting that people use.  It might be nice to have
   "tabs after the first non-blank inserted as spaces if you do this
   "though.  Otherwise aligned comments will be wrong when 'tabstop' is
   "changed.
autocmd FileType php setlocal colorcolumn=121
" For python, regardless of what global settings are (they may change), comply with PEP-8
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 formatoptions=croqj textwidth=74 comments=:#\:,:#
autocmd FileType python let g:python_highlight_all=1
autocmd FileType python let g:python_highlight_exceptions=0
autocmd FileType python let g:python_highlight_builtins=0
autocmd FileType python let g:python_slow_sync=1
autocmd FileType cucumber setlocal expandtab shiftwidth=2 tabstop=2 comments=:#\:,:#
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType go setlocal nolist noexpandtab tabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal smartindent
autocmd FileType rust nmap <leader>cb :!cargo build<Return>
autocmd FileType rust nmap <leader>cr :!cargo run<Return>

" vim jumps to the last position when reopening a file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Removes trailing whitespaces
augroup removeTrailiingWhitespaces
    autocmd!
    autocmd BufWrite * execute "normal! mz" |  keeppatterns %s/\v\s+$//e | normal `z
augroup END


language time en_US.UTF-8
nnoremap <F5> "=strftime("%c")<cr>P
inoremap <F5> <C-R>=strftime("%c")<cr>

" alternate between 2 last files
nnoremap <leader><leader> <C-^>
nnoremap <silent> <leader>R :source ~/.vimrc<cr>:echo ".vimrc reloaded!"<cr>

" Switching windows by Ctrl+<direction>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Adjust split window sizes with Ctrl+<arrow>
nnoremap <silent> <C-Left> :vertical resize +5<cr>
nnoremap <silent> <C-Right> :vertical resize -5<cr>
nnoremap <silent> <C-Up> :resize +2<cr>
nnoremap <silent> <C-Down> :resize -2<cr>

function! GetPwd()
  return system('pwd')
endfunction
" cd into current buffer's directory
map <silent> <leader>fcd :cd %:h<cr>:pwd<cr>
" cd into system pwd
map <silent> <leader>cd :call GetPwd()<cr>:pwd<cr>

nnoremap <silent> <C-c> :noh<return><esc>
inoremap <silent> <C-c> <esc>
" Sort
vnoremap <silent> <leader>s :'<,'>%sort<cr>
" Reverse sort
vnoremap <silent> <leader>S :'<,'>%sort!<cr>

" source: https://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux
" make Left, Right, Up, and Down work when in screen/tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

""" BUFFERS MANAGEMENT
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Delete all buffers but this one.
" Link: https://stackoverflow.com/questions/4545275/vim-close-all-buffers-but-this-one/12318683
nnoremap <leader>dd :%bd\|e#\|bd#<cr>

" :w!! asks for sudo password to modify system files
cmap w!! %!sudo tee > /dev/null %
