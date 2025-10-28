-- plugins/fugitive: configurações da integração com o git

vim.keymap.set("n", "<leader>g", ":Git ")
vim.keymap.set("n", "<leader>G", vim.cmd.Git)

-- O fugitive com o cmdheight=0 às vezes acaba causando alguns dos famigerados
-- prompts de "aperte ENTER para prosseguir". Alguns ajustes para resolver isso
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("eduardo-fugitive", {}),
  pattern = "fugitive",
  callback = function(ev)
    local set = function(lhs, rhs)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf })
    end
    set("cc", "<cmd>silent Git commit --quiet<cr>")
    set("ca", "<cmd>silent Git commit --amend --quiet<cr>")
    set("ce", "<cmd>silent Git commit --amend --no-edit --quiet<cr>")
  end
})
