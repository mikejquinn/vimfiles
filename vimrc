"Pathogen for plugins
filetype off
call pathogen#infect()
filetype plugin indent on

set nocompatible " Use smarter defaults than Vi's.
set nobackup     " Don't write out backup files.
set noswapfile
set nowritebackup
set undodir=~/.vim/tmp/undo/ " store persistent undo files here

" Chrome
set encoding=utf-8
set showmode
set showcmd
set hidden " hide buffers when opening new files, without having to save
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set laststatus=2
set number
set undofile
set scrolloff=4 " Keep 4 lines of context when scrolling
set shortmess+=I " Remove the default splash screen when a new file is created.
set autoread " When a file is changed outside of Vim, just reload it rather than asking what to do.
set nofoldenable " I hate going into a file with parts folded.

" Line wrapping
set textwidth=110
" Set wrap
set nolist " List disables linebreak
set linebreak
set colorcolumn=110
set formatoptions=croql  " Now it shouldn't hard-wrap long lines as you're typing (annoying), but you can gq
                         " as expected.

" Tabs
set tabstop=2 "the width hard tab characters are rendered.
set shiftwidth=2 "indent selections the same as softtabstop.
set softtabstop=2
set expandtab "Use spaces instead of tabs.

highlight Cursor guibg=LightGoldenRod guifg=LightGoldenRod
set bg=dark
syntax on
set synmaxcol=200 " Don't syntax highlight super long lines. It makes Vim scrolling very sluggish.

" Searching
set hlsearch
set ignorecase " ignore case when searching.
set smartcase " if you include an uppercase while searching, become case sensitive.
set incsearch " show search matches as you type.
set gdefault " Apply substitutions globally on a line.

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby
  autocmd FileType fun set ai sw=2 sts=2 et filetype=funtype
  autocmd FileType html set ai sw=2 sts=2 et
  autocmd FileType erb set ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
  autocmd FileType coffee set ai sw=2 sts=2 et
  autocmd FileType python set tabstop=4 sw=4 et!
  autocmd FileType javascript set sw=2 ts=2 sts=2 et
  autocmd FileType java set sw=2 ts=2 sts=2 et
  autocmd FileType php set ts=4 sw=4 et!
  autocmd FileType scss set ts=2 sw=2 et
  autocmd FileType less set ts=2 sw=2 et

augroup END

augroup xml
	autocmd BufReadPre,FileReadPre	build.xml set ts=4
augroup END

set background=dark
colorscheme mustang

let mapleader = ','
map <Leader>t :FuzzyFinderTextMate<CR>
map <Leader>r :FuzzyFinderTextMateRefreshFiles<CR>
map <Leader>d :NERDTreeToggle<CR>
map <Leader>evh :sp $MYVIMRC<CR>
map <Leader>evf :vi $MYVIMRC<CR>
map <Leader>evv :vsp $MYVIMRC<CR>
map <Leader>qv :wq<CR> :source $MYVIMRC<CR>
map <Leader>sv :source $MYVIMRC<CR>
" compile .less to .css, lessc is required
map <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>
map qq :q<CR>
map <C-j> :bprevious<CR>
map <C-k> :bnext<CR>
let g:fuzzy_ignore='tmp/**,vendor/rails/**,vendor/gems/**,vendor/plugins/**'

nnoremap H 0
inoremap jk <ESC>
iabbrev adn and
iabbrev @@ mquinn@gloto.com

set hls " highlight search

set t_Co=256
set guifont=Consolas:h12

" Strip trailing whitespace on save
" http://stackoverflow.com/q/356126
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%111v.\+/
