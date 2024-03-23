function Color(color)
	-- Use kanagawa if present, or use default settings.
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	-- Set transparent background.
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Color()
