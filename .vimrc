syntax on
set nowrap

"fixe monokai theme
set bg=dark
set t_Co=256
colorscheme molokai

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

set foldcolumn=0
"set smartindent
set autoindent
set hls
set nocompatible
set showmatch   " Show matching brackets.
set smartcase   " Do smart case matching
set showcmd " Show (partial) command in status line.

" enter spaces when tab is pressed:
set expandtab
" do not break lines when line lenght increases
"set textwidth=79
set textwidth=0
" user 4 spaces to represent a tab
set tabstop=4
set softtabstop=4
" number of space to use for auto indent
" you can use >> or << keys to indent current line or selection
" in normal mode.
set shiftwidth=4
" Copy indent from current line when starting a new line.
"set autoindent
" makes backspace key more powerful.
set backspace=indent,eol,start
" shows the match while typing
set incsearch
" case insensitive search
"set number
" show line and column number
"set ruler
" show some autocomplete options in status bar
set wildmenu
set modeline
"set paste

"set foldlevel=2
"au BufNewFile,BufRead *.xml,*.htm,*.html so XMLFolding
"below command not good for place python or xml code
"filetype plugin indent on

filetype plugin on
let g:xml_syntax_folding=1

au BufNewFile,BufRead *.xml,*.xsl,*.rml,*.html setlocal fdm=marker
au BufRead *.py map <F5> :!python %<CR>

"" Toggles NERDTree
map <silent> <F9> :NERDTreeToggle %:p:h<CR>
":map <F2> GoDate: <Esc>:read !date<CR>kJ

"highlight Folded ctermfg=Yellow ctermbg=NONE
highlight Folded ctermbg=NONE
"set stye folding
set foldtext=PythonSimpleFoldText()
set fillchars=

"set stye folding
function! StrRepeat(string, times)
    let result = ''
    let times = a:times

    while times > 0
        let result = result.a:string
        let times = times - 1
    endwhile

    return result
endfunction

function! PythonSimpleFoldText()
    let lines = v:foldend - v:foldstart
    let line  = getline(v:foldstart)
    let width = &columns
    let spaces = StrRepeat('─', width - strlen(line) - strlen(lines) - 3)
    return line." ".spaces." ".lines
endfunction

"set mouse=a
nnoremap <F12> :call ToggleMouse()<CR>

"if has('mouse')
  "set mouse=a
"endif

function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

"map <S-Enter> O<Esc>
"map <CR> o<Esc>
"
au BufNewFile,BufRead *.py map <F3> :call Flake8()<CR>
au BufNewFile,BufRead *.py map <F4> :call ToggleDebug()<CR>
function! ToggleDebug()
    let lineno = line(".")
    let line = getline(lineno)

    if line =~ "pdb"
        call feedkeys("dd")
    else
        "call feedkeys("Oimport pdb; pdb.set_trace()\<Esc>")
        call feedkeys("Oimport pdb; pdb.set_trace()")
    endif
endfunction

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

",cd change path with current directory
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
