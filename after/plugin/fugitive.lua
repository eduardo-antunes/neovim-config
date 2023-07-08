-- Configurações para vim-fugitive

vim.keymap.set('n', '<leader>gc', ':Git ')
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('n', '<leader>gl', vim.cmd.Gclog)

local fugitive_gr = vim.api.nvim_create_augroup('eduardo_fugitive', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = fugitive_gr,
    pattern = 'fugitive',
    callback = function ()
      local bufnr = vim.api.nvim_get_current_buf()
      local opts = { buffer = bufnr, remap = false }

      -- Atalhos específicos para quando a interface do fugitive estiver aberta
      vim.keymap.set('n', '<leader>gp', function() vim.cmd.Git('push') end, opts)
      vim.keymap.set('n', '<leader>gP', function() vim.cmd.Git('pull') end, opts)
      vim.keymap.set('n', '<leader>gu', ':Git push -u origin ', opts)
    end,
  })
