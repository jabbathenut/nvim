return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				-- List of LSPs to install
				ensure_installed = {
					"clangd",
					"cmake",
					"lua_ls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				-- List of linters and formatters to install
				ensure_installed = {
					"clang-format",
					"cmakelang",
					"stylua",
				},
			})
		end,
	},
}
