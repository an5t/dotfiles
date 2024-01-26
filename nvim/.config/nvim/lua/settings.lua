vim.opt.cursorline = true -- highlight current line
vim.opt.mouse = "a" -- enable mouse in all modes
vim.opt.number = true -- show line numbers
vim.opt.showmode = false -- disable mode indicator
vim.opt.termguicolors = true -- true color terminal
vim.opt.title = true
vim.opt.titlestring = "%f"
vim.opt.updatetime = 700
vim.opt.wildmode = "longest:full" -- command-line completion mode
vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.hlsearch = false
vim.opt.ignorecase = true -- ignore uppercase letters in search
vim.opt.smartcase = true -- ignore uppercase letters unless the search term has an uppercase letter

vim.opt.langmap = "ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;"
  .. "`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = false

vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

vim.cmd("autocmd BufNewFile,BufReadPost *.uci setfiletype uci")
