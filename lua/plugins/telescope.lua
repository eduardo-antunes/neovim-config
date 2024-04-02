-- O telescope.nvim é um fuzzy finder de propósito geral que, na minha
-- configuração, cumpre mais ou menos o mesmo propósito que a combinação
-- minibuffer + vertico desempenha no emacs.

local function pesquisa()
  -- Pergunta ao usuário por um termo de pesquisa e então utiliza o grep (ou o
  -- ripgrep) para efetuar a pesquisa no diretório atual, mostrando todos os
  -- resultados na interface do telescope.
  require("telescope.builtin").grep_string {
    search = vim.fn.input("Pesquisar no diretório: ")
  }
end

local function todos_arquivos()
  -- Lista no telescope todos os arquivos no árvore do diretório atual,
  -- incluindo os escondidos e os ignorados pelo git.
  require("telescope.builtin").find_files { hidden = true, no_ignore = true }
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- A extensão do telescope fzf-native incrementa o plugin com um alto
    -- desempenho proporcionado por uma implementação nativa do algoritmo do fzf.
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  init = function ()
    local t = require("telescope.builtin")

    -- Atalhos para as funções definidas acima e para operações pré-definidas
    -- do plugin, que incluem a listagem de: buffers do neovim, arquivos na
    -- árvore do diretório atual, comandos do vim, páginas de manual, commits
    -- do repositório git atual (se houver) e tópicos de ajuda do vim.
    vim.keymap.set("n", "<leader> ", t.buffers)
    vim.keymap.set("n", "<leader>.", t.find_files)
    vim.keymap.set("n", "<leader>:", t.commands)
    vim.keymap.set("n", "<leader>K", t.man_pages)
    vim.keymap.set("n", "<leader>gc", t.git_commits)
    vim.keymap.set("n", "<leader>H", t.help_tags)
    vim.keymap.set("n", "<leader>/", pesquisa)
    vim.keymap.set("n", "<C-f>", todos_arquivos)

    require("telescope").load_extension("fzf") -- extensão fzf-native
  end,
}
