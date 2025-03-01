local available, lualine = pcall(require, "lualine")
if not available then
  return
end

local options = {
  options = {
    icons_enabled = true,
    theme = "auto",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    ignore_focus = {
      "neo-tree",
      "nvim-tree",
    },
    -- always_divide_middle = true,
    globalstatus = true,
    refresh = {
      -- tabline = 100,
      winbar = 500,
      statusline = 1000,
    },
  },
  ----------------------------------------------------
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "diagnostics",
        separator = { left = "", right = "" },
        sources = { "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
        symbols = {
          error = " ",
          warn = " ",
          info = "󰋼 ",
          hint = "󰌵 ",
        },
        colored = true,
        diagnostics_color = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
        },
        update_in_insert = true,
      },
    },
    lualine_d = {},
    lualine_x = {},
    lualine_y = {
      {
        "diff",
        separator = { left = "", right = "" },
      },
    },
    lualine_z = {
      {
        "filename",
        path = 1,
        separator = { left = "", right = "" },
        file_status = true,
        symbols = {
          modified = "[]",
          readonly = "[]",
          unnamed = "[no_name]",
          newfile = "[new]",
        },
      },
    },
  },
  ----------------------------------------------------
  inactive_winbar = {
    lualine_a = {
      {
        "diagnostics",
        separator = { left = "", right = "" },
        sources = { "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
        symbols = {
          error = " ",
          warn = " ",
          info = "󰋼 ",
          hint = "󰌵 ",
        },
        colored = true,
        diagnostics_color = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint",
        },
        update_in_insert = true,
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_d = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        "filename",
        path = 1,
        separator = { left = "", right = "" },
        file_status = true,
        symbols = {
          modified = "[]",
          readonly = "[]",
          unnamed = "[no_name]",
          newfile = "[new]",
        },
      },
    },
  },
  ----------------------------------------------------
  sections = {
    lualine_a = {
      {
        "mode",
        separator = { left = "", right = "" },
      },
    },
    lualine_b = {
      {
        "branch",
        separator = { left = "", right = "" },
      },
    },
    lualine_c = {
      {
        "buffers",
        separator = { left = "", right = "" },
        icons_enabled = false,
        mode = 0,
        show_modified_status = true,
        symbols = {
          -- text to show when the buffer is modified
          modified = " []",
          -- text to show to identify the alternate file
          alternate_file = "",
          -- text to show when the buffer is a directory
          directory = "",
        },
      },
    },
    lualine_d = {},
    lualine_x = {
      { "searchcount" },
    },
    lualine_y = {
      { "location", separator = { left = "", right = "" } },
    },
    lualine_z = {
      {
        "tabs",
        separator = { left = "", right = "" },
        padding = 1,
        use_mode_colors = true,
        symbols = {
          modified = " []", -- Text to show when the file is modified.
        },
      },
    },
  },
  ----------------------------------------------------
  inactive_sections = {},
  tabline = {},
  ----------------------------------------------------
  extensions = {
    "lazy",
    "man",
    "mason",
    "neo-tree",
    "toggleterm",
    "quickfix",
  },
}

lualine.setup(options)
