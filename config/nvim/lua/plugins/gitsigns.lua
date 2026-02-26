-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map("n", "<leader>gB", gitsigns.blame, { desc = "Display [B]lame" })
			map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line [b]lame" })
		end,
	},
}
