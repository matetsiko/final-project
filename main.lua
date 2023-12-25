push = require "push"
Class = require "class"


require "Classes/Heart"
require "classes/Bullet"
require "classes/Player"
require "classes/Invader"
require "classes/Timer"
require "classes/Obstacle"
require "classes/Alienbullet"


WINDOW_WIDTH = 1260
WINDOW_HEIGHT = 680
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 241

state = "menu"

score = 0
hearts = 3

shootsound  = love.audio.newSource("sounds/shoot.wav", "static")
invaderKilledSound = love.audio.newSource("sounds/invaderkilled.wav", "static")


heart = Heart(hearts)
timer = Timer(200,200)
player = Player(200, 200)
bullets = {}
invaders = {}
obstacles = {}
alienBullets = {}



function love.load()
  love.graphics.setFont(love.graphics.newFont("8-bit-pusab.ttf", 8))
  love.graphics.setDefaultFilter("nearest", "nearest")
  push:setupScreen(
    VIRTUAL_WIDTH,
    VIRTUAL_HEIGHT,
    WINDOW_WIDTH,
    WINDOW_HEIGHT,
    {
      fullscreen = false,
      resizable = true,
      vsync = true
    }
  )

  generateAliens()

  love.keyboard.keysPressed = {}
end



function love.update(dt)
  if state == "game" then
    


    if #invaders == 0 then
      table.remove(bullets, k)
      generateAliens()
    end

    -- if alienBullet:collides(player)then
      -- hearts = hearts - 1
    -- end
    -- if heart:render() then
    --   state = "endScreen"
    -- end
    

    player:update(dt)
    timer:update()
    while timer.x <= 2 do
      table.insert(alienBullets, AlienBullet(invaders[randomNum]))
    end
    if love.keyboard.wasPressed('up') then
      while timer.x >= 230 do
        love.audio.play(shootsound )
        table.insert(bullets, Bullet(player.x + player.width / 2 - 1, player.y))
        timer.x = 0
      end
    end
      
    for k, bullet in pairs(bullets) do
        bullet:update(dt)
      if not bullet.inPlay then
        table.remove(bullets, k)
      end
    end
      
    for k, invader in ipairs(invaders) do
        invader:update(dt)
          
        for y, alienBullet in pairs(alienBullets) do  
          alienBullet:update(dt)
        end
        for k, bullet in pairs(bullets) do
          if bullet:collides(invader) then
            love.audio.play(invaderKilledSound)
            invader.inPlay = false
            bullet.inPlay = false
            score = score + 1
          end
        end
            
            
      if not invader.inPlay then
          table.remove(invaders, k)
      end
    end
        
        
  end


  if state == "endScreen" then
    love.graphics.setColor(1, 1, 255)
    love.graphics.scale(2, 2)
    love.graphics.print("GAME OVER", 145, 80)
    love.graphics.scale(1, 1)
    love.graphics.setColor(1, 1, 1)
  end
    





  love.keyboard.keysPressed = {}

  randomNum = math.random(dt)


end

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
  
    if state == "game" then
      if key == "p" then
        state = "pause"
      end
    elseif key == "return" then
       state = "game"
       Obstaclesgenerate()
    end
end


function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end

function love.draw()
  push:start()
  love.graphics.clear(0/255, 0/255, 0/255, 160/255)
    
  love.graphics.setColor(1, 1, 1)


  
  
  if state == "game"then
    
    player:render()

    for y, alienBullet in pairs(alienBullets) do  
      alienBullet:render()
    end

    for k, bullet in pairs(bullets) do
      bullet:render()
    end

    for _, invader in ipairs(invaders) do
      invader:render()
    end

    for p, obstacle in ipairs(obstacles) do
      obstacle:render()
    end

    love.graphics.print("score" .. score, 368, 5)
      
  end
    
    
  if state == "pause" then
    love.graphics.setColor(0, 1, 1)
    love.graphics.print("Paused", 120, 30)
  end
    

  if state == "menu" then
    love.graphics.setColor(0, 0.5, 1)
    love.graphics.print("Space Invaders", 145, 80)
  end
    
  push:finish()
    
 
  love.graphics.setColor(255, 255, 255)
  love.graphics.scale(1, 1)
  love.graphics.print("escape to close the game", 1000, 530)
  love.graphics.print("left arrow to go left -->", 1000, 550)
  love.graphics.print("right arrow to go right <--", 1000, 570)
  love.graphics.print("up arrow to shot ^", 1000, 590)
  love.graphics.print("!", 1120, 600)
  love.graphics.print("p to pause", 1000, 610)
  love.graphics.print("click enter to start", 1000, 630)
  love.graphics.scale(0, 0)

end


function generateAliens()
  local startX = 30
  local startY = 15
  local columns = 10
  local rows = 4

  for row = 1, rows do
    for col = 1, columns do
      table.insert(invaders, Invader(startX + (col - 1) * 30, startY + (row - 1) * 30))
    end
  end
end

function Obstaclesgenerate()
  local startX = 100
  local startY = 160
  love.graphics.print("Space Invaders", 145, 80)
  for c = 1, 3 do
    table.insert(obstacles, Obstacle(startX + 78, startY + 78))
  end
end