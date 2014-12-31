set nocompatible
" no really, 256 colors
set t_Co=256

" do the Pathogen thing
call pathogen#infect()
call pathogen#helptags()

set list
set listchars=tab:→⋅,trail:⋅,nbsp:⋅,extends:…

set nu encoding=utf-8
set nowrap
set backspace=eol,start,indent
set laststatus=2

set showcmd
set showmode

" undo settings
if v:version >= 703
    set undodir=~/.vim/undofiles
    set undofile
endif

set background=dark
colorscheme badwolf
syntax enable
filetype plugin indent on

" Markdown
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

set expandtab
set ts=4 sts=4 sw=4
set autoindent
set nofoldenable

noremap <F5> <Esc>:syntax sync fromstart<CR>
inoremap <F5> <C-o>:syntax sync fromstart<CR>
