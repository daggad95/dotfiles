""
" Toggle terminal buffer or create new one if there is none.
"
" nnoremap <silent> <C-z> :call kutsan#mappings#normal#terminal#()<Enter>
" tnoremap <silent> <C-z> <C-\><C-n>:call kutsan#mappings#normal#terminal#()<Enter>
""
function! NormalTerminal() abort
	if !has('nvim')
		return v:false
	endif

	" Create the terminal buffer.
	if !exists('g:terminal') || !g:terminal.term.loaded
		return CreateTerminal()
	endif

	" Go back to origin buffer if current buffer is terminal.
	if g:terminal.term.bufferid ==# bufnr('')
		silent execute 'buffer' g:terminal.origin.bufferid

	" Launch terminal buffer and start insert mode.
	else
		let g:terminal.origin.bufferid = bufnr('')

		silent execute 'buffer' g:terminal.term.bufferid
		startinsert
	endif
endfunction

""
" Create the terminal buffer.
""
function! CreateTerminal() abort
	if !has('nvim')
		return v:false
	endif

	if !exists('g:terminal')
		let g:terminal = {
			\ 'opts': {},
			\ 'term': {
				\ 'loaded': v:null,
				\ 'bufferid': v:null
			\ },
			\ 'origin': {
				\ 'bufferid': v:null
			\ }
		\ }

		function! g:terminal.opts.on_exit(jobid, data, event) abort
			silent execute 'buffer' g:terminal.origin.bufferid
			silent execute 'bdelete!' g:terminal.term.bufferid

			let g:terminal.term.loaded = v:null
			let g:terminal.term.bufferid = v:null
			let g:terminal.origin.bufferid = v:null
		endfunction
	endif

	if g:terminal.term.loaded
		return v:false
	endif

	let g:terminal.origin.bufferid = bufnr('')

	enew
	call termopen(&shell, g:terminal.opts)

	let g:terminal.term.loaded = v:true
	let g:terminal.term.bufferid = bufnr('')
endfunction

" Toggle terminal buffer.
tnoremap <silent> <C-z> <C-\><C-n>:call NormalTerminal()<Enter>
nnoremap <silent> <C-z> :call NormalTerminal()<Enter>
