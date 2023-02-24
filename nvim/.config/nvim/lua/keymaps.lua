local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-h>', '<cmd>wincmd h<CR>', opts)
map('n', '<C-j>', '<cmd>wincmd j<CR>', opts)
map('n', '<C-k>', '<cmd>wincmd k<CR>', opts)
map('n', '<C-l>', '<cmd>wincmd l<CR>', opts)

map('t', '<ESC>', '<C-\\><C-n>', opts)

-- Diagnostic
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
-- map('n', '<leader>q', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)

-- Telescope
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>fw', '<cmd>lua require("telescope.builtin").grep_string()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
map('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<cr>', opts)

-- NvimTree
map('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', opts)
