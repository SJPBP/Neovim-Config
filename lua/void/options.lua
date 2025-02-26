-- :help options

local options = {
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	hlsearch = true, -- highlight all matches on previous search pattern
	undofile = true, -- enable persistent undo
	undolevels = 10000,
	updatetime = 300, -- faster completion (4000ms default)
	tabstop = 4, -- insert 4 spaces for a tab
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	number = true, -- set numbered lines
	relativenumber = true, -- relative line numbers
	mouse = 'a', -- Enable mouse mode, can be useful for resizing splits for example!
	list = true,
	listchars = { tab = '» ', trail = '·', nbsp = '␣' }, -- Sets how neovim will display certain whitespace characters in the editor.
	inccommand = 'split', -- Preview substitutions live, as you type!
	linebreak = true, -- Wrap lines at convenient points
	smartcase = true, -- Don't ignore case with capitals
	smartindent = true, -- Insert indents automatically
	termguicolors = true, -- True color support
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	signcolumn = 'yes' -- Keep signcolumn on by default
}


for key, value in pairs(options) do
	vim.opt[key] = value
end
