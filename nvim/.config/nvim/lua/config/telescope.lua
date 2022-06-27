local function config()
  local actions = require 'telescope.actions'

  require('telescope').setup {
    defaults = {
      file_ignore_patterns = { '.git/' },

      -- add "--hidden" to default value
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },
    },

    pickers = {
      find_files = {
        theme = "dropdown",
        hidden = true,
      },
      live_grep = {
        theme = "dropdown",
        hidden = true,
      },
      buffers = {
        theme = "dropdown",
        mappings = {
          i = {
            ["<Del>"] = actions.delete_buffer,
          }
        }
      },
      help_tags = {
        theme = "dropdown",
      },
      lsp_definitions = {
        theme = "dropdown",
      },
      lsp_references = {
        theme = "dropdown",
      },
    },
  }
end

return config
