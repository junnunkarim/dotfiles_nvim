require("core.options")
require("core.keymaps")

if not vim.g.vscode then
  require("core.lazy")
  require("core.colorscheme")
end
