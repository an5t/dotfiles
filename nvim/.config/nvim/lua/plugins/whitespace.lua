return {
  "ntpeters/vim-better-whitespace",

  config = function()
    vim.g.strip_whitelines_at_eof = true
    vim.g.show_spaces_that_precede_tabs = true

    -- Disable in terminal buffers
    vim.cmd("autocmd TermOpen * DisableWhitespace")
  end,
}
