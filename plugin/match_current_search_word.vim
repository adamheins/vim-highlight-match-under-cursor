" Highlight the current search word under the cursor.

if exists('g:MatchCurrentSearchWord#loaded')
  finish
endif
let g:MatchCurrentSearchWord#loaded = 1

let g:MatchCurrentSearchWord#match_id = -1

if !exists('g:MatchCurrentSearchWord#match_bg')
  let g:MatchCurrentSearchWord#match_bg = 88
endif

function! MatchCurrentSearchWord()
  " Remove the old match, if it exists.
  if g:MatchCurrentSearchWord#match_id > 0
    silent! call matchdelete(g:MatchCurrentSearchWord#match_id)
    let g:MatchCurrentSearchWord#match_id = -1
  endif

  " Don't do highlighting when highlight search is off.
  if !v:hlsearch
    return
  endif

  " Save the current cursor position, since it gets moved around by the
  " searchpos functions below.
  let l:save_cursor = getcurpos()
  let l:cursor_lnum = l:save_cursor[1]
  let l:cursor_col = l:save_cursor[2]

  " Get the start of the next match, searching backwards. Moves the cursor to
  " the start position. Flags:
  " c: accept a match at the cursor position
  " b: search backwards
  let [l:match_lnum_start, l:match_col_start] = searchpos(@/, 'cb')

  " Get the end of the next match, searching forwards. Flags:
  " c: accept a match at the cursor position
  " e: get the end of the match
  let [l:match_lnum_end, l:match_col_end] = searchpos(@/, 'ce')

  " Restore the cursor
  call setpos('.', l:save_cursor)

  " Only do the match if the cursor is actually over top of the search string
  " (i.e., between the start and end of the match).
  if l:match_lnum_start ==# l:cursor_lnum
        \ && l:cursor_col >= l:match_col_start
        \ && l:cursor_col <= l:match_col_end
    let l:match_len = l:match_col_end - l:match_col_start + 1
    " Priority level 11 is chosen to be higher-priority than the default value
    " of 10.
    let g:MatchCurrentSearchWord#match_id = matchaddpos('CurrentSearchWord',
          \ [[l:match_lnum_start, l:match_col_start, l:match_len]], 11)
  endif
endfunction

exe 'highlight CurrentSearchWord ctermbg=' . g:MatchCurrentSearchWord#match_bg . ' cterm=NONE'

autocmd CursorMoved * call MatchCurrentSearchWord()
