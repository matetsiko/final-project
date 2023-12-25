Player = Class{}

function Player:init(x, y)
    self.x = x
    self.y = y
    self.speed = 5.5
    self.image = love.graphics.newImage("images/player.png")
    self.width = self.image:getWidth()
end


function Player:update(dt)
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

function Player:render()
    love.graphics.draw(self.image, self.x, self.y)
end