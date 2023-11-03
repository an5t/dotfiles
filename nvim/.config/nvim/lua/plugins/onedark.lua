return {
  "navarasu/onedark.nvim",
  dependencies = "lualine.nvim",

  config = function()
    local onedark = require("onedark")

    onedark.setup({
      style = "warm",
      highlights = {
        IblIndent = { fg = "$bg3" },
        IblScope = { fg = "$grey" },
        NvimTreeIndentMarker = { fg = "$bg3" },
        NvimTreeStatusLine = { fg = "$bg2", bg = "$bg_d" },
        NvimTreeStatusLineNC = { fg = "$bg1", bg = "$bg_d" },
        NvimTreeWinSeparator = { fg = "$bg_d", bg = "$bg_d" },
        StatusLine = { bg = "$bg1" },
        StatusLineNC = { bg = "$bg1" },
      },
      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    })

    onedark.load()
  end,
}
