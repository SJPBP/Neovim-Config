local servers = {
	"lua_ls",
	"harper_ls",
	"pylsp",
	"gopls",
	"clangd",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "✔️",
			package_pending = "🕐",
			package_uninstalled = "✖️",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	vim.notify("LSP Not Working")
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("void.lsp.handlers").on_attach,
		capabilities = require("void.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "void.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
