local highlight = {
	"CursorColumn",
	"Whitespace",
}

configs = {

	gitsigns = {
		signs = {
			add = { text = "+" },
			change = { text = "o" },
			delete = { text = "-" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signcolumn = true,
	},
	lualine = {
		options = {
			theme = "auto",
		},
	},
	treesitter = {
		ensure_installed = { "lua", "rust", "python", "dockerfile", "bash", "r" },
		ignore_install = { "javascript" },
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},

	telescope = function()
		local actions = require("telescope.actions")

		return {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<CR>"] = actions.select_tab,
					},
					n = {
						["q"] = actions.close,
					},
				},
				file_ignore_patterns = { ".git/", "node_modules" },
			},
		}
	end,
}

return configs
