-- LOCAL --------------------------

local o = vim.opt
local g = vim.g
local colorscheme = "tokyonight"

--  theme config
if ( colorscheme == "tokyonight" ) then 
	g.tokyonight_style = "night"
	g.tokyonight_italic_functions = true
	g.tokyonight_transparent = true
	g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
	-- Load the colorscheme
	vim.cmd[[colorscheme tokyonight]]
end


-- GLOBAL 

g.mapleader = ' '


-- NOT GLOBAL ? 

o.number = true 
o.relativenumber = true 
o.autoindent = true 
o.expandtab = false
o.tabstop = 4 
o.shiftwidth = 4
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.mouse = 'a'
o.cursorline = true 
o.ignorecase = true 
o.swapfile = false 
o.splitbelow = true 
o.splitright = true 
o.scrolloff = 3
o.encoding = 'UTF-8'
o.clipboard = 'unnamedplus'
o.listchars = {eol = '↲', tab = '▸-', trail = '·', space = '␣'}
o.termguicolors = true


