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
set cursorline

set completeopt=menu
set list
set listchars=tab:→⋅,trail:⋅,nbsp:⋅,extends:…

set background=dark
colorscheme jellybeans
syntax enable
filetype plugin indent on

" GitGutter
let g:gitgutter_enabled = 1

" Markdown
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'html', 'sass', 'xml', 'ruby']
let g:javascript_enable_domhtmlcss = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

" undo settings
if v:version >= 703
    set undodir=~/.vim/undofiles
    set undofile
endif

nmap <C-s> :syntax sync fromstart<CR>
nmap <C-j> :JSHint<CR>
