if not pcall(require, "lspconfig") then
	print("lspconfig failed to load")
	return
end

local function prequire(filename)
	local status_ok, file = pcall(require, filename)
	if not status_ok then
		print(string.format("%s failed to load", filename))
		return
	end
	return file
end

prequire("john.lsp.lsp-installer")
prequire("john.lsp.handlers").setup()
prequire("john.lsp.null-ls")
