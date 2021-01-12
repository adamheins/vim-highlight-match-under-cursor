" highlight-match-under-cursor: highlight the match under the cursor with a
" specific colour to stand out from the other search-highlighted matches.
"
" Author: Adam Heins <mail@adamheins.com>
" Source: https://github.com/vim-highlight-match-under-cursor


function! HighlightMatchUnderCursor#matchdelete() abort
  " Remove the old match, if it exists.
  if g:HighlightMatchUnderCursor_match_id > 0
    silent! call matchdelete(g:HighlightMatchUnderCursor_match_id)
    let g:HighlightMatchUnderCursor_match_id = -1
  endif
endfunction


function! HighlightMatchUnderCursor#matchadd() abort
  call HighlightMatchUnderCursor#matchdelete()

  " Don't do highlighting when highlight search is off or search register is
  " empty.
  if !v:hlsearch || strlen(@/) ==# 0
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
  if l:match_lnum_start ==# l:cursor_lnum && l:cursor_col >= l:match_col_start && l:cursor_col <= l:match_col_end
    let l:match_len = l:match_col_end - l:match_col_start + 1
    " Priority level 11 is chosen to be higher-priority than the default value
    " of 10.
    let g:HighlightMatchUnderCursor_match_id = matchaddpos('CurrentSearchWord', [[l:match_lnum_start, l:match_col_start, l:match_len]], 11)
  endif
endfunction


function! HighlightMatchUnderCursor#highlight() abort
  exe 'highlight CurrentSearchWord ' . g:HighlightMatchUnderCursor_highlight_args
endfunction
