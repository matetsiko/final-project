Heart = Class{}



function Heart:init(hearts)
    self.health = hearts
end

function Heart:render()
    if self.health == 1 then
        love.graphics.draw(self.image, self.x, self.y)
    elseif self.health == 2 then
        love.graphics.draw(self.image, self.x - 10, self.y)
    elseif self.health == 3 then
        love.graphics.draw(self.image, self.x - 20, self.y)
    else
        return true
    end
end