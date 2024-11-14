local available, which_key = pcall(require, "which-key")
if not available then
  return
end

local options = {
  -- classic, modern, helix
  preset = "modern",

  icons = {
    breadcrumb = "", -- symbol used in the command line area that shows your active key combo
    separator = "|", -- symbol used between a key and it's label
    group = " ", -- symbol prepended to a group
    ellipsis = "…",
  },
}

which_key.setup(options)
