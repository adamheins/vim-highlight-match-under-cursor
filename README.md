# Vim: Highlight Match Under Cursor

A simple vim and neovim plugin that does what the title says: highlights the
match currently under the cursor with a unique colour to differentiate it from
all the other search-highlighted matches. This is convenient for easily
identifying the current match when quickly jumping amongst many. In the GIF
below, the current match is highlighted in the default red colour.

![Demo GIF](https://github.com/adamheins/vim-highlight-match-under-cursor/blob/master/demo/demo.gif)

The plugin plays nicely with all search commands (/, ?, n, N, *, #) and the
`ignorecase` and `smartcase` options.

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
g:HighlightMatchUnderCursor_highlight_args
```
in your `.vimrc` or `init.vim`, which takes standard highlight arguments as a
string (see `:h highlight-args`). The default value is `'ctermbg=88
cterm=NONE'`. Alternatively you can set the variable
```
g:HighlightMatchUnderCursor_highlight_link_group
```
to link the CurrentSearchWord group to a configured highlight group. I
personally like to set this to be the same as `:hi IncSearch`.

The highlighting is updated whenever the cursor is moved, and only appears
when search highlighting is active (i.e., when `v:hlsearch` is true). If you
want to clear the highlight without moving the cursor, you can use
```
:call HighlightMatchUnderCursor#matchdelete()
```

## License

MIT&mdash;see the LICENSE file.
