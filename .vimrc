set number
set ic

set nocompatible
syntax on
filetype plugin indent on

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType html set ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
  autocmd FileType python set tabstop=4 sw=4 et!
  autocmd FileType javascript set sw=2 ts=2 sts=2 et
  autocmd FileType java set sw=2 ts=2 sts=2 et

augroup END

augroup xml
	autocmd BufReadPre,FileReadPre	build.xml set ts=4
augroup END

colorscheme vividchalk

let mapleader = ','
map <Leader>t :FuzzyFinderTextMate<CR>
map <Leader>r :FuzzyFinderTextMateRefreshFiles<CR>
map <Leader>d :NERDTreeToggle<CR>


let g:fuzzy_ignore='tmp/**,vendor/rails/**,vendor/gems/**,vendor/plugins/**'

set hls " highlight search
