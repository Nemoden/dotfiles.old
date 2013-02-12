filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
"call pathogen#infect()
syntax on                  " syntax highlighing
filetype on                " try to detect filetypes
filetype plugin indent on  " enable loading indent file for filetype
filetype plugin on  " enable loading indent file for filetype



let g:file_template_default = {}
let g:file_template_default['php'] = 'template'


source ~/.vim/russian_support.vim

" / is not handy since disposition on different keyboards differs and 
" sometimes it's hard to strech pinky to reach leader /
let mapleader=","

" settings
" basic
set noswapfile " do not create swap files
set nocompatible " not compatible with vi
" indentation
set backupdir=~/.vim/tmp/backup,.
set directory=~/.vim/tmp/swap,.
set foldmethod=indent
set foldlevel=99
set modeline "read per-file settings
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent
set scrolloff=9
set novisualbell
set t_vb =
set hidden " dont output buffer if switching to other buffer thus we dont save this file to edit other file
set mousehide " dont show mouse while entering text
set laststatus=2
" let g:git_branch_status_head_current=1
let g:git_branch_status_nogit="nogit"
set statusline=%<%f%h%m%r\ [:b%n]\ %y\ %{fugitive#statusline()}\ %b\ ENC\:\ %{&encoding}\ TERM\:\ %{&termencoding}\ %l,%c%V\ %P 
set smartindent
set sessionoptions=curdir,buffers,tabpages
set cursorline
set incsearch " search while typing 
set hlsearch " highlight search
set nu " set lines numbers
set ic " ignore case in searches

" background settings
set background=dark
colorscheme wombat

set guifont=DejaVu\ Sans\ Mono\ 10
map <leader>td <Plug>TaskList
map <F6> :GundoToggle<CR>
map <F3> :CommandT<Return>

let g:CommandTMaxFiles=40000
let g:CommandTMaxHeight=10

autocmd BufNewFile,BufRead *.php_tmpl

let g:pyflakes_use_quickfix = 0
au FileType python setlocal omnifunc=pythoncomplete#Complete sw=4 ts=8 sts=4 smartindent
au FileType javascript setlocal sw=4 ts=8 sts=4 smartindent
let ropevim_vim_completion=1
au FileType php set omnifunc=phpcomplete#CompletePHP
au BufNewFile,BufRead,BufEnter,FileType *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!
" integration with git
"%{fugitive#statusline()}

" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" {{{ Locale settings
" if we have BOM => this is BOM
if &fileencodings !~? "ucs-bom"
  set fileencodings^=ucs-bom
endif
if &fileencodings !~? "utf-8"
  let g:added_fenc_utf8 = 1
  set fileencodings+=utf-8
endif
if &fileencodings !~? "default"
set fileencodings+=default
endif
" }}}

:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F9> :!/usr/bin/ctags -R --PHP-kinds=cfiv --fields=+iaS --extra=+q --exclude=".svn" --exclude=".js" --exclude=".css" --regex-PHP="/(abstract)?\s+class\s+([^ ]+)/\2/c/" --regex-PHP="/(static\|abstract\|public\|protected\|private)\s+(final\s+)?function\s+(\&\s+)?([^ (]+)/\4/f/" --regex-PHP="/interface\s+([^ ]+)/\1/i/" --regex-PHP="/\$([a-zA-Z_][a-zA-Z0-9_]*)/\1/v/" .<CR>

set fileencodings=cp1251,utf-8,koi8-r,cp866

menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix <CR> :set termencoding=unix <CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=unix <CR> :set termencoding=cp1251<CR> 
menu Encoding.cp866 :e ++enc=cp866 ++ff=unix <CR> :set termencoding=cp866 <CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR> :set termencoding=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix <CR> :set termencoding=unix <CR>
let &termencoding = &encoding

map <F8> :emenu Encoding.

function! ReadFileName() 
let l:linenum = search("^// *[Mm]odule","w") 
let l:filename = getreg("%") 
let l:newline = '// Module : '.filename 
sil exe ":call setline(linenum, newline)"
endfunction

" SVN Commands go here:
" Ctrl + Q,E,A do not work in terminal
if has("hui_running")
  map <C-e> :VCSUpdate <Return>
  "map <C-q> :VCSCommit <C-R>=expand("%:p:t")<CR>
  map <C-q> :VCSCommit <C-R>=expand("%")<CR>
  map <C-a> :VCSAdd <Return>
endif
" this bindings should work either way
"map <leader>q :VCSCommit <C-R>=expand("%:p:t")<CR>
map <leader>q :VCSCommit <C-R>=expand("%")<CR>
map <leader>e :VCSUpdate <Return>
map <leader>a :VCSAdd <Return>

map <F2> :NERDTreeToggle <Return>

source ~/.vim/abbreviations

" open vimrc on leader-vimrc
map <leader>vimrc :e ~/.vimrc<cr>
"autocmd bufwritepleader-vimrcost .vimrc :source $MYVIMRC

" highlight text if it's length exceeds 80 symbols
highlight OverLength ctermbg=red ctermfg=white guibg=#8A4040
match OverLength /\%>80v.\+/
