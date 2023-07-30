-- Esse arquivo é o ponto de partida da config, mas eu não uso ele para
-- configurações propriamente ditas. Essa tarefa está distribuída entre
-- vários outros arquivos com propósitos específicos.

require("eduardo.packer")  -- instalação e gerenciamento de plugins
require("eduardo.config") -- configuração de opções do editor
require("eduardo.remap")   -- configuração de atalhos de teclado

-- Há ainda configurações específicas de certos plugins em after/plugin.
