return function()
  require('nvim-tree').setup {
    hijack_directories = { enable = false },
    respect_buf_cwd = true,
    view = {
      width = 35,
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
    },
    filters = {
      dotfiles = true,
    },
    actions = {
      open_file = {
        -- quit_on_open = true,
      }
    }
  }
end
