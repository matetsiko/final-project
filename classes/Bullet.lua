Bullet = Class{}

function Bullet:init(x, y)
  self.x = x
  self.y = y + 10
  
  self.width = 2
  self.height = 5
  
  self.speed = 2.59
  self.image = love.graphics.newImage("images/bullet.png")
  
  self.inPlay = true
end

function Bullet:update(dt)
    self.y = self.y - self.speed
    
    if self.y < 0 then
      self.inPlay = false
    end
end

function Bullet:collides(target)
	if self.x + self.width < target.x or target.x + target.width < self.x then
    return false
  end
  
  if self.y + self.height < target.y or target.y + target.height < self.y then
    return false
  end
  
  return true
end

function Bullet:render()
  love.graphics.draw(self.image, self.x, self.y)
end