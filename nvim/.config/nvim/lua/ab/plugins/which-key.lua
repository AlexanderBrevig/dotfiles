return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
		local wk = require("which-key")

		wk.register({
			s = {
				name = "splits",
			},
			t = {
				name = "tabs",
			},
			x = {
				name = "trouble",
			},
			f = {
				name = "find",
			},
			g = {
				name = "goto",
			},
			l = {
				name = "lsp",
			},
			c = {
				name = "code",
			},
			h = {
				name = "hunk",
			},
			w = {
				name = "window",
			},
		}, { prefix = "<leader>" })
	end,
	opts = {},
}
