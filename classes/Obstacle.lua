Obstacle = Class{}

function Obstacle:init(x, y)
    self.x = x
    self.y = y
    self.width = 70
    self.height = 70
    self.image = love.graphics.newImage("images/obstacle.png")
end


function Obstacle:update(dt)
end

function Obstacle:render()
    love.graphics.draw(self.image, self.x, self.y)
end