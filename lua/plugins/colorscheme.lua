return {
	-- {
	-- 	"morhetz/gruvbox",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd("let g:gruvbox_transparent_bg = 1")
	-- 		vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
	-- 		vim.cmd("colorscheme gruvbox")
	-- 	end,
	-- },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				transparent = true,
				colors = {
					theme = {
						all = {
							ui = {
								-- bg_gutter = "none",
							},
						},
					},
				},
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
