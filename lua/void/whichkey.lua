local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	vim.notify(wk .. "not installed")
end


wk.add({
	{
		mode = "n",
		{
			"<leader>e",
			":Lex 30<cr>",
			desc = "Open sidebar",
		},
		{
			"<leader>-",
			"<C-W>s",
			desc = "Split Window To Below"
		},
		{
			"<leader>|",
			"<C-W>v",
			desc = "Split Window To Right"
		},

		{
			"<leader>wd",
			"<C-W>c",
			desc = "Delete Window"
		},

		{
			"<leader>u",
			":UndotreeToggle<cr>",
			desc = "Open Undo Tree"
		},
	},
})
