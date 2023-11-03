return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      filetype = {
        go = {
          require("formatter.filetypes.go").gofmt,
          require("formatter.filetypes.go").goimports,
        },
        python = {
          require("formatter.filetypes.python").autopep8,
          require("formatter.filetypes.python").black,
          require("formatter.filetypes.python").isort,
        },
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        json = {
          require("formatter.filetypes.json").jq,
        },
      },
    })
  end,
}
