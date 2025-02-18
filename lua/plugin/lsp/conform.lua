local available, conform = pcall(require, "conform")

if not available then
  return
end

--{{ keymaps
--
-- vim.keymap.set(
--   {
--     "n",
--     "v",
--   },
--   "<leader>lm",
--   function()
--     conform.format({
--       lsp_fallback = true,
--       async = false,
--       timeout_ms = 1000,
--     })
--   end,
--   { noremap = true, silent = true, desc = "Format file" }
-- )
--
--}}

local slow_format_filetypes = {}

local options = {
  formatters_by_ft = {
    -- c = { "clang-format" },
    -- cpp = { "clang-format" },
    css = { "prettier" },
    graphql = { "prettier" },
    html = { "prettier" },
    --htmldjango = { "prettier" },
    java = { "clang-format" },
    javascript = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
    json = { "deno_fmt" },
    lua = { "stylua" },
    markdown = { "deno_fmt" },
    -- php = { "pretty-php" },
    php = { "php-cs-fixer" },
    python = function(bufnr)
      if conform.get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    scss = { "prettier" },
    toml = { "taplo" },
    typescript = { "deno_fmt" },
    typescriptreact = { "deno_fmt" },
    svelte = { "deno_fmt" },
    yaml = { "prettier" },
  },

  -- format_on_save = function(bufnr)
  --   if slow_format_filetypes[vim.bo[bufnr].filetype] then
  --     return
  --   end
  --   local function on_format(err)
  --     if err and err:match("timeout$") then
  --       slow_format_filetypes[vim.bo[bufnr].filetype] = true
  --     end
  --   end
  --
  --   return { timeout_ms = 200, lsp_fallback = true }, on_format
  -- end,
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },

  format_after_save = function(bufnr)
    if not slow_format_filetypes[vim.bo[bufnr].filetype] then
      return
    end
    return { lsp_fallback = true }
  end,
}

conform.setup(options)
