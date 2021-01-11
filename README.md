# Vim: Highlight Match Under Cursor

A simple vim and neovim plugin that does what the title says: highlights the
match currently under the cursor with a unique colour to differentiate it from
all the other search-highlighted matches. This is convenient to quickly
identify the current match when quickly jumping amongst many.

Todo: example GIF

## Installation

Can be installed with the vim plugin manager of your choice. For example, if
you use `plug`, add
```
Plug 'https://github.com/adamheins/vim-highlight-match-under-cursor'
```
to your `.vimrc` or `init.vim`.

The plugin is just a [single
script](https://raw.githubusercontent.com/adamheins/vim-highlight-match-under-cursor/master/plugin/highlight_match_under_cursor.vim),
so you can also install it without a plugin manager by simply downloading and
placing that script in your vim `plugin/` directory.

## Configuration

You can change the background highlight colour for the match under the cursor
by setting the variable
```
g:HighlightMatchUnderCursor#highlight_args
```
in your `.vimrc` or `init.vim`, which takes standard highlight arguments as a
string (see `:h highlight-args`). The default value is `'ctermbg=88
cterm=NONE'`. I personally like to set this to be the same as `:hi IncSearch`.

## License

MIT&mdash;see the LICENSE file.
