local o = vim.opt
local g = vim.g
local colorscheme = "rose-pine"

--  theme config

o.termguicolors = true

if colorscheme == "tokyonight" then
	g.tokyonight_style = "night"
	g.tokyonight_italic_functions = true
	g.tokyonight_transparent = false
	g.tokyonight_sidebars = { "qf", "vista_kind", "packer" }
	vim.cmd([[colorscheme tokyonight]])
	vim.cmd([[
	hi ColorColumn guibg=none ctermbg=1
	hi SignColumn guibg=none ctermbg=1
	]])
elseif colorscheme == "catppuccin" then
	g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
	local colors = require("catppuccin.palettes").get_palette()
	local local_bg = "#364351"
	local local_fg = "#aebcc9"
	local buffline_active = "#2c3741"
	local buffline_inactive = "NONE"
	require("catppuccin").setup({
		transparent_background = true,
		integrations = {
			gitsigns = false,
			telescope = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			dashboard = true,
			bufferline = false,
		},
		highlight_overrides = {
			all = {
				SignColumn = { bg = local_bg },
				LineNr = { bg = local_bg, fg = local_fg },
				GitGutterAdd = { bg = local_bg, fg = "#40f482" },
				GitGutterChange = { bg = local_bg, fg = "#efef00" },
				GitGutterDelete = { bg = local_bg, fg = "#ff5050" },
				Comment = { fg = local_fg },
				----- what is this behaviour bufferline ------------
				BufferLineBackground = { bg = buffline_inactive },
				BufferLineBackcrust = { bg = buffline_inactive }, -- others
				BufferLineBufferVisible = { bg = buffline_inactive },
				BufferLineBufferSelected = { bg = buffline_active }, -- current
				-- tabs
				BufferLineTab = { bg = buffline_inactive },
				BufferLineTabSelected = { bg = buffline_active },
				BufferLineTabClose = { bg = buffline_inactive },
				BufferLineIndicatorSelected = { bg = buffline_active },
				-- separators
				BufferLineSeparator = { bg = buffline_inactive },
				BufferLineSeparatorVisible = { bg = buffline_inactive },
				BufferLineSeparatorSelected = { bg = buffline_active },
				-- close buttons
				BufferLineCloseButton = { bg = buffline_inactive },
				BufferLineCloseButtonVisible = { bg = buffline_inactive },
				BufferLineCloseButtonSelected = { bg = buffline_active },
				-- Empty fill
				BufferLineFill = { bg = buffline_inactive },
				-------------------------------
			},
		},
	})
	vim.cmd([[colorscheme catppuccin]])
	vim.cmd([[
	hi ColorColumn guibg=none ctermbg=gray
	]])
else
	vim.cmd("colorscheme " .. colorscheme)
	vim.cmd([[
	hi Normal guibg=none ctermbg=none
	hi Folded guibg=none ctermbg=none
	hi NonText guibg=none ctermbg=none
	hi SpecialKey guibg=none ctermbg=none
	hi VertSplit guibg=none ctermbg=none
	hi SignColumn guibg=none ctermbg=none
	hi EndOfBuffer guibg=none ctermbg=none
	hi ColorColumn guibg=none ctermbg=1
	]])
end

vim.api.nvim_set_hl(0, "HeaderColourGroup", { fg = "#555555", bg = none })
