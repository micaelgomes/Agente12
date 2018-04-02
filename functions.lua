-- FUNÇÕES AUXILIARES 
-- Objetivo de diminuir a quantidade de linhas da main

-- @param: um personargem
-- @return: personargem desenhado em tela
function desenharPersonagens(person)
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