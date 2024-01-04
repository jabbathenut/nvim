return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" },
			auto_install = true,
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
