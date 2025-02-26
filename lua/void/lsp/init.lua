local ok, _ = pcall(require, "lspconfig")
if not ok then
	vim.notify("LSP Not Working")
	return
end

require("void.lsp.mason")
require("void.lsp.handlers").setup()
