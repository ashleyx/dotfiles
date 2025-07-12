
vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
	on_attach = on_attach,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- Python

vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            runtime = { version = 'Lua 5.1' },
            diagnostics = {
                globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
            },
			plugins = {
				pycodestyle = {
					ignore = {
						"E201","E202","E203",
						"E501"
					},
					maxLineLength = 120
				}
			}
        },
    },
})

