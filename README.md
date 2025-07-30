# Simple Neovim Config

Stolen from [nvim-lite](https://github.com/radleylewis/nvim-lite)

## LSP

### Lua

```bash
sudo pacman -Suy lua-language-server
```

### Markdown(-oxide)

```bash
sudo pacman -Suy rustup # if cargo is not installed
rustup default stable
cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide

# or just use AUR
paru -S markdown-oxide-git
yay -S markdown-oxide-git
```

### Web

```bash
sudo pacman -Suy nvm # if node is not installed
nvm install --lts
nvm use --lts
npm i -g vscode-langservers-extracted typescript typescript-language-server
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

On ubuntu

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
