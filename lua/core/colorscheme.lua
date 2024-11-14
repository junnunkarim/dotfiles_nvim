--require("core.highlight_group")

function change_colorscheme(colorscheme)
  vim.cmd.colorscheme(colorscheme or "nord")
end

-- local color = "base16-default-dark"
local color = "matugen"

if color == "matugen" then
  local colors = require("colors.matugen")

  require("base16-colorscheme").setup(colors)
else
  change_colorscheme(color)
end
