-- plugins/dap.lua: configura depuração no neovim via nvim-dap. O DAP é um
-- protocolo similar ao LSP, mas com foco específico em depuradores

vim.keymap.set("n", "<F5>",  function() require("dap").continue()  end, { desc = "debug continue"  })
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, { desc = "debug step_over" })
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, { desc = "debug step_into" })
vim.keymap.set("n", "<F12>", function() require("dap").step_over() end, { desc = "debug step_over" })

local function dap_bind(lhs, rhs, desc)
  vim.keymap.set("n", "<leader>d" .. lhs, rhs, { desc = "debug " .. desc })
end

dap_bind("b", function() require("dap").toggle_breakpoint()  end, "break"    )
dap_bind("r", function() require("dap").repl.open()          end, "repl"     )
dap_bind("l", function() require("dap").run_last()           end, "run_last" )
dap_bind("h", function() require("dap.ui.widgets").hover()   end, "hover"    )
dap_bind("p", function() require("dap.ui.widgets").preview() end, "preview"  )

dap_bind("L", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Mensagem: "))
end, "break_with_log")

dap_bind("f", function()
  local w = require("dap.ui.widgets")
  w.centered_float(w.frames)
end, "frames")

dap_bind("s", function()
  local w = require("dap.ui.widgets")
  w.centered_float(w.scopes)
end, "scopes")
