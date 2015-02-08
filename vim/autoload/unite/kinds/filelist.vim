let s:kind = {
  \ 'name': 'filelist', 'default_action': 'load',
  \ 'action_table': {}, 'parents': [] }

let s:kind.action_table.load = { 'is_selectable': 1 }

function! s:kind.action_table.load.func(candidates)
  if len(a:candidates) != 1
    echo "candidates must be only one"
    return
  endif
  execute "open " a:candidates[0].word
endfunction

function! unite#kinds#filelist#define()
  return s:kind
endfunction

