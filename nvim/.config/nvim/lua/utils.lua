------ AUTOCOMMANDS

vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  group = "AutoFormat",
  callback = function () vim.cmd(":silent !black % -l 120") end,
})

vim.api.nvim_create_autocmd('BufRead', {
    group = vim.api.nvim_create_augroup('filetype_python', { clear = true }),
    desc = 'Set LSP diagnostics for Python',
    pattern = { '*.py' },
    callback = function()
      vim.diagnostic.config({
        virtual_text = true,
        underline = false,
      })
    end,
  })
