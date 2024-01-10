local function codeium()
  return "{…}" .. vim.api.nvim_call_function("codeium#GetStatusString", {})
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "onedark",
      icons_enabled = false,
      section_separators = "",
      disabled_filetypes = {
        statusline = { "NvimTree" },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { { "filename", path = 1 }, "diff" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { codeium },
      lualine_z = { "location" },
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
