-- Use a protected call so we don't error out on first use
local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end

catppuccin.setup({
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		which_key = true,
		notify = false,
		harpoon = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		mason = true,
		nvim-cmp = true,
		nvimtree = true,
		telescope = {
			enabled = true,
			-- style = "nvchad"
		},
	}
})



local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
