" no really, 256 colors
set t_Co=256

" do the Pathogen thing
call pathogen#infect()

set background=dark
colorscheme molokai
syntax enable
filetype plugin indent on

set et ts=4 sts=4 sw=4
set nowrap nocompatible
set bs=eol,start,indent
set nu display=lastline,uhex
