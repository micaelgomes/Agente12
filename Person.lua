-- CLASSE PRINCIPAL DE PERSONARGEM DO JOGO

require("Bullet")

Person = {}
Person_mt = {}
Person_mt.__index = Person

function Person:new(x, y, nome, image, angle)
	local mediaObject = { 
		x = x, 
		y = y, 
		nome = nome, 
		img = image, 
		orientation = angle,
		speed = nil, 
		bullet = Bullet:new(), 
		item = {}
	}
	
	setmetatable(mediaObject, Person_mt)
	
	return mediaObject
end

function Person:getX()
	return self.x
end

function Person:setX(x)
	self.x = x
end

function Person:getY()
	return self.y
end

function Person:setY(y)
	self.y = y
end

function Person:getOrientation()
	return self.orientation
end

function Person:setOrientation(angle)
	self.orientation = angle
end

function Person:getSpeed()
	return self.speed
end

function Person:setSpeed(speed)
	self.speed = speed
end

function Person:getImg()
	return self.img
end

function Person:setImg(image)
	self.img = image
end

function Person:getBullet()
	return self.bullet
end

function Person:setBullet(bullet)
	self.bullet = bullet
end

function Person:move(control, right, left, up, down)
	if love.keyboard.isDown (right) then
		self.x = self.x + (self.speed * control)
		self.orientation = 0
	elseif love.keyboard.isDown (left) then
		self.x = self.x - (self.speed * control)
		self.orientation = 3.14
	elseif love.keyboard.isDown (up) then
		self.y = self.y - (self.speed * control)
		self.orientation = 3.14/2*-1	
	elseif love.keyboard.isDown (down) then
		self.y = self.y + (self.speed * control)
		self.orientation = 3.14/2
	end	
end

function Person:shoot(control)
	if not self.bullet:getCanShoot() then
		self.bullet:setCanShootTimer ( self.bullet:getCanShootTimer() + control ) 
	end
	
	if self.bullet:getCanShootTimer() >= 0.5 then
		self.bullet:setCanShoot(true)
		self.bullet:setCanShootTimer(0)
	end
	
	if self.bullet:getQuant() > 0 then
		if love.keyboard.isDown ("space") and self.bullet:getCanShoot() then
			newBullet = { 
				x = self.x, 
				y = self.y,
				img = self.bullet:getImg(), 
				orientacao = self.orientation
			}
			
			table.insert(balaTabela, newBullet)
			self.bullet:setCanShoot(false)
			self.bullet:setQuant( self.bullet:getQuant() - 1 )
		end
	end
end
