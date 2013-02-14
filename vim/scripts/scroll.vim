" i could'nt find any get_number_of_visible_lines function, so i made my own.
function GetNumberOfVisibleLines()
  let cur_line = line(".")
  let cur_col = virtcol(".")
  normal H
  let top_line = line(".")
  normal L
  let bot_line = line(".")
  execute "normal " . cur_line . "G"
  execute "normal " . cur_col . "|"
  return bot_line - top_line
endfunc

" noremap <PageUp> 39<C-U>:set scroll=0<CR>
function! MyPageUp()
  let visible_lines = GetNumberOfVisibleLines()
  execute "normal " . visible_lines . "\<C-U>:set scroll=0\r"
endfunction

" noremap <PageDown> 39<C-D>:set scroll=0<CR>
function! MyPageDown()
  let visible_lines = GetNumberOfVisibleLines()
  execute "normal " . visible_lines . "\<C-D>:set scroll=0\r"
endfunction

" BorlandPascal pageup/down behaviour!
" todo: when hitting top/bottom of file, then restore Y to lastY
noremap <PageUp> :call MyPageUp()<CR>
noremap <PageDown> :call MyPageDown()<CR>
