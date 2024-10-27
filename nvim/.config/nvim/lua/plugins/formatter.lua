function pgformat()
  return {
    exe = "pg_format",
    args = {
      "--inplace",
      "--nogrouping",
      "--no-extra-line",
      "-",
    },
    stdin = true,
  }
end

return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      filetype = {
        go = {
          require("formatter.filetypes.go").gofmt,
          require("formatter.filetypes.go").goimports,
          require("formatter.filetypes.json").jq,
          pgformat,
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
        sql = {
          pgformat,
        },
        html = {
          require("formatter.filetypes.html").prettier,
        },
      },
    })
  end,
}
