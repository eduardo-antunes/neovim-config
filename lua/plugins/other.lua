-- O other.nvim é um plugin muito interessante. Em alguns projetos e linguagens,
-- um arquivo pode estar diretamente relacionado a um mais outros arquivos na
-- mesma árvore. O exemplo clássico é a relação entre arquivos .h e .c nas
-- linguagens C e C++. Esse plugin permite definir essas associações,
-- fornecendo comandos para navegar entre arquivos relacionados e forma rápida.

return {
  "rgroli/other.nvim",
  ft = { "c", "cpp", "go" },
  config = function ()
    require("other-nvim").setup {
      -- Definição das relações entre arquivos; o plugin já traz algumas
      -- relações pré-definidas. Cada relação é definida pelo formato dos
      -- arquivos origem e alvo e por um contexto opcional.
      mappings = {
        "golang",
        -- Arquivos de cabeçalho (.h) e de implementação (.c) em C e C++
        { pattern = "include/(.*).h", target = "src/%1.c" },
        { pattern = "src/(.*).c", target = "include/%1.h" },
      }
    }
    -- Atalhos de navegação; permitem abrir o arquivo relacionado em vez do
    -- atual, abaixo dele (split) ou ao lado (vsplit).
    vim.keymap.set("n", "<leader><bs>", vim.cmd.Other, { silent = true })
    vim.keymap.set("n", "<leader>ls", vim.cmd.OtherSplit, { silent = true })
    vim.keymap.set("n", "<leader>lv", vim.cmd.OtherVSplit, { silent = true })
  end
}
