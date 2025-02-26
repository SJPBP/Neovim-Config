return {
	settings = {
		Lua = {
			completion = {
				callSnippet = "Both",
				keywordSnippet = "Both",
			},
			diagnostics = {
				globals = {
					"vim",
					"autocmd",
				},
			},
			hint = {
				enable = true,
			}
		},
		workspace = {
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
		},
	}

}
