return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("substitute").setup()
		require("ab.keymaps").substitute()
	end,
}
