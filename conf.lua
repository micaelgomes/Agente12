function love.conf(t)
	t.window.fullscreen = false --ajusta o tamanho da tela: cheia, minimizado
	t.window.resizable = false --define se pode ser ajustável as bordas da tela
	t.title = "mark"    -- define o título do arquivo
	t.modules.audio = true      -- ativa o audio
	t.modules.keyboard = true   -- ativa o teclado
	t.modules.image = true      -- ativa o imagem
	t.modules.graphics = true   -- ativa o gráfico
	t.modules.timer = true      -- ativa o relógio
	t.modules.mouse = false      -- ativa o mouse
	t.modules.sound = false      -- ativa o som
	t.modules.physics = true   -- ativa a física do jogo
	t.author = "SquarePixels" 
end