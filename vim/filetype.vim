au BufNewFile,BufRead *.json  setf javascript
au BufNewFile,BufRead *.less  setf less
au BufNewFile,BufRead *.md    setf markdown

" JavaScript, HTML and CSS all get 2-space tabs
autocmd FileType javascript,js,json setlocal sts=2 sw=2
autocmd FileType css,sass,less,scss setlocal sts=2 sw=2
autocmd FileType html               setlocal sts=2 sw=2

" 4-space tabs in python
autocmd FileType python setlocal sts=4 sw=4

" 4x tabs in Makefiles
autocmd FileType make setlocal noet ts=4 sts=0
