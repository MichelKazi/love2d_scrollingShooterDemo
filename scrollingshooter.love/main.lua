debug = true
-- Player table
player = { x = 200, y = 710, speed = 150, img = nil }

-- Timers
canShoot = true
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax

-- Bullet 
bullet = {}
bulletImg = nil


function love.load()

	player.img = love.graphics.newImage('assets/plane.png')	
	bulletImg = love.graphics.newImage('assets/bullet.png')

end

function love.update(dt)

	-- Exit the game
	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end

	-- Player movement

	if love.keyboard.isDown('lshift') then
		player.speed = 300
	else
		player.speed = 100
	end

	if love.keyboard.isDown('left', 'a') then
		if player.x > 0 then
			player.x = player.x - (player.speed*dt)
		end
	end

	if love.keyboard.isDown('right', 'd') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed*dt)
		end
	
	end

	if love.keyboard.isDown('up', 'w') then
		if player.y > 0 then
			player.y = player.y - (player.speed*dt)
		end
	end

	if love.keyboard.isDown('down', 's') then
		if player.y < (love.graphics.getHeight() - player.img:getHeight()) then
			player.y = player.y + (player.speed*dt)
		end
	end

	-- Timer for bullets
	canShootTimer = canShootTimer - (1 * dt)
	if canShootTimer < 0 then
		canShoot = true
	end

	-- Remove bullets out of canvas
	for i, b in ipairs(bullet) do
		if b.y < -10 then
			table.remove(bullet, i)
		end
		b.y = b.y - 150
	end

	-- Player attacks
	if love.keyboard.isDown('space', 'lctrl') and canShoot then
		newBullet = {
			x = player.x+(player.img:getWidth()/2),
			y = player.y,
		}
		table.insert(bullet, newBullet)
		img = bulletImg
		canShoot = false
		canShootTimer = canShootTimerMax
	end

end

function love.draw(dt)
	love.graphics.draw(player.img, player.x, player.y)
	for i,v in pairs(bullet) do 
		love.graphics.draw(bulletImg, v.x, v.y)
	end

end
