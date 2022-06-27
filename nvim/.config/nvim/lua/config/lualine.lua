return function()
  require('lualine').setup {
    options = {
      theme = 'onedark',
      icons_enabled = false,
      section_separators = '',
      disabled_filetypes = { 'packer', 'NvimTree' },
    },
    sections = {
      lualine_b = {
        { 'branch', icons_enabled = true },
        'diff',
        'diagnostics',
      },
      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },
    },
  }
end
