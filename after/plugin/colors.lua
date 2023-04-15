require('rose-pine').setup({
	disable_background = false
})

function SetupTheme(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- uncomment to set background to be transparent
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetupTheme()
