" (c) 2008 Almacom Ltd (http://almacom.net)

setlocal foldmethod=expr
setlocal foldexpr=PythonSimpleFold()

function! PythonSimpleFold()
	let line=getline(v:lnum)
	let ind=indent(v:lnum)/&sw

	if line=~'^\s*\(class\|def\)\s' && ind<=1
		return ">".(ind+1)
	endif

	if line=~'"""'
		return "="
	endif

	" find next line that is not a comment
	let nnum=v:lnum+1
	while 1
		if nnum>line("$")
			return "="
		endif
		let nline=getline(nnum)
		if nline=~'^\s*[^#]'
			break
		endif
		let nnum+=1
	endwhile

	if nline=~'"""'
		return "="
	endif

	let nind=indent(nnum)/&sw
	if nind<ind && !(nline=~'^\s*\(except\|else\|elif\)') && nind<=1
		return "<".(nind+1)
	endif
	return "="
endfunction
