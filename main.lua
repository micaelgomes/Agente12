require("Person")
require("functions")

g = love.graphics
k = love.keyboard

balaTabela = {} 

function love.load()
	agente12 = Person:new(100, 100, "Carlos", g.newImage("person/agente.png"), 0)
	agente12:setSpeed(250)
	agente12:getBullet():setQuant(6)
	agente12:getBullet():setCanShootTimer(1.5)
end

function love.update(dt)
	agente12:move(dt, "right", "left", "up", "down")
	agente12:shoot(dt)
	refreshBullet(agente12, balaTabela, dt)
end

function love.draw()
	drawPerson(agente12) 
	drawBullet(balaTabela)
end