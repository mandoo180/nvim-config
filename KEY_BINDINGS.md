# Neovim Key Bindings

> **Leader Key**: `<Space>`

## Navigation

| Mode   | Key     | Description                       |
| ------ | ------- | --------------------------------- |
| Normal | `n`     | Next search result (centered)     |
| Normal | `N`     | Previous search result (centered) |
| Normal | `<C-d>` | Half page down (centered)         |
| Normal | `<C-u>` | Half page up (centered)           |
| Normal | `<C-g>` | Escape                            |
| Visual | `<C-g>` | Escape                            |

## Editing

| Mode   | Key         | Description                         |
| ------ | ----------- | ----------------------------------- |
| Normal | `Y`         | Yank to end of line                 |
| Normal | `J`         | Join lines and keep cursor position |
| Normal | `<leader>d` | Delete without yanking              |
| Visual | `<leader>d` | Delete without yanking              |
| Visual | `<leader>p` | Paste without yanking               |
| Normal | `<A-j>`     | Move line down                      |
| Normal | `<A-k>`     | Move line up                        |
| Visual | `<A-j>`     | Move selection down                 |
| Visual | `<A-k>`     | Move selection up                   |
| Visual | `<`         | Indent left and reselect            |
| Visual | `>`         | Indent right and reselect           |

## Buffer Management

| Mode   | Key          | Description     |
| ------ | ------------ | --------------- |
| Normal | `<leader>]`  | Next buffer     |
| Normal | `<leader>[`  | Previous buffer |
| Normal | `<leader>k`  | Kill buffer     |
| Normal | `<leader>bb` | Find buffers    |

## Window Management

| Mode   | Key          | Description               |
| ------ | ------------ | ------------------------- |
| Normal | `<leader>1`  | Close other windows       |
| Normal | `<leader>2`  | Split horizontally        |
| Normal | `<leader>3`  | Split vertically          |
| Normal | `<leader>\|` | Split vertically          |
| Normal | `<leader>_`  | Split horizontally        |
| Normal | `<leader>o`  | Cycle to next window      |
| Normal | `<C-Up>`     | Increase window height    |
| Normal | `<C-Down>`   | Decrease window height    |
| Normal | `<C-Left>`   | Decrease window width     |
| Normal | `<C-Right>`  | Increase window width     |

## Diagnostics & Quickfix

| Mode   | Key         | Description             |
| ------ | ----------- | ----------------------- |
| Normal | `]d`        | Next diagnostic         |
| Normal | `[d`        | Previous diagnostic     |
| Normal | `<leader>q` | Diagnostics to loclist  |
| Normal | `<leader>Q` | Diagnostics to quickfix |
| Normal | `]q`        | Next quickfix item      |
| Normal | `[q`        | Previous quickfix item  |
| Normal | `]l`        | Next loclist item       |
| Normal | `[l`        | Previous loclist item   |

## LSP

| Mode   | Key             | Description        |
| ------ | --------------- | ------------------ |
| Normal | `gd`            | Go to definition   |
| Normal | `gD`            | Go to declaration  |
| Normal | `gr`            | Go to references   |
| Normal | `gi`            | Go to implementation |
| Normal | `K`             | Hover documentation |
| Normal | `<leader>rn`    | Rename symbol      |
| Normal | `<leader>ca`    | Code action        |
| Normal | `<Leader><Tab>` | Format document    |
| Insert | `<C-Space>`     | Trigger completion |

## Telescope (Fuzzy Finder)

| Mode   | Key          | Description              |
| ------ | ------------ | ------------------------ |
| Normal | `<leader>ff` | Find files               |
| Normal | `<leader>fg` | Live grep                |
| Normal | `<leader>fb` | Find buffers             |
| Normal | `<leader>fh` | Find help tags           |
| Normal | `<leader>fm` | Find marks               |
| Normal | `<leader>fp` | Find registers           |
| Normal | `<leader>fs` | Find document symbols    |
| Normal | `<leader>fw` | Find workspace symbols   |
| Normal | `<leader>fr` | Find references          |
| Normal | `<leader>fi` | Find implementations     |
| Normal | `<leader>fd` | Find definitions         |
| Normal | `<leader>ft` | Find type definitions    |
| Normal | `<leader>fe` | Find diagnostics         |
| Normal | `<leader>fc` | Find commands            |
| Any    | `<C-g>`      | Close Telescope picker   |

## File Explorer (Neo-tree)

| Mode   | Key         | Description          |
| ------ | ----------- | -------------------- |
| Normal | `<leader>e` | Toggle file explorer |

## Terminal

| Mode     | Key          | Description              |
| -------- | ------------ | ------------------------ |
| Normal   | `<leader>\`` | Toggle floating terminal |
| Terminal | `<Esc>`      | Close floating terminal  |

## Insert Mode (Emacs-style)

| Mode   | Key         | Description                       |
| ------ | ----------- | --------------------------------- |
| Insert | `jj`        | Exit insert mode                  |
| Insert | `jk`        | Exit insert mode                  |
| Insert | `<C-f>`     | Move cursor right                 |
| Insert | `<C-b>`     | Move cursor left                  |
| Insert | `<C-n>`     | Move cursor down                  |
| Insert | `<C-p>`     | Move cursor up                    |
| Insert | `<C-a>`     | Move to beginning of line         |
| Insert | `<C-e>`     | Move to end of line               |
| Insert | `<M-m>`     | Move to first non-blank character |
| Insert | `<C-d>`     | Delete character forward          |
| Insert | `<M-f>`     | Move word forward                 |
| Insert | `<M-b>`     | Move word backward                |
| Insert | `<M-d>`     | Delete word forward               |
| Insert | `<M-BS>`    | Delete word backward              |
| Insert | `<C-g>`     | Exit insert mode                  |

## Command Mode (Emacs-style)

| Mode    | Key      | Description              |
| ------- | -------- | ------------------------ |
| Command | `<C-f>`  | Move cursor right        |
| Command | `<C-b>`  | Move cursor left         |
| Command | `<C-p>`  | Command history up       |
| Command | `<C-n>`  | Command history down     |
| Command | `<M-f>`  | Move word forward        |
| Command | `<M-b>`  | Move word backward       |
| Command | `<C-a>`  | Move to beginning        |
| Command | `<C-e>`  | Move to end              |
| Command | `<C-d>`  | Delete character forward |
| Command | `<M-d>`  | Delete word forward      |
| Command | `<M-BS>` | Delete word backward     |
| Command | `<C-g>`  | Exit command mode        |

## Utility

| Mode   | Key          | Description                 |
| ------ | ------------ | --------------------------- |
| Normal | `<leader>c`  | Clear search highlights     |
| Normal | `<leader>ss` | Toggle spell check          |
| Normal | `<leader>pa` | Copy absolute file path     |
| Normal | `<leader>re` | Edit config (init.lua)      |
| Normal | `<leader>rr` | Reload config               |

## Java (buffer-local)

| Mode   | Key     | Description      |
| ------ | ------- | ---------------- |
| Normal | `<M-o>` | Organize imports |

## Markdown (buffer-local)

| Mode   | Key             | Description                    |
| ------ | --------------- | ------------------------------ |
| Normal | `<leader>mf`    | Format file with prettier      |
| Normal | `<leader>mt`    | Format current table           |
| Normal | `<Leader><Tab>` | Format (LSP or prettier)       |

## Plugin: Leap Motion

| Key  | Description         |
| ---- | ------------------- |
| `s`  | Leap forward        |
| `S`  | Leap backward       |
| `gs` | Leap from windows   |

## Plugin: Mini.pairs

Auto-pairs plugin is enabled for automatic bracket/quote completion.
