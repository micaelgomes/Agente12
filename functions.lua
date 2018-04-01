-- FUNÇÕES AUXILIARES 
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

function movement(control, person, velocidade, right, left, up, down)
	if k.isDown (right) then
		person.x = person.x + (velocidade * control);
		person.orientacao = 0;
	elseif k.isDown (left) then
		person.x = person.x - (velocidade * control);
		person.orientacao = 3.14;
	elseif k.isDown (up) then
		person.y = person.y - (velocidade * control);
		person.orientacao = 3.14/2*-1;	
	elseif k.isDown (down) then
		person.y = person.y + (velocidade * control);
		person.orientacao = 3.14/2;
	end	
end

function shoot(control, tabela, person, canShoot, canShootTimer, imagem)
	
end

function refreshBala(control, tabela, bala, velocidadeTiro)
	for i,bala in ipairs(tabela) do
		if bala.orientacao == 0 then
	    	bala.x = bala.x + (velocidadeTiro * control);
    	elseif bala.orientacao == 3.14/2*-1 then
		    bala.y = bala.y - (velocidadeTiro * control);
		elseif bala.orientacao == 3.14 then
		    bala.x = bala.x - (velocidadeTiro * control);
		else
		    bala.y = bala.y + (velocidadeTiro * control);
		end
		  
		if bala.x <= 0 or bala.x >= g.getWidth() then
			table.remove(tabela, i);
		elseif bala.y <= 0 or bala.y >= g.getHeight() then
		    table.remove(tabela, i);
		end
	end
end
