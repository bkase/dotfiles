" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim72/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" no vi compatibility
set nocompatible

set modelines=0

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" directory
set directory=/home/bkase/.vim

" disable backups (and swap)
set nobackup
set nowritebackup
set noswapfile

" wrap searches
set wrapscan

" tab and indentation
set tabstop=4
set softtabstop=4
set noexpandtab
set smarttab
set shiftwidth=4
set backspace=indent,eol,start
set autoindent
set smartindent
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast
set cursorline
set laststatus=2
set relativenumber
set undofile
set nopaste

" show commands
set showcmd

" yank to paste buffer
set clipboard=unnamedplus

" show line and column position of cursor
set ruler

" status bar
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %c,%l/%L]\
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set cmdheight=1

" textwidth
"set textwidth=80

" formatting options
set formatoptions=c,q,r,t

" line numbers
set number

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" syntax highlighting
filetype plugin on
syntax on

" enable mouse
set mouse=a

" set colorscheme
"colorscheme solarized
colorscheme dawn

"allows sudo with :w!!
cmap w!! %!sudo tee > /dev/null %

" auto indent
filetype plugin indent on

" leader key to ,
let mapleader=","

" source matchit.vim so that % can search through if/else/etc
runtime plugins/matchit.vim

" maintain more context around cursor
set scrolloff=3

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" VERY useful remap
nnoremap ; :
nnoremap j gj
nnoremap k gk
"nnoremap s l
"nnoremap l s
"vnoremap s l
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" fix regex so it's like perl/python
nnoremap / /\v
vnoremap / /\v

" clear highlights with ,<space>
nnoremap <leader><space> :noh<cr>

" map tab to %
nnoremap <tab> %

" hides buffers instead of closing them
set hidden

set history=1000   " remember more commands and search history
set undolevels=1000 " use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
"set title "terminal title

" Shows spaces as you're writing
"set list
"set listchars=tab:>.trail:.,extends:#,nbsp:.

set pastetoggle=<F2>

" Help key annoyance
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" auto-save on leaving focus
au FocusLost * :wa

" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack
nnoremap <leader>a :Ack

" reselect things just pasted
nnoremap <leader>v V`]

" quick exit from insert
inoremap jj <ESC>

" open a new split and go to it ,w
nnoremap <leader>w <C-w>v<c-w>l

" remap for C-moving windowsing
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Tex-Live grep fix
set grepprg=grep\ -nH\ $*

" Python stuff
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

" indent-guides config
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=grey

"tagbar config
nmap <leader>t :TagbarToggle<CR>

"fuzzyfinder config
nnoremap <leader>f :FufFile<CR>
nnoremap <leader>b :FufBuffer<CR>

"eclim
" ,i imports whatever is needed for current line
nnoremap <silent> <LocalLeader>i :JavaImport<cr>
" ,d opens javadoc for statement in browser
nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
nnoremap <silent> <LocalLeader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
nnoremap <silent> <LocalLeader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
"use default Taglist instead of Eclim, avoid problem
let g:EclimTaglistEnabled=0
"if the current file is in a Eclipse project, open project tree automatically
let g:EclimProjectTreeAutoOpen=1
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1  "share tree instance through all tabs
" use tabnew instead of split for new action
let g:EclimProjectTreeActions = [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]

"LaTeX
"Compile to pdf
let g:Tex_CompileRule_dvi = 'pdflatex $*'
"auto recompile upon save
autocmd BufWritePost *.tex execute "normal ,ll"
"custom folds
let g:Tex_FoldedEnvironments = 'question,verbatim,comment,eq,gather,itemize,align,figure,table,thebibliography,keywords,abstract,titlepage'
"awesome macros
autocmd BufRead,BufNewFile *.tex call IMAP('`s', '\sum_{<++>}^{<++>}<++>', 'tex')
autocmd BufRead,BufNewFile *.tex call IMAP('`m', '\mathbb{<++>}<++>', 'tex')
autocmd BufRead,BufNewFile *.tex call IMAP('`v', '\verb~<++>~<++>', 'tex')
autocmd BufRead,BufNewFile *.tex call IMAP('`l', '\lambda', 'tex')

"make sig files have proper highlighting
autocmd BufRead,BufNewFile *.sig set filetype=sml
autocmd BufRead,BufNewFile sources.cm set filetype=sml
autocmd BufRead,BufNewFile *.ispc set filetype=ispc
autocmd BufRead,BufNewFile *todo.txt set filetype=todo.txt

"make haskell files override 'K' functionality
autocmd FileType haskell nnoremap K :call Haddock()
autocmd ShellCmdPost *.hs redraw!
let g:haddock_browser = '/usr/bin/lynx'

"fix the bad search color with solarized
hi Search ctermbg=7

"Scala tagbar configuration
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }
"Start Tagbar for Scala files
autocmd BufRead,BufNewFile *.scala execute "normal ,t"

