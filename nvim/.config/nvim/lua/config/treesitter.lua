local M = {}

M.config = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'bash',
      'comment',
      'css',
      'dockerfile',
      'go',
      'gomod',
      'gowork',
      'graphql',
      'html',
      'http',
      'java',
      'javascript',
      'jsdoc',
      'json',
      'json5',
      'kotlin',
      'lua',
      'make',
      'proto',
      'python',
      'regex',
      'rst',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vue',
      'yaml',
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
      disable = { 'yaml', },
    },
    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
    },
    refactor = {
      highlight_definitions = {
        enable = true,
        -- Set to false if you have an `updatetime` of ~100.
        clear_on_cursor_move = true,
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "<F2>",
        },
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "<nop>",
          list_definitions = "<NOP>",
          list_definitions_toc = "gO",
          goto_next_usage = "gn",
          goto_previous_usage = "gN",
        },
      },
    },
  }
end

M.run = function()
  if package.loaded['nvim-treesitter'] then
    vim.cmd [[ TSUpdate ]]
  end
end

return M
