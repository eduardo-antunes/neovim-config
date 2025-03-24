-- telescope.lua: instala e configura o telescope, um fuzzy finder de
-- propósito geral que, na minha config, cumpre a mesma função que a
-- combinação minibuffer + vertico no emacs

return {
  "nvim-telescope/telescope.nvim",
  -- opts = { defaults = { path_display = { shorten = true } } },
  config = function ()
    -- O telescope vem com um pacote de funcionalidades nativas que cobre
    -- basicamente todas as minhas necessidades; defino atalhos para elas aqui
    local t = require("telescope.builtin")
    vim.keymap.set("n", "<c-b>", t.buffers)
    vim.keymap.set("n", "<c-f>", t.find_files)
    vim.keymap.set("n", "<c-/>", t.grep_string)
    vim.keymap.set("n", "<leader>h", t.help_tags)
    vim.keymap.set("n", "<leader>k", t.man_pages)
    vim.keymap.set("n", "<leader>:", t.commands)

    -- Seleciona entre todos arquivos, inclusive ocultos e ignorados
    vim.keymap.set("n", "<leader>f", function ()
      t.find_files { hidden = true, no_ignore = true }
    end)

    -- Seleciona apenas os arquivos do diretório atual
    local u = require("telescope.utils")
    vim.keymap.set("n", "<leader>.", function ()
      t.find_files {
        cwd = u.buffer_dir(),
        path_display = { shorten = false }
      }
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
