" TODO: Refactor filelist caching and deleting functions into standalone commands
" TODO: Update wildignore pattern processing according to the rules defined
"       here: http://vimdoc.sourceforge.net/htmldoc/autocmd.html#autocmd-patterns

" Define filelist source
let s:unite_source = { 'name': 'filelist' }

function! s:unite_source.gather_candidates(args, context)
  let cwd = getcwd()
  let cwd_l = strlen(cwd)

  let filename = s:get_filelist_filename()
  let lists_dir = expand("~/.vim/filelists/")
  let filepath = lists_dir . filename

  if findfile(filename, lists_dir) != lists_dir . filename
    let in_git = strlen(system("git rev-parse")) <= 0
    if in_git
      let cmd = "git ls-files" .
        \ " | sed 's/^/\\.\\//'" .
        \ " > " . filepath

      call system(cmd)
    else
      let ignores = &wildignore
      let patterns = map(split(ignores, ","), '
        \ substitute(substitute(substitute(v:val,
          \ "\\.", "\\\\.", "g"),
          \ "\\/", "\\\\/", "g"),
          \ "*", "\\.*", "g")
      \')

      let cmd = "find " . cwd . " -type f" .
        \ " | grep --invert-match -E \"" . join(patterns, "|") . "\"" .
        \ " | cut -c " . (cwd_l + 1) . "-" .
        \ " | sed 's/^/\\./'" .
        \ " > " . filepath

      call system(cmd)
    endif
  endif

  let files = readfile(filepath)

  return map(files, '{
    \ "word": substitute(v:val, cwd, ".", ""),
    \ "source": "filelist",
    \ "kind": "filelist",
  \ }')
endfunction

function! unite#sources#filelist#define()
  return s:unite_source
endfunction

" Return the filelist file name for the current working directory.
" For CWD '/path/to/directory' this function returns 'path##to##directory'
function! s:get_filelist_filename()
  let cwd = getcwd()
  return substitute(substitute(cwd,
    \ "^/", "", ""),
    \ "/", "##", "g")
endfunction

" Delete the filelist file
function! s:delete_filelist()
  let filename = s:get_filelist_filename()
  call system("rm -f " . expand("~/.vim/filelists/" . filename))
endfunction

" Define editor command to delete the filelist file
command DeleteUniteFilelist call s:delete_filelist()

