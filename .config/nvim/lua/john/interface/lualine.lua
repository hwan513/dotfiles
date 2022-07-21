local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
	return
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local mode = {
	function()
		return "  "
	end,
	padding = { left = 0, right = 0 },
	color = {},
	cond = nil,
}

local progress = {
	function()
		local current_line = vim.fn.line(".")
		local total_lines = vim.fn.line("$")
		local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
		local line_ratio = current_line / total_lines
		local index = math.ceil(line_ratio * #chars)
		return chars[index]
	end,
	padding = { left = 0, right = 0 },
	cond = nil,
	color = { fg = "#F7768E", bg = "#16161E" },
}

local filename = {
	"filename",
	file_status = true, -- Displays file status (readonly status, modified status)
	path = 0, -- 0: Just the filename
	-- 1: Relative path
	-- 2: Absolute path

	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
	-- for other components. (terrible name, any suggestions?)
	symbols = {
		modified = "[+]", -- Text to show when the file is modified.
		readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
		unnamed = "[ ]", -- Text to show for unnamed buffers.
	},
}

-- local location = {
-- 	"location",
-- 	padding = { left = 1, right = 1 },
-- }

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "Mundo", "MundoDiff", "toggleterm" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { "branch", "diff" },
		lualine_c = { filename },
		lualine_x = { "filetype" },
		lualine_y = { diagnostics },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
