" highlight-match-under-cursor: highlight the match under the cursor with a
" specific colour to stand out from the other search-highlighted matches.
"
" Author: Adam Heins <mail@adamheins.com>
" Source: https://github.com/vim-highlight-match-under-cursor

if exists('g:HighlightMatchUnderCursor_loaded')
  finish
endif
let g:HighlightMatchUnderCursor_loaded = 1

let g:HighlightMatchUnderCursor_match_id = -1

let g:HighlightMatchUnderCursor_highlight_args =
      \ get(g:, 'HighlightMatchUnderCursor_highlight_args', 'ctermbg=88 cterm=NONE')

let g:HighlightMatchUnderCursor_highlight_link_group =
      \ get(g:, 'HighlightMatchUnderCursor_highlight_link_group', '')

augroup HighlightMatchUnderCursor_group
  autocmd!
  autocmd ColorScheme * call HighlightMatchUnderCursor#highlight()
  autocmd CursorMoved * call HighlightMatchUnderCursor#matchadd()
augroup end

call HighlightMatchUnderCursor#highlight()
