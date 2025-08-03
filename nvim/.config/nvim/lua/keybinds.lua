local map = vim.keymap.set

-- forbid leader shortcuts in v,i modes

map({ "n", "v" }, "<Leader>", "<Nop>")

-- Personal --

map({ "n", "v", "i" }, "<C-t>", [[<esc>:tabe<CR>]], { noremap = true, silent = true })
map({ "n", "v", "i" }, "<C-s>", [[<esc>:w<CR>]], { noremap = true, silent = true })
map({ "n", "v", "i" }, "<C-d>", [[<esc>:tabclose<CR>]], { noremap = true, silent = true })
map("n", "gs", [[:G<CR><C-W>T]], { noremap = true, silent = true })

map({ "x" }, "<Leader>p", [[\dP]], { noremap = true, silent = true })

-- Keep selection after visual mode indent
map("v", ">", [[>gv^]], { noremap = true, silent = true })
map("v", "<", [[<gv^]], { noremap = true, silent = true })

-- Telescope --

local telescope = require("telescope.builtin")
local telescopeConfig = require("telescope.config")
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
map("n", "<Leader>ff", telescope.find_files, { noremap = true })
map("n", "<Leader>FF", function()
	telescope.find_files({ find_command = { "rg", "--files", "--hidden", "--no-require-git" } })
end, { noremap = true })
map("n", "<Leader>fg", telescope.live_grep, { noremap = true })
map("n", "<Leader>FG", function()
	telescope.live_grep({ vimgrep_aruments = vimgrep_arguments })
end, { noremap = true })

map("n", "<Leader>fb", telescope.buffers, { noremap = true })
map("n", "<Leader>gb", telescope.git_branches, { noremap = true })
map("n", "<Leader>gs", telescope.git_status, { noremap = true })
map("v", "<Leader>gb", telescope.git_bcommits_range, { noremap = true })

-- BufferLine --

map("n", "b]", [[:tabn<CR>]], { noremap = true, silent = true })
map("n", "b[", [[:tabp<CR>]], { noremap = true, silent = true })

-- Comment Lines --

map({ "n" }, "<Leader>c", [[gcc]], { remap = true, silent = true })
map("v", "<Leader>c", [[gc]], { remap = true, silent = true })

-- Diagnostics Toggle --

-- stolen from https://www.reddit.com/r/neovim/comments/11axh2p/comment/jasdwkr/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.keymap.set("n", "<leader>d", function()
	-- If we find a floating window, close it.
	local found_float = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative ~= "" then
			vim.api.nvim_win_close(win, true)
			found_float = true
		end
	end

	if found_float then
		return
	end

	vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
end, { desc = "Toggle Diagnostics" })

-- UNDO TREE

map("n", "<leader><F5>", vim.cmd.UndotreeToggle)
