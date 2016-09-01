set nocompatible
" no really, 256 colors
set t_Co=256

" do the Pathogen thing
call pathogen#infect()
call pathogen#helptags()

set encoding=utf-8

set expandtab
set autoindent
set ts=4 sts=4 sw=4
" round shifts to sw
set shiftround
" open all folds by default (toggle with `zi`)
set nofoldenable

" show line numbers
set nu
set nowrap
" allow backspacing over and and start of lines, indent
set backspace=eol,start,indent
" always show the last status
set laststatus=2
set showcmd
set showmode
set cursorline

" ignorecase if search term is lowercase, respects case otherwise
set smartcase

set completeopt=menu
set list
set listchars=tab:→⋅,trail:⋅,nbsp:⋅,precedes:«,extends:»

set background=dark
colorscheme jellybeans
syntax enable
filetype plugin indent on

" lots of undo history
set history=512

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" GitGutter
let g:gitgutter_enabled = 1

" Markdown
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript', 'html', 'sass', 'xml', 'ruby']
let g:javascript_enable_domhtmlcss = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

nmap <C-s> :syntax sync fromstart<CR>
nmap <C-j> :JSHint<CR>
