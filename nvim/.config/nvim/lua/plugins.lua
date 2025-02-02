
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
 -- undotree 
 

local custom_configs = require 'plug_config.setup' -- source of custom_configs for plugins


-- Setup lazy.nvim
require("lazy").setup({
	spec = {
	{ 'nvim-lualine/lualine.nvim', -- statusline
		dependencies = { 'kyazdani42/nvim-web-devicons'},
		lazy = false ,
		config = custom_configs['lualine'] },
	{'lewis6991/gitsigns.nvim', -- git diff signs on file
	  config = custom_configs['gitsigns'],
	},
	{'tpope/vim-surround'}, -- add chars like brackets or quotes to regions
	{'nvim-treesitter/nvim-treesitter', -- better syntax highlighting
		config = custom_configs['treesitter'],
		lazy = false,
	},
	{'preservim/tagbar'}, -- Tagbar for code navigation
	{'scrooloose/nerdcommenter'}, -- leader c for commenting
	{'nvim-telescope/telescope.nvim',-- filename and content search
		dependencies = 'nvim-lua/plenary.nvim',
		lazy = false
	},
	{ "nvim-telescope/telescope-file-browser.nvim" }, -- telescope file browser extension
	{'akinsho/bufferline.nvim', version = "*", -- prettier bufferline and movement
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = {},
	},
	{"lukas-reineke/indent-blankline.nvim", -- horizontal indent guide
		main = "ibl",
		config = {},
	},
	{'norcalli/nvim-colorizer.lua', -- color highlighting for hex values
	},
	{'jiangmiao/auto-pairs'}, -- pair for quotes and brackets when typing 
	{
	  "startup-nvim/startup.nvim", name =  "dashboard", lazy= false,
	  dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim"},
	  config = function()
		require"startup".setup(require("dash"))
	  end		
	},
	{"tpope/vim-fugitive"}, -- git commands
	{
	  "neovim/nvim-lspconfig",
	  dependencies = {"williamboman/mason.nvim","williamboman/mason-lspconfig.nvim"},
	  config = function()
			require'lspconfig'.pylsp.setup{
			  settings = {
				pylsp = {
				  plugins = {
					pycodestyle = {
					  ignore = {"E201","E202","E203","E251",
						"E226","E231","E501"},
					  maxLineLength = 100
					}
				  }
				}
			  }
			}
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
		  ensure_installed = {
			"rust_analyzer",
			"python-lsp-server"
		  },
		},
		dependencies = {'simrat39/rust-tools.nvim',"neovim/nvim-lspconfig"}
	},
	{ 
		"williamboman/mason-lspconfig.nvim",
		dependencies = {"williamboman/mason.nvim"},
		config = function()
			require("mason-lspconfig").setup_handlers{
				function (server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["rust_analyzer"] = function()
					require("rust-tools").setup()
				end,
			}
		end
	},
	--- THEMES
	{
	  "catppuccin/nvim",
	  lazy = true,
	  name = "catppuccin"
	  },

	},
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  rocks = {enabled=false},
  -- automatically check for plugin updates
  checker = { 
	  enabled = true,
	  notify = false,
  }
})



