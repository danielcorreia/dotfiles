local opt = vim.opt

opt.guicursor = ""

-- line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = true -- show relative line numbers

-- tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- line wrapping
opt.wrap = false -- disable line wrapping

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- turn off swapfile
opt.swapfile = false
opt.backup = false

-- long running undos
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- searching on file
opt.hlsearch = false
opt.incsearch = true

-- cool colors
opt.termguicolors = true

-- space to the top/bottom of the file
opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50

opt.colorcolumn = "80"

opt.listchars = {
  trail = "·",
  tab = "▷ ",
  nbsp = "○",
  extends = "◣",
  precedes = "◢"
}
opt.list = true
