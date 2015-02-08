" Define filelist source
let s:unite_source = { 'name': 'filelist' }

function! s:unite_source.gather_candidates(args, context)
  let cwd = getcwd()
  let cwd_l = strlen(cwd)

  let filename = <SID>GetFilelistFilename()
  let lists_dir = expand("~/.vim/filelists/")
  let filepath = lists_dir . filename

  if findfile(filename, lists_dir) != lists_dir . filename
    " TODO: Need better pattern processing
    " http://vimdoc.sourceforge.net/htmldoc/autocmd.html#autocmd-patterns
    let ignores = &wildignore
    let patterns = map(split(ignores, ","), '"\"" .
      \ substitute(substitute(substitute(v:val,
        \ "\\.", "\\\\.", "g"),
        \ "\\/", "\\\\/", "g"),
        \ "*", "\\.*", "g")
    \ . "\""')

    " Incorporate support for git ls-files
    let cmd = "find " . cwd . " -type f " .
      \ join(map(patterns, '"-not -regex " . v:val'), " -and ") .
        \ " | cut -c " . (cwd_l + 1) . "-" .
        \ " | sed 's/^/\./'" .
        \ " > " . filepath

    call system(cmd)
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
function! <SID>GetFilelistFilename()
  let cwd = getcwd()
  return substitute(substitute(cwd,
    \ "^/", "", ""),
    \ "/", "##", "g")
endfunction

" Delete the filelist file
function! <SID>DeleteFilelist()
  let filename = <SID>GetFilelistFilename()
  call system("rm -f " . expand("~/.vim/filelists/" . filename))
endfunction

" Define editor command to delete the filelist file
command DeleteUniteFilelist call <SID>DeleteFilelist()

