function ColorMyPencils(color)
	color = color or "rose-pine"
	-- vim.cmd.colorscheme(color)
	
	-- Set the background to transparent (use same as terminal)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	-- Change conceal color
	vim.api.nvim_set_hl(0, "Conceal", { fg = normal_color, ctermfg = normal_color })

	-- Change color of comments
	vim.cmd [[highlight Comment ctermfg=244 guifg=#5f8787]]

end

ColorMyPencils()
-- to execute this file run: so (shoutout) 
