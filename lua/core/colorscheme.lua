function change_colorscheme(colorscheme)
	vim.cmd.colorscheme(colorscheme or "nord")
	--vim.api.nvim_set_hl(0, "Normal", {bg = "none"} )
	--vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"} )
end

--require("core.highlight_group")

local color = "base16-default-dark"

change_colorscheme(color)
