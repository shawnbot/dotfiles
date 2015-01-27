set nocompatible
" no really, 256 colors
set t_Co=256

" do the Pathogen thing
call pathogen#infect()
call pathogen#helptags()

set expandtab
set ts=4 sts=4 sw=4
set autoindent
set nofoldenable

set nu encoding=utf-8
set nowrap
set backspace=eol,start,indent
set laststatus=2

set showcmd
set showmode

set completeopt=menu
set list
set listchars=tab:→⋅,trail:⋅,nbsp:⋅,extends:…

set background=dark
colorscheme jellybeans
syntax enable
filetype plugin indent on

" Markdown
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'html', 'sass', 'xml', 'ruby']

" undo settings
if v:version >= 703
    set undodir=~/.vim/undofiles
    set undofile
endif

noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <Esc>:syntax sync fromstart<CR>
noremap <C-j> <Esc>:JSHint<CR>
inoremap <C-j> <Esc>:JSHint<CR>
