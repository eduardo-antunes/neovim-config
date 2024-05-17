-- telescope.lua: instala e configura o telescope, um fuzzy finder de
-- propósito geral que, na minha config, cumpre a mesma função que a
-- combinação minibuffer + vertico no emacs

return {
  "nvim-telescope/telescope.nvim",
  opts = {},
  config = function ()
    -- O telescope vem com um pacote de funcionalidades nativas que cobre
    -- basicamente todas as minhas necessidades; defino atalhos para elas aqui
    local t = require("telescope.builtin")
    vim.keymap.set("n", "<c-b>", t.buffers)
    vim.keymap.set("n", "<c-f>", t.find_files)
    vim.keymap.set("n", "<leader>h", t.help_tags)
    vim.keymap.set("n", "<leader>k", t.man_pages)
    vim.keymap.set("n", "<leader>:", t.commands)
    vim.keymap.set("n", "<leader>.", t.oldfiles)

    -- Seleciona entre todos arquivos, inclusive ocultos e ignorados
    vim.keymap.set("n", "<leader>f", function ()
      t.find_files { hidden = true, no_ignore = true }
    end)

    -- Seleciona entre todas as ocorrências de um texto no diretório atual,
    -- usando o programa ripgrep para efetuar a pesquisa
    vim.keymap.set("n", "<leader>/", function ()
      local w = vim.fn.input("Pesquisar no diretório: ")
      if w == "" then return end -- operação cancelada
      t.grep_string { search = w }
    end)

    -- A extensão telescope-fzf-native, já instalada, traz um desempenho
    -- excelente para o telescope
    require("telescope").load_extension("fzf")
  end,
}
