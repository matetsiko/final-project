Invader = Class{}

function Invader:init(x , y)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage("images/invader.png")
    self.image2 = love.graphics.newImage("images/invader2.png")
    self.speed = 0.3
    self.direction = 1
    self.moveLimitRight = x + 80
    self.moveLimitLeft = x - 30
    
    self.width = 32
    self.height = 32
    
    self.inPlay = true
end

function Invader:update(dt)
  
    self.x = self.x + self.speed * self.direction
    if self.x <= self.moveLimitLeft then
        self.direction = 1
        self.x = self.x + 1
    elseif self.x >= self.moveLimitRight then
        self.direction = -1
        self.x = self.x - 1
    end
end





function Invader:render()
    if self.y >= 50 then
        love.graphics.draw(self.image2, self.x, self.y)
    else
        love.graphics.draw(self.image, self.x, self.y)
    end
end