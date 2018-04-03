-- FUNÇÕES AUXILIARES 
-- Objetivo de diminuir a quantidade de linhas da main

-- FUNÇÕES: DESENHAR; ATUALIAZAR-TELA
-- @param: um personargem
-- @return: personargem desenhado em tela
function drawPerson(person)
	love.graphics.draw(
		person:getImg(), 
		person:getX(), 
		person:getY(), 
		person:getOrientation(),
		0.9, 0.9, 
		person:getImg():getWidth()/2, 
		person:getImg():getHeight()/2
	)
end

-- @param: 
-- @return: 
function refreshBullet(person, balaTabela, dt)

	for k, bala in ipairs(balaTabela) do
		if bala.orientacao == 0 then
			bala.x = bala.x + (person:getBullet():getSpeedShoot() * dt)
		elseif bala.orientacao == 3.14/2*-1 then
			bala.y = bala.y - (person:getBullet():getSpeedShoot() * dt)
		elseif bala.orientacao == 3.14 then
			bala.x = bala.x - (person:getBullet():getSpeedShoot() * dt)
		else
			bala.y = bala.y + (person:getBullet():getSpeedShoot() * dt)
		end
	
		-- bala limitada pela tela
		if bala.x <= 0 or bala.x >= 800 then
			table.remove(balaTabela, k)
		elseif bala.y <= 0 or bala.y >= 600 then
			table.remove(balaTabela, k)
		end
	end
end

-- @param: 
-- @return: 
function drawBullet(balaTabela)
	for k, bala in pairs(balaTabela) do
		g.draw(bala.img, bala.x, bala.y, bala.orientacao, 0.5, 0.5)
	end
end

--FUNÇÕES: MAPA
-- @param: 
-- @return: 
function loadMapBasic()

end

-- @param: um arquivo base
-- @return: 'true', caso o arquivo não esteja vazio
function fileExists(file)
	local f = io.open(file, "rb")
	
	if f then 
		f:close() 
	end

	return f ~= nil
end
  
-- @param: um diretorio
-- @return: tabela vazia se arquivo não existe
function linesFrom(file)
	if not fileExists(file) then 
		return {} 
	end
	
	lines = {}
	
	for line in io.lines(file) do 
		lines[#lines + 1] = line
	end
	
	return lines
end
  
-- testando
local file = 'teste.map'
local lines = linesFrom(file)

for index, line in pairs(lines) do
	if line == '@DATA' then
		map = tonumber(lines[index+1])
	end
end

print(map)