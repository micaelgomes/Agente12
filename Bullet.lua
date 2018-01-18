Bullet = {}
Bullet_mt = {}
Bullet_mt.__index = Bullet

function Bullet:new()
	local mediaObject = {
		bulletTable = {},  
		canShoot = true, 
	    canShootTimer = 0, 
	    speedShoot = 2000,
	    img = love.graphics.newImage("item/bullet.png")
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