# Vim: Highlight Match Under Cursor

A simple vim and neovim plugin that does what the title says: highlights the
match currently under the cursor with a unique colour to differentiate it from
all the other search-highlighted matches. This is convenient to quickly
identify the current match when quickly jumping amongst many.

Todo: example GIF

The highlighting is updating whenever the cursor is moved, and only appears
when search highlighting is active (i.e., when `v:hlsearch` is true). If you
want to clear the highlight without moving the cursor, you can use
```
:call HighlightMatchUnderCursor#matchdelete()
```

## Installation

Can be installed with the vim plugin manager of your choice. For example, if
you use `plug`, add
```
Plug 'https://github.com/adamheins/vim-highlight-match-under-cursor'
```
to your `.vimrc` (vim) or `init.vim` (neovim).

## Configuration

You can change the highlight style for the match under the cursor by setting
the variable
```
g:HighlightMatchUnderCursor#highlight_args
```
in your `.vimrc` or `init.vim`, which takes standard highlight arguments as a
string (see `:h highlight-args`). The default value is `'ctermbg=88
cterm=NONE'`. I personally like to set this to be the same as `:hi IncSearch`.

## License

MIT&mdash;see the LICENSE file.
