module("credits", package.seeall)
require "main"
require "game"

function load()
  
  mainImg = love.graphics.newImage("assets/Close_Button.png")  
  buttonQuad = love.graphics.newQuad(1,1,500/2,500/2,500/2,500/2)
  creditsFont1 = love.graphics.newFont(25)
  creditsFont2 = love.graphics.newFont(30)
  creditsFont3 = love.graphics.newFont(18)
  downMove = 600
end

function draw()  
  love.graphics.draw(mainImg, buttonQuad, 125/2 ,750/2)
  
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Credits", 150 , (0 + downMove)) 
  love.graphics.setFont(creditsFont2)
  love.graphics.print("Ducky Dash", 150 , (50 + downMove)) 
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Omar Hassan", 100 , (90 + downMove))
  love.graphics.setFont(creditsFont3)
  love.graphics.print("Artist and Designer", 100 , (120 + downMove))
  love.graphics.setFont(creditsFont1)
  love.graphics.print("Thomas 'Dashy Duck' Griffiths",  0, (150 + downMove))
  love.graphics.setFont(creditsFont3)
  love.graphics.print("Upgrade Programmer", 100 , (180 + downMove))
end

function mousepressed(x,y,button, istouch)
  clickLocations(x,y) 
end

function touchpressed(id,x,y,sw,sh,pressure)
  clickLocations(x,y)
end

function clickLocations(x,y)
  if (x > 85 and x < 288 and y > 446 and y < 552) then
      --close settings
      sound.playSqueak()
      _G.settings = false  
  end
end

function update()
  downMove = downMove - 1
end