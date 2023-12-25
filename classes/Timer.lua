Timer = Class{}

function Timer:init(x, y)
    self.x = x
    self.y = y
    self.speed = 5
end


function Timer:update(dt)
    self.x = self.x + self.speed

    while self.x <= -1 do
        self.x = 0
    end
    while self.x >= 400 do
        self.x = 399
    end
end

function Timer:render()
end