debug = true
player = { x = 200, y = 710, speed = 150, img = nil }

function love.load()
	player.img = love.graphics.newImage('assets/plane.png')	
end

function love.update(dt)

	if love.keyboard.isDown('escape') then
		love.event.push('quit')
	end

	if love.keyboard.isDown('lshift') then
		player.speed = 300
	else
		player.speed = 150
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

end

function love.draw(dt)
	love.graphics.draw(player.img, player.x, player.y)

end
