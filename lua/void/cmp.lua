-- See `:help cmp`
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()


--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "󰊄",
	Method = "m",
	Function = "󰊕",
	Constructor = "",
	Field = "",
	Variable = "󰫧",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "󰌆",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "󰉺",
}


-- find more here: https://www.nerdfonts.com/cheat-sheet

luasnip.config.setup {}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = 'menu,menuone,noinsert',

		---@usage The minimum length of a word to complete on.
		keyword_length = 1,
	},

	-- For an understanding of why these mappings were
	-- chosen, you will need to read `:help ins-completion`
	--
	-- No, but seriously. Please read `:help ins-completion`, it is really good!
	mapping = cmp.mapping.preset.insert {
		-- Select the [n]ext item
		['<C-n>'] = cmp.mapping.select_next_item(),
		-- Select the [p]revious item
		['<C-p>'] = cmp.mapping.select_prev_item(),

		-- Scroll the documentation window [b]ack / [f]orward
		['<C-b>'] = cmp.mapping.scroll_docs(-1),
		['<C-f>'] = cmp.mapping.scroll_docs(1),

		-- Accept ([y]es) the completion.
		--  This will auto-import if your LSP supports it.
		--  This will expand snippets if the LSP sent a snippet.
		['<CR>'] = cmp.mapping.confirm { select = true },

		-- Manually trigger a completion from nvim-cmp.
		--  Generally you don't need this, because nvim-cmp will display
		--  completions whenever it has completion options available.
		['<C-Space>'] = cmp.mapping.complete {},

		-- Think of <c-l> as moving to the right of your snippet expansion.
		--  So if you have a snippet that's like:
		--  function $name($args)
		--    $body
		--  end
		--
		-- <c-l> will move you to the right of each of the expansion locations.
		-- <c-h> is similar, except moving you backwards.
		['<C-l>'] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { 'i', 's' }),
		['<C-h>'] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { 'i', 's' }),

		-- Close menu or close
		["<C-e>"] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},

		-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
		--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

			-- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = "(LSP)",
				nvim_lua = "(NVIM)",
				emoji = "(Emoji)",
				calc = "(Calc)",
				luasnip = "(Snippet)",
				-- tmux = "(TMUX)",
				-- treesitter = "(TreeSitter)",
				buffer = "(Buffer)",
				path = "(Path)",
			})[entry.source.name]

			return vim_item
		end,
	},
	sources = {
		{
			name = 'lazydev',
			-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
			group_index = 0,
		},
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		-- -- { name = "treesitter" },
		{ name = 'path' },
		{ name = "buffer" },
		-- { name = "tmux" },
		{ name = "emoji" },
		{ name = "calc" },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
	},
	view = {
		entries = "native",
	}
}
