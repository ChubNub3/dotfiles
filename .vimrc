"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
" Date modified: 7-20-2022
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
filetype indent on
filetype plugin on
set noswapfile
syntax on

"--Vim Presets--
set nu
set cursorline

set cursorcolumn
set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set smarttab

set incsearch
set hlsearch
set ignorecase "Ignores capitilization from search

set lazyredraw  
set linebreak "doesnt make lines go across window

set scrolloff=1 
set sidescrolloff=5
set wrap
set title
set nomodeline
set mouse=a

set laststatus=2
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set statusline+=%=
set statusline+=\ %F\ %M\ %Y\ %R

set noerrorbells 
set vb t_vb=
set history=1000

" Make terminal open below file, terminal size 10x0
set splitbelow
set termwinsize=5x0

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.class

"---Plugins---
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe' " Auto completetion
Plug 'morhetz/gruvbox' "Colorscheme
Plug 'junegunn/fzf', {'do': { -> fzf#install() } } "fuzzy finder
Plug 'junegunn/fzf.vim' "fuzzy finder
Plug 'preservim/nerdtree' "File finder
Plug 'vim-airline/vim-airline' "aesthetic core uwu
Plug 'vim-airline/vim-airline-themes' "Aesthetic core uwu pt.2
Plug 'frazrepo/vim-rainbow' "Helps find brackets and stuff
Plug 'mbbill/undotree' "Shows all previous changes saved on tree
Plug 'chiel92/vim-autoformat' "Auto format
Plug 'uiiaoo/java-syntax.vim' "Better java Syntax highlighting
Plug 'tpope/vim-fugitive' "Git commands in Vim
Plug 'honza/vim-snippets' " Snippets !!
Plug 'SirVer/ultisnips' " Snippet engine  
Plug 'tpope/vim-commentary' "Commentary Stuff
call plug#end()

"--Colorscheme aesthetic stuff--
colorscheme gruvbox
set background=dark
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }


"----Basic Key Bindings----
let g:mapleader = "'"

inoremap jj <esc>
vnoremap jj <esc>

nnoremap <leader>w :wincmd w<CR>
nnoremap <leader>g <c-w>v <CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>t :term <CR>
nnoremap <leader>o <c-\><c-N> <CR>

"Disable/Enable auto-comment
nmap <leader>c :setlocal formatoptions-=cro<CR>
nmap <leader>C :setlocal formatoptions=cro<CR>

nnoremap <leader>a :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" compile file in vim editor
nnoremap <c-j> :w <CR> :!javac % && java %:r  <CR>
nnoremap <c-p> :w <CR> :!clear;python3 % <CR>
nnoremap <c-c> :w <CR> :!gcc % -o %< && ./%< <CR>
nnoremap <C-b> :w <CR> :!chmod +x % && ./% <CR>
nnoremap <C-s> :w <CR> :!

"Vim commentary
nmap <leader>c <Plug>CommentaryLine
xmap <leader>c <Plug>Commentary

"-- YCM, Snippet and autoformat  Configs--

nnoremap <leader>d :YcmCompleter GoToDefinition <CR>
function! s:CustomizeYcmQuickFixWindow()
   "Move the window to the top of the screen.
  wincmd K
   " Set the window height to 5.
   5wincmd _
endfunction
autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<CR>"

nnoremap <leader>f :YcmCompleter FixIt <CR>

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="s"

"Autoformat Keys
nnoremap <leader>F :Autoformat<CR>

"---- Java development ----

let g:syntastic_java_checkers = []
let NERDTreeIgnore=['\.class$', '\~$', '\.exe$', '\.tar.gz$'] "ignore .class files in NERDTree

" Creates basic template for java files
autocmd BufNewFile *.java 0r ~/.vim/templates/java.skel

"---Python Dev----

au BufNewFile,BufRead *.py
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw  match BadWhitespace /\s\+$/    
let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1

"---Web Dev---

autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"--C + ASM dev--

au BufNewFile,BufRead *.c
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

autocmd BufNewFile *.c 0r ~/.vim/templates/c.skel
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

autocmd BufNewFile *.asm 0r ~/.vim/templates/asm.skel
