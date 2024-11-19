local opt = vim.opt

-- opt.guicursor = ""

-- make line numbers default
opt.number = true
-- set relative line numbers
opt.relativenumber = true

-- enable mouse mode (can be useful for resizing splits for example)
opt.mouse = "a"

-- don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- enable break indent
opt.breakindent = true

-- save undo history
opt.undofile = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- keep signcolumn on by default
opt.signcolumn = "yes"

-- decrease update time
opt.updatetime = 250

-- decrease mapped sequence wait time
-- displays which-key popup sooner
opt.timeoutlen = 300

-- configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- -- tabs
-- opt.tabstop = 2
-- opt.softtabstop = 2
-- opt.shiftwidth = 2
-- opt.expandtab = true
--
-- -- line wrapping
-- opt.wrap = false -- disable line wrapping
--
-- -- backspace
-- opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
--
-- -- turn off swapfile
-- opt.swapfile = false
-- opt.backup = false
--
-- -- long running undos
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- opt.undofile = true
--
-- -- searching on file
-- opt.hlsearch = false
-- opt.incsearch = true
--
-- -- cool colors
-- opt.termguicolors = true
--
-- opt.colorcolumn = "80"
