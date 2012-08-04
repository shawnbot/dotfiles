" Vim file plugin for editing files with unicode codes.
" It changes \u00E9 to é when viewing, and puts \u00E9 when writing. Set g:ucs_encode_java 
" in your .vimrc
"
" You can also set it to work with html encoding (&#nnn; ). Set g:ucs_encode_html in your
" .vimrc
" for help with the accented characters, see :help digraph
" copied/mangled from a script on www.vim.org that did it for TeX codes
"
" Usage: put in your $VIMDIR/plugin directory, set one of the variables
" 	either g:ucs_encode_java = 1 or g:ucs_encode_html = 1 in your .vimrc
" 	or override any of the ucs_ variables if you like
" Last Change: $Date: 2004/06/01 12:55:59 $
" Version: $Revision: 1.6 $ 
" Maintainer: Roger Pilkey (rpilkey at magma.ca)

"Startup stuff {{{1
if exists("s:loaded_unicodeswitch")
	finish
endif
let s:loaded_unicodeswitch = 1
"
" multi-byte is required
if ! has("multi_byte")
	echoerr "unicodeswitch.vim: Sorry, this version of (g)vim was not compiled with +multi_byte" 
	finish
endif

" Global variables: {{{1
" Set one of these in your .vimrc to set all the settings for either java or
" html style encoding, like this:
" let g:ucs_encode_java = 1
"
" Or make your own bunch of settings following these as examples.
"
" g:ucs_encode_java: load all the settings for "\u00AA" java-style encoding {{{2
if exists('g:ucs_encode_java')
	let s:ucs_prefix = '\\u'
	"matches a hex number
	let s:ucs_encodematch = '\x\{1,4}'
	let s:ucs_suffix = ''
	let s:ucs_is_hex = 1
	let s:ucs_filetype = '*.properties,*.java'
" g:ucs_encode_html: load all the settings for "&#123;" html-style encoding {{{2
elseif exists('g:ucs_encode_html')
	let s:ucs_prefix = '&\#'
	"minimal match any number
	let s:ucs_encodematch = '\d\{-}'
	let s:ucs_suffix = ';'
	let s:ucs_is_hex = 0
	let s:ucs_filetype = '*.html'
else
	"no settings found, so quit
	finish
endif
" you can also override the individual settings {{{2
" s:ucs_prefix: encoding prefix {{{3
if exists('g:ucs_prefix')
	let s:ucs_prefix = g:ucs_prefix
endif

" s:ucs_encodingmatch: match string for the number {{{3
if exists('g:ucs_encodematch')
	let s:ucs_encodematch = g:ucs_encodematch
endif

" s:ucs_suffix: encoding suffix {{{3
if exists('g:ucs_suffix')
	let s:ucs_suffix = g:ucs_suffix
endif

" s:ucs_is_hex: is the incoming encoded number hexadecimal? {{{3
if exists('g:ucs_is_hex')
	let s:ucs_is_hex = g:ucs_is_hex
endif

" s:ucs_filetype: run on matching files {{{3
if exists('g:ucs_filetype')
	let s:ucs_filetype = g:ucs_filetype
endif

" s:ucs_charlist: list of chars to transform when writing (default is the European chars in the Latin-1 supplement) {{{2 
if exists('g:ucs_charlist')
	let s:ucs_charlist = g:ucs_charlist
else
	"use a character class to search, it's a bit faster than alternation
	let s:ucs_charlist = '[àáâãäåæèéêëìíîïòóôõöùúûüýÿ¿¡ñßçšž«»]'
endif

" Hook the functions to the Read/Write events {{{1
augroup unicodeswitch
	exe "autocmd BufReadPost " . s:ucs_filetype . " call s:toUTF8()"
	exe "autocmd BufWritePre " . s:ucs_filetype . " call s:toUnicode()"
	exe "autocmd BufWritePost " . s:ucs_filetype . " call s:toUTF8()"
augroup END

" function: ZeroExtend(string) returns the zero-extended string of a string. {{{1
func s:ZeroExtend(str)
	let l:retval = a:str
	let l:len = strlen(l:retval)
	if (l:len == 3)
		let l:retval = "0".l:retval
	elseif (l:len == 2)
		let l:retval = "00".l:retval
	elseif (l:len == 1)
		let l:retval = "000".l:retval
	elseif (l:len == 0)
		let l:retval = "0000"
	else
		"I give up, the string is supposed to only be 4 chars long
	endif	
	return l:retval
endfunc

" function: Nr2Hex(nr) returns the Hex string of a number. {{{1
func s:Nr2Hex(nr)
	let n = a:nr
	let r = ""
	while n
		let r = '0123456789ABCDEF'[n % 16] . r
		let n = n / 16
	endwhile
	return r
endfunc

" function: toUnicode converts utf8 symbols to unicode codes {{{1
function s:toUnicode()
	" store cursor position
	let s:line = line(".")
	let s:column = col(".")
	" convert SPECIFIED utf-8 symbols to unicode codes
	if s:ucs_is_hex
		silent exec ":%s/\\(".s:ucs_charlist."\\)/\\='".s:ucs_prefix."'.s:ZeroExtend(s:Nr2Hex(char2nr(submatch(1)))).'".s:ucs_suffix."'/ieg"
	else
		silent exec ":%s/\\(".s:ucs_charlist."\\)/\\='".s:ucs_prefix."'.s:ZeroExtend(char2nr(submatch(1))).'".s:ucs_suffix."'/ieg"
	endif
	"default to something
	if !exists('s:oldencoding')
		let s:oldencoding = &l:fileencoding
	endif
	if !exists('s:line')
		let s:line = line(".")
	endif
	if !exists('s:column')
		let s:column = col(".")
	endif

	" restore old encoding before writing
	let &l:fileencoding = s:oldencoding
	" restore cursor position
	call cursor(s:line,s:column)
endfunction

" function: toUTF8() converts unicode codes to utf-8 symbols {{{1
function s:toUTF8()
	" store cursor position
	let s:line = line(".")
	let s:column = col(".")

	" store the fileencoding
	let s:oldencoding = &l:fileencoding

	" convert ALL unicode codes to utf-8 symbols (watch out!)
	if s:ucs_is_hex
		silent exec ":%s/".s:ucs_prefix."\\(".s:ucs_encodematch."\\)".s:ucs_suffix."/\\=nr2char('0x'.submatch(1))/ieg"
	else
		silent exec ":%s/".s:ucs_prefix."\\(".s:ucs_encodematch."\\)".s:ucs_suffix."/\\=nr2char(submatch(1))/ieg"
	endif
	" restore cursor position
	call cursor(s:line,s:column)
endfunction

" vim600:tw=78:set fdm=marker:set fileformat=unix
