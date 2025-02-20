local available_lsp, lspconfig = pcall(require, "lspconfig")
if not available_lsp then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local available_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if available_cmp_lsp then
  capabilities = cmp_lsp.default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
end

--{{ helper functions
--

local on_attach = function(client, bufnr)
  if client.name == "svelte" then
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
      callback = function(ctx)
        -- Here use ctx.match instead of ctx.file
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      end,
    })
  else
    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  end
end

local lsp_flags = {
  --allow_incremental_sync = true,
  --debounce_text_changes = 150,
}

--
--}}

local lua_library_files = vim.api.nvim_get_runtime_file("", true)
local lua_plugin_paths = {}
local lsp_util = require("lspconfig.util")
--vim.notify_once(resource_path)

--{{ LSP configuation
--

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
  root_dir = function(fname)
    return lsp_util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
      or lsp_util.path.dirname(fname)
  end,
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      format = {
        enable = true,
        -- Put format options here
        -- NOTE: the value should be String!
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
      runtime = {
        version = "LuaJIT",
        plugin = lua_plugin_paths,
      },
      diagnostics = {
        globals = {
          "vim",
          "quarto",
          "pandoc",
          "io",
          "string",
          "print",
          "require",
          "table",
          "awesome",
          "screen",
          "client",
        },
        disable = { "trailing-space" },
      },
      workspace = {
        library = lua_library_files,
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
      },
    },
  },
})

lspconfig.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

lspconfig.html.setup({
  capabilities = capabilities,
  flags = lsp_flags,
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

-- lspconfig.phpactor.setup({})
lspconfig.intelephense.setup({})

-- lspconfig.clangd.setup({})

lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "markdown", "quarto" },
  root_dir = lsp_util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
})

lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- lspconfig.ts_ls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

lspconfig.svelte.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "*.js", "*.ts", "svelte" },
})

lspconfig.hyprls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
