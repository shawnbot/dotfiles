" no really, 256 colors
set t_Co=256

" do the Pathogen thing
call pathogen#infect()
call pathogen#helptags()

set nu encoding=utf-8
set nowrap nocompatible
set bs=eol,start,indent
set laststatus=2

set background=dark
colorscheme molokai
syntax enable
filetype plugin indent on

set et ts=4 sts=4 sw=4

" noremap Z <Esc>:syntax sync fromstart<CR>
" inoremap Z <C-o>:syntax sync fromstart<CR>
