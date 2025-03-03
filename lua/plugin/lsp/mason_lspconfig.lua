local available_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")

if not available_mason_lsp then
  return
end

local options = {
  ensure_installed = {
    --[ lsp
    "bashls",
    -- "clangd",
    "cssls",
    "denols",
    "html",
    "hyprls",
    -- "ltex",
    "lua_ls",
    -- "intelephense",
    -- "marksman",
    -- "pico8-ls",
    "rust_analyzer",
    "svelte",
    "tailwindcss",
    "taplo",
    -- "texlab",
    "ts_ls",
    --
    --]

    --[ formatter
    --
    "ruff",
    -- "shfmt",
    -- "stylua",
    --
    --]
  },
}

mason_lspconfig.setup(options)
