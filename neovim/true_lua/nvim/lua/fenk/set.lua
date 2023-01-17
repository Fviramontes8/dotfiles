-- Show numbers on the left
vim.opt.number = true
-- Show relative numbers outside the current line
vim.opt.relativenumber = true

-- Indentation settings, going for a tab size of 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- Force tabs because I don't like spaces :)
vim.opt.expandtab = false

-- Keeping same indent as line you're already on unless filetype specific
-- 	indenting is required
-- vim.opt.autoindent = true

-- Keeps the syntax style consistent
vim.opt.smartindent = true

-- Will show matching (), [], and {}
vim.opt.showmatch = true

-- Ignore autocomplete for .o files
vim.opt.wildignore="*.o"

-- Turn off highlighting of all matches when searching with '/'
vim.opt.hlsearch = false
-- Turn on incremental search for ease of use
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- Draws a column at position 80
vim.opt.colorcolumn = "80"
-- Draws a signcolumn on the far left of the terminal when opening a file
vim.opt.signcolumn = "yes"

-- When splitting windows (e.g. :sp) the new window will be opened below
-- 	the current window
vim.opt.splitbelow = true

-- When splitting windows (e.g. :vsp) the new window will be opened to the
-- 	right of the current window
vim.opt.splitright = true

