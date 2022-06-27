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
          IndentBlanklineChar = { fg = '$bg3' },
          IndentBlanklineContextChar = { fg = '$grey' },
          NvimTreeIndentMarker = { fg = '$bg3' },
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

  use {
    'tpope/vim-surround',
    requires = 'tpope/vim-repeat',
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup {
        show_current_context = true,
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

  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
    'neovim/nvim-lspconfig',
    config = require('config.lsp').config,
  }

  use 'williamboman/nvim-lsp-installer'

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
          python = {
            require('formatter.filetypes.python').autopep8,
            require('formatter.filetypes.python').black,
            require('formatter.filetypes.python').isort,
          }
        }
      }
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
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

  use 'cmcaine/vim-uci'
  use 'lervag/vimtex'
  use 'raimon49/requirements.txt.vim'

  if Bootstrap then
    require('packer').sync()
  end

end)
