-- pack.lua: configura o sistema de plugins com o lazy.nvim. O nome é uma
-- homenagem ao falecido packer.nvim, que muito bem me serviu

local icons = false -- requer nerd font, eu não gosto
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Caso o lazy não esteja instalado, instala-o
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- release estável do lazy
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local config = {
  change_detection = { enabled = false }
}
if not icons then
  -- Substitui ícones com caracteres Unicode na falta de uma fonte apropriada.
  -- Eu gosto bastante desses emojis, acho sinceramente que usar ícones deixa
  -- o trem bem mais feio
  config.ui = {
    icons = {
      cmd = "⌘", config = "🛠", event = "📅", ft = "📂", init = "⚙",
      keys = "🗝", plugin = "🔌", runtime = "💻", require = "🌙",
      source = "📄", start = "🚀", task = "📌", lazy = "💤 ",
    }
  }
end
-- Caminhos dos meus próprios plugins pessoais
config.dev = { path = "~/Projetos/pessoais" }
-- Atalho básico para abrir a interface do lazy
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy)

-- Essa linha configura a interface do lazy e carrega os plugins, utilizando
-- as especificações na pasta lua/plugins
require("lazy").setup("plugins", config)
