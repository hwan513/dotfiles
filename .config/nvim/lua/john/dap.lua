local keymap = vim.api.nvim_set_keymap -- keymaps function shortened
local opts = { noremap = true, silent = true }
local status_ok_dap, _ = pcall(require, "dap")
if not status_ok_dap then
	return
end

local signs = {
	active = false,
	on_config_done = nil,
	breakpoint = {
		text = "",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	breakpoint_rejected = {
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "DiagnosticUnderlineInfo",
		numhl = "LspDiagnosticsSignInformation",
	},
}

vim.fn.sign_define("DapBreakpoint", signs.breakpoint)
vim.fn.sign_define("DapBreakpointRejected", signs.breakpoint_rejected)
vim.fn.sign_define("DapStopped", signs.stopped)

keymap("n", "<Leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<Leader>db", "<cmd>lua require'dap'.step_back()<cr>", opts)
keymap("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<Leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", opts)
keymap("n", "<Leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", opts)
keymap("n", "<Leader>dg", "<cmd>lua require'dap'.session()<cr>", opts)
keymap("n", "<Leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<Leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<Leader>du", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<Leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", opts)
keymap("n", "<Leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<Leader>ds", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<Leader>dq", "<cmd>lua require'dap'.close()<cr>", opts)

local status_ok_DI, dap_install = pcall(require, "dap-install")
if not status_ok_DI then
	return
end
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end
