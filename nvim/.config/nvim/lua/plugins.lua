-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- wishlist to add
-- mini.surround
-- nvim-cmp ?

local custom_configs = require("plug_config.setup") -- source of custom_configs for plugins

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"nvim-lualine/lualine.nvim", -- statusline
			dependencies = { "kyazdani42/nvim-web-devicons" },
			lazy = false,
			config = custom_configs["lualine"],
		},
		{
			"lewis6991/gitsigns.nvim", -- git diff signs on file
			config = custom_configs["gitsigns"],
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "lua", "rust", "python", "dockerfile", "bash", "r" },
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },
				})
			end,
		},
		{
			"nvim-telescope/telescope.nvim", -- filename and content search
			dependencies = "nvim-lua/plenary.nvim",
			lazy = false,
		},
		{ "nvim-telescope/telescope-file-browser.nvim" }, -- telescope file browser extension
		{
			"akinsho/bufferline.nvim",
			version = "*", -- prettier bufferline and movement
			dependencies = "nvim-tree/nvim-web-devicons",
			config = {},
		},
		{
			"lukas-reineke/indent-blankline.nvim", -- horizontal indent guide
			main = "ibl",
			config = {},
		},
		{
			"norcalli/nvim-colorizer.lua", -- color highlighting for hex values
		},
		{ "jiangmiao/auto-pairs" }, -- pair for quotes and brackets when typing
		{
			"startup-nvim/startup.nvim",
			name = "dashboard",
			lazy = false,
			dependencies = {
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
			},
			config = function()
				require("startup").setup(require("dash"))
			end,
		},
		{ "tpope/vim-fugitive" }, -- git commands
		{ "mbbill/undotree" }, -- tree history of edits <F5>
		-- LSP THINGS
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "pylsp", "rust_analyzer" },
			},
			dependencies = {
				{ "mason-org/mason.nvim", opts = { automatic_enable = false } },
				"neovim/nvim-lspconfig",
			},
		},
		{
			"mrcjkb/rustaceanvim",
			version = "^6", -- Recommended
			lazy = false, -- This plugin is already lazy
		},
		--- THEMES
		{
			"catppuccin/nvim",
			lazy = true,
			name = "catppuccin",
			enabled = false,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	rocks = { enabled = false },
	-- automatically check for plugin updates
	checker = {
		enabled = true,
		notify = false,
	},
})
