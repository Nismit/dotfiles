"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/kurow/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/kurow/.vim/bundles')
  call dein#begin('/Users/kurow/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/kurow/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('itchyny/lightline.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

"End dein Scripts-------------------------

nnoremap <C-t> :NERDTreeToggle<CR>

" lightline config
set laststatus=2
set noshowmode

" lightline status setting
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ }
  \ }

" show line number
set number
