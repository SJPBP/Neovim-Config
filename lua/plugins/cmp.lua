return { -- Autocompletion
	'hrsh7th/nvim-cmp',
	-- event = { "InsertEnter", "CmdlineEnter" }, -- Entering insert, replace, visual, or commandline mode
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			'folke/lazydev.nvim',
			ft = 'lua',
			opts = {
				library = {
					-- Load luvit types when the `vim.uv` word is found
					{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
				},
			},
		},
		{
			'L3MON4D3/LuaSnip',
			build = (function()
				-- Build Step is needed for regex support in snippets.
				-- This step is not supported in many windows environments.
				-- Remove the below condition to re-enable on windows.
				if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
					return
				end
				return 'make install_jsregexp'
			end)(),
			dependencies = {
				-- `friendly-snippets` contains a variety of premade snippets.
				--    See the README about individual language/framework/plugin snippets:
				--    https://github.com/rafamadriz/friendly-snippets
				{
					'rafamadriz/friendly-snippets',
					--  config = function()
					--   require('luasnip.loaders.from_vscode').lazy_load()
					-- end,

				},
				{
					-- Adds a LuaSnip snippet picker to the Neovim Telescope
					-- Requires LuaSnip and telescope.nvim
					-- "benfowler/telescope-luasnip.nvim",
				},
			},
		},
		'saadparwaiz1/cmp_luasnip',

		--  Adds other completion capabilities.
		--  nvim-cmp does not ship with all sources by default. They are split
		--  into multiple repos for maintenance purposes.
		'hrsh7th/cmp-path', -- path completions
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-nvim-lua",
		-- "hrsh7th/cmp-cmdline",           -- cmdline completions
		-- "mtoohey31/cmp-fish",            -- Fish shell
		-- "andersevenrud/cmp-tmux",        -- Tmux
		"hrsh7th/cmp-emoji", -- Emojis
		"hrsh7th/cmp-calc", -- Calc
		-- "hrsh7th/cmp-nvim-lsp-signature-help", -- Display function signatures
		"hrsh7th/cmp-nvim-lsp",
	},
}
