-- Esse arquivo é o ponto de partida da config, mas eu não uso ele para
-- configurações propriamente ditas. Essa tarefa está distribuída entre
-- vários outros arquivos com propósitos específicos.

require('eduardo.packer') -- instalação e gerenciamento de plugins

require('eduardo.options') -- opções do editor

require('eduardo.keys') -- atalhos de teclado

require('eduardo.statusline').setup() -- statusline caseira
