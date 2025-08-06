-- In your Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lemminx" }, -- Lemminx is the server behind vscode-xml
})
