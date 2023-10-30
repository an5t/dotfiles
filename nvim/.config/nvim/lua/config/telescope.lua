local function config()
  local actions = require 'telescope.actions'

  require('telescope').setup {
    defaults = {
      file_ignore_patterns = { '.git/', '.direnv/'},

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
      lsp_definitions = {
        theme = "ivy",
      },
      lsp_references = {
        theme = "ivy",
      },
      lsp_implementations = {
        theme = "ivy",
      },
    },
  }
end

return config
