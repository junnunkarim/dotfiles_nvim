require("core.keymaps")
require("core.options")

if not vim.g.vscode then
  require("core.lazy")
  require("core.colorscheme")
end
