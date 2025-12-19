# Simple Neovim Config

Based on [nvim-lite](https://github.com/radleylewis/nvim-lite). A single-file
Neovim configuration using pure Lua.

## Requirements

- Neovim 0.12+

## Structure

```
init.lua      # Complete configuration (~1000 lines)
scripts/      # Setup scripts (e.g., get-jdtls-lib.sh)
```

## Features

- Native plugin management (`vim.pack.add`)
- Native LSP configuration (`vim.lsp.config`, `vim.lsp.enable`)
- Completion with nvim-cmp + LuaSnip
- Telescope for fuzzy finding
- Treesitter for syntax highlighting
- Floating terminal (`<leader>\``)
- Emacs-style keybindings in insert/command mode
- Image viewing in terminal (requires compatible terminal)

## LSP Setup

### Lua

```bash
sudo pacman -Suy lua-language-server
```

### Markdown

For full markdown support including table formatting:

```bash
# Markdown-oxide for completion and preview
sudo pacman -Suy rustup # if cargo is not installed
rustup default stable
cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide

# or just use AUR
paru -S markdown-oxide-git
yay -S markdown-oxide-git

# Marksman for additional LSP features (optional)
npm i -g marksman

# Prettier for table formatting (recommended)
npm i -g prettier
```

#### Markdown Keybindings

| Key             | Description                               |
| --------------- | ----------------------------------------- |
| `<Leader><Tab>` | Format document (uses LSP or prettier)    |
| `<leader>mf`    | Format entire markdown file with prettier |
| `<leader>mt`    | Format current markdown table only        |

### Web

```bash
sudo pacman -Suy nvm # if node is not installed
nvm install --lts
nvm use --lts
npm i -g vscode-langservers-extracted typescript typescript-language-server emmet-ls
```

### Python

```bash
npm i -g pyright
```

### Java

```bash
sudo pacman -Suy maven # if mvn is not installed
sudo pacman -Suy wget # if wget is not installed
bash scripts/get-jdtls-lib.sh
```

### Ruby

On Ubuntu:

[Doc for Ruby LSP](https://shopify.github.io/ruby-lsp/editors.html#neovim)

```bash
sudo apt update
sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.bashrc
source ~/.bashrc
mise use -g ruby@3 # if ruby is not installed

gem install ruby-lsp
```

### XML

Installed automatically via Mason (`lemminx`).

## Image Viewing

Requires a terminal with graphics protocol support (Kitty, WezTerm, or iTerm2).

```bash
# macOS
brew install imagemagick
luarocks --local --lua-version=5.1 install magick

# Arch Linux
sudo pacman -S imagemagick
luarocks --local --lua-version=5.1 install magick
```

Images will render inline in markdown files. You can also open image files directly in Neovim.

## Key Bindings

See [KEY_BINDINGS.md](KEY_BINDINGS.md) for the complete list.

### Quick Reference

| Key          | Description              |
| ------------ | ------------------------ |
| `<Space>`    | Leader key               |
| `<leader>ff` | Find files               |
| `<leader>fg` | Live grep                |
| `<leader>e`  | Toggle file explorer     |
| `<leader>\`` | Toggle floating terminal |
| `gd`         | Go to definition         |
| `gr`         | Find references          |
| `K`          | Hover documentation      |
| `<leader>rn` | Rename symbol            |
| `<leader>ca` | Code action              |
