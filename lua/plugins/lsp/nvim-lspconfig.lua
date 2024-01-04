return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Configure diagnostic symbols for the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Set LSP capabilities
		local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

		-- Set LSP attachments
		local lsp_attachments = function(client, bufnr)
			local keymap = vim.keymap
			local opts = { noremap = true, silent = true, buffer = bufnr }

			keymap.set("n", "gr", vim.lsp.buf.references, opts)
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			keymap.set("n", "K", vim.lsp.buf.hover, opts)
			keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		end

		-- LSP setup: clangd
		lspconfig.clangd.setup({
			capabilities = lsp_capabilities,
			on_attach = function(client, bufnr)
				client.server_capabilities.signatureHelpProvider = false
				lsp_attachments(client, bufnr)
			end,
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--all-scopes-completion",
				"--completion-style=detailed",
				"--header-insertion-decorators",
				"--header-insertion=iwyu",
				"--fallback-style=google",
				"--pch-storage=memory",
				"--offset-encoding=utf-16",
			},
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
		})

		-- LSP setup: cmake
		lspconfig.cmake.setup({
			capabilities = lsp_capabilities,
			on_attach = lsp_attachments,
		})

		-- LSP setup: lua_ls
		lspconfig.lua_ls.setup({
			capabilities = lsp_capabilities,
			on_attach = lsp_attachments,
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
					},
				},
			},
		})
	end,
}
