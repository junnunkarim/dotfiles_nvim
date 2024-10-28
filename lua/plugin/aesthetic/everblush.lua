require("everblush").setup({
	-- Override the default highlights using Everblush or other colors
	override = {
		Normal = { fg = "#ffffff", bg = "#ffffff" },
	},
	-- Set transparent background
	transparent_background = false,

	-- Set contrast for nvim-tree highlights
	nvim_tree = {
		contrast = true,
	},
})
