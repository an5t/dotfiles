return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    -- Don't add pairs if it already has a close pair in the same line
    enable_check_bracket_line = true,
  },
}
