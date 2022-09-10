local M = {}

function M.config()
  require('nvim-lsp-installer').setup {
    automatic_installation = true,
  }

  -- Add additional capabilities supported by nvim-cmp
  local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local opts = { noremap = true, silent = true }

  local on_attach = function(client, bufnr)
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<F6>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>F', '<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
  end

  local lspconfig = require('lspconfig')

  lspconfig['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  lspconfig['sumneko_lua'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    }
  }

  lspconfig['texlab'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

end

return M
