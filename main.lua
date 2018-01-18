require("Agente")

g = love.graphics
k = love.keyboard

function love.load()
	agente = Agente:new(100, 100, "Carlos", g.newImage("person/agente.png"), 0)
end

function love.update(dt)
	agente:setSpeed(250)
	agente:move(dt, "right", "left", "up", "down")

	if(k.isDown("space"))then
		agente:shoot()
	end

end

function love.draw()
	g.draw(agente:getImg(), agente:getX(), agente:getY(), agente:getOrientation(), 
		   0.9, 0.9, agente:getImg():getWidth()/2, agente:getImg():getHeight()/2)
end