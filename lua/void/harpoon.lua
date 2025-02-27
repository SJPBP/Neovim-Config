local harpoon = require("harpoon")

-- REQUIRED
harpoon.setup {
	global_settings = {
		-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
		save_on_toggle = false,

		-- saves the harpoon file upon every change. disabling is unrecommended.
		save_on_change = true,

		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = false,

		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
		tmux_autoclose_windows = false,

		-- filetypes that you want to prevent from adding to the harpoon list menu.
		excluded_filetypes = { "harpoon" },

		-- set marks specific to each git branch inside git repository
		mark_branch = false,

		-- enable tabline with harpoon marks
		tabline = false,
		tabline_prefix = "   ",
		tabline_suffix = "   ",
	}
}
-- REQUIRED

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
	}):find()
end

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add File to Harpoon" })
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
-- 	{ desc = "Toggle Harpoon Quick Menu" })
vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
	{ desc = "Open harpoon window" })

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Open First file" })
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Open Second File" })
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Open Third File" })
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Open Fourth File" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Go to previous file" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Go to next file" })
