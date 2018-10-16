module("credits", package.seeall)
require "main"
require "game"

function load()
  
  mainImg = love.graphics.newImage("assets/Close_Button.png")  
  buttonQuad = love.graphics.newQuad(1,1,500/5,500/5,500/5,500/5)
  creditsFont1 = love.graphics.newFont(23)
  creditsFont2 = love.graphics.newFont(40)
  creditsFont3 = love.graphics.newFont(18)
  downMove = 600
end

function draw()  
  love.graphics.draw(mainImg, buttonQuad, 500/2 ,1050/2)
  
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Credits", 150 , (0 + downMove)) 
  love.graphics.setFont(creditsFont2)
  love.graphics.print("Ducky Dash", 80 , (50 + downMove)) 
  
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Omar Hassan", 40 , (140 + downMove))
  love.graphics.setFont(creditsFont3)
  love.graphics.print("Artist and Designer", 100 , (170 + downMove))
  
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Thomas Griffiths",  20, (210 + downMove))
  love.graphics.setFont(creditsFont3)
  love.graphics.print("Upgrades Programmer", 100 , (240 + downMove))
  
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Robert Bond",  15, (310 + downMove))
  love.graphics.setFont(creditsFont3)
  love.graphics.print("Audio & Animator", 100 , (340 + downMove))
  
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Thomas Ibbs",  40, (380 + downMove))
  love.graphics.setFont(creditsFont3)
  love.graphics.print("Versus Mode Programmer", 100 , (410 + downMove))
  
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Rhys Olson",  20, (480 + downMove))
  love.graphics.setFont(creditsFont3)
  love.graphics.print("'Gameplay Programmer'", 100 , (510 + downMove))
  
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Rhys Panting",  20, (580 + downMove))
  love.graphics.setFont(creditsFont3)
  love.graphics.print("Source Control", 120 , (610 + downMove))


end

function mousepressed(x,y,button, istouch)
  clickLocations(x,y) 
end

function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y)
end

function clickLocations(x,y)
  if (x > 260 and x < 340 and y > 555 and y < 595) then
      --close settings
      sound.playSqueak()
      _G.creditsLoad = false  
  end
end

function update()
  downMove = downMove - 1
  if downMove == -1000 then
   downMove = 600
  end
end
