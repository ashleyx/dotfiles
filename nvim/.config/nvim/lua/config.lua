-- LOCAL --------------------------

local o = vim.opt
local g = vim.g

-- GLOBAL 

g.mapleader = ' '

 -- vimslime
local file= io.popen([[tmux display-message -p '#{window_index}']])
local window_num = file:read()
file:close()
window_num = ":"..window_num..".2"

g.slime_target = "tmux"
--g.slime_default_config = {socket_name="default", target_pane="Local:Code.2"}
g.slime_default_config = {socket_name="default", target_pane= window_num }
g.slime_dont_ask_default = 1
g.slime_paste_file = "$HOME/.cache/.slime_paste"
-- NOT GLOBAL ? 

o.number = true 
o.relativenumber = true 
o.autoindent = true 
o.smarttab = true
o.tabstop = 4 
o.shiftwidth = 4
o.tabstop = 4
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
o.hidden = true
o.colorcolumn = "80"

