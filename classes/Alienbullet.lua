AlienBullet = Class{}

function AlienBullet:init(x, y)
    self.x = x
    self.y = y
    self.width = 2
    self.height = 5
    self.speed = 2.5
    self.image = love.graphics.newImage("images/alien_bullet.png")
    self.inPlay = true


end

function AlienBullet:update(dt)
    self.y = self.y + self.speed


    if self.y > VIRTUAL_HEIGHT then
        self.inPlay = false
    end
end

function AlienBullet:collides(target)
	if self.x + self.width < target.x or target.x + target.width < self.x then
        return false
    end
      
    if self.y + self.height < target.y or target.y + target.height < self.y then
        return false
    end
      
      return true
end

function AlienBullet:render()
    love.graphics.draw(self.image, self.x, self.y)
end