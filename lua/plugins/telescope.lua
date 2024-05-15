-- O telescope.nvim é um fuzzy finder de propósito geral que, na minha
-- configuração, cumpre mais ou menos o mesmo propósito que a combinação
-- minibuffer + vertico desempenha no emacs.

local function pesquisa()
  -- Pergunta ao usuário por um termo de pesquisa e então utiliza o grep (ou o
  -- ripgrep) para efetuar a pesquisa no diretório atual, mostrando todos os
  -- resultados na interface do telescope.
  local term = vim.fn.input("Pesquisar no diretório: ")
  if term == "" then return end
  require("telescope.builtin").grep_string { search = term }
end

local function todos_arquivos()
  -- Lista no telescope todos os arquivos no árvore do diretório atual,
  -- incluindo os escondidos e os ignorados pelo git.
  require("telescope.builtin").find_files { hidden = true, no_ignore = true }
end

return {
  "nvim-telescope/telescope.nvim",
  config = function ()
    local t = require("telescope.builtin")

    -- Atalhos para as operações pré-definidas do plugin, bem como para as
    -- minhas funções próprias. Permitem pesquisar coisas variadas rapidamente
    vim.keymap.set("n", "<c-b>", t.buffers)
    vim.keymap.set("n", "<c-f>", t.find_files)
    vim.keymap.set("n", "<leader>f", todos_arquivos)
    vim.keymap.set("n", "<leader>h", t.help_tags)
    vim.keymap.set("n", "<leader>k", t.man_pages)
    vim.keymap.set("n", "<leader>:", t.commands)
    vim.keymap.set("n", "<leader>.", t.oldfiles)
    vim.keymap.set("n", "<leader>/", pesquisa)

    require("telescope").load_extension("fzf") -- extensão fzf-native
  end,
}
