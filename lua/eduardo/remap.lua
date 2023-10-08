-- Configuração de atalhos de teclado

local atalhos = {
  -- Pequenas conveniências
  { "n", "Q",         "<nop>"       },
  { "i", "kj",        "<esc>"       },
  { "n", "<leader>s", ":%s/"        },
  { "n", "<leader>r", "<c-^>"       },
  { "n", "<leader>e", ":e %:h/"     },
  { "t", "<esc>",     "<c-\\><c-n>" },

  -- Movimentação entre janelas
  { "n", "<leader>w", "<c-w>"  },
  { "n", "<c-j>",     "<c-w>j" },
  { "n", "<c-k>",     "<c-w>k" },
  { "n", "<c-h>",     "<c-w>h" },
  { "n", "<c-l>",     "<c-w>l" },
  { "n", "<c-\\>",    "<c-w>p" },

  -- Gerenciamento de buffers
  { "n", "<leader><right>", vim.cmd.bnext   },
  { "n", "<leader><left>",  vim.cmd.bprev   },
  { "n", "<leader>bd",      vim.cmd.bdelete },

  -- Copiar e colar do clipboard do sistema
  { "n", "<leader>p",  "\"+p"  },
  { "n", "<leader>Y",  "\"+y$" },
  { "n", "<leader>yy", "\"+yy" },
  { "n", "<leader>y",  "\"+y"  },
  { "v", "<leader>y",  "\"+y"  },

  -- Apagar texto para o registrador nulo
  { "n", "<leader>D",  "\"_D"  },
  { "n", "<leader>dd", "\"_dd" },
  { "n", "<leader>d",  "\"_d"  },
  { "v", "<leader>d",  "\"_d"  },

  -- Movimentação rápida mais agradável
  { "n", "<c-u>", "<c-u>zz" },
  { "n", "<c-d>", "<c-d>zz" },

  -- Movendo linhas no modo visual
  { "v", "J", ":m\">+1<cr>gv=gv" },
  { "v", "K", ":m\">-2<cr>gv=gv" },

  -- Diagnósticos
  { "n", "[d", vim.diagnostic.goto_prev, silent = true          },
  { "n", "]d", vim.diagnostic.goto_next, silent = true          },
  { "n", "<leader>ll", vim.diagnostic.open_float, silent = true },
  { "n", "<leader>lq", vim.diagnostic.setloclist, silent = true },

  -- Lista de quickfix local
  { "n", "<leader>q", vim.cmd.lopen },
  { "n", "<leader>j", vim.cmd.lnext },
  { "n", "<leader>k", vim.cmd.lprev },

  -- Lista de quickfix global
  { "n", "<leader>c",  vim.cmd.copen },
  { "n", "<leader>cj", vim.cmd.cnext },
  { "n", "<leader>ck", vim.cmd.cprev },
}

-- Aplica os atalhos na tabela
for _, atalho in ipairs(atalhos) do
  vim.keymap.set(atalho[1], atalho[2], atalho[3], { silent = atalho.silent })
end

-- Atalhos para o sistema de complete nativo

vim.keymap.set("i", "<tab>", function ()
  return vim.fn.pumvisible() == 1 and "<c-n>" or "<tab>"
end, { expr = true })

vim.keymap.set("i", "<s-tab>", function ()
  return vim.fn.pumvisible() == 1 and "<c-p>" or "<s-tab>"
end, { expr = true })

-- Remova espaços em branco sobressalentes ao salvar arquivos
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[if &ft!="text"|%s/\s\+$//e|endif]],
    group = vim.api.nvim_create_augroup("RemoveWhitespace"),
  })
