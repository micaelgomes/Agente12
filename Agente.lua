require("Bullet")

Agente = {}
Agente_mt = {}
Agente_mt.__index = Agente

function Agente:new(x, y, nome, image, angle)
	local mediaObject = { 
		x = x, 
		y = y, 
		nome = nome, 
		img = image, 
		orientation = angle,
		speed = nil, 
		bullet = Bullet:new(), 
		item = nil 
	}
	
	setmetatable(mediaObject, Agente_mt)
	
	return mediaObject
end

function Agente:getX()
	return self.x
end

function Agente:setX(x)
	self.x = x
end

function Agente:getY()
	return self.y
end

function Agente:setY(y)
	self.y = y
end

function Agente:getOrientation()
	return self.orientation
end

function Agente:setOrientation(angle)
	self.orientation = angle
end

function Agente:getSpeed()
	return self.speed
end

function Agente:setSpeed(speed)
	self.speed = speed
end

function Agente:getImg()
	return self.img
end

function Agente:setImg(image)
	self.img = image
end

function Agente:move(control, right, left, up, down)
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

function Agente:shoot(control)
	if (not self.bullet:getCanShoot()) then
		self.bullet:setCanShootTimer(control)
	end
	if self.bullet:getCanShootTimer() >= 0.5 then
		self.bullet:setCanShoot(true)
		self.bullet:setCanShootTimer(0)
	end
	if self.bullet:getCanShoot() then
		if self.orientation == 0 then 
			novaBala = { x = self.x-3, y = self.y+9, orientation = self.orientation, img = self.bullet:getImg() };
		elseif self.orientation == 3.14/2*-1 then
			novaBala = { x = self.x+9, y = self.y-3, orientation = self.orientation, img = self.bullet:getImg() };
		elseif self.orientation == 3.14 then
			novaBala = { x = self.x+3, y = self.y-9, orientation = self.orientation, img = self.bullet:getImg() };
		else
			novaBala = { x = self.x-9, y = self.y+3, orientation = self.orientation, img = self.bullet:getImg() };
		end

		table.insert(self.bullet:getBulletTable(), novaBala);
		self.bullet:setCanShoot(false)
	end

	for i,bala in ipairs(self.bullet:getBulletTable()) do
		if self.orientation == 0 then
	    	bala.x = bala.x + (self.bullet:getSpeedShoot() * control);
		elseif self.orientation == 3.14/2*-1 then
		    bala.y = bala.y - (self.bullet:getSpeedShoot() * control);
		elseif self.orientation == 3.14 then
		    bala.x = bala.x - (self.bullet:getSpeedShoot() * control);
		else
		    bala.y = bala.y + (self.bullet:getSpeedShoot() * control);
		end
		  
		if bala.x <= 0 or bala.x >= love.graphics.getWidth() then
			table.remove(self.bullet:getBulletTable(), i);
		elseif bala.y <= 0 or bala.y >= love.graphics.getHeight() then
		    table.remove(self.bullet:getBulletTable(), i);
		end
	end
end
