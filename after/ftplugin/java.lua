-- ftplugin/java.lua: configurations for java programming, mainly focused on
-- spring boot and gradle projects

local term = require("eduardo.lib.terminal")

vim.keymap.set("n", "<localleader>b", function()
    term.send "./gradlew build"
end, { desc = "gradle build" })

vim.keymap.set("n", "<localleader>r", function()
    term.send "./gradlew bootRun"
end, { desc = "gradle run" })

vim.keymap.set("n", "<localleader>d", function()
    term.send "./gradlew bootRun --debug-jvm"
end, { desc = "gradle debug" })
