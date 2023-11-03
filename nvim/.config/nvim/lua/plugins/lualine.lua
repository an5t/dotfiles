return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "onedark",
      icons_enabled = false,
      section_separators = "",
      disabled_filetypes = {
        statusline = { "NvimTree", "packer" },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { { "filename", path = 1 }, "diff" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "location" },
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
