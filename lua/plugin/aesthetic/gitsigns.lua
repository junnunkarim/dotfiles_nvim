local available, gitsigns = pcall(require, "gitsigns")

if not available then
	return
end

local options = {}

gitsigns.setup(options)
