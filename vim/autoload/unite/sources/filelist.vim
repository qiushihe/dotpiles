let s:unite_source = { 'name': 'filelist' }

function! s:unite_source.gather_candidates(args, context)
  let cwd = getcwd()
  let cwd_l = strlen(cwd)

  let list_filename = substitute(cwd, "^/", "", "")
  let list_filename = substitute(list_filename, "/", "##", "g")

  let list_filepath = expand("~/.vim/filelists/" . list_filename)

  " let list = split(globpath(cwd, '**'), '\n')
  " let files = filter(list, '!isdirectory(v:val)')

  let ignores = &wildignore
  " TODO: Need better pattern processing
  " http://vimdoc.sourceforge.net/htmldoc/autocmd.html#autocmd-patterns
  let find_patterns = map(split(ignores, ","), '"\"" .
    \ substitute(substitute(substitute(v:val,
      \ "\\.", "\\\\.", "g"),
      \ "\\/", "\\\\/", "g"),
      \ "*", "\\.*", "g")
  \ . "\""')
  let find_options = join(map(find_patterns, '
    \ "-not -regex " . v:val
  \ '), " -and ")

  " Incorporate support for git ls-files
  let cmd = "find " . cwd . " -type f " . find_options
  let cmd = cmd . " | cut -c " . (cwd_l + 1) . "- | sed 's/^/\./' > " . list_filepath
  " let result = system(cmd)

  let files = readfile(list_filepath)

  return map(files, '{
    \ "word": substitute(v:val, cwd, ".", ""),
    \ "source": "filelist",
    \ "kind": "filelist",
  \ }')
endfunction

function! unite#sources#filelist#define()
  return s:unite_source
endfunction
