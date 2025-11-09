-- plugins/pick.lua: configura o mini.pick, um seletor genérico, leve e
-- flexível; parte do mini.nvim que eu mais configuro

local pick = require("mini.pick")
local u = require("eduardo.lib.utils")

local win_config = function()
  local config = u.win_center_compute()
  config.style = "minimal"
  config.border = "rounded"
  return config
end

vim.ui.select = pick.ui_select
pick.setup {
  window = { config = win_config },
  source = { show = pick.default_show },
}

vim.keymap.set("n", "<c-f>", pick.builtin.files, { desc = "pick files" })
vim.keymap.set("n", "<c-b>", pick.builtin.buffers, { desc = "pick buffers" })
vim.keymap.set("n", "<leader>h", pick.builtin.help, { desc = "pick help" })

--------------------------------------------------------------------------------

-- Muda a cor de destaque do accent.nvim
vim.keymap.set("n", "<leader>C", function()
  local source = {
    name = "Accent Colors",
    choose = function(name)
      vim.g.accent_color = name
      vim.cmd.colors "accent"
    end,
    items = require("accent").accent_colors,
  }
  pick.start { source = source }
end, { desc = "pick accent_colors" })

-- Pesquisa em arquivos com caminhos truncados; útil principalmente em projetos
-- com estruturas de diretórios profundamente aninhadas, como os típicos em java
vim.keymap.set("n", "<leader>f", function()
  local original_paths = {}
  local source = {
    name = "Abbrev Files (rg)",
    choose = function(path)
      pick.default_choose(original_paths[path])
    end,
    preview = function(buf, path, opts)
      pick.default_preview(buf, original_paths[path], opts)
    end,
  }

  pick.builtin.cli({
    command = { "rg", "--files" },
    postprocess = function(paths)
      local items = {}
      for _, path in ipairs(paths) do
        if path == "" then break end
        local dir = vim.fn.fnamemodify(path, ":h:t")
        local name = vim.fn.fnamemodify(path, ":t")
        local new_path = (dir ~= ".")
          and string.format("%s/%s", dir, name)
          or name
        table.insert(items, new_path)
        original_paths[new_path] = path
      end
      return items
    end,
  }, { source = source })
end, { desc = "pick abbrev_files" })

-- Pesquisa apenas arquivos sob o diretório atual (caminhos truncados)
vim.keymap.set("n", "<leader>.", function()
  local original_paths = {}
  local source = {
    name = "Current Filetree (rg)",
    choose = function(path)
      pick.default_choose(original_paths[path])
    end,
    preview = function(buf, path, opts)
      pick.default_preview(buf, original_paths[path], opts)
    end,
  }

  local dir = vim.fn.expand("%:h")
  pick.builtin.cli({
    command = { "rg", "--files", dir },
    postprocess = function(paths)
      local items = {}
      local prefix_len = u.common_prefix_len(paths)
      for _, path in ipairs(paths) do
        if path == "" then break end
        local new_path = path:sub(prefix_len + 1)
        original_paths[new_path] = path
        table.insert(items, new_path)
      end
      return items
    end
  }, { source = source })
end, { desc = "pick current_filetree" })

--------------------------------------------------------------------------------

local extra = require("mini.extra").pickers
vim.keymap.set("n", "<leader>k", extra.keymaps, { desc = "pick keymaps" })
