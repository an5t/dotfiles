return {
  {
    "github/copilot.vim",
    event = "BufEnter",
    config = function()
      vim.g.copilot_proxy = "localhost:3128"
    end,
  },
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  -- },
}
