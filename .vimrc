filetype off
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
filetype on                " try to detect filetypes
filetype plugin indent on  " enable loading indent file for filetype
filetype plugin on  " enable loading indent file for filetype
syntax on                  " syntax highlighing

" add Russian support
source ~/.vim/russian_support.vim

" / is not handy since disposition on different keyboards differs and
" sometimes it's hard to strech pinky to reach leader /
let mapleader = ","

" table mode for md files
autocmd FileType markdown :TableModeEnable
autocmd FileType markdown let g:table_mode_corner="|"

" Syntax checkers
map <leader>sc :SyntasticCheck
let g:syntastic_python_checkers=['flake8','pyflakes','python']
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--encoding=utf-8 -s --standard=PSR2 --sniffs=Generic.ControlStructures.InlineControlStructure,Generic.Files.ByteOrderMark,Generic.Files.LineEndings,Generic.Formatting.DisallowMultipleStatements,Generic.Functions.FunctionCallArgumentSpacing,Generic.NamingConventions.UpperCaseConstantName,Generic.PHP.DisallowShortOpenTag,Generic.PHP.LowerCaseConstant,Generic.PHP.LowerCaseKeyword,Generic.WhiteSpace.DisallowTabIndent,Generic.WhiteSpace.ScopeIndent,PEAR.Functions.ValidDefaultValue,PSR1.Classes.ClassDeclaration,PSR2.Classes.ClassDeclaration,PSR2.ControlStructures.ControlStructureSpacing,PSR2.ControlStructures.ElseIfDeclaration,PSR2.ControlStructures.SwitchDeclaration,PSR2.Files.ClosingTag,PSR2.Files.EndFileNewline,PSR2.Namespaces.NamespaceDeclaration,PSR2.Namespaces.UseDeclaration,Squiz.Classes.ValidClassName,Squiz.ControlStructures.ControlSignature,Squiz.ControlStructures.ForEachLoopDeclaration,Squiz.ControlStructures.ForLoopDeclaration,Squiz.ControlStructures.LowercaseDeclaration,Squiz.Functions.FunctionDeclarationArgumentSpacing,Squiz.Functions.FunctionDeclaration,Squiz.Functions.LowercaseFunctionKeywords,Squiz.Functions.MultiLineFunctionDeclaration,Squiz.Scope.MethodScope,Squiz.WhiteSpace.ScopeClosingBrace,Squiz.WhiteSpace.ScopeKeywordSpacing,Squiz.WhiteSpace.SuperfluousWhitespace'
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:syntastic_javascript_checkers=['eslint']
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" let g:syntastic_javascript_jslint_conf = '--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars --indent'
"let g:syntastic_mode_map = { 'mode': 'active',
      "\ 'active_filetypes': ['ruby', 'php', 'python'],
      "\ 'passive_filetypes': ['puppet'] }
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'php', 'python'],
      \ 'passive_filetypes': ['puppet'] }

" basic settings
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
set wildmode=list:full
set backupdir=~/.vim/tmp/backup,.
set directory=~/.vim/tmp/swap,.
set statusline=[%{getcwd()}]\ %<%f%h%m%r\ [:b%n]\ %y\ %{fugitive#statusline()}\ %b\ ENC\:\ %{&encoding}\ TERM\:\ %{&termencoding}\ %l,%c%V\ %P

" Fugitive settings
let g:git_branch_status_nogit="nogit"
let b:SuperTabDisabled = 1

" background settings
set background=dark
colorscheme xoria256 " wombat

set guifont=Monaco\ 10
map <leader>td <Plug>TaskList
map <F6> :GundoToggle<CR>
" map <F3> :CommandT<Return>
map <F3> :CtrlPCurWD<Return>

" let g:CommandTMaxFiles=40000
" let g:CommandTMaxHeight=10
let g:ctrlp_max_files=90000

autocmd BufNewFile,BufRead *.php_tmpl

autocmd FileType php setlocal colorcolumn=121
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
            \ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

" Don't warn on
"   E121 continuation line indentation is not a multiple of four
"   E128 continuation line under-indented for visual indent
"   E711 comparison to None should be 'if cond is not None:'
"   E301 expected 1 blank line, found 0
"   E261 at least two spaces before inline comment
"   E241 multiple spaces after ':'
"   E124 closing bracket does not match visual indentation
"   E126 continuation line over-indented for hanging indent
"   E721 do not compare types, use 'isinstance()'
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
 \ --max-line-length=84'

let g:pyflakes_use_quickfix = 0
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete sw=4 ts=8 sts=4 smartindent " omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal sw=2 ts=2 sts=2 smartindent
autocmd FileType javascript setlocal sw=4 ts=8 sts=4 smartindent
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufNewFile,BufRead,BufEnter,FileType *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
nmap <leader>a <Esc>:Ack!
map <leader>k :bd<CR>
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

:lan tim en_US.UTF-8
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F9> :!/usr/bin/ctags -R --PHP-kinds=cfiv --fields=+iaS --extra=+q --exclude=".svn" --exclude="*.js" --exclude="*.css" --regex-PHP="/(abstract)?\s+class\s+([^ ]+)/\2/c/" --regex-PHP="/(static\|abstract\|public\|protected\|private)\s+(final\s+)?function\s+(\&\s+)?([^ (]+)/\4/f/" --regex-PHP="/interface\s+([^ ]+)/\1/i/" --regex-PHP="/\$([a-zA-Z_][a-zA-Z0-9_]*)/\1/v/" .<CR>

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
function! GetPwd()
  return system('pwd')
endfunction
map <leader>fcd :cd %:h<cr>:pwd<cr>
map <leader>cd :call GetPwd()<cr>:pwd<cr>

" highlight text if it's length exceeds 80 symbols
" highlight OverLength ctermbg=red ctermfg=white guibg=#8A4040
" match OverLength /\%>80v.\+/



" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
    \ "\<lt>C-n>" :
    \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
    \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
    \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" :w!! asks for sudo password to modify system files
cmap w!! %!sudo tee > /dev/null %
map <leader>af :Autoformat<CR><CR>


" https://git.drom.ru/snippets/31
" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
" let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 1                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.

"nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
"nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>


source ~/.vim/drom
