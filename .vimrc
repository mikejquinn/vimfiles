set number

set nocompatible
syntax on
filetype plugin indent on

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

colorscheme vividchalk

let mapleader = ','
map <Leader>t :FuzzyFinderTextMate<CR>
map <Leader>r :FuzzyFinderTextMateReload<CR>
map <Leader>d :NERDTreeToggle<CR>


let g:fuzzy_ignore='tmp/**,vendor/rails/**,vendor/gems/**,vendor/plugins/**'
