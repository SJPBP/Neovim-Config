local M = {}

-- TODO: backfill this to template
M.setup = function()
	vim.diagnostic.config {
		severity_sort = true,
		float = { border = 'rounded', source = 'if_many' },
		underline = { severity = vim.diagnostic.severity.ERROR },
		signs = vim.g.have_nerd_font and {
			text = {
				[vim.diagnostic.severity.ERROR] = '󰅚 ',
				[vim.diagnostic.severity.WARN] = '󰀪 ',
				[vim.diagnostic.severity.INFO] = '󰋽 ',
				[vim.diagnostic.severity.HINT] = '󰌶 ',
			},
		},
		virtual_text = false,
	}

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlight then
		vim.api.nvim_exec(
			[[
			augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
			]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	M.capabilities = cmp_nvim_lsp.default_capabilities()
end

return M
