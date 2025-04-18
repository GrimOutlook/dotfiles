# Neovim

This readme is used to note intracacies and good things to remember about this
neoverim conviguration.

## Keymaps

| Keymap           | Description                                           |
| ---------------- | ----------------------------------------------------- |
| <leader><leader> | Smart file search                                     |
| <leader>e        | File explorer                                         |
| <leader>/        | Grep explorer                                         |
| <leader>n        | Notification history                                  |
| <leader>r        | Rename symbol                                         |
| <leader>sk       | Search keymaps                                        |
| <leader>sC       | Search available commands                             |
| <leader>s/       | Search search history                                 |
| <leader>w        | Save                                                  |
| <leader>q        | Quit                                                  |
| C-u              | Move down half a page                                 |
| C-d              | Move down half a page                                 |
| C-S-L            | Next tab                                              |
| C-S-H            | Previous tab                                          |
| C-h              | Left pane                                             |
| C-l              | Right pane                                            |
| C-j              | Bottom pane                                           |
| C-k              | Top pane                                              |
| [NUMBER]j        | Jump down [NUMBER] lines                              |
| [NUMBER]k        | Jump up [NUMBER] lines                                |
| ]m               | Next function                                         |
| zz               | Center screen on cursor                               |
| [LINE_NUMBER]G   | Jump to specific line number                          |
| C-T              | New tab from file (when in Snacks.Picker)             |
| H                | Show hover window (in Rust)                           |
| D                | Show diagnostics (in Rust)                            |
| E                | Show error (in Rust)                                  |
| M                | Expand macros recursively (in Rust)                   |
| <leader>a        | Show quick fixes                                      |
| gq               | Wrap lines (in Visual mode)                           |
| gq1              | Wrap one line (in Normal mode)                        |
| C-o              | Previous cursor position (including after file jumps) |
| C-i              | Next cursor position                                  |
| zR               | Unfold all                                            |

## Useful Commands

| Command        | Description                      |
| -------------- | -------------------------------- |
| checkhealth    | Check the health of NVIM plugins |
| messages       | Show startup errors              |
| gd             | Goto definition                  |
| gD             | Goto declaraction                |
| gI             | Goto implementation              |
| gy             | Goto type definitions            |
| gr             | Goto references                  |
| :[LINE_NUMBER] | Jump to specific line number     |
| retab          | Convert tabs to spaces           |

## TODO

- Create plugin that prevents you from writing to a new file without an
  additional prompt. I end up with files named ']' far too often due to missing
  the enter key.
- Set <S-Enter> to open in new tab when in file picker.
- Set <C-S-Enter> to open in new split window when in file picker.
- Unbind `ZZ` and `:wq`. My fat fingers can't help themselves.
