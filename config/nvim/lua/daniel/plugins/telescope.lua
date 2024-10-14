return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    "nvim-tree/nvim-web-devicons",
  },
	config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local utils = require("telescope.utils")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        mappings = {
          -- insert mode
          i = {
            -- move to prev result
            ["<C-k>"] = actions.move_selection_previous,
            -- move to next result
            ["<C-j>"] = actions.move_selection_next,
            -- add selections to quickfix list
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        },
        path_display = "truncate",
      }
    })

    telescope.load_extension("fzf")

    -- keymaps
		vim.keymap.set(
      "n",
      "<leader>ff",
      function()

        local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })

        if ret == 0 then
          builtin.git_files()
        else
          builtin.find_files()
        end
      end,
      { desc = "Fuzzy find git files (fallback to files in cwd if not git repo)" }
    )
		vim.keymap.set("n", "<leader>FF", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	end,
}
