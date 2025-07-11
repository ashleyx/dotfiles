
local map = vim.keymap.set

-- forbid leader shortcuts in v,i modes

map({'n','v'}, '<Leader>', '<Nop>')

-- Personal --

map({'n','v','i'},'<C-t>', [[<esc>:tabnew<CR>]], {noremap = true, silent = true})
map({'n','v','i'},'<C-s>', [[<esc>:w<CR>]], {noremap = true, silent = true})
map({'n','v','i'},'<C-q>', [[<esc>:bd<CR>]], {noremap = true, silent = true})

map({'x'},'<Leader>p',[[\dP]],{noremap = true, silent = true})

-- Keep selection after visual mode indent
map('v','>', [[>gv^]], {noremap = true, silent = true})
map('v','<', [[<gv^]], {noremap = true, silent = true})

-- Telescope --
map('n', '<Leader>ff', [[:Telescope find_files prompt_prefix=🔍-><CR>]], {noremap = true})
map('n', '<Leader>FF', [[:Telescope find_files find_command=rg,--files,--hidden,--iglob=!.git prompt_prefix=🔍-><CR>]],{noremap = true})
map('n', '<Leader>fg', [[:Telescope live_grep prompt_prefix=🔍-><CR>]], {noremap = true})
map('n', '<Leader>FG', [[:Telescope live_grep vimgrep_arguments=rg,--hidden,--iglob=!.git prompt_prefix=🔍-><CR>]], {noremap = true})
--map('n', '<Leader>fh', [[:Telescope help_tags<CR>]], {noremap = true})

--map('n', '<Leader>fb', [[:Telescope file_browser<CR>]], {noremap = true})

map('n', '<Leader>fb', [[:Telescope buffers<CR>]], {noremap = true})

-- BufferLine --

map('n', 'b]', [[:BufferLineCycleNext<CR>]], {noremap = true , silent = true})
map('n', 'b[', [[:BufferLineCyclePrev<CR>]], {noremap = true , silent = true})
map('n', 'b}', [[:BufferLineMoveNext<CR>]], {noremap = true , silent = true})
map('n', 'b{', [[:BufferLineMovePrev<CR>]], {noremap = true , silent = true})

-- Comment Lines --

map({'n'},'<Leader>c', [[gcc]], {remap = true, silent = true})
map('v','<Leader>c', [[gc]], {remap = true, silent = true})
