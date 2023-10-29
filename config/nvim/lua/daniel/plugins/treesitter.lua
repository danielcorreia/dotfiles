return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"css",
				"gitignore",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"query",
				"rust",
				"ssh_config",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
