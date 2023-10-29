return function()
  require('nvim-tree').setup {
    hijack_directories = { enable = false },
    respect_buf_cwd = true,
    view = {
      width = 36,
    },
    renderer = {
      add_trailing = true,
      highlight_git = true,
      icons = {
        show = {
          git = false,
          file = false,
          folder = false,
          folder_arrow = false,
        }
      },
      indent_markers = { enable = true },
      special_files = {},
    },
    filters = {
      custom = {
        "^.direnv$",
        "^.git$",
        "^.mypy_cache$",
        "^.pytest_cache$",
        "^__pycache__$",
      },
    },
    actions = {
      open_file = {
        -- quit_on_open = true,
      }
    },
    git = {
      enable = true,
    },
    modified = {
      enable = true,
      show_on_open_dirs = false,
    },
  }
end
