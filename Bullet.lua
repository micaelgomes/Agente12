-- CLASSE PRINCIPAL DE BALAS DO JOGO
-- mudar imagem ????

Bullet = {}
Bullet_mt = {}
Bullet_mt.__index = Bullet

function Bullet:new()
	local mediaObject = {
		bulletTable = {},  
		canShoot = true, 
	    canShootTimer = 1.3, 
	    speedShoot = 2000,
		img = love.graphics.newImage("item/bullet.png"),
		quant = 0
	}

	setmetatable(mediaObject, Bullet_mt)

	return mediaObject
end

function Bullet:getBulletTable()
	return bulletTable
end

function Bullet:getCanShoot()
	return self.canShoot
end

function Bullet:setCanShoot(canShoot)
	self.canShoot = canShoot
end

function Bullet:getCanShootTimer()
	return self.canShootTimer
end

function Bullet:setCanShootTimer(canShootTimer)
	self.canShootTimer = canShootTimer
end

function Bullet:getSpeedShoot()
	return self.speedShoot
end

function Bullet:getImg()
	return self.img
end

function Bullet:setImg(image)
	self.img = image
end

function Bullet:getQuant()
	return self.quant
end

function Bullet:setQuant(quant)
	self.quant = quant
end
