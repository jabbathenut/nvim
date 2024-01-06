-- ### LOCAL KEY MAPS ###

local keymap = vim.keymap
local opts = {
	noremap = true,
	silent = true,
}

-- Window Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Right

keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>", opts) -- Left
keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>", opts) -- Down
keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>", opts) -- Up
keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>", opts) -- Right

-- Indenting
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- ### WHICH-KEY KEY MAPS ###

local wk = require("which-key")

wk.setup({
	show_help = false,
	show_keys = false,
})

-- Create ToggleTerm variables
local terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
	local float = terminal:new({
		direction = "float",
	})
	return float:toggle()
end

-- Leader Keymaps
local leader = {
	C = { "<cmd>ColorizerToggle<CR>", "Colorizer Toggle" },
	e = {
		name = "+NvimTree",
		e = { "<cmd>NvimTreeToggle<CR>", "File Explorer Toggle" },
		f = { "<cmd>NvimTreeFocus<CR>", "File Explorer Focus" },
		h = { "<cmd>e ~/<CR>", "File Explorer Home" },
	},
	f = {
		name = "+Telescope",
		f = { "<cmd>Telescope find_files<CR>", "Find Files" },
		g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
		b = { "<cmd>Telescope buffers<CR>", "Buffers" },
		h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
	},
	t = {
		name = "+Terminal",
		f = { toggle_float, "Floating" },
	},
	T = { "<cmd>TagbarToggle<CR>", "Ctags Toggle" },
	s = {
		name = "+Window",
		v = { "<C-w>v", "Vertical Split" },
		h = { "<C-w>s", "Horizontal Split" },
		e = { "<C-w>=", "Equalize Splits" },
		x = { "<cmd>close<CR>", "Close Split" },
		m = { "<cmd>MaximizerToggle<CR>", "Maximize Toggle" },
	},
}

wk.register(leader, { prefix = "<leader>" })
