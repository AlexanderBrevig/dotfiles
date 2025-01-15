local g = vim.g

g.netrw_liststyle = 3
g.have_nerd_font = true

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.clipboard:append("unnamedplus")

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"
opt.hlsearch = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.cursorline = true

opt.scrolloff = 8

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
