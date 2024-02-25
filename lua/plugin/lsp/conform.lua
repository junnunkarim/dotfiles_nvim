local available, conform = pcall(require, "conform")

if not available then
  return
end

--{{ keymaps
--
vim.keymap.set(
  {
    "n",
    "v",
  },
  "<leader>lm",
  function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end,
  { noremap = true, silent = true, desc = "Format file" }
)
--
--}}

local options = {
  formatters_by_ft = {
    css = { "prettier" },
    graphql = { "prettier" },
    --html = { "prettier" },
    --htmldjango = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    --lua = { "stylua" },
    -- markdown = { "prettier" },
    python = function(bufnr)
      if conform.get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    yaml = { "prettier" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    lsp_fallback = true,
    async = false,
    timeout_ms = 300,
  },
}

conform.setup(options)
