set encoding=utf-8

" leader
let mapleader = ";"

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
if filereadable(expand("~/.vim/russian_support.vim"))
  source ~/.vim/russian_support.vim
endif
if filereadable(expand("~/.vim/abbreviations"))
    source ~/.vim/abbreviations
endif

set backspace=2
set autowrite
set nobackup
set nowritebackup
set t_Co=256                   " 256 colors terminal
set noswapfile                 " do not create swap files
set nocompatible               " not compatible with vi
set foldmethod=indent          " equally indented lines are folded
set foldlevel=8                " folding level
set modeline                   " read per-file settings
set tabstop=4                  " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4               " Number of spaces to use for each step of (auto)indent.
                               " Used for 'cindent', >>, <<, etc.
set expandtab                  " Use spaces instead of Tabs, insert a tab with Ctrl-V<Tab>
set softtabstop=4
" DONT SET! BREAKS SUPERTAB COMPLETION
"set paste                      " 'textwidth' is set to 0
                               " 'wrapmargin' is set               to 0
                               " 'autoindent' is reset
                               " 'smartindent' is reset
                               " 'softtabstoptop' is set to 0
                               " 'revins' is reset
                               " 'ruler' is reset
                               " 'showmatchtch' is reset
                               " 'formatoptions' is used like it is empty
set autoindent                 " Copy indent from current line when starting a new line
                               " (typing <CR> in Insert mode or when using the o or O command)
set scrolloff=9                " scroll if close to the beginning of the file or to the end
set novisualbell               " do not make any noise
set t_vb=                      " no visualbell
set hidden                     " dont output buffer if switching to other buffer
                               " thus we dont save this file to edit other file
set mousehide                  " dont show mouse while entering text
set laststatus=2               "
set smartindent
set smarttab
" set cindent " <- don't use this!
set cursorline                 " highlight a line under the cursor
set incsearch                  " search while typing
set hlsearch                   " highlight search
set nu                         " set lines numbers
set ic                         " ignore case in searches
set sessionoptions=curdir,buffers,tabpages,help,resize,winsize " restore session
set wildmenu
set wildignore+=*.pyc,*.dll,*.o,*.bak,*.exe,*.jpg,*.jpeg,*.sublime-project,*.sublime-workspace
" set wildmode=list:full
set wildmode=list:longest,list:full
set backupdir=~/.vim/tmp/backup,.
set directory=~/.vim/tmp/swap,.
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set background=dark
colorscheme xoria256
set guifont=Monaco\ 10
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif
filetype plugin indent on

" table mode for md files
autocmd FileType php setlocal colorcolumn=121
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
autocmd FileType python let python_highlight_all=1
autocmd FileType python let python_highlight_exceptions=0
autocmd FileType python let python_highlight_builtins=0
autocmd FileType python let python_slow_sync=1
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType ruby setlocal sw=2 ts=2 sts=2 smartindent
autocmd FileType javascript setlocal sw=4 ts=8 sts=4 smartindent


lan tim en_US.UTF-8
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>
nnoremap <leader><leader> <C-^> " alternate between 2 last files
" Effectively C-C is the same to Esc, but some plugins will treat only Esc
" properly ¯\_(ツ)_/¯ Especially that was irritating with coc.nvim plugin
" which would hang a dangling tooltip on completion selection followed by
" Ctrl+C
inoremap <C-C> <Esc>

function! GetPwd()
  return system('pwd')
endfunction

map <leader>fcd :cd %:h<cr>:pwd<cr>
map <leader>cd :call GetPwd()<cr>:pwd<cr>

" cargo commands
map <leader>cb :!cargo build<Return>
map <leader>cr :!cargo run<Return>

" Ctrl-Space for completions. Heck Yeah!
"inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
    "\ "\<lt>C-n>" :
    "\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    "\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    "\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
"imap <C-@> <C-Space>

" :w!! asks for sudo password to modify system files
cmap w!! %!sudo tee > /dev/null %
