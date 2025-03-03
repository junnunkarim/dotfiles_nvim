local helper = require("core.helper")
local available, mason = pcall(require, "mason")

if not available then
  return
end

--{{ keymaps
--
helper.set_keymap("n", "<leader>sm", "<cmd>Mason<cr>", { noremap = true, silent = true, desc = "Open Mason" })
--
--}}

local options = {
  ui = {
    border = "none",

    -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
    backdrop = 30,
  },
}

mason.setup(options)
