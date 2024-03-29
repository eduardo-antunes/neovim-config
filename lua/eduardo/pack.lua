--# Setup básico do sistema de plugins

local icons = false -- requer nerd font
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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

local config = {}
if not icons then
  -- substitui ícones com caracteres Unicode
  config.ui = {
    icons = {
      cmd = "⌘", config = "🛠", event = "📅", ft = "📂", init = "⚙",
      keys = "🗝", plugin = "🔌", runtime = "💻", require = "🌙",
      source = "📄", start = "🚀", task = "📌", lazy = "💤 ",
    }
  }
end
config.dev = { path = "~/Projetos/pessoais" }
vim.keymap.set("n", "<leader>L", vim.cmd.Lazy)

-- Essa linha configura a interface do lazy e carrega os plugins, utilizando
-- as especificações na pasta lua/plugins
require("lazy").setup("plugins", config)
