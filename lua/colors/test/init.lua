local M = {}
local theme = require("colors.test.theme")

M.setup = function()
  -- clears all highlight groups
  vim.cmd("hi clear")

  vim.o.background = "dark"
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "test"

  theme.set_highlights()
end

M.setup()
