-- Bootstrap
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Downloading Packer...')
  Bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'navarasu/onedark.nvim',
    after = 'lualine.nvim',

    config = function()
      local onedark = require('onedark')
      onedark.setup {
        style = 'warm',
        highlights = {
          IblIndent = { fg = '$bg3' },
          IblScope = { fg = '$grey' },
          NvimTreeIndentMarker = { fg = '$bg3' },
          NvimTreeStatusLine = { fg = '$bg2', bg = '$bg_d' },
          NvimTreeStatusLineNC = { fg = '$bg1', bg = '$bg_d' },
          NvimTreeWinSeparator  = { fg = '$bg_d', bg = '$bg_d' },
          StatusLine = { bg = '$bg1' },
          StatusLineNC = { bg = '$bg1' },
        },
        -- Plugins Config --
        diagnostics = {
            darker = true, -- darker colors for diagnostic
            undercurl = true, -- use undercurl instead of underline for diagnostics
            background = true, -- use background color for virtual text
        },
      }
      onedark.load()
    end
  }

  use {
    'ntpeters/vim-better-whitespace',

    config = function()
      vim.g.strip_whitelines_at_eof = true
      vim.g.show_spaces_that_precede_tabs = true

      -- Disable in terminal buffers
      vim.cmd 'autocmd TermOpen * DisableWhitespace'
    end
  }

  use 'tpope/vim-fugitive'
  use 'tommcdo/vim-fubitive' -- Bitbucket support in :GBrowse
  use 'shumphrey/fugitive-gitlab.vim'

  use {
    'tpope/vim-surround',
    requires = 'tpope/vim-repeat',
  }

  use {
    'tpope/vim-unimpaired',
    requires = 'tpope/vim-repeat',
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {
        enable_check_bracket_line = true,
      }
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup {
        indent = { char = '▏'},
        scope = { enabled = false },
      }
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {}
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = require 'config.gitsigns',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = require('config.treesitter').run,
    config = require('config.treesitter').config,
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require'treesitter-context'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = 'inner', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
      }
    end
  }

  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    after = 'mason.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  }

  use {
    'neovim/nvim-lspconfig',
    after = 'mason-lspconfig.nvim',
    config = require('config.lsp').config,
  }

  use {
    'hrsh7th/nvim-cmp', -- autocompletion plugin
    config = require 'config.cmp',
  }

  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- snippets plugin

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup {
        sources = {
          null_ls.builtins.diagnostics.flake8.with {
            extra_args = { '--ignore=E501' },
          },
        },
      }
    end
  }

  use {
    'mhartington/formatter.nvim',
    config = function()
      require('formatter').setup {
        filetype = {
          go = {
            require('formatter.filetypes.go').gofmt,
            require('formatter.filetypes.go').goimports,
          },
          python = {
            require('formatter.filetypes.python').autopep8,
            require('formatter.filetypes.python').black,
            require('formatter.filetypes.python').isort,
          },
          json = {
            require('formatter.filetypes.json').jq,
          },
        }
      }
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    config = require 'config.tree',
  }

  use 'elihunter173/dirbuf.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = require 'config.telescope',
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = require 'config.lualine',
  }

  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup {
        filetypes = {
          'css',
          'javascript',
          'html',
        },
        user_default_options = {
          mode = 'virtualtext',
        },
      }
    end
  }

  use 'cmcaine/vim-uci'
  use 'lervag/vimtex'
  use 'raimon49/requirements.txt.vim'

  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.g.mkdp_auto_close = false
    end,
  }

  if Bootstrap then
    require('packer').sync()
  end

end)
