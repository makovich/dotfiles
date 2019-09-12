" ___vital___
" NOTE: lines between '" ___vital___' is generated by :Vitalize.
" Do not mofidify the code nor insert new lines before '" ___vital___'
function! s:_SID() abort
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
endfunction
execute join(['function! vital#_incsearch#Over#Signals#import() abort', printf("return map({'_vital_depends': '', 'call': '', 'make': '', '_vital_loaded': ''}, \"vital#_incsearch#function('<SNR>%s_' . v:key)\")", s:_SID()), 'endfunction'], "\n")
delfunction s:_SID
" ___vital___
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


function! s:_vital_loaded(V)
	let s:V = a:V
	let s:L = s:V.import("Data.List")
endfunction


function! s:_vital_depends()
	return ["Data.List"]
endfunction


let s:base = {
\	"variables" : {
\		"slots" : [],
\		"counter" : 0,
\	}
\}


function! s:base.connect(slot)
	let self.variables.counter += 1
	let slot = { "id" : self.variables.counter, "slot" : a:slot }
	call add(self.variables.slots, slot)
	return slot
endfunction


function! s:base.disconnect(slot)
	if empty(a:slot)
		return -1
	endif
	for i in range(len(self.variables.slots))
		if self.variables.slots[i].id == a:slot.id
			unlet self.variables.slots[i]
			return
		endif
	endfor
	return -1
endfunction


function! s:base.disconnect_by(expr)
	return self.disconnect(self.find_first_by(a:expr))
endfunction


function! s:call(list, func, ...)
	let args = get(a:, 1, [])
	let def = get(a:, 2, 0)
	return map(copy(a:list), "has_key(v:val, a:func) ? call(v:val.".a:func.", args, v:val) : def")
endfunction

function! s:base.call(func, ...)
	return call("s:call", [self.slots(), a:func] + a:000)
endfunction


function! s:base.find_by(expr)
	return filter(copy(self.variables.slots), a:expr)
endfunction


function! s:base.find_first_by(expr)
	return get(self.find_by(a:expr), 0, {})
endfunction


function! s:base.sort_by(expr)
	let self.variables.slots = s:L.sort_by(self.variables.slots, a:expr)
endfunction


function! s:base.get_slot(val)
	return a:val.slot
endfunction


function! s:base.slots()
	return map(copy(self.variables.slots), "self.get_slot(v:val)")
endfunction


" function! s:base.dict()
" 	let result = {}
" 	for _ in self.variables.slots
" 		let result[_.id] = _.value
" 	endfor
" 	return result
" endfunction


function! s:make()
	let result = deepcopy(s:base)
	return result
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo