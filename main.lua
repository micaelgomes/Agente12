require("Agente")
require("functions")

g = love.graphics
k = love.keyboard

function love.load()
	agente12 = Agente:new(100, 100, "Carlos", g.newImage("person/agente.png"), 0)
end

function love.update(dt)
	agente12:setSpeed(250)
	agente12:move(dt, "right", "left", "up", "down")

	if(k.isDown("space"))then
		agente12:shoot()
	end

end

function love.draw()
	desenharPersonagens(agente12)
end