Obstacle = Class{}

function Obstacle:init(x, y)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage("images/Obstacle.png")
    self.width = self.image:getWidth()
end


function Obstacle:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed
    end

    while self.x <= -1 do
        self.x = 396
    end
    while self.x >= 397 do
        self.x = 0
    end
end

function Obstacle:render()
    love.graphics.draw(self.image, self.x, self.y)
end