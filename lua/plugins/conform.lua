local options = {
  formatters_by_ft = {
    -- c = { "clang-format" },
    -- cpp = { "clang-format" },
    css = { "deno_fmt" },
    html = { "deno_fmt" },
    java = { "clang-format" },
    javascript = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
    json = { "deno_fmt" },
    lua = { "stylua" },
    markdown = { "deno_fmt" },
    -- php = { "pretty-php" },
    -- php = { "php-cs-fixer" },
    python = { "ruff_format" },
    scss = { "deno_fmt" },
    toml = { "taplo" },
    typescript = { "deno_fmt" },
    typescriptreact = { "deno_fmt" },
    svelte = { "deno_fmt" },
    yaml = { "deno_fmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return {
  'stevearc/conform.nvim',
  opts = options,
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  cmd = "ConformInfo",
}
