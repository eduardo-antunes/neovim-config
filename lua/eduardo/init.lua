-- Quando o 'init.lua' executa require('eduardo'), esse é o arquivo que
-- é incluído. A única tarefa dele é requerer as várias partes da config.

require('eduardo.plugins') -- instalação e gerenciamento de plugins

require('eduardo.options') -- opções do editor

require('eduardo.keys') -- atalhos de teclado

require('eduardo.statusline').setup() -- statusline caseira
