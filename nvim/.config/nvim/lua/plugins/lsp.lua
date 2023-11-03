function config()
  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  -- TODO: remove when fixed; https://github.com/neovim/neovim/issues/23291
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.workspace = { didChangeWatchedFiles = { dynamicRegistration = false } }

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local opts = { noremap = true, silent = true }
  local on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      "gi",
      '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>',
      opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F6>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>F', '<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  local lspconfig = require("lspconfig")

  lspconfig["pyright"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  lspconfig["gopls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
        buildFlags = { "-tags=tests" },
      },
    },
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-lspconfig.nvim",
    },
    config = config,
  },
}
