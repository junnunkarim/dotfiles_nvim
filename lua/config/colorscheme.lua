local available, plugin = pcall(require, "base16-colorscheme")

if not available then
	return
end

local function change_colorscheme(colorscheme)
	vim.cmd.colorscheme(colorscheme or "default")
end

plugin.with_config({
	telescope = false,
	indentblankline = true,
	notify = true,
	ts_rainbow = true,
	cmp = false,
	illuminate = true,
	dapui = true,
})

local color = "nord"

if color == "matugen" then
	local colors = require("colors.matugen")

	plugin.setup(colors)
else
	change_colorscheme(color)
end
